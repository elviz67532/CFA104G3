package com.move_request.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
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
import com.move_order.model.MoveOrderService;
import com.move_order.model.MoveOrderServiceImpl;
import com.move_photo.model.MovePhotoService;
import com.move_photo.model.MovePhotoServiceImpl;
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

		HttpSession session = req.getSession();
		MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
		if (memberVo == null) {
			res.sendRedirect(req.getContextPath() + "/front_end/member/login.jsp");
			return;
		}
		
		int memberId = memberVo.getId();
		
		if ("moveRequest".equals(action)) {
			String fromAddress = req.getParameter("fromAddress");
			String toAddress = req.getParameter("toAddress");
			String items = req.getParameter("items");
			String moveDate = req.getParameter("moveDate");
			String requestMode = req.getParameter("requestMode");
			String evaDate = req.getParameter("evaDate");
			Collection<Part> parts = req.getParts();

			// TODO ??????????????????(EVA???MOVE)
			
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
						errorMsgs.put("moveDate", "???????????????");
					}
				}
				
				EMoveRequestEvaType evaluateType = null;
				Timestamp tEvaDate = null;
				List<byte[]> photos = null;
				if ("online".equals(requestMode)) {
					evaluateType = EMoveRequestEvaType.ONLINE;
					if (parts == null) {
						errorMsgs.put("itemPhoto", "???????????????");
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
							errorMsgs.put("itemPhoto", "???????????????");
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
							errorMsgs.put("evaDate", "???????????????");
						}
					}
					
					if (tMoveDate != null && tEvaDate != null) {
						long diffTime = tMoveDate.getTime() - tEvaDate.getTime(); 
						if(diffTime <= 0) {
							errorMsgs.put("evaDate", "????????????????????????????????????");
						} else if(diffTime < 7 * 24 * 60 * 60 * 1000) {
							errorMsgs.put("evaDate", "???????????????????????????????????????");
						}
					}
				} else {
					errorMsgs.put("requestMode", "?????????????????????");
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
					
					// ????????????
					NotificationService notifService = new NotificationServiceImpl();
					notifService.addNotification(memberId, "???????????????????????????, ?????????????????????", ENotificationType.MOVE);
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
		
		if ("moveRequestCtrl".equals(action)) {
			try {
				String type = req.getParameter("type");
				String id = req.getParameter("requestId");
				int requestId = Integer.parseInt(id);
				
				MoveRequestService service = new MoveRequestServiceImpl();
				if ("pay".equals(type)) {
					// TODO ??????API??????
					boolean payok = service.pay(requestId);
					if(payok) {
						NotificationService notifService = new NotificationServiceImpl();
						notifService.addNotification(memberId, "????????????????????????????????????, ", ENotificationType.MOVE);
					}
				} else if ("cancel".equals(type)) {
					boolean cancel = service.cancelRequest(requestId);
					if(cancel) {
						NotificationService notifService = new NotificationServiceImpl();
						notifService.addNotification(memberId, "?????????????????????", ENotificationType.MOVE);
					}
				}
				req.setAttribute("moveRequestVO", null);
				req.setAttribute("movePhotosVO", null);
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequestManage.jsp");
				failureView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("moveRequestVO", null);
				req.setAttribute("movePhotosVO", null);
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequestManage.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("moveRequestView".equals(action)) {
			String id = req.getParameter("requestId");
			
			try {
				int requestId = Integer.parseInt(id);
				
				MoveRequestService service = new MoveRequestServiceImpl();
				MovePhotoService photoService = new MovePhotoServiceImpl(); 
				MoveRequestVO request = service.getRequest(requestId);
				List<MovePhotoVO> movePhotoVOs = photoService.findAllPhotosByRequestId(requestId);
				List<byte[]> photos = new ArrayList<byte[]>();
				for (MovePhotoVO movePhotoVO : movePhotoVOs) {
					photos.add(movePhotoVO.getPhoto());
				}
				
				// ????????????
				if (request.getMemberId() != memberId) {
					req.setAttribute("moveRequestVO", null);
					req.setAttribute("movePhotosVO", null);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequestCManage.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("moveRequestVO", request);
				req.setAttribute("movePhotosVO", photos);
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequestCManage.jsp");
				failureView.forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("moveRequestVO", null);
				req.setAttribute("movePhotosVO", null);
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequestCManage.jsp");
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
			errorMsgs.put(errorMsgId, "????????????");
		}
		return isEmpty;
	}
}
