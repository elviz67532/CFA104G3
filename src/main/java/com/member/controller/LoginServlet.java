package com.member.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MailService;
import com.member.model.MemberDAO;
import com.member.model.MemberDAOJDBCImpl;
import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;
import com.member.model.RandomPassword;

import core.util.CommonUtil;
import core.util.SQLUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class LoginServlet extends HttpServlet {
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void init() throws ServletException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(SQLUtil.URL, SQLUtil.USER, SQLUtil.PASSWORD);
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	/**
	 *
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("register".equals(action)) {// 註冊
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);// 怡裡的用法

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				MemberServiceImpl memSvc = new MemberServiceImpl();
				String email = req.getParameter("email");
				String emailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.put("email", "請輸入郵箱");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.put("email", "請輸入正確的郵箱格式");
				} else if (memSvc.findByEmail(email) != null) {
					errorMsgs.put("email", "此信箱已使用");
				}
				String account = req.getParameter("account");
				String accountReg = "^[A-Za-z0-9]{6,24}$";
				if (account == null || account.trim().length() == 0) {
					errorMsgs.put("account", "請輸入帳號");
				} else if (!account.trim().matches(accountReg)) {
					errorMsgs.put("account", "請輸入正確的帳號格式");
				} else if (memSvc.findByAccount(account) != null) {
					errorMsgs.put("account", "此帳號已存在");
				}
				String password = req.getParameter("password");
				String passwordReg = "^[A-Za-z0-9]{6,24}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.put("password", "請輸入密碼");
				}
				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.put("nickname", "暱稱請勿空白");
				}
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.put("name", "姓名: 請勿空白");
				} else if (!name.trim().matches(nameReg)) {
					errorMsgs.put("name", "姓名只能為中文,長度2到10");
				}
				String phone = req.getParameter("phone");
				String phoneReg = "^09[0-9]{8}$";
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.put("phone", "請輸入手機號碼");
				} else if (!phone.trim().matches(phoneReg)) {
					errorMsgs.put("phone", "請輸入正確的手機號碼格式");
				}
				Integer gender = null;
				try {
					gender = new Integer(req.getParameter("gender").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.put("gender", "性別");
				}
				byte[] avatar = CommonUtil
						.getPictureByteArray(getServletContext().getRealPath("/") + "/asset/img/avatar.jpg");
				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

				memberVO.setEmail(email);
				memberVO.setAccount(account);
				memberVO.setPassword(password);
				memberVO.setNickname(nickname);
				memberVO.setName(name);
				memberVO.setPhone(phone);
				memberVO.setGender(gender);
				memberVO.setAvatar(avatar);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("tempMemberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/register.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				String code = new RandomPassword().getRandomPassword();
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberVO = memberSvc.register(email, account, password, nickname, name, phone, gender, code, avatar);

				String str = generateForm(req, memberVO.getId(), code);
				new MailService().sendMail(email, "恭喜您成為委域的會員", "請點連結驗證信箱 " + str);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front_end/member/Signupthanks.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();

				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/register.jsp");
				failureView.forward(req, res);
			}
		}

		if ("login".equals(action)) {// 登入
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String account = req.getParameter("account");
				String password = req.getParameter("password");

				req.setAttribute("inputAccount", account);
				req.setAttribute("inputPassword", password);

				// 檢查是否為空
				if (account == null || account.trim().length() == 0) {
					errorMsgs.put("account", "請輸入帳號");

				}
				if (password == null || password.trim().length() == 0) {
					errorMsgs.put("password", "請輸入密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				// 嘗試登入
				MemberServiceImpl memebrSVC = new MemberServiceImpl();
				MemberVO memberVO = memebrSVC.login(account, password);
				if (memberVO == null) {
					errorMsgs.put("account", "此帳號不存在或密碼錯誤");
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				// 狀態測試
				Integer status = memberVO.getStatus();
				System.out.println("status =" + status);
				switch (status) {
				case 0:// 未驗證
					System.out.println("會員未驗證");
					res.sendRedirect(req.getContextPath() + "/front_end/member/notverify.jsp");
					return;
				case 1:// 已驗證
					break;
				case 2:// 停權
					System.out.println("會員已停權");
					res.sendRedirect(req.getContextPath() + "/front_end/member/banmember.jsp");
					return;
				default:
					System.out.println("會員狀態異常, 狀態=" + status);
					res.sendRedirect(req.getContextPath() + "/index.jsp");
					return;
				}

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				HttpSession session = req.getSession();
				session.setAttribute("memberVO", memberVO);

				// 來源頁面跳轉
				String location = (String) session.getAttribute("frontEndBeforeLoginURL");
				if (location != null) {
					session.removeAttribute("frontEndBeforeLoginURL"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
				res.sendRedirect(req.getContextPath() + "/index.jsp");
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
				failureView.forward(req, res);
			}
		}

		if ("logout".equals(action)) {// 登出
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		}

//		if ("getOne_For_Member_Update".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 ****************************************/
//				Integer id = new Integer(req.getParameter("id"));
//
//				/*************************** 2.開始查詢資料 ****************************************/
//				MemberServiceImpl memberSvc = new MemberServiceImpl();
//				MemberVO memberVO = memberSvc.selectById(id);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("tempMemberVO", memberVO);
//				String url = "/front_end/member/front_end_update.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front_end/member/front_end_listOneMember.jsp");
//				failureView.forward(req, res);
//			}
//		}

		if ("front_end_member_update".equals(action)) { // 前台會員更新資料
			HttpSession session = req.getSession();

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);// 怡裡的用法

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				MemberServiceImpl memSvc = new MemberServiceImpl();
				Integer id = new Integer(req.getParameter("id").trim());

				String email = req.getParameter("email");
				String emailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.put("email", "請輸入郵箱");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.put("email", "請輸入正確的郵箱格式");
				} else {
					MemberVO findByEmail = memSvc.findByEmail(email);
					if (findByEmail != null) {
						if (findByEmail.getId().intValue() != id.intValue()) {
							errorMsgs.put("email", "此信箱已使用");
						}
					}
				}
				String password = req.getParameter("password");
				String passwordReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.put("password", "請輸入密碼");
				} else if (!password.trim().matches(passwordReg)) {
					errorMsgs.put("password", "密碼第一個須為大寫英文字母");
				}

				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.put("nickname", "暱稱請勿空白");
				}
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.put("name", "姓名: 請勿空白");

				} else if (!name.trim().matches(nameReg)) {
					errorMsgs.put("name", "姓名只能為中文,長度2到10");
				}
				String phone = req.getParameter("phone");
				String phoneReg = "^09[0-9]{8}$";
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.put("phone", "請輸入手機號碼");
				} else if (!phone.trim().matches(phoneReg)) {
					errorMsgs.put("phone", "請輸入正確的手機號碼格式");
				}

				String city = req.getParameter("city").trim();
				String cityReg = "^[(\\u4e00-\\u9fa5)]{2,10}$";
				if (city == null || city.trim().length() == 0) {
					errorMsgs.put("city", "城市請勿空白");
				} else if (!city.trim().matches(cityReg)) {
					errorMsgs.put("city", "城市地區只能輸入中文");
				}

				String cityArea = req.getParameter("cityArea").trim();
				String cityAreaReg = "^[(\\u4e00-\\u9fa5)]{2,10}$";
				if (cityArea == null || cityArea.trim().length() == 0) {
					errorMsgs.put("cityArea", "鄉鎮請勿空白");
				} else if (!cityArea.trim().matches(cityAreaReg)) {
					errorMsgs.put("cityArea", "鄉鎮地區只能輸入中文");
				}
				String address = req.getParameter("address").trim();
				if (address == null || address.trim().length() == 0) {
					errorMsgs.put("address", "地址請勿空白");
				}
				InputStream in = req.getPart("avatar").getInputStream();
				byte[] avatar = null;
				if (in.available() != 0) {
					avatar = new byte[in.available()];
					in.read(avatar);
					in.close();
				}

				MemberVO tempMemberVO = new MemberVO();
				tempMemberVO.setEmail(email);
				tempMemberVO.setPassword(password);
				tempMemberVO.setNickname(nickname);
				tempMemberVO.setName(name);
				tempMemberVO.setPhone(phone);
				tempMemberVO.setCity(city);
				tempMemberVO.setCityArea(cityArea);
				tempMemberVO.setAddress(address);
				tempMemberVO.setAvatar(avatar);
				tempMemberVO.setId(id);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("tempMemberVO", tempMemberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/front_end_update.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
				memberServiceImpl.frontMemberUpdate(email, password, nickname, name, phone, city, cityArea,
						address, avatar, id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				
				MemberVO memberVo = memberServiceImpl.selectById(id);
				
				session.setAttribute("memberVO", memberVo);
				
				String url = "/front_end/member/front_end_listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/member/front_end_listOneMember.jsp");
				failureView.forward(req, res);
			}
		}
		if ("forgetpassword".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String email = req.getParameter("email");
				/*************************** 2.開始查詢資料 *****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				String random = new RandomPassword().getRandomPassword();
				MemberVO memberVO = memberSvc.forgetpassword(email);

				if (memberVO == null) {
					errorMsgs.put("email", "EMAIl不存在");
				} else {
					new MailService().sendMail(email, "密碼變更通知", " 以下為新密碼: " + random);
					memberVO.setPassword(random);
					memberSvc.updateMember(memberVO);
				}

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/forgetpassword.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				String url = "/front_end/member/mailforgetmember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if ("validate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer id = null;
				try {
					id = new Integer(req.getParameter("id").trim());
				} catch (NumberFormatException e) {
					id = 0;
				}
				String code = req.getParameter("code");

				/*************************** 2.開始查詢資料 *****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				boolean veriftyCode = memberSvc.veriftyCode(null, id, code);

				String url = "/CFA104G3/index.jsp";
				res.sendRedirect(url);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		if ("getImage".equals(action)) {
			res.setContentType("image/gif"); // 顯示圖片
			ServletOutputStream out = res.getOutputStream();

			try {
				Statement stmt = con.createStatement();
				ResultSet rs = stmt
						.executeQuery("SELECT MEM_AVATAR FROM MEMBER WHERE MEM_ID = " + req.getParameter("MEM_ID"));
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("MEM_AVATAR"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				} else {
					res.sendError(HttpServletResponse.SC_NOT_FOUND);
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}

	private String generateForm(HttpServletRequest req, int id, String code) {// 信箱連結
		StringBuffer form = new StringBuffer();
		form.append("<form action=\"" + req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath() + "/front_end/member/MemberServlet.do\" method=\"POST\">");
		form.append("	<input type=\"hidden\" name=\"action\" value=\"validate\">");
		form.append("	<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
		form.append("	<input type=\"hidden\" name=\"code\" value=\"" + code + "\">");
		form.append("	<input type=\"submit\" value=\"點此鏈結\">");
		form.append("</form>");
		return form.toString();
	}

}
