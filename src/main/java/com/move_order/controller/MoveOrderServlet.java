package com.move_order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.member.model.MemberVO;
import com.move_order.model.*;
import com.notification.model.ENotificationType;
import com.notification.model.NotificationServiceImpl;
import com.notification.model.NotificationVO;

import core.FrontEndMemberFilter;

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
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
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
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
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
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
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
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
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
				

				
				MoveOrderVO moveOrderVO1 = new MoveOrderVO();
				moveOrderVO1.setId(id);
				moveOrderVO1.setMemberId(memberId);
				moveOrderVO1.setAmountTotal(amountTotal);
				moveOrderVO1.setComment(comment);
				moveOrderVO1.setCustomer(customer);
				moveOrderVO1.setPhone(phone);
				moveOrderVO1.setFromAddress(fromAddress);
				moveOrderVO1.setToAddress(toAddress);
				moveOrderVO1.setMoveDate(moveDate);
				moveOrderVO1.setAmountFirst(amountFirst);
				moveOrderVO1.setDeposit(deposit);
				moveOrderVO1.setOrderDate(orderDate);
				moveOrderVO1.setStatus(status);

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO1 = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				List<MoveOrderVO> moveOrderVO = moSvc.getByMemberId(memberId);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front_end/move/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/move/frontGetMoveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_By_Mem".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if(memberVO == null) {

					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/move/frontGetMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				int memberId = memberVO.getId();
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				List<MoveOrderVO> moveOrderVO = moSvc.getByMemberId(memberId);
					
			/***************************2.開始查詢資料*****************************************/
				if (moveOrderVO.isEmpty()) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
			 	if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/move/frontGetMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/front_end/move/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/move/homePage.jsp");
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}
				
				/***************************新增通知*****************************************/
				NotificationServiceImpl notSvc = new NotificationServiceImpl();
				notSvc.addNotification(memberId, "訂單已經取消了喔", ENotificationType.MOVE);

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}
				/***************************新增通知*****************************************/
				NotificationServiceImpl notSvc = new NotificationServiceImpl();
				notSvc.addNotification(memberId, "等待搬家人員前往您的地址進行搬家", ENotificationType.MOVE);
				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}
				
				/***************************新增通知*****************************************/
				NotificationServiceImpl notSvc = new NotificationServiceImpl();
				notSvc.addNotification(memberId, "您的貨品正在運送中了喔", ENotificationType.MOVE);
				
				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}
				/***************************新增通知*****************************************/
				
				NotificationServiceImpl notSvc = new NotificationServiceImpl();
				notSvc.addNotification(memberId, "您的訂單已經完成囉，如果還沒有寫過評論，請不要吝嗇給予我們指教喔", ENotificationType.MOVE);
				
				
				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getMem_For_Display".equals(action)) { // 來自select_page.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("memberid");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer memberId = null;
				try {
					memberId = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				List<MoveOrderVO> moveOrderVO = moSvc.getByMemberId(memberId);
				if (moveOrderVO.isEmpty()) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/move/readMoveOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto1bymem".equals(action)) { // 來自update_emp_input.jsp的請求
			
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto2bymem".equals(action)) { // 來自update_emp_input.jsp的請求
			
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto3bymem".equals(action)) { // 來自update_emp_input.jsp的請求
			
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto4bymem".equals(action)) { // 來自update_emp_input.jsp的請求
			
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
							.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //程式中斷
					
				}

				/***************************2.開始修改資料*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/move/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/move/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
