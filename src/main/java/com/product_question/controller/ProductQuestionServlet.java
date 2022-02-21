package com.product_question.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.model.NewsServiceImpl;
import com.news.model.NewsVO;
import com.product_question.controller.*;
import com.product_question.model.*;

public class ProductQuestionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		/********
		 * 查詢單一*
		 ********/

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入問答編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("s");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					/***************************/
					id = Integer.valueOf(str);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("rs");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductQuestionServiceImpl questionSvc = new ProductQuestionServiceImpl();
				ProductQuestionVO pojo = questionSvc.selectById(id);

				if (pojo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("rs");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("questionVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "rone";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("rs");
				failureView.forward(req, res);
			}
		}

		/********
		 * 查詢會員*
		 ********/
		if ("GET_ONE_MEMBER".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入問答編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("s");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					/***************************/
					id = Integer.valueOf(str);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("rs");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductQuestionServiceImpl questionSvc = new ProductQuestionServiceImpl();
				ProductQuestionVO pojo = questionSvc.selectById(id);

				if (pojo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("rs");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("questionVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "rone";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("rs");
				failureView.forward(req, res);
			}
		}

		/********
		 * 新增 *
		 ********/

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String problem = req.getParameter("problem").trim();
				if (problem == null || problem.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}

				java.sql.Timestamp problemDate = null;
				try {
					problemDate = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException ie) {
					errorMsgs.add("請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
				}

				Integer memberId = null;
				Integer productId = null;
				String reply = null;
				Timestamp replyDate = null;

				ProductQuestionVO pojo = new ProductQuestionVO();
				pojo.setMemberId(memberId);
				pojo.setProductId(productId);
				pojo.setProblem(problem);
				pojo.setReply(reply);
				pojo.setProblemDate(problemDate);
				pojo.setReplyDate(replyDate);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("questionVO", pojo); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("add");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProductQuestionServiceImpl questionSvc = new ProductQuestionServiceImpl();
				pojo = questionSvc.insert(memberId, productId, problem, reply, problemDate, replyDate);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/manage";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("add");
				failureView.forward(req, res);
			}
		}

		/********
		 * 刪除 *
		 ********/
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/
				ProductQuestionServiceImpl questionSvc = new ProductQuestionServiceImpl();
				questionSvc.deleteById(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "manage";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("manage");
				failureView.forward(req, res);
			}
		}

		/********
		 * 更新 *
		 ********/

	}
}
