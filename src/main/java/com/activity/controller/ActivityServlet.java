package com.activity.controller;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.activity.model.ActivityServiceImpl;
import com.activity.model.ActivityVO;
import com.activity_photo.model.ActivityPhotoServiceImpl;
import com.activity_photo.model.ActivityPhotoVO;
import com.member.model.MemberVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 100 * 1024 * 1024)
public class ActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8"); // post
		String action = req.getParameter("action");

//		System.out.println("test");

		/*************************** 狀態回復正常 **********************************/
		if ("normal".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeNormal(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 後台狀態回復正常 **********************************/
		if ("normalBack".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeNormal(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 狀態改成取消 **********************************/
		if ("cancel".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeCancel(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}
		/*************************** 後台狀態改成取消 **********************************/

		if ("cancelBack".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeCancel(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				failureView.forward(req, res);
			}
		}
		/*************************** 狀態改成下架 **********************************/
		if ("remove".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeRemove(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 後台狀態改成下架 **********************************/
		if ("removeBack".equals(action)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int activityId = Integer.valueOf(req.getParameter("activityId").trim());

				ActivityVO actVO = new ActivityVO();
				actVO.setActivityId(activityId);
				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.changeRemove(activityId);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				failureView.forward(req, res);
			}
		}

		/********************************** 新增 **********************************/
		if ("insert".equals(action)) { // 來自addAct.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				/* ========================= 會員id ========================= */
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if (memberVO == null) {
//			     FrontEndMemberFilter.doFilter(req, res, gg);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				int organizerMemberId = memberVO.getId();
				/* ========================= 狀態 ========================= */
				int status = 0;
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
//Map<Integer, String> t = new LinkedHashMap<Integer, String>();
//t.put(1, "活動");
//t.put(2, "聚餐");
//t.put(3, "講座");
//t.put(4, "其他");
//t.get(type);
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

				/* ========================= 建立時間 ========================= */
				java.sql.Timestamp launchedDate = null;
				launchedDate = new Timestamp(System.currentTimeMillis());
				System.out.println(launchedDate);

				/* ========================= 報名開始時間 ========================= */
				// 測試報名開始時間介於開始、結束時間之間，不得晚於報名截止時間。
				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束

				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (applyStartDate.before(launchedDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法在表單建立時間之前");
					} else if (applyStartDate.after(applyEndDate)) {
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
				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (applyEndDate.before(launchedDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法在表單建立時間之前");
					} else if (applyEndDate.after(startDate)) {
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

				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));
					if (startDate.before(launchedDate)) {
						errorMsgs.put("startDate", "活動開始時間無法在表單建立時間之前");
					} else if (startDate.after(endDate)) {
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
					launchedDate = new Timestamp(System.currentTimeMillis());
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
				} catch (Exception e1) {
					e1.printStackTrace();
				}

				/* ========================= 報名人數倒數 ========================= */
				int applyMemberExisting = 0;
				// 活動人數上限
				int maxMember = 0;
				// 活動人數下限
				int minMember = 0;
				applyMemberExisting = Integer.valueOf(req.getParameter("maxMember"));
				try {
					applyMemberExisting = Integer.valueOf(req.getParameter("maxMember").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("applyMemberExisting", "報名人數倒數問題");
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
				// 照片
				InputStream is = null;
				byte[] photo = null;
				Part filePart = req.getPart("actp");
				if (filePart != null) {
					is = filePart.getInputStream();
					photo = new byte[is.available()];
					is.read(photo);
					is.close();
				}
				// 種類
//				Map<Integer, String> t = new LinkedHashMap<Integer, String>();
//				t.put(1, "活動");
//				t.put(2, "聚餐");
//				t.put(3, "講座");
//				t.put(4, "其他");
//				t.get(type);

				ActivityVO actVO = new ActivityVO();
				actVO.setOrganizerMemberId(organizerMemberId);
				actVO.setType(type);
				actVO.setName(name);
				actVO.setContent(content);
				actVO.setLaunchedDate(launchedDate);
				actVO.setApplyStartDate(applyStartDate);
				actVO.setApplyEndDate(applyEndDate);
				actVO.setLocation(location);
				actVO.setCost(cost);
				actVO.setApplyMemberExisting(applyMemberExisting);
				actVO.setMaxMember(maxMember);
				actVO.setMinMember(minMember);
				actVO.setStartDate(startDate);
				actVO.setEndDate(endDate);
				actVO.setStatus(status);

				// 如果有錯誤，將使用發送回表單
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("actVO", actVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/publishActivity.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/

				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.addAct(organizerMemberId, type, name, content, launchedDate, applyStartDate,
						applyEndDate, location, cost, applyMemberExisting, maxMember, minMember, startDate, endDate,
						status);
				// 取得PK主鍵
				Integer activityId = actVO.getActivityId();

				ActivityPhotoVO vo = new ActivityPhotoVO();
				vo.setActivityId(activityId);
				vo.setPhoto(photo);

				ActivityPhotoServiceImpl actpSvc = new ActivityPhotoServiceImpl();
				vo = actpSvc.addActPhoto(activityId, photo);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				// 新增成功後轉交
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/previewActPage.jsp"); // 新增成功後轉交newAct.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("其他可能的錯誤處理:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/publishActivity.jsp");
				failureView.forward(req, res);
			}
		}

		if ("selectActivityByMemId".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ****************************************/
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				if (memberVO == null) {
//			     FrontEndMemberFilter.doFilter(req, res, gg);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				int memberId = memberVO.getId();
				/*************************** 2.開始查詢資料 ****************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				List<ActivityVO> actVO = actSvc.findByMemId(memberId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("actVO", actVO); // 資料庫取出的empVO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/memPublishActivityOwnPage.jsp");// 回到預覽頁面
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("無法取得要修改的資料:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("selectOneAct".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer activityId = Integer.valueOf(req.getParameter("activityId"));
				/*************************** 2.開始查詢資料 ****************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				ActivityVO actVO = actSvc.findByActivityId(activityId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("actVO", actVO); // 資料庫取出的empVO物件,存入req
//				跳轉頁面 遊客/會員
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");// 回到預覽頁面
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("無法取得要修改的資料:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/singleActPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("selectOneActForEdit".equals(action)) { // 來自singleActPage.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer activityId = Integer.valueOf(req.getParameter("activityId"));

				/*************************** 2.開始查詢資料 ****************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				ActivityVO actVO = actSvc.findByActivityId(activityId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("actVO", actVO); // 資料庫取出的empVO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/updateActivity.jsp");// 回到預覽頁面
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("無法取得要修改的資料:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/previewActPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer activityId = Integer.valueOf(req.getParameter("activityId"));

				/*************************** 2.開始查詢資料 ****************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actSvc.deleteAct(activityId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("刪除資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/homePage.jsp");
				failureView.forward(req, res);
			}
		}

		// 後台管理
		if ("deleteBack".equals(action)) { // 來自selectAllActivityPage.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer activityId = Integer.valueOf(req.getParameter("activityId"));

				/*************************** 2.開始查詢資料 ****************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actSvc.deleteAct(activityId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ************/
				RequestDispatcher successView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("刪除資料失敗:", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back_end/activity/selectAllActivityPage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自singleActPage.jsp的請求

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				/* ========================= activityId ========================= */

				int activityId = Integer.valueOf(req.getParameter("activityId").trim());
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

				/* ========================= cost ========================= */

				int cost = 0;
				try {
					cost = Integer.valueOf(req.getParameter("cost").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("cost", "請填數字");
				}

				/* ========================= 時間 ========================= */
				// 報名開始時間
				java.sql.Timestamp applyStartDate = null;
				// 報名截止時間
				java.sql.Timestamp applyEndDate = null;
				// 活動開始時間
				java.sql.Timestamp startDate = null;
				// 活動結束時間
				java.sql.Timestamp endDate = null;

				/* ========================= 建立時間 ========================= */
				java.sql.Timestamp launchedDate = null;
				launchedDate = new Timestamp(System.currentTimeMillis());
				System.out.println(launchedDate);
				/* ========================= 報名開始時間 ========================= */
				// 測試報名開始時間介於開始、結束時間之間，不得晚於報名截止時間。
				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束

				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));

					if (applyStartDate.before(launchedDate)) {
						errorMsgs.put("applyStartDate", "報名開始時間無法在表單建立時間之前");
					} else if (applyStartDate.after(applyEndDate)) {
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
				} catch (Exception e) {
					e.printStackTrace();
				}

				/* ========================= 報名截止時間 ========================= */
				// 測試報名截止時間介於開始、結束時間之間，不得早於報名開始時間。
				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));

					if (applyEndDate.before(launchedDate)) {
						errorMsgs.put("applyEndDate", "報名截止時間無法在表單建立時間之前");
					} else if (applyEndDate.after(startDate)) {
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
				} catch (Exception e) {
					e.printStackTrace();
				}

				/* ========================= 活動開始時間 ========================= */

				// 表單建立 > 報名開始 > 報名截止 > 活動開始 > 活動結束
				try {
					launchedDate = new Timestamp(System.currentTimeMillis());
					String datetimeLocalApplyStartDate = req.getParameter("applyStartDate");
					applyStartDate = java.sql.Timestamp.valueOf(datetimeLocalApplyStartDate.replace("T", " "));
					String datetimeLocalApplyEndDate = req.getParameter("applyEndDate");
					applyEndDate = java.sql.Timestamp.valueOf(datetimeLocalApplyEndDate.replace("T", " "));
					String datetimeLocalStartDate = req.getParameter("startDate");
					startDate = java.sql.Timestamp.valueOf(datetimeLocalStartDate.replace("T", " "));
					String datetimeLocalEndDate = req.getParameter("endDate");
					endDate = java.sql.Timestamp.valueOf(datetimeLocalEndDate.replace("T", " "));

					if (startDate.before(launchedDate)) {
						errorMsgs.put("startDate", "活動開始時間無法在表單建立時間之前");
					} else if (startDate.after(endDate)) {
						errorMsgs.put("startDate", "活動開始時間無法在活動結束時間之後");
					} else if (startDate.equals(endDate)) {
						errorMsgs.put("startDate", "活動開始時間無法與活動結束時間相同");
					}
					System.out.println(startDate);
				} catch (IllegalArgumentException e) {
					errorMsgs.put("startDate", "請輸入日期與時間");
				} catch (Exception e) {
					e.printStackTrace();
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
				} catch (Exception e) {
					e.printStackTrace();
				}

				/* ========================= 報名人數倒數 ========================= */
				int applyMemberExisting = 0;
				// 活動人數上限
				int maxMember = 0;
				// 活動人數下限
				int minMember = 0;

				applyMemberExisting = Integer.valueOf(req.getParameter("maxMember"));
				try {
					applyMemberExisting = Integer.valueOf(req.getParameter("maxMember").trim());
				} catch (NumberFormatException e) {
					errorMsgs.put("applyMemberExisting", "報名人數倒數問題");
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

				// 照片
				InputStream is = null;
				byte[] photo = null;
				Part filePart = req.getPart("actp");
				if (filePart != null) {
					is = filePart.getInputStream();
					photo = new byte[is.available()];
					is.read(photo);
					is.close();
				}

				ActivityVO actVO = new ActivityVO();
//				actVO.setOrganizerMemberId(organizerMemberId);
//				actVO.setStatus(status);
				actVO.setActivityId(activityId);
				actVO.setType(type);
				actVO.setName(name);
				actVO.setContent(content);
				actVO.setLaunchedDate(launchedDate);
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/updateActivity.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 ***************************************/
				ActivityServiceImpl actSvc = new ActivityServiceImpl();
				actVO = actSvc.updateAct(activityId, type, name, content, launchedDate, applyStartDate, applyEndDate,
						location, cost, applyMemberExisting, maxMember, minMember, startDate, endDate);
				// 取得PK主鍵

				ActivityPhotoVO vo = new ActivityPhotoVO();
				vo.setActivityId(activityId);
				vo.setPhoto(photo);

				ActivityPhotoServiceImpl actpSvc = new ActivityPhotoServiceImpl();
				vo = actpSvc.addActPhoto(activityId, photo);
				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				// 新增成功後轉交previewActPage.jsp
				req.setAttribute("actVO", actVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/activity/previewActPage2.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.put("修改資料失敗:", e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/activity/updateActivity.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
