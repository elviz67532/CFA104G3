package com.move_request.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Base64;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.management.Notification;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.member.model.MemberVO;
import com.move_photo.model.MovePhotoVO;
import com.move_request.model.EMoveRequestEvaType;
import com.move_request.model.EMoveRequestStatus;
import com.move_request.model.MoveRequestService;
import com.move_request.model.MoveRequestServiceImpl;
import com.move_request.model.MoveRequestVO;
import com.notification.model.ENotificationType;
import com.notification.model.NotificationService;
import com.notification.model.NotificationServiceImpl;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 3 * 1024 * 1024, maxRequestSize = 3 * 3 * 1024 * 1024)
public class MoveRequestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);

		if ("moveRequest".equals(action)) {
			HttpSession session = req.getSession();
			MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
			if (memberVo == null) {
				res.sendRedirect(req.getContextPath() + "/front_end/member/login.jsp");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/homePage.jsp");
				failureView.forward(req, res);
				return;
			}
			
			int memberId = memberVo.getId();
			
			String fromAddress = req.getParameter("fromAddress");
			String toAddress = req.getParameter("toAddress");
			String items = req.getParameter("items");
			String moveDate = req.getParameter("moveDate");
			String requestMode = req.getParameter("requestMode");
			String evaDate = req.getParameter("evaDate");
			Collection<Part> parts = req.getParts();

			// TODO 指定允許時間(EVA、MOVE)
			
			try {
				checkEmpty(errorMsgs, fromAddress, "fromAddress");
				checkEmpty(errorMsgs, toAddress, "toAddress");
				checkEmpty(errorMsgs, items, "items");
				boolean isMoveDateEmpty = checkEmpty(errorMsgs, moveDate, "moveDate");
				Timestamp tMoveDate = null;
				if (!isMoveDateEmpty) {
					try {
						Date date = Date.valueOf(moveDate);
						tMoveDate = new Timestamp(date.getTime());
					} catch (IllegalArgumentException e) {
						errorMsgs.put("moveDate", "請選擇日期");
					}
				}
				
				EMoveRequestEvaType evaluateType = null;
				Timestamp tEvaDate = null;
				List<byte[]> photos = null;
				if ("online".equals(requestMode)) {
					evaluateType = EMoveRequestEvaType.ONLINE;
					if (parts == null) {
						errorMsgs.put("itemPhoto", "請選擇圖片");
					} else {
						photos = parts.stream().filter(part -> "itemPhoto".equals(part.getName()) && part.getSize() > 0)
								.map(part -> {
									byte[] data = null;
									try (InputStream inputStream = part.getInputStream()) {
										data = inputStream.readAllBytes();
									} catch (IOException e) {
									}
									return data;
								}).filter(data -> data != null)
								.collect(Collectors.toList());
						if (photos.isEmpty()) {
							errorMsgs.put("itemPhoto", "請選擇圖片");
						}
					}
				} else if ("site".equals(requestMode)) {
					evaluateType = EMoveRequestEvaType.SITE;
					boolean isEvaDateEmpty = checkEmpty(errorMsgs, evaDate, "evaDate");
					if (!isEvaDateEmpty) {
						try {
							Date date = Date.valueOf(evaDate);
							tEvaDate = new Timestamp(date.getTime());
						} catch (IllegalArgumentException e) {
							errorMsgs.put("evaDate", "請選擇日期");
						}
					}
					
					if (tMoveDate != null && tEvaDate != null) {
						long diffTime = tMoveDate.getTime() - tEvaDate.getTime(); 
						if(diffTime < 7 * 24 * 60 * 60 * 1000) {
							errorMsgs.put("evaDate", "搬家日期與估價日期時間過近");
						}
					}
				} else {
					errorMsgs.put("requestMode", "請選擇估價模式");
				}

				if (!errorMsgs.isEmpty()) {
					MoveRequestVO vo = new MoveRequestVO();
					vo.setMemberId(memberId);
					vo.setFromAddress(fromAddress);
					vo.setToAddress(toAddress);
					vo.setEvaluateDate(tEvaDate);
					vo.setItems(items);
					vo.setMoveDate(tMoveDate);
					vo.setEvaluateType(evaluateType.getTypeCode());
					req.setAttribute("moveRequestVO", vo);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequest.jsp");
					failureView.forward(req, res);
					return;
				}

				MoveRequestService service = new MoveRequestServiceImpl();
				boolean addOk = service.addRequest(memberId, fromAddress, toAddress, items, tMoveDate, evaluateType,
						tEvaDate, photos);
				
				if (addOk) {
					MoveRequestVO vo = new MoveRequestVO();
					vo.setMemberId(memberId);
					vo.setFromAddress(fromAddress);
					vo.setToAddress(toAddress);
					vo.setEvaluateDate(tEvaDate);
					vo.setItems(items);
					vo.setMoveDate(tMoveDate);
					vo.setEvaluateType(evaluateType.getTypeCode());
					req.setAttribute("moveRequestVO", vo);
					req.setAttribute("movePhotosVO", photos);
					req.setAttribute("result", "1");
					
					// 送出通知
					NotificationService notifService = new NotificationServiceImpl();
					notifService.addNotification(memberId, "新增搬家申請單成功, 請耐心等待審核", ENotificationType.MOVE);
				} else {
					req.setAttribute("moveRequestVO", null);
					req.setAttribute("movePhotosVO", null);
					req.setAttribute("result", "0");
				}

				RequestDispatcher successView = req.getRequestDispatcher("/front_end/move/moveRequest.jsp");
				successView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("moveRequestVO", null);
				req.setAttribute("movePhotosVO", null);
				req.setAttribute("result", "0");
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequest.jsp");
				failureView.forward(req, res);
			}
		}
	}

	/**
	 * @return Returns true if checkString is empty
	 */
	private boolean checkEmpty(Map<String, String> errorMsgs, String checkString, String errorMsgId) {
		boolean isEmpty = checkString == null || checkString.trim().isEmpty();
		if (isEmpty) {
			errorMsgs.put(errorMsgId, "請勿空白");
		}
		return isEmpty;
	}
}
