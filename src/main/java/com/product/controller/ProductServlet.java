package com.product.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.eclipse.jdt.internal.compiler.ast.WhileStatement;

import com.member.model.MemberVO;
import com.product.model.ProductDAOImpl;
import com.product.model.ProductServiceImpl;
import com.product.model.ProductVO;
import com.product_photo.model.ProductPhotoServiceImpl;


public class ProductServlet extends HttpServlet {

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
				String str = req.getParameter("prodId");
				if(str == null || (str.trim()).length() == 0) { // 沒有輸入資料 或 僅輸入空格
					errMsgs.add("請輸入商品編號");
				}
				if (!errMsgs.isEmpty()) { // errorMsgs有內容
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;
				}
				
				// 格式不正確
				Integer prodno = null;
				try {
					prodno = new Integer(str);
				} catch (NumberFormatException e) {
					errMsgs.add("商品編號格是不正確");
				}
				
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;		
				}
				
				/***************************2.開始查詢資料*****************************************/	
				ProductServiceImpl productSvc = new ProductServiceImpl();
				ProductVO prodVo = productSvc.getOneProduct(prodno);
				if(prodVo == null) {
					errMsgs.add("查無資料");
				}
				
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;//程式中斷				
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("productVO", prodVo);
				String url = "/front_end/product/singleItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/Seller.jsp");
				failureView.forward(req, res);
				return;				
			}	
			
		}
		
		if("getOne_For_Display_Backend".equals(action)) {

			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/			
				String str = req.getParameter("prodId");
				if(str == null || (str.trim()).length() == 0) { // 沒有輸入資料 或 僅輸入空格
					errMsgs.add("請輸入商品編號");
				}
				if (!errMsgs.isEmpty()) { // errorMsgs有內容
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;
				}
				
				// 格式不正確
				Integer prodno = null;
				try {
					prodno = new Integer(str);
				} catch (NumberFormatException e) {
					errMsgs.add("商品編號格是不正確");
				}
				
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;		
				}
				
				/***************************2.開始查詢資料*****************************************/	
				ProductServiceImpl productSvc = new ProductServiceImpl();
				ProductVO prodVo = productSvc.getOneProduct(prodno);
				if(prodVo == null) {
					errMsgs.add("查無資料");
				}
				
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/product/seller.jsp");
					failureView.forward(req, res);
					return;//程式中斷				
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("productVO", prodVo);
				String url = "/back_end/product/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/Seller.jsp");
				failureView.forward(req, res);
				return;				
			}				
		}
		
		if("get_Display_From_Type".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數**********************/
				Integer prodType = Integer.valueOf(req.getParameter("prodType"));
				
				/***************************2.開始查詢資料*****************************************/	
				ProductServiceImpl productSvc = new ProductServiceImpl();
				List<ProductVO> list = productSvc.getProductsByType(prodType);
				
				if(list == null) {
					errMsgs.add("目前無這類商品");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/Seller.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("list", list);
				String url = "/front_end/product/listOneTypeProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/product/Seller.jsp");
				failureView.forward(req, res);
				return;
			}
			
		}
		
		if("get_Display_From_Type_Backend".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數**********************/
				Integer prodType = Integer.valueOf(req.getParameter("prodType"));
				
				/***************************2.開始查詢資料*****************************************/	
				ProductServiceImpl productSvc = new ProductServiceImpl();
				List<ProductVO> list = productSvc.getProductsByType(prodType);
				
				if(list == null) {
					errMsgs.add("目前無這類商品");
				}
				if(!errMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/seller.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("list", list);
				String url = "/back_end/product/listOneTypeProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/product/seller.jsp");
				failureView.forward(req, res);
				return;
			}			
		}

		if("getOne_For_Update".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs); // 放置到request裡面	
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer prodId = Integer.valueOf(req.getParameter("prodId"));
//				System.out.println("ProductServlet-getoneforupdate: " + prodId); // 有取得數值
				/***************************2.開始查詢資料****************************************/
				ProductServiceImpl productSvc = new ProductServiceImpl();
				ProductVO productVO = productSvc.getOneProduct(prodId);
				
				/***************************3.查詢完成，準備轉交****************************************/
				req.setAttribute("productVO", productVO);
				String url = "/front_end/product/update_product_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/front_end/product/listAll.jsp");
				failView.forward(req, res);
			} 
		}	
		
		if("getOne_For_Update_Img".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs); // 放置到request裡面	
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer prodId = Integer.valueOf(req.getParameter("prodId"));
//				System.out.println("ProductServlet-getoneforupdate: " + prodId); // 有取得數值
				/***************************2.開始查詢資料****************************************/
				ProductServiceImpl productSvc = new ProductServiceImpl();
				ProductVO productVO = productSvc.getOneProduct(prodId);
				
				/***************************3.查詢完成，準備轉交****************************************/
				req.setAttribute("productVO", productVO);
				String url = "/front_end/product/update_img.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/front_end/product/listAll.jsp");
				failView.forward(req, res);
			} 
		}			
		
		if("update".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs); // 放置到request裡面	

			/***************************1.接收請求參數****************************************/
			Integer prodId = Integer.valueOf(req.getParameter("prodId").trim());
			
			Integer memId = null;
			try {
				memId = Integer.valueOf(req.getParameter("memId").trim());
			} catch (NumberFormatException e) {
				/*檢查是否為 number*/
				errMsgs.add("會員編號請填入正整數");
			}

			Integer prodType = Integer.valueOf(req.getParameter("prodType").trim());
			/*檢查是否為 0 1 2 3 4*/

			String prodDesc = req.getParameter("prodDesc").trim();
			if(prodDesc == null || prodDesc.trim().length() == 0) {
				errMsgs.add("商品敘述請勿空白");
			}
			
			Integer prodPrice = null;
			try {
				prodPrice = Integer.valueOf(req.getParameter("prodPrice"));
			} catch (NumberFormatException e) {
				errMsgs.add("請填入商品價格");
			}
			
			String prodName = req.getParameter("prodName").trim();
			if (prodName == null || prodDesc.trim().length() == 0) {
				errMsgs.add("請填入商品名稱");
			}

			Timestamp prodUptime = null;
			try {
				prodUptime = Timestamp.valueOf(req.getParameter("prodUpdate"));
			} catch (IllegalArgumentException e) {
				prodUptime = new Timestamp(System.currentTimeMillis());
			}


			String prodLoc = req.getParameter("prodLoc").trim();
			if (prodLoc == null || prodLoc.trim().length() == 0) {
				errMsgs.add("商品所在地請勿空白");
			}

			Integer prodStatus = Integer.valueOf(req.getParameter("prodStatus").trim());


			/*打包VO預防錯誤輸入時重新打資料*/
			ProductVO productVO = new ProductVO();
			productVO.setDescription(prodDesc);
			productVO.setLocation(prodLoc);
			productVO.setSellerMemberId(memId);
			productVO.setName(prodName);
			productVO.setPrice(prodPrice);
			productVO.setStatus(prodStatus);
			productVO.setType(prodType);
			productVO.setLaunchedDate(prodUptime);
			
			if(!errMsgs.isEmpty()) {
				req.setAttribute("prodVO", productVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/update_product_input.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/***************************2.開始修改資料*****************************************/			
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productVO = productSvc.updateProduct(prodId, prodName, memId, prodType, prodDesc,
					prodPrice, prodUptime, prodLoc, prodStatus);
			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/		
			req.setAttribute("productVO", productVO);
			String successUrl = "/front_end/product/listOneProduct.jsp";
			RequestDispatcher successDispatcher = req.getRequestDispatcher(successUrl);
			System.out.println("修改完成,準備轉交");
			successDispatcher.forward(req, res);
		}

		if("update_data".equals(action)) {
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs); // 放置到request裡面	

			/***************************1.接收請求參數****************************************/
			Integer prodId = Integer.valueOf(req.getParameter("prodId").trim());
			
			Integer memId = null;
			try {
				memId = Integer.valueOf(req.getParameter("memId").trim());
			} catch (NumberFormatException e) {
				/*檢查是否為 number*/
				errMsgs.add("會員編號請填入正整數");
			}

			Integer prodType = Integer.valueOf(req.getParameter("prodType").trim());
			/*檢查是否為 0 1 2 3 4*/

			String prodDesc = req.getParameter("prodDesc").trim();
			if(prodDesc == null || prodDesc.trim().length() == 0) {
				errMsgs.add("商品敘述請勿空白");
			}
			
			Integer prodPrice = null;
			try {
				prodPrice = Integer.valueOf(req.getParameter("prodPrice"));
			} catch (NumberFormatException e) {
				errMsgs.add("請填入商品價格");
			}
			
			String prodName = req.getParameter("prodName").trim();
			if (prodName == null || prodDesc.trim().length() == 0) {
				errMsgs.add("請填入商品名稱");
			}

			Timestamp prodUptime = null;
			try {
				prodUptime = Timestamp.valueOf(req.getParameter("prodUpdate"));
			} catch (IllegalArgumentException e) {
				prodUptime = new Timestamp(System.currentTimeMillis());
			}


			String prodLoc = req.getParameter("prodLoc").trim();
			if (prodLoc == null || prodLoc.trim().length() == 0) {
				errMsgs.add("商品所在地請勿空白");
			}

			Integer prodStatus = Integer.valueOf(req.getParameter("prodStatus").trim());


			/*打包VO預防錯誤輸入時重新打資料*/
			ProductVO productVO = new ProductVO();
			productVO.setDescription(prodDesc);
			productVO.setLocation(prodLoc);
			productVO.setSellerMemberId(memId);
			productVO.setName(prodName);
			productVO.setPrice(prodPrice);
			productVO.setStatus(prodStatus);
			productVO.setType(prodType);
			productVO.setLaunchedDate(prodUptime);
			
			if(!errMsgs.isEmpty()) {
				req.setAttribute("prodVO", productVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/update_product_input.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/***************************2.開始修改資料*****************************************/			
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productVO = productSvc.updateProduct(prodId, prodName, memId, prodType, prodDesc,
					prodPrice, prodUptime, prodLoc, prodStatus);
			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/		
			req.setAttribute("productVO", productVO);
			String successUrl = "/front_end/product/sellerAllProducts.jsp";
			RequestDispatcher successDispatcher = req.getRequestDispatcher(successUrl);
			System.out.println("修改完成,準備轉交");
			successDispatcher.forward(req, res);
		}
		
		
		if ("insert".equals(action)) {
			/* 新增商品
			 * 控制器 需要的錯誤訊息站存區 請求參數 會員id 商品類別 商品敘述 價格 商品名稱 上架時間 所在地 商品目前狀態
			 * */
			System.out.println("進入insert");
			System.out.println(req.getParameter("memId"));
			HttpSession session = req.getSession();
			MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
			System.out.println(memberVo.getId());
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs); // 放置到request裡面
			
			Integer memId = null;
			try {
				//memId = Integer.valueOf(req.getParameter("memId"));
				memId = Integer.valueOf(memberVo.getId());
			} catch (NumberFormatException e) {
				/*檢查是否為 number*/
				errMsgs.add("會員編號請填入正整數");
			}


			Integer prodType = Integer.valueOf(req.getParameter("prodType").trim());
			/*檢查是否為 0 1 2 3 4*/

			String prodDesc = req.getParameter("prodDesc").trim();
			if(prodDesc == null || prodDesc.trim().length() == 0) {
				errMsgs.add("商品敘述請勿空白");
			}
			
			Integer prodPrice = null;
			try {
				prodPrice = Integer.valueOf(req.getParameter("prodPrice"));
			} catch (NumberFormatException e) {
				errMsgs.add("請填入商品價格");
			}
			
			String prodName = req.getParameter("prodName").trim();
			if (prodName == null || prodDesc.trim().length() == 0) {
				errMsgs.add("請填入商品名稱");
			}

			Timestamp prodUptime = null;
			try {
			//	prodUptime = Timestamp.valueOf(req.getParameter("prodUpdate").trim());
				prodUptime = new Timestamp(System.currentTimeMillis());
			} catch (IllegalArgumentException e) {
				prodUptime = new Timestamp(System.currentTimeMillis());
			}


			String prodLoc = req.getParameter("prodLoc").trim();
			if (prodLoc == null || prodLoc.trim().length() == 0) {
				errMsgs.add("商品所在地請勿空白");
			}

			//Integer prodStatus = Integer.valueOf(req.getParameter("prodStatus").trim());
			Integer prodStatus = 0;
			
			/*打包VO預防錯誤輸入時重新打資料*/
			ProductVO productVO = new ProductVO();
			productVO.setDescription(prodDesc);
			productVO.setLocation(prodLoc);
			productVO.setSellerMemberId(memId);
			productVO.setName(prodName);
			productVO.setPrice(prodPrice);
			productVO.setStatus(prodStatus);
			productVO.setType(prodType);
			productVO.setLaunchedDate(prodUptime);
			
			if(!errMsgs.isEmpty()) {
				req.setAttribute("productVO", productVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/sellerProduct.jsp");
				failureView.forward(req, res);
				return;
			}
			ProductServiceImpl productSvc = new ProductServiceImpl();
			String key = productSvc.addProduct(prodName, memId, prodType, prodDesc, prodPrice, prodUptime, prodLoc, prodStatus);
			System.out.println("key="+key); // 自增主鍵
			//HttpSession session = req.getSession();
			session.setAttribute("key", key);
			String successUrl = "/front_end/product/addPhoto.jsp";
			RequestDispatcher successDispatcher = req.getRequestDispatcher(successUrl);
			successDispatcher.forward(req, res);
		}
		

		if("delete".equals(action)) { // 前台賣家的delete
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數*****************************************/
				Integer prodId = Integer.valueOf(req.getParameter("prodId"));

				/***************************2.開始刪除資料*****************************************/
				// 刪除圖片
				ProductPhotoServiceImpl prodphotoSvc = new ProductPhotoServiceImpl();
				prodphotoSvc.deleteByProdId(prodId);
				// 刪除商品資訊				
				ProductServiceImpl productSvc = new ProductServiceImpl();
				productSvc.delete(prodId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)*************/	
				String url = "/front_end/product/sellerAllProducts.jsp";
				RequestDispatcher successview = req.getRequestDispatcher(url);
				successview.forward(req, res);
			} catch (Exception e) {
				errMsgs.add("刪除資料失敗" + e.getMessage());
				String url = "/front_end/product/listAll.jsp";				
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			} 
			
		}
		
		if("delete_backend".equals(action)) { // 後台的delete
			
			List<String> errMsgs = new LinkedList<String>();
			req.setAttribute("errMsgs", errMsgs);
			
			try {
				/***************************1.接收請求參數*****************************************/
				Integer prodId = Integer.valueOf(req.getParameter("prodId"));

				/***************************2.開始刪除資料*****************************************/
				// 刪除圖片
				ProductPhotoServiceImpl prodphotoSvc = new ProductPhotoServiceImpl();
				prodphotoSvc.deleteByProdId(prodId);
				// 刪除商品資訊
				ProductServiceImpl productSvc = new ProductServiceImpl();
				productSvc.delete(prodId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)*************/	
				String url = "/back_end/product/listAll.jsp";
				RequestDispatcher successview = req.getRequestDispatcher(url);
				successview.forward(req, res);
			} catch (Exception e) {
				errMsgs.add("刪除資料失敗" + e.getMessage());
				String url = "/back_end/product/listAll.jsp";				
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			} 			
		}
		
		

	}


}
