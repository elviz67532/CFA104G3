package com.product_collection.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
import com.move_order.model.MoveOrderServiceImpl;
import com.move_order.model.MoveOrderVO;
import com.product_collection.model.ProductCollectionServiceImpl;
import com.product_collection.model.ProductCollectionVO;

public class ProductCollectionServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
        if ("insert".equals(action)) {   
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String str = req.getParameter("productId");
				Integer productId = null;
				productId = Integer.valueOf(str);
				
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if(memberVO == null) {
					//寫怡理filter的東西
				}else {
					Integer memberId = memberVO.getId();
				
					ProductCollectionVO productCollectionVO = new ProductCollectionVO();
					productCollectionVO.setProductId(productId);
					productCollectionVO.setMemberId(memberId);
				
				/***************************2.開始新增資料***************************************/
					ProductCollectionServiceImpl proCollectionSvc = new ProductCollectionServiceImpl();
					productCollectionVO = proCollectionSvc.insert(memberId, productId);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/front_end/product/商品列表畫面.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);				
				}
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/addEmp.jsp");
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
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/去登入會員畫面");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				int memberId = memberVO.getId();
				ProductCollectionServiceImpl pcSvc = new ProductCollectionServiceImpl();
				List<ProductCollectionVO> productCollectionVO = pcSvc.getByMemId(memberId);
					
			/***************************2.開始查詢資料*****************************************/
				if (productCollectionVO.isEmpty()) {
					errorMsgs.add("收藏是空的喔");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/product/商品前台畫面.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
			
			/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("productCollectionVO", productCollectionVO); // 資料庫取出的empVO物件,存入req
				String url = "/front_end/product/收藏畫面.jsp";
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
	}

}
