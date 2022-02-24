package com.activity_attend.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
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

import com.activity.model.ActivityService;
import com.activity.model.ActivityServiceImpl;
import com.activity.model.ActivityVO;
import com.activity_attend.model.ActivityAttendService;
import com.activity_attend.model.ActivityAttendServiceImpl;
import com.activity_attend.model.ActivityAttendVO;
import com.member.model.MemberVO;


public class ActivityAttendServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) { // 來自addActa.jsp的請求
			MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
			if (memberVO == null) {
				res.sendRedirect(req.getContextPath() + "/front_end/member/login.jsp");
				return;
			}
			Integer memberId = memberVO.getId();
			
			Map<String, String> errorMsgs = new HashMap<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				// 取得參數(理論上不該出現錯誤)
				String comment = null;
				String note = null;
				int activityId = -1;
				try {
					activityId = Integer.parseInt(req.getParameter("activityId").trim());
				} catch (Exception e2) {
					errorMsgs.put("activityId", "找不到活動");
				}
				try {
					comment = req.getParameter("comment").trim();
				} catch (Exception e2) {
					errorMsgs.put("comment", "請填寫留言");
				}
				try {
					note = req.getParameter("note").trim();
				} catch (Exception e2) {
					errorMsgs.put("note", "請填寫備註");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/attendActivity.jsp");
					failureView.forward(req, res);
					return;
				}
				
				// 取得所需VO
				ActivityService activityService = new ActivityServiceImpl();
				ActivityAttendService activityAttendService = new ActivityAttendServiceImpl();
				ActivityVO activityVO = activityService.findByActivityId(activityId);
				ActivityAttendVO oneActa = activityAttendService.getOneActa(memberId, activityId);
				req.setAttribute("actvo", activityVO);
				req.setAttribute("actaVO", oneActa); 
				if (activityVO == null) {
					req.setAttribute("result", "活動不存在");
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/attendActivity.jsp");
					failureView.forward(req, res);
					return;
				}
				if (oneActa != null) {
					req.setAttribute("result", "已參加本活動");
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/attendActivity.jsp");
					failureView.forward(req, res);
					return;
				}
				
				// 判斷時間是否超過
				Timestamp today = new Timestamp(System.currentTimeMillis());
				if (today.after(activityVO.getLaunchedDate())) {
					errorMsgs.put("result", "已超過活動報名時間");
				}
				
				Integer applyMemberExisting = activityVO.getApplyMemberExisting();
				Integer maxMember = activityVO.getMaxMember();
				if (applyMemberExisting.intValue() >= maxMember.intValue()) {
					req.setAttribute("result", "活動參加者以達最大人數");
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/attendActivity.jsp");
					failureView.forward(req, res);
					return;
				}

				int status = 1;
				ActivityAttendVO actaVO = new ActivityAttendVO();
				actaVO.setMemberId(memberId);
				actaVO.setActivityId(activityId);
				actaVO.setComment(comment);
				actaVO.setNote(note);
				actaVO.setStatus(status);
				req.setAttribute("actaVO", actaVO);
				
				// 預設為付款
				/*************************** 2.開始新增資料 ***************************************/
				ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
				actaVO = actaSvc.addActa(memberId, activityId, comment, note, status);
				req.setAttribute("result", "報名成功");
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/listAllActa.jsp"); // 新增成功後轉交listAllActa.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
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
//付款狀態					
					int status = Integer.valueOf(req.getParameter("status"));
					
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
								.getRequestDispatcher("/front_end/activity/listAllActa.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					actaVO = actaSvc.updateActa(memberId, activityId, comment, note, status);
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("actaVO", actaVO); // 資料庫update成功後,正確的的actaVO物件,存入req
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
		 if ("getOne_For_Update".equals(action)) { // 來自listAllActa.jsp的請求


				
				try {
					   
					HttpSession session = req.getSession();
				    MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				    if (memberVO == null) {
//				        FrontEndMemberFilter.doFilter(req, res, gg);
				     RequestDispatcher failureView = req.getRequestDispatcher("/front_end/member/login.jsp");
				     failureView.forward(req, res);
				     return;// 程式中斷
				    }
					/***************************1.接收請求參數****************************************/
					int memberId =memberVO.getId();
					int activityId = Integer.valueOf(req.getParameter("activityId"));			
					/***************************2.開始查詢資料****************************************/
					ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
					ActivityAttendVO actaVO = actaSvc.getOneActa(memberId,activityId);
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("actaVO", actaVO);// 資料庫取出的empVO物件,存入req
					String url = "/front_end/activity/scoreActivity.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					e.printStackTrace();
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
				}
			}
			if ("getOne_For_Insert".equals(action)) { // 來自listAllActa.jsp的請求
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if (memberVO == null) {
					res.sendRedirect(req.getContextPath() + "/front_end/member/login.jsp");
					return;// 程式中斷
				}
				
				Integer memberId = memberVO.getId();
				
				try {
					/*************************** 1.接收請求參數 ****************************************/
					int activityId = Integer.valueOf(req.getParameter("activityId"));
					/*************************** 2.開始查詢資料 ****************************************/
					ActivityService service = new ActivityServiceImpl();
					ActivityAttendService activityAttendService = new ActivityAttendServiceImpl();
					ActivityVO actvo = service.findByActivityId(activityId);
					
					ActivityAttendVO oneActa = activityAttendService.getOneActa(memberId, activityId);
					req.setAttribute("actvo", actvo);
					req.setAttribute("actaVO", oneActa); 
					if (oneActa != null) {
						req.setAttribute("result", "已報名活動");
					}
					
					/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
					req.setAttribute("actvo", actvo);// 資料庫取出的empVO物件,存入req
					String url = "/front_end/activity/attendActivity.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);
					/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					e.printStackTrace();
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
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
