package com.product_collection.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
import com.move_order.model.MoveOrderServiceImpl;
import com.move_order.model.MoveOrderVO;
import com.product.model.ProductServiceImpl;
import com.product.model.ProductVO;
import com.product_collection.model.ProductCollectionDAOJDBCImpl;
import com.product_collection.model.ProductCollectionServiceImpl;
import com.product_collection.model.ProductCollectionVO;

import core.DualKey;

public class ProductCollectionServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
        if ("insert".equals(action)) {   
			System.out.println("insert");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String str = req.getParameter("id");
				Integer productId = null;
				productId = Integer.valueOf(str);
				
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				
				if (memberVO == null) {				
					return;
				}
				Integer memberId = memberVO.getId();
			
				ProductCollectionVO productCollectionVO = new ProductCollectionVO();
				
				productCollectionVO.setProductId(productId);
				productCollectionVO.setMemberId(memberId);
				System.out.println("成功抓到");
				/***************************2.開始新增資料***************************************/
				ProductCollectionServiceImpl proCollectionSvc = new ProductCollectionServiceImpl();
				productCollectionVO = proCollectionSvc.insert(memberId, productId);
				
				ProductServiceImpl service = new ProductServiceImpl();
				ProductVO oneProduct = service.getOneProduct(productId);
				
				req.setAttribute("productVO", oneProduct);
					
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front_end/product/singleItem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/singleItem.jsp");
				failureView.forward(req, res);
			}
		}
        
		if ("get_By_Mem".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if(memberVO == null) {
					return;//程式中斷
				}
				
				int memberId = memberVO.getId();
				ProductCollectionServiceImpl pcSvc = new ProductCollectionServiceImpl();
				List<ProductCollectionVO> productCollectionVO = pcSvc.getByMemId(memberId);
				List<Integer> productIdList = new ArrayList<Integer>();
				for(ProductCollectionVO pId: productCollectionVO) {
					
					productIdList.add(pId.getProductId());
				}
				ProductServiceImpl prodSvc = new ProductServiceImpl();
				List<ProductVO> productVO = prodSvc.getIdForCollection(productIdList);

			/***************************2.開始查詢資料*****************************************/
				if (productVO.isEmpty()) {
					errorMsgs.add("收藏是空的喔");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/singleItem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("productVO", productVO); // 資料庫取出的empVO物件,存入req
				String url = "/front_end/product/collection.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/點進去收藏畫面的按鈕所在的畫面.jsp");
				failureView.forward(req, res);
			}
		}
		if("delete_from_collection".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if(memberVO == null) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/去登入會員畫面");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer memberId = memberVO.getId();
				
				String str = req.getParameter("productId");
				Integer productId;
				productId = Integer.valueOf(str);
				
				ProductCollectionDAOJDBCImpl dao = new ProductCollectionDAOJDBCImpl();
				DualKey<Integer, Integer> key = new DualKey<Integer, Integer>(memberId, productId);
				dao.deleteById(key);
				
				/*========================刪除後再查詢===========================*/
				ProductCollectionServiceImpl pcSvc = new ProductCollectionServiceImpl();
				List<ProductCollectionVO> productCollectionVO = pcSvc.getByMemId(memberId);
				List<Integer> productIdList = new ArrayList<Integer>();
				for(ProductCollectionVO pId: productCollectionVO) {
					
					productIdList.add(pId.getProductId());
				}
				ProductServiceImpl prodSvc = new ProductServiceImpl();
				List<ProductVO> productVO = prodSvc.getIdForCollection(productIdList);
				 
				req.setAttribute("productVO", productVO);
				String url = "/front_end/product/collection.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/product/點進去收藏畫面的按鈕所在的畫面.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
