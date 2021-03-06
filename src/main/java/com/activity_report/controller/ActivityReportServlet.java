package com.activity_report.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.activity.model.ActivityDAO;
import com.activity_attend.model.ActivityAttendServiceImpl;
import com.activity_attend.model.ActivityAttendVO;
import com.activity_report.*;
import com.activity_report.model.ActivityReportServiceImpl;
import com.activity_report.model.ActivityReportVO;
import com.member.model.MemberVO;


@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 5 * 10 * 1024 * 1024)
public class ActivityReportServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) {   
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					 HttpSession session = req.getSession();
					    MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
					    if (memberVO == null) {
//					        FrontEndMemberFilter.doFilter(req, res, gg);
					     RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
					     failureView.forward(req, res);
					     return;// 程式中斷
					    }				
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//檢舉活動編號		
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					
//檢舉會員編號					
					int memberId = memberVO.getId();
					
//檢舉內容					
					String content = req.getParameter("content").trim();
					if (content == null || content.trim().length() == 0) {
						errorMsgs.add("檢舉內容請勿空白");
					}
//審核結果					
					int status = Integer.valueOf(req.getParameter("status"));
	
//檢舉圖片
					byte[] photo = null;
					try {
						Part part=req.getPart("photo");
						InputStream in=part.getInputStream();
						photo=new byte[in.available()];
						in.read(photo);
						in.close();
					}catch(Exception e){
						e.printStackTrace();
//						photo=null;
					}
					
					ActivityReportVO actrVO = new ActivityReportVO();
					actrVO.setActivityId(activityId);
					actrVO.setMemberId(memberId);
					actrVO.setContent(content);
					actrVO.setStatus(0);
					actrVO.setPhoto(photo);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actrVO", actrVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front_end/activity/reportActivity.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					ActivityReportServiceImpl actrSvc = new ActivityReportServiceImpl();
					actrVO = actrSvc.addActr(activityId,memberId,content,status,photo);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/front_end/activity/homePage.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllActa.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/reportActivity.jsp");
					failureView.forward(req, res);
				}
		 }
		 if ("getOne_For_Insert".equals(action)) { 

			 		try {
			 					/***************************1.接收請求參數****************************************/
			 					int activityId = Integer.valueOf(req.getParameter("activityId"));
			 					
			 					/***************************2.開始查詢資料****************************************/
			 					ActivityReportVO actrVO =new ActivityReportVO();
			 					System.out.println(activityId);
			 					actrVO.setActivityId(activityId);
			 					actrVO.setContent("不好玩");
			 					/***************************3.查詢完成,準備轉交(Send the Success view)************/
			 					req.setAttribute("actrVO", actrVO);         // 資料庫取出的empVO物件,存入req
			 					String url = "/front_end/activity/reportActivity.jsp";
			 					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			 					successView.forward(req, res);
			 
			 					/***************************其他可能的錯誤處理**********************************/
			 				} catch (Exception e) {
			 					RequestDispatcher failureView = req
			 							.getRequestDispatcher("/front_end/activity/homePage.jsp");
			 					failureView.forward(req, res);
			 				}
			 			}
		 
		 if ("normalReport".equals(action)) { // 來自update_acta_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					
//參與會員編號					
					int id =Integer.valueOf(req.getParameter("id"));
									
					ActivityReportServiceImpl actrSvc = new ActivityReportServiceImpl();
					
					ActivityReportVO actrVO = actrSvc.getOneActr(id);
					actrVO = actrSvc.updateActr(actrVO.getId(),actrVO.getActivityId(),actrVO.getMemberId(),actrVO.getContent(),2,actrVO.getPhoto());
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actrVO", actrVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back_end/activity/listAllActr.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
	
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("actrVO", actrVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/back_end/activity/listAllActr.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/activity/listAllActr.jsp");
					failureView.forward(req, res);
				}
			}
		 if ("cancelReport".equals(action)) { // 來自update_acta_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					
//參與會員編號					
					int Id =Integer.valueOf(req.getParameter("id"));
									
					ActivityReportServiceImpl actrSvc = new ActivityReportServiceImpl();
					
					ActivityReportVO actrVO = actrSvc.getOneActr(Id);
					actrVO = actrSvc.updateActr(actrVO.getId(),actrVO.getActivityId(),actrVO.getMemberId(),actrVO.getContent(),1,actrVO.getPhoto());
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("actrVO", actrVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back_end/activity/listAllActr.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
	
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("actrVO", actrVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/back_end/activity/listAllActr.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/activity/listAllActr.jsp");
					failureView.forward(req, res);
				}
		 }
}
}		
//		 if ("update".equals(action)) { // 來自update_acta_input.jsp的請求
//				
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//			
//				try {
//					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//					
//參與會員編號					
//					int memberId =Integer.valueOf(req.getParameter("memberId"));
//					if(memberId==0) {
//						errorMsgs.add("參與會員編號請勿空白");
//					}

//參與活動編號
//					int activityId = Integer.valueOf(req.getParameter("activityId"));
//					if(activityId==0) {
//						errorMsgs.add("參與活動編號請勿空白");
//					}

//評論內容(活動結束後)					
//					String comment = req.getParameter("comment").trim();
//					if (comment == null || comment.trim().length() == 0) {
//						errorMsgs.add("評論內容請勿空白");
//					}

//活動內容備註(報名時)					
//					String note = req.getParameter("note").trim();
//					if (note == null || note.trim().length() == 0) {
//						errorMsgs.add("活動內容備註請勿空白");
//					}

//付款狀態					
//					int status = Integer.valueOf(req.getParameter("status"));
//					if(status==-1) {
//						errorMsgs.add("請選擇付款狀態");
//					}

//					
//					ActivityAttendVO actaVO = new ActivityAttendVO();
//					actaVO.setMemberId(memberId);
//					actaVO.setActivityId(activityId);
//					actaVO.setComment(comment);
//					actaVO.setNote(note);
//					actaVO.setStatus(status);

					// Send the use back to the form, if there were errors
//					if (!errorMsgs.isEmpty()) {
//						req.setAttribute("actaVO", actaVO); // 含有輸入格式錯誤的empVO物件,也存入req
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/back_end/activity/update_acta_input.jsp");
//						failureView.forward(req, res);
//						return; //程式中斷
//					}
					
//					/***************************2.開始修改資料*****************************************/
//					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
//					actaVO = actaSvc.updateActa(memberId, activityId, comment, note, status);
//					
//					/***************************3.修改完成,準備轉交(Send the Success view)*************/
//					req.setAttribute("actaVO", actaVO); // 資料庫update成功後,正確的的empVO物件,存入req
//					String url = "/back_end/activity/listOneActa.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//					successView.forward(req, res);
//
//					/***************************其他可能的錯誤處理*************************************/
//				} catch (Exception e) {
//					errorMsgs.add("修改資料失敗:"+e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/back_end/activity/update_acta_input.jsp");
//					failureView.forward(req, res);
//				}
//			}
//		 if ("getOne_For_Update".equals(action)) { // 來自listAllActa.jsp的請求
//
//				List<String> errorMsgs = new LinkedList<String>();
//				// Store this set in the request scope, in case we need to
//				// send the ErrorPage view.
//				req.setAttribute("errorMsgs", errorMsgs);
//				
//				try {
//					/***************************1.接收請求參數****************************************/
//					int memberId =Integer.valueOf(req.getParameter("memberId"));
//					int activityId = Integer.valueOf(req.getParameter("activityId"));
//					
//					/***************************2.開始查詢資料****************************************/
//					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
//					ActivityAttendVO actaVO = actaSvc.getOneActa(memberId,activityId);
//									
//					/***************************3.查詢完成,準備轉交(Send the Success view)************/
//					req.setAttribute("actaVO", actaVO);         // 資料庫取出的empVO物件,存入req
//					String url = "/back_end/activity/update_acta_input.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//					successView.forward(req, res);
//
//					/***************************其他可能的錯誤處理**********************************/
//				} catch (Exception e) {
//					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/back_end/activity/listAllActa.jsp");
//					failureView.forward(req, res);
//				}
//			}
//	}
//}
