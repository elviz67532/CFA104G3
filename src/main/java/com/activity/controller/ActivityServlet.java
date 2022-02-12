package com.activity.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8"); // post
		String action = req.getParameter("action");

//		System.out.println("test");

		if ("insert".equals(action)) { // 來自addAct.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
/* ========================= 活動名稱 ========================= */
// 正則最後處理
//String actNameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,20}$";
//} else if (!name.trim().matches(actNameReg)) {
//errorMsgs.put("name", "只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsgs.put("name", "請勿空白");
				}
				System.out.println(name);

/* ========================= 活動種類 ========================= */
				int type = Integer.valueOf(req.getParameter("type"));
				if (type == 0) {
					errorMsgs.put("type", "請選擇種類");
				}
				System.out.println(type);

/* ========================= 活動地點 ========================= */
// 正則最後處理
//String actLocationReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{10,30}$";
//} else if (!location.trim().matches(actLocationReg)) {
//errorMsgs.put("location", "只能是中、英文字母、數字和_ , 且長度必需在10到30之間");
				String location = req.getParameter("location");
				if (location == null || location.trim().length() == 0) {
					errorMsgs.put("location", "請勿空白");
				}
				System.out.println(location);

/* ========================= 活動內容 ========================= */
// 正則最後處理
//String actContentReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{20,1000}$";
//} else if (!content.trim().matches(actContentReg)) {
//errorMsgs.put("content", "只能是中、英文字母、數字和_ , 且長度必需在20到1000之間");
				String content = req.getParameter("content");
				if (content == null || content.trim().length() == 0) {
					errorMsgs.put("content", "請勿空白");
				}
				System.out.println(content);

/* ========================= 活動費用 ========================= */
				int cost = 0;
				try {
					cost = Integer.valueOf(req.getParameter("cost").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("cost", "請填數字");
				}
				System.out.println(cost);

/* ========================= 時間從這裡開始 ========================= */
				// 報名開始時間
				java.sql.Timestamp applyStartDate = null;
				// 報名截止時間
				java.sql.Timestamp applyEndDate = null;
				// 活動開始時間
				java.sql.Timestamp startDate = null;
				// 活動結束時間
				java.sql.Timestamp endDate = null;

/* ========================= 報名開始時間 ========================= */
				// 測試報名開始時間介於開始、結束時間之間，不得晚於報名截止時間。
				// 報名開始 > 報名截止 > 活動開始 > 活動結束

				try {
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (applyStartDate.after(applyEndDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法在報名截止時間之後");
					} else if (applyStartDate.equals(applyEndDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法與報名截止時間相同");
					} else if (applyStartDate.after(startDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法在活動開始時間之後");
					} else if (applyStartDate.equals(startDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法與活動開始時間相同");
					} else if (applyStartDate.after(endDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法在活動結束時間之後");
					} else if (applyStartDate.equals(endDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法與活動結束時間相同");
					}
					System.out.println(applyStartDate);
				} catch (IllegalArgumentException ie) {
					errorMsgs.put("applyStartDate", "請輸入日期與時間");
				} catch (Exception e1) {
					e1.printStackTrace();
				}

/* ========================= 報名截止時間 ========================= */
				// 測試報名截止時間介於開始、結束時間之間，不得早於報名開始時間。
				// 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (applyEndDate.after(startDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法在活動開始時間之後");
					} else if (applyEndDate.equals(startDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法與活動結束時間相同");
					} else if (applyEndDate.after(endDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法在活動結束時間之後");
					} else if (applyEndDate.equals(endDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法與活動結束時間相同");
					}
					System.out.println(applyEndDate);
				} catch (IllegalArgumentException ie) {
					errorMsgs.put("applyEndDate", "請輸入日期與時間");
				} catch (Exception e1) {
					e1.printStackTrace();
				}

/* ========================= 活動開始時間 ========================= */

				// 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (startDate.after(endDate)) {
						errorMsgs.put("startDate", "活動開始時間無法在活動結束時間之後");
					} else if (startDate.equals(endDate)) {
						errorMsgs.put("startDate", "活動開始時間無法與活動結束時間相同");
					}
					System.out.println(startDate);
				} catch (IllegalArgumentException e) {
					errorMsgs.put("startDate", "請輸入日期與時間");
				} catch (Exception e1) {
					e1.printStackTrace();
				}

/* ========================= 活動結束時間 ========================= */
				try {
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					System.out.println(endDate);
				} catch (IllegalArgumentException e) {
					errorMsgs.put("endDate", "請輸入日期與時間");
				}

/* ========================= 報名人數倒數 ========================= */
				int applyMemberExisting = 0;
				// 活動人數上限
				int maxMember = 0;
				// 活動人數下限
				int minMember = 0;
				try {
					applyMemberExisting = Integer.valueOf(req.getParameter("maxMember"));
				} catch (Exception e) {
					errorMsgs.put("applyMemberExisting","請填數字");
				}

/* ========================= 活動人數上限 ========================= */

				try {
					maxMember = Integer.valueOf(req.getParameter("maxMember"));
					minMember = Integer.valueOf(req.getParameter("minMember"));
					if (maxMember < minMember) {
						errorMsgs.put("maxMember", "活動人數上限不能小於活動人數下限");
					} else if (maxMember == minMember) {
						errorMsgs.put("maxMember", "活動人數上限不能等於活動人數下限");
					}
					maxMember = Integer.valueOf(req.getParameter("maxMember").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("maxMember", "請填活動人數上限");
				}

				System.out.println(maxMember);

/* ========================= 活動人數下限 ========================= */
				try {
					minMember = Integer.valueOf(req.getParameter("minMember").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("minMember", "請填活動人數下限");
				}

				System.out.println(minMember);

				ActivityVO actVO = new ActivityVO();
				actVO.setType(type);
				actVO.setName(name);
				actVO.setContent(content);
				actVO.setApplyStartDate(applyStartDate);
				actVO.setApplyEndDate(applyEndDate);
				actVO.setLocation(location);
				actVO.setCost(cost);
				actVO.setApplyMemberExisting(applyMemberExisting);
				actVO.setMaxMember(maxMember);
				actVO.setMinMember(minMember);
				actVO.setStartDate(startDate);
				actVO.setEndDate(endDate);

				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/publishActivity.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.addAct(type, name, content, applyStartDate, applyEndDate, location, cost, maxMember,
						minMember, startDate, endDate);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/appearActPage.jsp"); // 新增成功後轉交newAct.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("其他可能的錯誤處理:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/publishActivity.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
