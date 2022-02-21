package com.activity_question.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.activity.model.ActivityServiceImpl;
import com.activity.model.ActivityVO;
import com.activity_question.model.ActivityQuestionServiceImpl;
import com.activity_question.model.ActivityQuestionVO;
import com.member.model.MemberVO;

public class ActivityQuestionServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("question".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if (memberVO == null) {
	//		     FrontEndMemberFilter.doFilter(req, res, gg);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				int memberId = memberVO.getId();
				try {
					memberId = Integer.valueOf(req.getParameter("id"));
				} catch (NumberFormatException e) {
					errorMsgs.put("memberId", "memberId error");
				}
				
				ActivityVO actVO = new ActivityVO();
				Integer activityId = actVO.getActivityId();

				try {
					activityId = Integer.valueOf(req.getParameter("activityId"));
				} catch (NumberFormatException e) {
					errorMsgs.put("activityId", "activityId error");
				}
				
				String problem = req.getParameter("problem");
				if(problem == null || problem.trim().length() == 0) {
					errorMsgs.put("problem", "請勿空白");
				}
				java.sql.Timestamp problemDate = null;
				try {
					problemDate = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException e) {
					errorMsgs.put("problemDate", "請輸入日期與時間");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				System.out.println("建立時間: "+problemDate);

				
				ActivityQuestionVO actqVO = new ActivityQuestionVO();
				actqVO.setActivityId(activityId);
				actqVO.setId(memberId);
				actqVO.setProblem(problem);
				actqVO.setProblemDate(problemDate);
				
				int id = actqVO.getId();
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actqVO", actqVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				ActivityQuestionServiceImpl actqSvc = new ActivityQuestionServiceImpl();
				actqVO = actqSvc.addQuestion(activityId, memberId, problem ,problemDate);
				System.out.println(actqVO);
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				// 新增成功後轉交
				req.setAttribute("actqVO", actqVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/previewQuestion.jsp"); 
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("其他可能的錯誤處理:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("answer".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				int id = Integer.valueOf(req.getParameter("id"));
				System.out.println(id);
				try {
					id = Integer.valueOf(req.getParameter("id").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("id", "id error");
				}
				String reply = req.getParameter("reply");
				if(reply == null || reply.trim().length() == 0) {
					errorMsgs.put("reply", "請勿空白");
				}
				System.out.println(reply);
				
				java.sql.Timestamp replyDate = null;
				try {
					replyDate = new Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException e) {
					errorMsgs.put("replyDate", "請輸入日期與時間");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				System.out.println("建立時間: "+replyDate);
				
				ActivityQuestionVO actqVO = new ActivityQuestionVO();
				actqVO.setId(id);
				actqVO.setReply(reply);
				actqVO.setReplyDate(replyDate);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actqVO", actqVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				ActivityQuestionServiceImpl actqSvc = new ActivityQuestionServiceImpl();
				actqVO = actqSvc.addAnswer(id, reply ,replyDate);
				System.out.println(actqVO);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				// 新增成功後轉交
				req.setAttribute("actqVO", actqVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/previewAnswer.jsp"); 
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.put("其他可能的錯誤處理:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
