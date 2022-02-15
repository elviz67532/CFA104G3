package com.move_request.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.move_photo.model.MovePhotoService;
import com.move_photo.model.MovePhotoServiceImpl;
import com.move_photo.model.MovePhotoTransVO;
import com.move_photo.model.MovePhotoVO;
import com.move_request.model.MoveRequestManageTransVO;
import com.move_request.model.MoveRequestService;
import com.move_request.model.MoveRequestServiceImpl;
import com.move_request.model.MoveRequestVO;
import com.move_request.model.MoveTransVO;

import core.CommonRes;
import core.util.CommonUtil;

//TODO
public class MoveRequestManageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		//拆解json
		String json = CommonUtil.jsonParse(req.getReader());
		if (json == null || json .isEmpty()) {
			return;
		}
		
		System.out.print(json);
		
		Gson gson = new Gson();
		MoveTransVO moveRequestVO = gson.fromJson(json , MoveTransVO.class);
		if (moveRequestVO == null) {
			return;
		}
		
		// TODO 會員登入
		
		String mode = moveRequestVO.getMode();
		if ("backManage".equals(mode)) {
			Integer id = moveRequestVO.getId();
			
			//組回傳json
			response.setCharacterEncoding("UTF8");
			response.setContentType("text/html; charset=UTF-8");
		
			try {
				MoveRequestService moveRequestService = new  MoveRequestServiceImpl();
				MovePhotoService movePhotoService = new MovePhotoServiceImpl();
				
				// TODO 補取得MEMBER資料
				
				MoveRequestVO request = moveRequestService.getRequest(id);
				List<MovePhotoVO> photos = movePhotoService.findAllPhotosByRequestId(id);
				
				MoveRequestManageTransVO moveRequestManageTransVO = new MoveRequestManageTransVO();
				moveRequestManageTransVO.setMoveRequestVO(request);
				
				MovePhotoTransVO[] photosArray = new MovePhotoTransVO[photos.size()]; 
				for (int i = 0; i < photos.size(); i++) {
					MovePhotoTransVO movePhotoTransVO = new MovePhotoTransVO();
					MovePhotoVO movePhotoVO = photos.get(i);
					movePhotoTransVO.setMoveRequestId(movePhotoVO.getMoveRequestId());
					movePhotoTransVO.setPhoto(Base64.getEncoder().encodeToString(movePhotoVO.getPhoto()));
					photosArray[i] = movePhotoTransVO;
				}
				moveRequestManageTransVO.setMovePhotoTransVO(photosArray);
				
				CommonRes<MoveRequestManageTransVO> res = new CommonRes<>();
				
				res.setErrorCode("success");
				res.setErrorMes("成功");
				res.setBody(moveRequestManageTransVO);
				String jsonStr = gson.toJson(res);
				PrintWriter out = response.getWriter();
		        out.print(jsonStr);          
		        out.close();
			} catch (Exception e) {
				// TODO
//				req.setAttribute("exception", e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/move/moveRequest.jsp");
//				failureView.forward(req, res);
			}
		}
		
		if ("frontManage".equals(mode)) {
			
		}
	}
}
