package com.product_collection.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;
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
	}

}
