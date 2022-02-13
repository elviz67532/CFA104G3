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

import com.product.model.ProductServiceImpl;
import com.product.model.ProductVO;
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
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				ProductOrderVO productOrderVO = poSvc.getOneProductOrder(id);
				if (productOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫取出的empVO物件,存入req
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
							.getRequestDispatcher("/front_end/product/frontProductOrderMain.jsp");
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
							.getRequestDispatcher("/front_end/product/frontProductOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				ProductOrderVO productOrderVO = poSvc.getOneProductOrder(id);
				if (productOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/frontProductOrderMain.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/front_end/product/frontGetProductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/frontProductOrderMain.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				ProductOrderVO productOrderVO = poSvc.getOneProductOrder(id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/moveorderfrontend/moveComment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/frontGetProductOrder.jsp");
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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatecomment".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/moveorderfrontend/moveComment.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front_end/product/frontGetProductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/frontGetProductOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto1".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto2".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto3".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto4".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto1forone".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto2forone".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto3forone".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}

		if ("updatestatusto4forone".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

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

				ProductOrderVO productOrderVO = new ProductOrderVO();
				productOrderVO.setId(id);
				productOrderVO.setProductId(productId);
				productOrderVO.setCustomerMemberId(customerMemberId);
				productOrderVO.setSellerMemberId(sellerMemberId);
				productOrderVO.setProductName(productName);
				productOrderVO.setPhone(phone);
				productOrderVO.setAddress(address);
				productOrderVO.setDate(date);
				productOrderVO.setAmountOfProduct(amountOfProduct);
				productOrderVO.setStatus(status);
				productOrderVO.setAmountOfPrice(amountOfPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productOrderVO", productOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
					failureView.forward(req, res);

					return; // 程式中斷

				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				productOrderVO = poSvc.updateProductOrder(id, productId, customerMemberId, sellerMemberId, productName,
						phone, address, date, amountOfProduct, status, amountOfPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", productOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back_end/product/productOrderGetOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/productOrderGetOne.jsp");
				failureView.forward(req, res);
			}
		}
	}
}