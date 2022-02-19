package com.move_request.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberServiceImpl;
import com.member.model.MemberVO;
import com.move_photo.model.MovePhotoService;
import com.move_photo.model.MovePhotoServiceImpl;
import com.move_photo.model.MovePhotoTransVO;
import com.move_photo.model.MovePhotoVO;
import com.move_request.model.EMoveRequestEvaType;
import com.move_request.model.EMoveRequestStatus;
import com.move_request.model.MoveRequestService;
import com.move_request.model.MoveRequestServiceImpl;
import com.move_request.model.MoveRequestTransReqVO;
import com.move_request.model.MoveRequestTransResVO;
import com.move_request.model.MoveRequestVO;
import com.server_manager.model.ServerManagerVO;

import core.CommonRes;
import core.util.CommonUtil;

//TODO
public class MoveRequestManageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	// Note 使用ajax, 不要使用sendRedirect控制
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		// 工具
		Gson gson = new Gson();
		
		// 回應用
		MoveRequestTransResVO resVo = new MoveRequestTransResVO(); 
		CommonRes<MoveRequestTransResVO> commonRes = null;
		
		// 登入驗證
		HttpSession session = req.getSession();
		ServerManagerVO smVO = (ServerManagerVO) session.getAttribute("ServerManagerVO");
		if (smVO == null) {
			PrintWriter out = res.getWriter();
			resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
			commonRes = genCommonRes("login", "登入", resVo);
			String jsonStr = gson.toJson(commonRes);
			out.print(jsonStr);          
			out.close();
			return;
		}
		
		Integer managerId = smVO.getSmgrId();
		
		//拆解json
		String json = CommonUtil.jsonParse(req.getReader());
		if (json == null || json.isEmpty()) {
			return;
		}
		
		MoveRequestTransReqVO vo = gson.fromJson(json , MoveRequestTransReqVO.class);
		if (vo == null) {
			return;
		}
		
		// 回應用類別
		String action = vo.getAction();
		Integer id = vo.getId();
		Integer price = vo.getPrice();
		if ("backManage".equals(action)) {
			PrintWriter out = res.getWriter();
			
			try {
				MoveRequestService moveRequestService = new  MoveRequestServiceImpl();
				MovePhotoService movePhotoService = new MovePhotoServiceImpl();
				MemberService memberService = new MemberServiceImpl();
				// TODO 補取得MEMBER資料
				
				MoveRequestVO request = moveRequestService.getRequest(id);
				Integer memberId = request.getMemberId();
				MemberVO memberVo = memberService.selectById(memberId);
				List<MovePhotoVO> photos = movePhotoService.findAllPhotosByRequestId(id);
				
				// TODO
				resVo.setId(id);
				resVo.setMemberName(memberVo.getName());
				resVo.setFromAddress(request.getFromAddress());
				resVo.setToAddress(request.getToAddress());
				resVo.setItems(request.getItems());
				resVo.setMoveDate(request.getMoveDate());
				resVo.setEvaluateType(request.getEvaluateType());
				resVo.setEvaluateDate(request.getEvaluateDate());
				resVo.setEvaluatePrice(request.getEvaluatePrice());
				resVo.setRequestDate(request.getRequestDate());
				resVo.setHandled(request.getHandled());
				resVo.setStatus(EMoveRequestStatus.parseCode(request.getStatus()).getText());
				resVo.setEvaluatePrice(request.getEvaluatePrice());
				MovePhotoTransVO[] photosArray = new MovePhotoTransVO[photos.size()]; 
				for (int i = 0; i < photos.size(); i++) {
					MovePhotoTransVO movePhotoTransVO = new MovePhotoTransVO();
					MovePhotoVO movePhotoVO = photos.get(i);
					movePhotoTransVO.setMoveRequestId(movePhotoVO.getMoveRequestId());
					movePhotoTransVO.setPhoto(Base64.getEncoder().encodeToString(movePhotoVO.getPhoto()));
					photosArray[i] = movePhotoTransVO;
				}
				resVo.setMovePhotoTransVOs(photosArray);
				commonRes = genCommonRes("success", "成功", resVo);
			} catch (Exception e) {
				resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
				commonRes = genCommonRes("fail", "失敗", resVo);
			}
			
			String jsonStr = gson.toJson(commonRes);
			out.print(jsonStr);          
			out.close();
		}

		if ("verifyOK".equals(action)) {
			PrintWriter out = res.getWriter();
				
			try {
				MoveRequestService moveRequestService = new  MoveRequestServiceImpl();
				MoveRequestVO request = moveRequestService.getRequest(id);
				EMoveRequestEvaType type = EMoveRequestEvaType.parseCode(request.getEvaluateType());
				switch(type) {
					case ONLINE:
						moveRequestService.verifyOnlineRequestOK(id, price);
						break;
					case SITE:
						moveRequestService.verifySiteRequestOK(id);
						break;	
					default:
						break;	
				}
				request = moveRequestService.getRequest(id);
				
				resVo.setStatus(EMoveRequestStatus.parseCode(request.getStatus()).getText());
				resVo.setEvaluatePrice(request.getEvaluatePrice());
				resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
				commonRes = genCommonRes("success", "成功", resVo);
			} catch (Exception e) {
				resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
				commonRes = genCommonRes("fail", "失敗", resVo);
			}
			
			String jsonStr = gson.toJson(commonRes);
			out.print(jsonStr);          
			out.close();
		}
		
		if (("verifyNAK").equals(action)) {
			PrintWriter out = res.getWriter();
			
			try {
				MoveRequestService moveRequestService = new  MoveRequestServiceImpl();
				moveRequestService.verifyRequestNAK(id);
				MoveRequestVO request = moveRequestService.getRequest(id);
				
				resVo.setStatus(EMoveRequestStatus.parseCode(request.getStatus()).getText());
				resVo.setEvaluatePrice(request.getEvaluatePrice());
				resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
				commonRes = genCommonRes("success", "成功", resVo);
			} catch (Exception e) {
				resVo.setHref("/CFA104G3/back_end/server_manager/loginServer.jsp");
				commonRes = genCommonRes("fail", "失敗", resVo);
			}
			
			String jsonStr = gson.toJson(commonRes);
			out.print(jsonStr);          
			out.close();
		}
	}
	
	private <T> CommonRes<T> genCommonRes(String errCode, String errMsg, T body) {
		CommonRes<T> commonRes = new CommonRes<>();
		commonRes.setErrorCode(errCode);
		commonRes.setErrorMes(errMsg);
		commonRes.setBody(body);
		return commonRes;
	}
}
