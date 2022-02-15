package com.member.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MailService;
import com.member.model.MemberDAOJDBCImpl;
import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;
import com.member.model.RandomPassword;

import core.util.CommonUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class LoginServlet extends HttpServlet {
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif"); // 顯示圖片
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT MEM_AVATAR FROM MEM_AVATAR WHERE MEM_ID = " + req.getParameter("id"));

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("image"));
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

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("register".equals(action)) {// 註冊

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String email = req.getParameter("email");
				String emailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("請輸入郵箱");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("請輸入正確的郵箱格式");
				}
				String account = req.getParameter("account");
				String accountReg = "^[A-Za-z0-15]{6,24}$";
				if (account == null || account.trim().length() == 0) {
					errorMsgs.add("請輸入帳號");
				} else if (!account.trim().matches(accountReg)) {
					errorMsgs.add("請輸入正確的帳號格式");
				}
				String password = req.getParameter("password");
				String passwordReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (!password.trim().matches(passwordReg)) {
					errorMsgs.add("第一個須為大寫英文字母");
				}
				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");

				}
				String phone = req.getParameter("phone");
				String phoneReg = "^09[0-9]{8}$";
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.add("請輸入手機號碼");
				} else if (!phone.trim().matches(phoneReg)) {
					errorMsgs.add("請輸入正確的手機號碼格式");
				}
				Integer gender = null;
				try {
					gender = new Integer(req.getParameter("gender").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("性別");
				}

				String city = req.getParameter("city").trim();
				if (city == null || city.trim().length() == 0) {
					errorMsgs.add("城市請勿空白");
				}
				String cityArea = req.getParameter("cityArea").trim();
				if (cityArea == null || cityArea.trim().length() == 0) {
					errorMsgs.add("鄉鎮請勿空白");
				}
				String address = req.getParameter("address").trim();
				if (address == null || address.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}
				String code = req.getParameter("code").trim();
				if (code == null || code.trim().length() == 0) {
					errorMsgs.add("郵遞區號請勿空白");
				}
				byte[] avatar = CommonUtil.getPictureByteArray("/CFA104G3/src/main/webapp/asset/img/avatar.gif");
				InputStream in = req.getPart("avatar").getInputStream();
//				byte[] avatar = null;
				if (in.available() != 0) {
					avatar = new byte[in.available()];
					in.read(avatar);
					in.close();
//				} else {
//
//					errorMsgs.add("請上傳圖片");
				}

				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

				memberVO.setEmail(email);
				memberVO.setAccount(account);
				memberVO.setPassword(password);
				memberVO.setNickname(nickname);
				memberVO.setName(name);
				memberVO.setPhone(phone);
				memberVO.setGender(gender);
				memberVO.setCity(city);
				memberVO.setCityArea(cityArea);
				memberVO.setAddress(address);
				memberVO.setCode(code);
				memberVO.setAvatar(avatar);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberVO = memberSvc.register(email, account, password, nickname, name, phone, gender, city, cityArea,
						address, code, avatar);

				memberVO = memberSvc.login(account, password);

				String str = generateForm(req, memberVO.getId());
				System.out.println(str);
				/* 寄送註冊成功信件 */
				new MailService().sendMail(email, "恭喜您成為委域的會員", "請點連結驗證信箱 " + str);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front_end/member/Signupthanks.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/register.jsp");
				failureView.forward(req, res);
			}
		}
		if ("login".equals(action)) {// 登入

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String account = req.getParameter("account");
				String password = req.getParameter("password");
				MemberServiceImpl memebrSVC = new MemberServiceImpl();
				MemberVO memberVO = memebrSVC.login(account, password);
				if (account == null || account.trim().length() == 0) {
					errorMsgs.add("請輸入帳號");
				} else if (memberVO == null) {
					errorMsgs.add("此帳號不存在");
				}

				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (!password.equals(memberVO.getPassword())) {
					errorMsgs.add("密碼錯誤");
				}

				HttpSession session = req.getSession();
				session.setAttribute("memberVO", memberVO);
				if (!errorMsgs.isEmpty()) {

					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "front_end_listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				res.sendRedirect(url);
//				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
				failureView.forward(req, res);
			}
		}

		if ("logout".equals(action)) {// 登出
			HttpSession session = req.getSession();
			session.invalidate();
			String url = "/CFA104G3/front_end/member/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			res.sendRedirect(url);
//			successView.forward(req, res);
		}
		if ("getOne_For_Member_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer id = new Integer(req.getParameter("id"));

				/*************************** 2.開始查詢資料 ****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				MemberVO memberVO = memberSvc.selectById(id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberVO", memberVO);
				String url = "/front_end/member/front_end_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}
		if ("front_end_member_update".equals(action)) { // 前台會員更新資料
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer id = new Integer(req.getParameter("id").trim());
		
				String email = req.getParameter("email");
				String emailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("請輸入郵箱");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("請輸入正確的郵箱格式");
				}

				String password = req.getParameter("password");
				String passwordReg = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (!password.trim().matches(passwordReg)) {
					errorMsgs.add("第一個須為大寫英文字母");
				}
				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");

				}
				String phone = req.getParameter("phone");
				String phoneReg = "^09[0-9]{8}$";
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.add("請輸入手機號碼");
				} else if (!phone.trim().matches(phoneReg)) {
					errorMsgs.add("請輸入正確的手機號碼格式");
				}

				String city = req.getParameter("city").trim();
				if (city == null || city.trim().length() == 0) {
					errorMsgs.add("城市請勿空白");
				}
				String cityArea = req.getParameter("cityArea").trim();
				if (cityArea == null || cityArea.trim().length() == 0) {
					errorMsgs.add("鄉鎮請勿空白");
				}
				String address = req.getParameter("address").trim();
				if (address == null || address.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				InputStream in = req.getPart("avatar").getInputStream();
				byte[] avatar = null;
				if (in.available() != 0) {
					avatar = new byte[in.available()];
					in.read(avatar);
					in.close();
				} else {

					errorMsgs.add("請上傳圖片");
				}

				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

				memberVO.setEmail(email);
				memberVO.setPassword(password);
				memberVO.setNickname(nickname);
				memberVO.setName(name);
				memberVO.setPhone(phone);
				memberVO.setCity(city);
				memberVO.setCityArea(cityArea);
				memberVO.setAddress(address);
				memberVO.setAvatar(avatar);
				memberVO.setId(id);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/front_end_update.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
				memberVO = memberServiceImpl.frontMemberUpdate(email, password, nickname, name, phone, city, cityArea, address, avatar,id);
				
//				MemberServiceImpl memberSvc = new MemberServiceImpl();
//				memberVO = memberSvc.frontMemberUpdate(email, password, nickname, name, phone, city, cityArea, address,
//						avatar,id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO);
				String url = "/front_end/member/front_end_listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("到這囉==============================");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/member/front_end_listOneMember.jsp");
				failureView.forward(req, res);
			}
		}
		if ("forgetpassword".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				System.out.println("forgetpassword action!!!");
				MemberDAOJDBCImpl memberDAO = new MemberDAOJDBCImpl();
				String email = req.getParameter("email");
				/*************************** 2.開始查詢資料 *****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				String random = new RandomPassword().getRandomPassword();
				MemberVO memberVO = memberSvc.forgetpassword(email);
				if (memberVO == null) {
					errorMsgs.add("EMAIl不存在");
				} else {
					new MailService().sendMail(email, "密碼變更通知", " 以下為新密碼: " + random);
					memberVO.setPassword(random);
					memberSvc.updateMember(memberVO);
					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("memberVO", memberVO); // 資料庫取出的empVO物件,存入req
				}

				String url = "/front_end/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}

	private String generateForm(HttpServletRequest req, int id) {
		StringBuffer form = new StringBuffer();
		form.append("<form action=\"" + req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath() + "/front-end/member/MemberServlet.do\" method=\"POST\">");
		form.append("	<input type=\"hidden\" name=\"action\" value=\"validate\">");
		form.append("	<input type=\"hidden\" name=\"memno\" value=\"" + id + "\">");
		form.append("	<input type=\"submit\" value=\"點此鏈結\">");
		form.append("</form>");
		return form.toString();
	}
}