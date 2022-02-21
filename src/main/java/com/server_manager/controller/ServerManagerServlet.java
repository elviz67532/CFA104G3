package com.server_manager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.server_manager.model.ServerManagerServiceImpl;
import com.server_manager.model.ServerManagerVO;
import com.server_manager_auth.model.ServerManagerAuthDAOJDBCImpl;
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
		if ("loginhandler".equals(action)) {
			Map<String, String> errMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/	
				// 【取得使用者 帳號(account) 密碼(password)】
				String account = req.getParameter("account");
				String password = req.getParameter("password");
				
				// 【用戶登入失敗】
				if(account == null || account.trim().length() == 0) {
					errMsgs.put("account", "用戶名不可為空，請您輸入");
				}
				if(password == null || (password.trim()).length() == 0) {
					errMsgs.put("password", "請輸入密碼");
				}
				
				req.setAttribute("inputAccount", account);
				req.setAttribute("inputPassword", password);
				
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
					failureView.forward(req, res);
					return;					
				}	
				
				// 【檢查該帳號 , 密碼是否有效】
				if (!allowUser(account, password)) { // 【帳號 , 密碼無效時】
					errMsgs.put("account", "你的帳號 , 密碼無效!");
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
					failureView.forward(req, res);
					return;	
				} 

				// 【帳號 , 密碼有效時, 才做以下工作】
				ServerManagerVO smVO = aquireVO(account);
				//【取得 & 設定 session】
				HttpSession session = req.getSession();
				session.setAttribute("ServerManagerVO", smVO);
				session.setAttribute("account", account);
				
				//【取得角色】 DB 撈資料
				ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
				ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
				Integer smgrId = smSvc.getId(account);
				List<ServerManagerAuthVO> list = smaSvc.selectByManager(smgrId); //【取得smaId】
				session.setAttribute("auth", list);
				
				// 來源頁面跳轉
				String location = (String) session.getAttribute("beforeLoginURL");
				if (location != null) { 
					session.removeAttribute("beforeLoginURL"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
				res.sendRedirect(req.getContextPath() + "/back_end/server_manager/serverManagerHom.jsp"); // *工作3:
			} catch (IOException e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/server_manager/loginServer.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.invalidate();
			res.sendRedirect(req.getContextPath() + "/back_end/server_manager/serverManagerHom.jsp");
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
				smVO = smSvc.insert(smgrEmail, smgrAccount, 
						smgrPassword, smgrName, smgrPhone, smgrGender, smgrAddress);
				smVO.setSmgrId(smgrId);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back_end/server_manager/listAllServerManager.jsp";
				RequestDispatcher successView = req
						.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/server_manager/addManager.jsp");
				failureView.forward(req, res);
			} 
		}
		if("update".equals(action)) {
			Integer smgrId = Integer.valueOf(req.getParameter("smgrId"));
			String[] smgeAuthIds = req.getParameterValues("smgeAuthId");
			System.out.println(smgeAuthIds);
			System.out.println("update smgrId: " + smgrId);
			for(String smgeAuthId : smgeAuthIds) {
				System.out.println("update smgeAuthId: " + smgeAuthId.toString());
			}
			//【delete】
			ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
			smaSvc.deleteById(smgrId);
//			for(String smgeAuthId : smgeAuthIds) {
//				Integer smgeAuthId_ = Integer.valueOf(smgeAuthId);
//				DualKey<Integer, Integer> dual = new DualKey<Integer, Integer>(smgeAuthId_, smgrId);
//				smaSvc.deleteById(dual);
//				//System.out.println("update smgeAuthId: " + smgeAuthId.toString());
//			}
			//【insert】
			for(String smgsAuthId : smgeAuthIds) {
				ServerManagerAuthVO smaVO = new ServerManagerAuthVO();
				Integer smgeAuthId_ = Integer.valueOf(smgsAuthId);
				smaVO.setSmgeAuthId(smgeAuthId_);
				smaVO.setSmgrId(smgrId);
				smaSvc.insert(smaVO);
			}
			
			RequestDispatcher view  = req
					.getRequestDispatcher("/back_end/server_manager/admin.jsp");
			view.forward(req, res);
		}
		
		System.out.println("action=" + action);
		if("delete".equals(action)) {
			System.out.println("action");
			try {
				Integer smgrId = Integer.valueOf(req.getParameter("smgrId"));
				ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
				smaSvc.deleteById(smgrId);				
				ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
				smSvc.delete(smgrId);
				//Integer smgeAuthId = Integer.valueOf(req.getParameter("smgeAuthId"));
				//System.out.println("delete smgeAuthId: " + smgeAuthId);
				//DualKey<Integer, Integer> dual = new DualKey<Integer, Integer>(smgeAuthId, smgrId);
//				try {
//					ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
//					DualKey<Integer, Integer> dual = new DualKey<Integer, Integer>(smgeAuthId, smgrId);
//					smaSvc.deleteById(dual);
//				} catch (Exception e) {
//					
//					e.printStackTrace();
//				}

				RequestDispatcher view = req.getRequestDispatcher("/back_end/server_manager/admin.jsp");
				view.forward(req, res);
			} catch (NumberFormatException e) {
				System.out.println("刪除後臺管理員失敗");
				e.printStackTrace();
			}
		}
		
		if("insert_manager_and_auth".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);			
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				//Integer smgrId = Integer.valueOf(req.getParameter("smgrId")); // 自增主鍵
				Integer smgrId = null;
				
				//【勾取的權限】
				String[] smgeAuthIds = req.getParameterValues("smgeAuthId");
				System.out.println(smgeAuthIds);
				System.out.println("update smgrId: " + smgrId);
				for(String smgeAuthId : smgeAuthIds) {
					System.out.println("update smgeAuthId: " + smgeAuthId.toString());
				}
				
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
				
				//smVO.setSmgrId(smgrId);
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
							.getRequestDispatcher("/back_end/server_manager/addManager.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始新增資料 先新增manager 再新增auth*****************************/
				ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
				smVO = smSvc.insert(smgrEmail, smgrAccount, smgrPassword, smgrName, smgrPhone, smgrGender, smgrAddress);
				// 取得smgrId
				smgrId = smSvc.getId(smgrAccount);
				smVO.setSmgrId(smgrId);
				
				// 新增權限
				ServerManagerAuthServiceImpl smaSvc = new ServerManagerAuthServiceImpl();
				for(String smgeAuthId : smgeAuthIds) {
					ServerManagerAuthVO smaVO = new ServerManagerAuthVO();
					Integer smgeAuthId_ = Integer.valueOf(smgeAuthId);
					smaVO.setSmgeAuthId(smgeAuthId_);
					smaVO.setSmgrId(smgrId);
					smaSvc.insert(smaVO);
				}
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				RequestDispatcher view = req
						.getRequestDispatcher("/back_end/server_manager/admin.jsp");
				view.forward(req, res);
			} catch (Exception e) {
				errMsgs.add("新增管理員失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/server_manager/addManager.jsp");
				failureView.forward(req, res);
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


