package com.member.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;

import core.util.CommonUtil;

public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("selectById".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add(" 會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				MemberVO memberVO = memberSvc.selectById(id);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/back_end/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneMember.jsp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer id = new Integer(req.getParameter("id").trim());

				String email = req.getParameter("email");
				String emailReg = "^(([^<>()[\\]\\\\.,;:\\s@\\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\\"]+)*)|(\\\".+\\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$]";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("email: 請勿空白");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("email: 英文字母、數字和@");
				}

				String account = req.getParameter("account").trim();
				if (account == null || account.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}

				String password = req.getParameter("password").trim();
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || password.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name").trim();
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("名字請勿空白");
				}
				String phone = req.getParameter("phone").trim();
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}
				Integer gender = null;
				try {
					gender = new Integer(req.getParameter("gender").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("性別請勿空白");
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

				Date registerDate = null;

				try {
					registerDate = java.sql.Date.valueOf(req.getParameter("registerDate").trim());
				} catch (IllegalArgumentException e) {
					registerDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Timestamp timestamp = new Timestamp(registerDate.getTime());

				Integer status = null;
				try {
					gender = new Integer(req.getParameter("status").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("權限");
				}

				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

				memberVO.setId(id);
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
				memberVO.setRegisterDate(timestamp);
				memberVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/member/update_member_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberVO = memberSvc.update(id, email, account, password, nickname, name, phone, gender, city, cityArea,
						address, code, avatar, timestamp, status);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/back_end/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/Member/update_member_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer id = new Integer(req.getParameter("id").trim());

				String email = req.getParameter("email");
				String emailReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9@)]";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("email: 請勿空白");
				} else if (!email.trim().matches(emailReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("email: 只能是中、英文字母、數字和@");
				}

				String account = req.getParameter("account").trim();
				if (account == null || account.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}

				String password = req.getParameter("password").trim();
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				String nickname = req.getParameter("nickname").trim();
				if (nickname == null || password.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name").trim();
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("名字請勿空白");
				}
				String phone = req.getParameter("phone").trim();
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}
				Integer gender = null;
				try {
					gender = new Integer(req.getParameter("gender").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("性別請勿空白");
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
				byte[] avatar = CommonUtil.getPictureByteArray("/CFA104G3/src/main/webapp/asset/img/avatar.gif");

				String code = req.getParameter("code").trim();
				if (code == null || code.trim().length() == 0) {
					errorMsgs.add("郵遞區號請勿空白");

				}
				Date registerDate = null;

				try {
					registerDate = java.sql.Date.valueOf(req.getParameter("registerDate").trim());
				} catch (IllegalArgumentException e) {
					registerDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Timestamp timestamp = new Timestamp(registerDate.getTime());

				Integer status = null;
				try {
					gender = new Integer(req.getParameter("status").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("權限");
				}

				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

				memberVO.setId(id);
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
				memberVO.setRegisterDate(timestamp);
				memberVO.setStatus(status);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/***************************  ***************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberVO = memberSvc.insert(id, email, account, password, nickname, name, phone, gender, city, cityArea,
						address, code, avatar, timestamp, status);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/member/listAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/addMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllMember.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = new Integer(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberSvc.deleteById(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/member/listAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}
		System.out.println("password");

		if ("login".equals(action)) { // 來自login.jsp
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String account = req.getParameter("account");
				String password = req.getParameter("password");

				/*************************** 2.登入 ***************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberSvc.login(account, password);
				
		
				/*************************** 3.登入完成 回首頁 ***********/
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("登入失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/register.jsp");
				failureView.forward(req, res);
			}
		}
//		String accoucnt = String.valueOf(request.getParameter("accoucnt"));
//		String password = String.valueOf(request.getParameter("password"));
//		if (accoucnt == null || password == null) {
//			response.sendRedirect("index.html");
//			return;
//		}
//		String sql = "select * from MEMBER where MEM_ACCOUNT = ?and MEM_PASSWORD = ?";
//		Connection con = db.ConnectionPool.getIstance().getConnection();
//		PreparedStatement ps = con.prepareStatement(sql);
//		int i = 0;
//		ps.setString(++i, id);
//		ps.setString(++i, passwd);
//
//		ResultSet rs = ps.executeQuery();
//		if (rs.next()) {
//			Prof user = new Prof();
//			user.setId(rs.getString(1));
//			session.setAttribute("user", user);
//		} else {
//			response.sendRedirect("index.jsp");
//			return;
//		}
//	}
	}
}
