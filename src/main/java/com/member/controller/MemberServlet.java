package com.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
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
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO);
				String url = "/back_end/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

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
				String url = "/back_end/member/update_member_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

//				Integer id = new Integer(req.getParameter("id").trim());
				String email = req.getParameter("email").trim();
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("郵件請勿空白");
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
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name");
//				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");
//				} else if (!nameReg.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");

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
//				byte[] avatar = CommonUtil.getPictureByteArray("/CFA104G3/src/main/webapp/asset/img/avatar.gif");
				InputStream in = req.getPart("avatar").getInputStream();
				byte[] avatar = null;
				if (in.available() != 0) {
					avatar = new byte[in.available()];
					in.read(avatar);
					in.close();
				} else {

					errorMsgs.add("請上傳圖片");
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

				memberVO = memberSvc.update( email, account, password, nickname, name, phone, gender, city, cityArea,
						address, code, avatar, timestamp, status);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp

				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());

				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

//				Integer id = new Integer(req.getParameter("id").trim());
				String email = req.getParameter("email").trim();
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("郵件請勿空白");
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
				if (nickname == null || nickname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("姓名: 請勿空白");
				} else if (!name.trim().matches(nameReg)) {
					errorMsgs.add("姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");

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
				InputStream in = req.getPart("avatar").getInputStream();
				byte[] avatar = null;
				if (in.available() != 0) {
					avatar = new byte[in.available()];
					in.read(avatar);
					in.close();
				} else {

					errorMsgs.add("請上傳圖片");
				}
				java.sql.Timestamp registerDate = null;

				try {
					registerDate = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException ie) {
					errorMsgs.add("請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
				}

				Integer status = null;
				try {
					gender = new Integer(req.getParameter("status").trim());
				} catch (NumberFormatException e) {
					gender = 0;
					errorMsgs.add("權限");
				}

				MemberVO memberVO = new MemberVO();
				memberVO = new MemberVO();

//				memberVO.setId(id);

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

				memberVO.setRegisterDate(registerDate);
				memberVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的empVO物件,也存入req

					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/addMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				MemberServiceImpl memberSvc = new MemberServiceImpl();
				memberVO = memberSvc.insert(email, account, password, nickname, name, phone, gender, city, cityArea,
						address, code, avatar, registerDate, status);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/member/listAllMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/addMember.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
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
	}
}
