package com.product_order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
import com.product.model.ProductServiceImpl;
import com.product_order.model.ProductOrderService;
import com.product_order.model.ProductOrderServiceImpl;
import com.product_order.model.ProductOrderVO;

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
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListOne.jsp");
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
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListOne.jsp");
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
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListOne.jsp");
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
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListOne.jsp");
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
				e.printStackTrace();
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

//		if ("updatestatusto2".equals(action)) {
//
//			List<String> errorMsgs = new LinkedList<String>();
//
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//
//				Integer id = Integer.valueOf(req.getParameter("id"));
//
//				System.out.println("id=" + id);
//				// 設定狀態變為2
//				Integer status = 2;
//
//
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				/*************************** 2.開始修改資料 *****************************************/
//				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
//				boolean success = poSvc.changeStatus(id, status);
//
//				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				String url = "/front_end/product/listAllproductOrder.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				e.printStackTrace();
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
//				failureView.forward(req, res);
//			}
//		}

//		待出貨

		if ("waitGO".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.waitGO(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}
//		已出貨
		if ("go".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.go(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				failureView.forward(req, res);
			}
		}
		if ("complete".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.complete(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}

		if ("accountOne".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.accountOne(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("accountTwo".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.accountTwo(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("cancelOne".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.cancelOne(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("returnOne".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.returnOne(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("cancelTwo".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.cancelTwo(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				failureView.forward(req, res);
			}
		}
		if ("returnTwo".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.returnTwo(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/listAllproductOrder.jsp");
				failureView.forward(req, res);
			}
		}
		if ("sellerCancelOne".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.sellerCancelOne(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				failureView.forward(req, res);
			}
		}
		if ("sellerCancelTwo".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int id = Integer.valueOf(req.getParameter("id").trim());

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.sellerCancelTwo(id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("vo", vo);
				RequestDispatcher successView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_ListAll_Sell.jsp");
				failureView.forward(req, res);
			}
		}

		if ("retrieveById".equals(action)) { // 來自select_page.jsp的請求

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
				ProductOrderVO vo = poSvc.retrieveById(id);
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

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

				System.out.println("memberVO" + memberVO);
				if (memberVO == null) {
					// TODO

					System.out.println("insert enter");
					return;
				}
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

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo); // 含有輸入格式錯誤的FaqVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Create.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.addProductOrder(productId, customerMemberId, sellerMemberId, productName, phone, address,
						date, amountOfProduct, status, amountOfPrice);
				
				ProductServiceImpl pdSer = new ProductServiceImpl();
				pdSer.updateStatus(productId);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front_end/product/listAllproductOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllFaq.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_Create.jsp");
				failureView.forward(req, res);
			}
		}

		if ("reviseOrder".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer id = Integer.valueOf(req.getParameter("id"));
				String productName = req.getParameter("productName");
				String phone = req.getParameter("phone");
				String address = req.getParameter("address");

				ProductOrderVO vo = new ProductOrderVO();
				vo.setId(id);
				vo.setProductName(productName);
				vo.setPhone(phone);
				vo.setAddress(address);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("vo", vo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/front_ProductOrder_Update.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
				vo = poSvc.reviseOrder(id, productName, phone, address);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productOrderVO", vo);
				String url = "/front_end/product/front_ProductOrder_ListOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/front_ProductOrder_Update.jsp");
				failureView.forward(req, res);
			}
		}

	}
}