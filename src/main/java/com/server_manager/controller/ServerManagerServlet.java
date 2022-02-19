package com.server_manager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.server_manager.model.ServerManagerServiceImpl;
import com.server_manager.model.ServerManagerVO;
import com.server_manager_auth.model.ServerManagerAuthServiceImpl;
import com.server_manager_auth.model.ServerManagerAuthVO;
import com.server_manager_function.model.ServerManageFunctionServiceImpl;

import core.DualKey;

public class ServerManagerServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String atag = req.getParameter("atag");
		if ("loginhandler".equals(action)) {
			
//			System.out.println("我進來loginhandler");
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);

			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/	
				// 【取得使用者 帳號(account) 密碼(password)】
				String account = req.getParameter("account");
				String password = req.getParameter("password");
				
				// 【用戶登入失敗】
				if(account == null || account.trim().length() == 0) {
					errMsgs.add("用戶名不可為空，請您輸入");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
					failureView.forward(req, res);
					return;					
				}
				if(password == null || (password.trim()).length() == 0) {
					errMsgs.add("請輸入密碼");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
					failureView.forward(req, res);
					return;					
				}	
				
				// 【檢查該帳號 , 密碼是否有效】
				System.out.println("開始檢查該帳號");
				if (!allowUser(account, password)) { // 【帳號 , 密碼無效時】
					errMsgs.add("你的帳號 , 密碼無效!");
				} else { // 【帳號 , 密碼有效時, 才做以下工作】
					ServerManagerVO smVO = aquireVO(account);
					//【取得 & 設定 session】
					HttpSession session = req.getSession();
					session.setAttribute("ServerManagerVO", smVO);
					session.setAttribute("account", account);
							//session.setAttribute("account", account); // *工作1: 才在session內做已經登入過的標識
							//System.out.println("取得session了"); // session.getAttribute => 登入的資訊

					
					//【取得角色】 DB 撈資料
					ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
					ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
					Integer smgrId = smSvc.getId(account);
					List<ServerManagerAuthVO> list = smaSvc.selectByManager(smgrId); //【取得smaId】
						System.out.println("list" + list); 
					session.setAttribute("auth", list);
						System.out.println("auth " + session.getAttribute("auth"));
					try {
						String location = (String) session.getAttribute("location");
						if (location != null) { 
							session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
							res.sendRedirect(location);
							return;
						}
					} catch (Exception ignored) {
					}
					res.sendRedirect(req.getContextPath() + "/back_end/server_manager/serverManagerHom.jsp"); // *工作3:
																					// (-->如無來源網頁:則重導至login_success.jsp)
				}
			} catch (IOException e) {
				errMsgs.add("例外錯誤");
				e.printStackTrace();
			}
		}
		
		if("logout".equals(atag)) {
			HttpSession session = req.getSession();
			session.invalidate();
			RequestDispatcher view = req.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
			view.forward(req, res);
		}
		
		if("insert".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);			
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer smgrId = Integer.valueOf(req.getParameter("smgrId"));
				
				String smgrEmail = req.getParameter("smgrEmail");
				if(smgrEmail == null || smgrEmail.trim().length() == 0) {
					errMsgs.add("email 請勿空白");
				}
				
				String smgrAccount = req.getParameter("smgrAccount");
				if(smgrAccount == null || smgrAccount.trim().length() == 0) {
					errMsgs.add("帳號 請勿空白");
				}
				
				String smgrPassword = req.getParameter("smgrPassword");
				if(smgrPassword == null || smgrPassword.trim().length() == 0) {
					errMsgs.add("密碼 請勿空白");
				}
				
				String smgrName = req.getParameter("smgrName");
				if(smgrName == null || smgrName.trim().length() == 0) {
					errMsgs.add("管理員名稱 請勿空白");
				}
				
				String smgrPhone = req.getParameter("smgrPhone");
				if(smgrPhone == null || smgrPhone.trim().length() == 0) {
					errMsgs.add("聯絡電話 請勿空白");
				}
				
				Integer smgrGender = Integer.valueOf(req.getParameter("smgrGender"));
				
				String smgrAddress = req.getParameter("smgrAddress");
				if(smgrAddress == null || smgrAddress.trim().length() == 0) {
					errMsgs.add("詳細地址 請勿空白");
				}
				
				ServerManagerVO smVO = new ServerManagerVO();
				
				smVO.setSmgrId(smgrId);
				smVO.setSmgrEmail(smgrEmail);
				smVO.setSmgrAccount(smgrAccount);
				smVO.setSmgrPassword(smgrPassword);
				smVO.setSmgrName(smgrName);
				smVO.setSmgrPhone(smgrPhone);
				smVO.setSmgrGender(smgrGender);
				smVO.setSmgrAddress(smgrAddress);
				
				if(!errMsgs.isEmpty()) {
					req.setAttribute("smVO", smVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/server_manager/addServerManager.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
				smVO = smSvc.insert(smgrId, smgrEmail, smgrAccount, 
						smgrPassword, smgrName, smgrPhone, smgrGender, smgrAddress);
				
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back_end/server_manager/listAllServerManager.jsp";
				RequestDispatcher successView = req
						.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/server_manager/addServerManager.jsp");
				failureView.forward(req, res);
			} 
		}
		if("delete".equals(action)) {
			
			try {
				Integer smgrId = Integer.valueOf(req.getParameter("smgrId"));
				
				ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
				smSvc.delete(smgrId);
				
				RequestDispatcher view = req.getRequestDispatcher("/back_end/server_manager/admin.jsp");
			} catch (NumberFormatException e) {
				System.out.println("刪除後臺管理員失敗");
				e.printStackTrace();
			}
		}
		
	}
	
	public boolean allowUser(String account, String password) {
		
		//【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
		// 應至資料庫搜尋比對
		//DB
		System.out.println("allowUser");
		ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
		System.out.println("產生smSvc: "+ smSvc);
		ServerManagerVO smVO = smSvc.findByAccount(account); //DB的password
		if (smVO == null) {
			return false;
		}
		
		String ans = smVO.getSmgrPassword();
		System.out.println("ans: "+ ans);
		
		if(account.equals(account) && ans.equals(password))
			return true;
		else 
			return false;
	}
	
	public ServerManagerVO aquireVO(String account) {
		ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();		
		ServerManagerVO smVO = smSvc.findByAccount(account); //DB的password
		return smVO;
	}
}


