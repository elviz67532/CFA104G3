package com.move_order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


import com.move_order.model.*;

public class MoveOrderServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
				if (moveOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Displayfront".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
				if (moveOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/moveorderfrontend/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));
				
				/***************************2.開始查詢資料****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("moveOrderVO", moveOrderVO);         // 資料庫取出的empVO物件,存入req
				String url = "/moveorderfrontend/moveComment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/frontGetMoveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				Integer status = Integer.valueOf(req.getParameter("status").trim());
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatecomment".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				Integer status = Integer.valueOf(req.getParameter("status").trim());
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveComment.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderfrontend/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/frontGetMoveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto1".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為1
				Integer status = 1;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto2".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為2
				Integer status = 2;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto3".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為3
				Integer status = 3;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto4".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為4
				Integer status = 4;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto1forone".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為1
				Integer status = 1;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto2forone".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為2
				Integer status = 2;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto3forone".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為3
				Integer status = 3;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto4forone".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("請輸入金額");
				}
				String comment = req.getParameter("comment");
				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer memberId = Integer.valueOf(req.getParameter("memberId"));
				String customer = req.getParameter("customer");
				String phone = req.getParameter("phone");
				String fromAddress = req.getParameter("fromAddress");
				String toAddress = req.getParameter("toAddress");
				Timestamp moveDate = java.sql.Timestamp.valueOf(req.getParameter("moveDate"));
				Integer amountFirst = Integer.valueOf(req.getParameter("amountFirst").trim());
				Integer deposit = Integer.valueOf(req.getParameter("deposit").trim());
				Timestamp orderDate = java.sql.Timestamp.valueOf(req.getParameter("orderDate"));
				//設定狀態變為4
				Integer status = 4;
				

				
				MoveOrderVO moveOrderVO = new MoveOrderVO();
				moveOrderVO.setId(id);
				moveOrderVO.setMemberId(memberId);
				moveOrderVO.setAmountTotal(amountTotal);
				moveOrderVO.setComment(comment);
				moveOrderVO.setCustomer(customer);
				moveOrderVO.setPhone(phone);
				moveOrderVO.setFromAddress(fromAddress);
				moveOrderVO.setToAddress(toAddress);
				moveOrderVO.setMoveDate(moveDate);
				moveOrderVO.setAmountFirst(amountFirst);
				moveOrderVO.setDeposit(deposit);
				moveOrderVO.setOrderDate(orderDate);
				moveOrderVO.setStatus(status);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("moveOrderVO", moveOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
