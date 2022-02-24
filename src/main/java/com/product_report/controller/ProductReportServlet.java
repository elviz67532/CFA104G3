package com.product_report.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
import com.notification.model.ENotificationType;
import com.notification.model.NotificationServiceImpl;
import com.product_report.model.ProductReportServiceImpl;
import com.product_report.model.ProductReportVO;

import core.DualKey;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProductReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		/******************************
		 * 查詢單一 "getOne_For_Display"*
		 ******************************/

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **************************/

				/**************************** 1-2 檢查商品編號 *********************************/
				String str = req.getParameter("k2");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productReportManage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer productId = null;
				try {
					/***************************/
					productId = Integer.valueOf(str);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productReportManage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/**************************** 1-1 檢查會員編號 *************************************/
				String str1 = req.getParameter("k1");
				if (str1 == null || (str1.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productReportManage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer memberId = null;
				try {
					/***************************/
					memberId = Integer.valueOf(str1);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productReportManage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductReportServiceImpl reportSvc = new ProductReportServiceImpl();
				DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(productId, memberId);
				ProductReportVO pojo = reportSvc.selectById(id);

				if (pojo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productReportManage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productReportVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/product/listOneReport.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/product/productReportManage.jsp");
				failureView.forward(req, res);
			}
		}

		/****************
		 * 新增 "insert" *
		 ****************/

		System.out.println("--------------------------");
		System.out.println(action);
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
			
			HttpSession session = req.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			

			
			System.out.println("memberVO" + memberVO);
			if (memberVO == null) {
				// TODO 
				
				System.out.println("insert enter");
				return;
			}
			Integer memberId = memberVO.getId();
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.			
			req.setAttribute("errorMsgs", errorMsgs);
			/***************************新增通知*****************************************/
			NotificationServiceImpl notSvc = new NotificationServiceImpl();
			notSvc.addNotification(memberId, "您被檢舉囉!!!小心點。", ENotificationType.PRODUCT);
			
			
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer productId = null;
				try {
					productId = Integer.valueOf(req.getParameter("productId").trim());
				} catch (NumberFormatException e) {
					productId = 0;
					errorMsgs.add("請輸入商品編號.");
				}
				
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}

				java.sql.Timestamp date = null;

				try {
					date = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException ie) {
					errorMsgs.add("請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
				}

				InputStream in = req.getPart("photo").getInputStream();
				byte[] photo = null;
				if (in.available() != 0) {
					photo = new byte[in.available()];
					in.read(photo);
					in.close();
				} else {

					errorMsgs.add("請上傳圖片");
				}

				Integer status = null;
				try {
					status = Integer.valueOf(req.getParameter("status").trim());
				} catch (NumberFormatException e) {
					status = 0;
					errorMsgs.add("未設定預設狀態");
				}

				ProductReportVO pojo = new ProductReportVO();
				pojo.setProductId(productId);
				pojo.setMemberId(memberId);
				pojo.setContent(content);
				pojo.setDate(date);
				pojo.setPhoto(photo);
				pojo.setStatus(status);

				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productReportVO", pojo); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/productReport.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProductReportServiceImpl reportSvc = new ProductReportServiceImpl();
				pojo = reportSvc.insert(productId, memberId, content, date, photo, status);
				
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front_end/product/homePage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/productReport.jsp");
				failureView.forward(req, res);
			}
		}

		/***************
		 * 刪除 "delete"*
		 ***************/
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer memberId = Integer.valueOf(req.getParameter("k1"));
				Integer productId = Integer.valueOf(req.getParameter("k2"));
				/*************************** 2.開始刪除資料 ***************************************/
				ProductReportServiceImpl reportSvc = new ProductReportServiceImpl();
				DualKey<Integer, Integer> id = new DualKey<Integer, Integer>(memberId, productId);
				reportSvc.deleteById(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/product/productReportManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/listOneReport.jsp");
				failureView.forward(req, res);
			}
		}
	}
}