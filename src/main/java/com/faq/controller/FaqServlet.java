package com.faq.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.faq.model.*;
import com.product_order.model.ProductOrderService;
import com.product_order.model.ProductOrderServiceImpl;
import com.product_order.model.ProductOrderVO;

public class FaqServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始查詢資料 ****************************************/
				FaqServiceImpl faqSvc = new FaqServiceImpl();
				FaqVO faqVO = faqSvc.getOneFaq(id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("faqVO", faqVO); // 資料庫取出的FaqVO物件,存入req
				String url = "/back_end/faq/update_Faq_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Faq_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listOneFaq.jsp");
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

				Integer id = Integer.valueOf(req.getParameter("id").trim());

				String question = req.getParameter("question").trim();
				if (question == null || question.trim().length() == 0) {
					errorMsgs.add("問題請勿空白");
				}

				String answer = req.getParameter("answer").trim();
				if (answer == null || answer.trim().length() == 0) {
					errorMsgs.add("回答請勿空白");
				}

				FaqVO faqVO = new FaqVO();
				faqVO.setId(id);
				faqVO.setQuestion(question);
				faqVO.setAnswer(answer);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("faqVO", faqVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/update_Faq_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				FaqServiceImpl faqSvc = new FaqServiceImpl();
				faqVO = faqSvc.updateFaq(id, question, answer);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("faqVO", faqVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/faq/listOneFaq.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/update_Faq_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addFaq.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String question = req.getParameter("question").trim();
				if (question == null || question.trim().length() == 0) {
					errorMsgs.add("請勿空白");
				}

				String answer = req.getParameter("answer").trim();
				if (answer == null || answer.trim().length() == 0) {
					errorMsgs.add("請勿空白");
				}

				FaqVO faqVO = new FaqVO();

				faqVO.setQuestion(question);
				faqVO.setAnswer(answer);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("faqVO", faqVO); // 含有輸入格式錯誤的FaqVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/faq/homePage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				FaqService faqSvc = new FaqServiceImpl();
				faqVO = faqSvc.addFaq(question, answer);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/faq/listAllFaq.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllFaq.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllFaq.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/
				FaqService faqSvc = new FaqServiceImpl();
				faqSvc.deleteFaq(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/faq/listAllFaq.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
				failureView.forward(req, res);

			}
		}
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入FAQ編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("FAQ編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				FaqServiceImpl faqSvc = new FaqServiceImpl();
				FaqVO vo = faqSvc.getOneFaq(id);

				if (vo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/faq/listOneFaq.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理s *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/faq/listAllFaq.jsp");
				failureView.forward(req, res);
			}
		}

	}
}