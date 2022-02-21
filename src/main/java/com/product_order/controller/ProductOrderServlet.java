package com.product_order.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faq.model.FaqService;
import com.faq.model.FaqServiceImpl;
import com.move_order.model.MoveOrderServiceImpl;
import com.move_order.model.MoveOrderVO;
import com.product_order.model.*;

//@WebServlet("/Shop_OrderReturnServlet")
public class ProductOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					id = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductOrderService poSvc = new ProductOrderServiceImpl();
				ProductOrderVO vo = poSvc.getOneProductOrder(id);
				if (vo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderMain.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Displayfront".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Retrieve.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
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
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Retrieve.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				ProductOrderVO vo = poSvc.getOneProductOrder(id);
				if (vo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Retrieve.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo); // 資料庫取出的empVO物件,存入req
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_Retrieve.jsp");
				failureView.forward(req, res);
			}
		}

		// 前台修改訂單資料
		if ("getOne_For_Update_Order_Front".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			System.out.println(action);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				ProductOrderVO vo = poSvc.getOneProductOrder(id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_Update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListOne.jsp");
				failureView.forward(req, res);
			}
		}

		// 送出更新訂單按鈕
		if ("Update_Front".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				Integer status = Integer.valueOf(req.getParameter("status").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}
		if ("delete_front".equals(action)) { // 來自listAll.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/

				ProductOrderService poSvc = new ProductOrderServiceImpl();
				poSvc.deleteProductOrder(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front_end/product/listAllproductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);

			}
		}
		if ("delete_back".equals(action)) { // 來自listAll.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/

				ProductOrderService poSvc = new ProductOrderServiceImpl();
				poSvc.deleteProductOrder(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/product/listAllproductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {

				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);

			}
		}
		if ("updatestatusto1".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為0
				Integer status = 0;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto1".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為1
				Integer status = 1;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto2".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為2
				Integer status = 2;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/listAllproductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto3".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為3
				Integer status = 3;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto4".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為4
				Integer status = 4;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto5".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為5
				Integer status = 5;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/listAllproductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto6".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為6
				Integer status = 6;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto7".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為7
				Integer status = 7;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto8".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer amountOfPrice = null;
				try {
					amountOfPrice = Integer.valueOf(req.getParameter("amountOfPrice").trim());
				} catch (NumberFormatException e) {
					amountOfPrice = 0;
					errorMsgs.add("請輸入金額");
				}

				Integer id = Integer.valueOf(req.getParameter("id"));
				Integer productId = Integer.valueOf(req.getParameter("productId"));
				Integer customerMemberId = Integer.valueOf(req.getParameter("customerMemberId"));
				Integer sellerMemberId = Integer.valueOf(req.getParameter("sellerMemberId"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");
				Integer amountOfProduct = Integer.valueOf(req.getParameter("amountOfProduct"));
				Timestamp date = java.sql.Timestamp.valueOf(req.getParameter("date"));
				// 設定狀態變為8
				Integer status = 8;

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductId(productId);
				vo.setCustomerMemberId(customerMemberId);
				vo.setSellerMemberId(sellerMemberId);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);
				vo.setDate(date);
				vo.setAmountOfProduct(amountOfProduct);
				vo.setStatus(status);
				vo.setAmountOfPrice(amountOfPrice);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName, phone,
						address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("vo", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}
	}
}