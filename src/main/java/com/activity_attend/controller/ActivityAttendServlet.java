package com.activity_attend.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.activity.model.ActivityServiceImpl;
import com.activity.model.ActivityVO;
import com.activity_attend.model.ActivityAttendServiceImpl;
import com.activity_attend.model.ActivityAttendVO;


public class ActivityAttendServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) { // 來自addActa.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//參與會員編號					
					int memberId =Integer.valueOf(req.getParameter("memberId"));
					if(memberId==0) {
						errorMsgs.add("參與會員編號請勿空白");
					}
//參與活動編號
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					if(activityId==0) {
						errorMsgs.add("參與活動編號請勿空白");
					}
//評論內容(活動結束後)					
					String comment = req.getParameter("comment").trim();
					if (comment == null || comment.trim().length() == 0) {
						errorMsgs.add("評論內容請勿空白");
					}
//活動內容備註(報名時)					
					String note = req.getParameter("note").trim();
					if (note == null || note.trim().length() == 0) {
						errorMsgs.add("活動內容備註請勿空白");
					}
//付款狀態					
					int status = Integer.valueOf(req.getParameter("status"));
					if(status==-1) {
						errorMsgs.add("請選擇付款狀態");
					}

					ActivityAttendVO actaVO = new ActivityAttendVO();
					actaVO.setMemberId(memberId);
					actaVO.setActivityId(activityId);
					actaVO.setComment(comment);
					actaVO.setNote(note);
					actaVO.setStatus(status);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actaVO", actaVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front_end/activity/addAttend.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					actaVO = actaSvc.addActa(memberId, activityId, comment, note, status);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/listAllActa.jsp"); // 新增成功後轉交listAllActa.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/addAttend.jsp");
					failureView.forward(req, res);
				}
			}
		
		 if ("update".equals(action)) { // 來自update_acta_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					
//參與會員編號					
					int memberId =Integer.valueOf(req.getParameter("memberId"));
					if(memberId==0) {
						errorMsgs.add("參與會員編號請勿空白");
					}
//參與活動編號
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					if(activityId==0) {
						errorMsgs.add("參與活動編號請勿空白");
					}
//評論內容(活動結束後)					
					String comment = req.getParameter("comment").trim();
					if (comment == null || comment.trim().length() == 0) {
						errorMsgs.add("評論內容請勿空白");
					}

//活動內容備註(報名時)					
					String note = req.getParameter("note").trim();
					if (note == null || note.trim().length() == 0) {
						errorMsgs.add("活動內容備註請勿空白");
					}
//付款狀態					
					int status = Integer.valueOf(req.getParameter("status"));
					if(status==-1) {
						errorMsgs.add("請選擇付款狀態");
					}
					
					ActivityAttendVO actaVO = new ActivityAttendVO();
					actaVO.setMemberId(memberId);
					actaVO.setActivityId(activityId);
					actaVO.setComment(comment);
					actaVO.setNote(note);
					actaVO.setStatus(status);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actaVO", actaVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front_end/activity/update_acta_input.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					actaVO = actaSvc.updateActa(memberId, activityId, comment, note, status);
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("actaVO", actaVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/front_end/activity/listOneActa.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/update_acta_input.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("getOne_For_Update".equals(action)) { // 來自listAllActa.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					int memberId =Integer.valueOf(req.getParameter("memberId"));
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					
					/***************************2.開始查詢資料****************************************/
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					ActivityAttendVO actaVO = actaSvc.getOneActa(memberId,activityId);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("actaVO", actaVO);         // 資料庫取出的empVO物件,存入req
					String url = "/front_end/activity/update_acta_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/listAllActa.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("cancel".equals(action)) { // 來自update_acta_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					
//參與會員編號					
					int memberId =Integer.valueOf(req.getParameter("memberId"));
					
//參與活動編號
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					
					
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					
					ActivityAttendVO actaVO = actaSvc.getOneActa(memberId, activityId);
					actaVO = actaSvc.updateActa(actaVO.getMemberId(), actaVO.getActivityId(), actaVO.getComment(), actaVO.getNote(), 0);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actaVO", actaVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front_end/activity/listAllActa.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
	
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("actaVO", actaVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/front_end/activity/listAllActa.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/listAllActa.jsp");
					failureView.forward(req, res);
				}
			}
		 
	}
}
