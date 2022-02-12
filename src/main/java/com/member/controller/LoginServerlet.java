package com.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;

public class LoginServerlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//TODD
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

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

				String url = "/front_end/member/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("登入失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/register.jsp");
				failureView.forward(req, res);
			}
		}
	}
}