package com.news.controller;

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

import com.news.model.NewsServiceImpl;
import com.news.model.NewsVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class NewsServlet extends HttpServlet {

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
					errorMsgs.add("請輸入最新消息編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					/***************************/
					id = Integer.valueOf(str);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("最新消息編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				NewsServiceImpl newsSvc = new NewsServiceImpl();
				NewsVO pojo = newsSvc.selectOneNews(id);
				if (pojo == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("newsVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "/backend/news/listOneEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		/****************************************************************************************************/

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}

				InputStream in = req.getPart("image").getInputStream();
				byte[] image = null;
				if (in.available() != 0) {
					image = new byte[in.available()];
					in.read(image);
					in.close();
				} else {

					errorMsgs.add("請上傳圖片");
				}

//				

//			    java.util.Date d1 = new java.util.Date();
//			    SimpleDateFormat sdfmt = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			    Calendar cal = Calendar.getInstance();
//			 
//			    //取得目前時間
//			    d1 = cal.getTime();
//			    System.out.println("Now Date = " + sdfmt.format(d1));
//			 
//			    //目前時間減8小時
//			    cal.add(Calendar.HOUR,-8);
//			 
//			    d1 = cal.getTime();
//			    System.out.println("Decrease 8 hours = " + sdfmt.format(d1));
//				
//				
//				
				java.sql.Timestamp date = null;

				try {
					date = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException ie) {
					errorMsgs.add("請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
				}
//				try {
//					String date1 = req.getParameter("date");
//					date = java.sql.Timestamp.valueOf(date1.replace("T", ""));
//				} catch (Exception e) {
//					// TODO: handle exception
//				}
//				Timestamp date = Timestamp(Date.System.currentTimeMillis()) ;
//				try {					
//					Timestamp t = new Timestamp(System.currentTimeMillis());
//					System.out.println(t);
//				} catch (IllegalArgumentException ie) {
//					System.out.println("1");
//					// TODO: handle exception
//				}
//				
				Integer type = null;
				try {
					type = Integer.valueOf(req.getParameter("type").trim());
				} catch (NumberFormatException e) {
					type = 0;
					errorMsgs.add("消息分類編號.");
				}

				NewsVO pojo = new NewsVO();

				pojo.setContent(content);
				pojo.setImage(image);
				pojo.setDate(date);
				pojo.setType(type);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("newsVO", pojo); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				NewsServiceImpl newsSvc = new NewsServiceImpl();
				pojo = newsSvc.insert(content, image, date, type);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/backend/news/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/news/addEmp.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
