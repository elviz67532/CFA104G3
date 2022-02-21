package com.notification.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.member.model.MemberVO;
import com.notification.model.NotificationService;
import com.notification.model.NotificationServiceImpl;
import com.notification.model.NotificationTransVO;
import com.server_manager.model.ServerManagerVO;

import core.CommonRes;
import core.util.CommonUtil;

public class NotificationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		
		// 工具
		Gson gson = new Gson();
		
		// 回應用
		NotificationTransVO resVo = new NotificationTransVO(); 
		CommonRes<NotificationTransVO> commonRes = null;
		
		// 登入驗證
		HttpSession session = req.getSession();
		MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
		if (memberVo == null) {
			PrintWriter out = res.getWriter();
			resVo.setHref(req.getContextPath() + "/back_end/server_manager/loginServer.jsp");
			commonRes = genCommonRes("login", "登入", resVo);
			String jsonStr = gson.toJson(commonRes);
			out.print(jsonStr);          
			out.close();
			return;
		}
		
		//拆解json
		String json = CommonUtil.jsonParse(req.getReader());
		if (json == null || json.isEmpty()) {
			return;
		}
		
		NotificationTransVO vo = gson.fromJson(json , NotificationTransVO.class);
		if (vo == null) {
			return;
		}
		
		
		String action = vo.getAction();
		Integer notificationId = vo.getId();	// 會員id
		if ("viewedNotify".equals(action)) {
			PrintWriter out = res.getWriter();

			try {
				NotificationService service = new NotificationServiceImpl();
				service.viewNotification(notificationId);
				
				resVo.setHref(req.getContextPath() + "/front_end/notification/homePage.jsp");
				commonRes = genCommonRes("success", "成功", resVo);
			} catch (Exception e) {
				resVo.setHref(req.getContextPath() + "/front_end/notification/homePage.jsp");
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
