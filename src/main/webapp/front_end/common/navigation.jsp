<%@page import="java.util.stream.Collector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.*"%>
<%@ page import="com.notification.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	NotificationService service = new NotificationServiceImpl();	
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
	if (memberVo != null) {
		Integer memberId = memberVo.getId();
		int count = service.getUnviewNotificationCount(memberId);	
		List<NotificationVO> notificationVOs = service.getMemberLatestNotification(memberId, 5);
		if (notificationVOs != null) {
			Comparator notifyComparator = new Comparator<NotificationVO>() {
				@Override
				public int compare(NotificationVO o1, NotificationVO o2) {
					if (o1.getNotifyTime() == null) {
						return 1;
					}
					if (o2.getNotifyTime() == null) {
						return -1;
					}
					if(o1.getNotifyTime().after(o2.getNotifyTime())) {
						return -1;
					}
					return 1;
				}
			};
			Collections.sort(notificationVOs, notifyComparator);		
		}
		pageContext.setAttribute("notificationsCnt", count);
		pageContext.setAttribute("notifications", notificationVOs);
	}
%>
<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
<style>
/* 重製label下方外距 */
label {
	margin-bottom: 0rem;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
	<div class="container px-4 px-lg-5">
	    <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">委域</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
	        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        選單
	        <i class="fas fa-bars"></i>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarResponsive">
	    	<ul class="navbar-nav md py-4 py-lg-0">
	        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="<%=request.getContextPath()%>/about.jsp">關於我們</a></li>
	            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="<%=request.getContextPath()%>/front_end/news/homePage.jsp">最新消息</a></li>
	            <li class="nav-item dropdown">
	          		<a class="nav-link px-lg-3 py-3 py-lg-4 dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">服務</a>
            		<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownBlog">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/move/homePage.jsp">前往搬家</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/product/homePage.jsp">前往二手商城</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/activity/homePage.jsp">前往活動</a></li>
					</ul>
               	</li>
				<li class="nav-item dropdown">
					<a class="nav-link px-lg-3 py-3 py-lg-4 dropdown-toggle" id="navbarDropdownHelp" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">幫助中心</a>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownHelp">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/faq/homePage.jsp">FAQ</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact.jsp">聯絡我們</a></li>
					</ul>
				</li>
           	</ul>
	        <ul class="navbar-nav ms-auto py-4 py-lg-0 ml-auto">
	        	<c:choose>
					<c:when test="${empty memberVO}">
			            <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/front_end/member/register.jsp">註冊</a></li>
	          		 	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/front_end/member/login.jsp">登入</a></li>
	        		</c:when>
					<c:otherwise>
						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1">
			
							<a class="nav-link dropdown-toggle px-lg-3 py-3 py-lg-4" href="#" id="alertsDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fas fa-bell fa-fw"></i>
								<c:choose>
									<c:when test="${notificationsCnt gt 5}">
										<span class="badge badge-danger badge-counter">5+</span>
									</c:when>
									<c:when test="${notificationsCnt eq 0}">
									</c:when>
									<c:otherwise>
										<span class="badge badge-danger badge-counter">${notificationsCnt}</span>
									</c:otherwise>
								</c:choose> 
							</a> 
							
							<!-- Dropdown - Alerts -->
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in sm"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">訊息通知</h6>
								<!-- 筆記 -->
								<!-- bg-primary、bg-success、bg-warning -->
								<c:forEach var="notification" items="${notifications}">
									<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/front_end/notification/homePage.jsp?type=${notification.type}">
										<div class="mr-3">
											<div class="icon-circle bg-primary">
												<i class="fas fa-file-alt text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500" style="">
												<fmt:formatDate value="${notification.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
											</div>
											<span class="<c:if test='${notification.viewed eq false}'>font-weight-bold</c:if>" style="overflow: hidden">
												<c:choose>
													<c:when test="${fn:length(notification.content) gt 20}">
														<c:out value="${fn:substring(notification.content, 0, 20)}..."></c:out>
													</c:when>
													<c:otherwise>
														<c:out value="${notification.content}"></c:out>
													</c:otherwise>
												</c:choose> 
											</span>
										</div>
									</a> 
								</c:forEach>
								<a class="dropdown-item text-center small text-gray-500"  href="${pageContext.request.contextPath}/front_end/notification/homePage.jsp">
									顯示所有通知
								</a>
							</div>
		          		 	<li class="nav-item dropdown">
				          		<a class="nav-link px-lg-3 py-3 py-lg-4 dropdown-toggle" id="navbarDropdownProfile" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${memberVO.nickname}</a>
			            		<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdownProfile">
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/member/front_end_listOneMember.jsp">個人檔案</a></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/member/MemberServlet.do?action=logout">登出</a></li>
								</ul>
			               	</li>
						</li>
	        		</c:otherwise>
				</c:choose> 
            </ul>
        </div>
    </div>
</nav>

<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
