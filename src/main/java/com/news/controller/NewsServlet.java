package com.news.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/selectnews_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer id = null;
				try {
					/***************************/
					id = Integer.valueOf(str);
					/***************************/
				} catch (Exception e) {
					errorMsgs.add("消息編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/selectnews_page.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/selectnews_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("newsVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/news/listonenews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/selectnews_page.jsp");
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
//				String content = req.getParameter("content").trim();
//				if (content == null || content.trim().length() == 0) {
//					errorMsgs.add("內容請勿空白");
//				}
				
				String content = req.getParameter("content");
				if (content == null || content.length() == 0) {
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

				java.sql.Timestamp date = null;

				try {
					date = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException ie) {
					errorMsgs.add("請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
				}

				Integer type = null;
				try {
					type = Integer.valueOf(req.getParameter("type").trim());
				} catch (NumberFormatException e) {
					type = 0;
					errorMsgs.add("請輸入分類編號.");
				}
				
				String title = req.getParameter("title").trim();
				if (title == null || title.trim().length() == 0) {
					errorMsgs.add("標題請勿空白");
				}
				
				
				NewsVO pojo = new NewsVO();

				pojo.setContent(content);
				pojo.setImage(image);
				pojo.setDate(date);
				pojo.setType(type);
				pojo.setTitle(title);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("newsVO", pojo); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/addnews.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				NewsServiceImpl newsSvc = new NewsServiceImpl();
				pojo = newsSvc.insert(content, image, date, type, title);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/news/listallnews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/addnews.jsp");
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer id = new Integer(req.getParameter("id"));

				/*************************** 2.開始刪除資料 ***************************************/
				NewsServiceImpl newsSvc = new NewsServiceImpl();
				newsSvc.delete(id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/back_end/news/listallnews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/listallnews.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp 或  /dept/listEmps_ByDeptno.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("/back_end/news/listallnews.jsp"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】		
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer id = Integer.valueOf(req.getParameter("id"));
				
				/***************************2.開始查詢資料****************************************/
				NewsServiceImpl newServiceImpl = new NewsServiceImpl();
				NewsVO pojo = newServiceImpl.selectOneNews(id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("newsVO", pojo); // 資料庫取出的empVO物件,存入req
				String url = "/back_end/news/updatenews.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("/back_end/news/listallnews.jsp"); // 送出修改的來源網頁路徑: 可能為【/emp/listAllEmp.jsp】 或  【/dept/listEmps_ByDeptno.jsp】 或 【 /dept/listAllDept.jsp】
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer id = Integer.valueOf(req.getParameter("id"));				
				String content = req.getParameter("content");
				
				
				InputStream in = req.getPart("image").getInputStream();
				byte[] image = null;
				if (in.available() != 0) {
					image = new byte[in.available()];
					in.read(image);
					in.close();
				} 
//				else {
//					errorMsgs.add("請上傳圖片");
//				}
				
				Timestamp date = new Timestamp(System.currentTimeMillis());
				Integer type = Integer.valueOf(req.getParameter("type"));
				String title = req.getParameter("title");

				NewsVO pojo = new NewsVO();				
				pojo.setId(id);
				pojo.setContent(content);
				pojo.setImage(image);
				pojo.setDate(date);
				pojo.setType(type);
				pojo.setTitle(title);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("newsVO", pojo); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back_end/news/addnews.jsp");
					failureView.forward(req, res);
					return;
				}

				/***************************2.開始修改資料*****************************************/
				NewsServiceImpl newsSvc = new NewsServiceImpl();
				pojo = newsSvc.update(id, content, image, date, type, title);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/		
                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher("/back_end/news/listallnews.jsp");   // 修改成功後,轉交回送出修改的來源網頁
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/news/updatenews.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
