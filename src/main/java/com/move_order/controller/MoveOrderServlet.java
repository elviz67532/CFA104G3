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
	
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("�q��s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
				if (moveOrderVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveMain.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Displayfront".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�q��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("�q��s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
				if (moveOrderVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/moveorderfrontend/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/moveMainFront.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));
				
				/***************************2.�}�l�d�߸��****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				MoveOrderVO moveOrderVO = moSvc.getOneMoveOrder(id);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("moveOrderVO", moveOrderVO);         // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/moveorderfrontend/moveComment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/frontGetMoveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatecomment".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderfrontend/moveComment.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderfrontend/frontGetMoveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderfrontend/frontGetMoveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto1".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�1
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto2".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�2
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto3".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�3
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto4".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�4
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto1forone".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�1
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto2forone".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�2
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto3forone".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�3
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updatestatusto4forone".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/

				Integer amountTotal = null;
				try {
					amountTotal = Integer.valueOf(req.getParameter("amountTotal").trim());
				} catch (NumberFormatException e) {
					amountTotal = 0;
					errorMsgs.add("�п�J���B");
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
				//�]�w���A�ܬ�4
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
					req.setAttribute("moveOrderVO", moveOrderVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
					failureView.forward(req, res);

					return; //�{�����_
					
				}

				/***************************2.�}�l�ק���*****************************************/
				MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
				moveOrderVO = moSvc.updateMoveOrder(id, memberId, customer, phone, fromAddress, toAddress, moveDate, amountFirst, deposit, amountTotal, comment, orderDate, status);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("moveOrderVO", moveOrderVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
				String url = "/moveorderbackend/moveOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/moveorderbackend/moveOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
