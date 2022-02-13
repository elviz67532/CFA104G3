package com.server_manager_function.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server_manager_function.model.ServerManageFunctionServiceImpl;
import com.server_manager_function.model.ServerManageFunctionVO;

/**
 * Servlet implementation class ServerManageFunctionServlet
 */
@WebServlet("/ServerManageFunctionServlet")
public class ServerManageFunctionServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = (String) req.getParameter("smgeFuncId");
				if(str == null || (str.trim()).length() == 0) {
					errMsgs.add("請輸入管理功能編號");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/server_manager_function/ManagerFunHom.jsp");
					return; //程式中斷
				}
				
				
				Integer smgeFuncId = 0;
				try {
					smgeFuncId = Integer.valueOf(str);
					System.out.println(smgeFuncId);
				} catch (NumberFormatException e) {
					errMsgs.add("管理功能編號格式不對");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/server_manager_function/ManagerFunHom.jsp");
					return; //程式中斷				
				}
				System.out.println("接收請求參數完成");
				
				/***************************2.開始查詢資料*****************************************/
				System.out.println("開始查詢資料");
				ServerManageFunctionServiceImpl serverManageFunctionSvc = new ServerManageFunctionServiceImpl();
				ServerManageFunctionVO serverManageFunctionVO = serverManageFunctionSvc.GetFromId(smgeFuncId);
				System.out.println("serverManageFunctionVO: " + serverManageFunctionVO);
				
				if(serverManageFunctionVO == null) {
					errMsgs.add("查無資料");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/server_manager_function/ManagerFunHom.jsp");
					return; //程式中斷				
				}			
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				System.out.println("查詢完成,準備轉交");
				req.setAttribute("smfVO", serverManageFunctionVO);
				String url = "/server_manager_function/listOneSMF.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				System.out.println("successView");
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/server_manager_function/ManagerFunHom.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if("getOne_For_Update".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數**********************/
				Integer smgeFuncId = Integer.valueOf(req.getParameter("smgeFuncId"));
				
				/***************************2.開始查詢資料****************************************/	
				ServerManageFunctionServiceImpl smfSvc = new ServerManageFunctionServiceImpl();
				ServerManageFunctionVO smfVO = smfSvc.GetFromId(smgeFuncId);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/		
				req.setAttribute("smfVO", smfVO);
				String url = "/server_manager_function/update_SMF_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				System.out.println("成功轉交了");
				successView.forward(req, res);
			} catch (NumberFormatException e) {
				errMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/server_manager_function/listAllSMF.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer smgeFuncId = Integer.valueOf(req.getParameter("smgeFuncId").trim());
				
				String smgeFunc = req.getParameter("smgeFunc");
				if(smgeFunc == null || smgeFunc.trim().length() == 0) {
					errMsgs.add("管理功能名稱: 請勿空白");
				}
				
				ServerManageFunctionVO smfVO = new ServerManageFunctionVO();
				smfVO.setSmgeFuncId(smgeFuncId);
				smfVO.setSmgeFunc(smgeFunc);
				
				if(!errMsgs.isEmpty()) {
					req.setAttribute("smfVO", smfVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/server_manager_function/update_SMF_input.jsp");
					failureView.forward(req, res);
				}
				
				/***************************2.開始修改資料*****************************************/
				ServerManageFunctionServiceImpl smfSvc = new ServerManageFunctionServiceImpl();
				ServerManageFunctionVO smfVONew = smfSvc.update(smfVO);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("smfVO", smfVONew);
				String url = "/server_manager_function/listOneSMF.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/server_manager_function/update_SMF_input.jsp");
				failureView.forward(req, res);				
			}
		}
		
		if("insert".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer smgeFuncId = Integer.valueOf(req.getParameter("smgeFuncId").trim());
				
				String smgeFunc = req.getParameter("smgeFunc");
				
				if(smgeFunc == null || smgeFunc.trim().length() == 0) {
					errMsgs.add("管理功能名稱:請勿空白");
				}
				
				ServerManageFunctionVO smfVO = new ServerManageFunctionVO();
				smfVO.setSmgeFuncId(smgeFuncId);
				smfVO.setSmgeFunc(smgeFunc);
				
				if(!errMsgs.isEmpty()) {
					req.setAttribute("smfVO", smfVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/server_manager_function/update_SMF_input.jsp");
					failureView.forward(req, res);
				}
				
				/***************************2.開始新增資料***************************************/
				ServerManageFunctionServiceImpl smfSvc = new ServerManageFunctionServiceImpl();
				smfSvc.insert(smgeFuncId, smgeFunc);
				System.out.println("smf新增資料完成");
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/	
				String url = "/server_manager_function/listAllSMF.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				System.out.println("successView");
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("smf新增資料失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/server_manager_function/addSMF.jsp");
				failureView.forward(req, res);						
			} 				
		}
		
		if("delete".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);			
			
			try {
				/***************************1.接收請求參數**********************/
				Integer smgeFuncId = Integer.valueOf(req.getParameter("smgeFuncId").trim());
				
				/***************************2.開始刪除資料***************************************/
				ServerManageFunctionServiceImpl smfSvc = new ServerManageFunctionServiceImpl();
				smfSvc.delete(smgeFuncId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/server_manager_function/listAllSMF.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/server_manager_function/listAllSMF.jsp");
				failureView.forward(req, res);				
			}
		}
	}

}
