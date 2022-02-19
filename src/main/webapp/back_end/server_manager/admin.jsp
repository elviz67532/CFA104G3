<%@ page import="com.server_manager.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="javax.servlet.http.*"%>
<%
	Object account = session.getAttribute("account");
	if(account == null){
		session.setAttribute("location", request.getRequestURI());
		response.sendRedirect(request.getContextPath()+"/back_end/server_manager/loginServer.jsp");
	}
%>
<%
	ServerManagerServiceImpl smSvc = new ServerManagerServiceImpl();
	List<ServerManagerVO> list = smSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<%
	Map<Integer, String> map = new HashMap<>();
	map.put(1,"管理員權限管理");
	map.put(10,"活動");
	map.put(20,"二手");
	map.put(30,"搬家");
	map.put(40, "會員");
	map.put(50, "FAQ");
	pageContext.setAttribute("map", map);
%>
<%
	Map<Integer, String> gentle = new HashMap<>();
	gentle.put(0,"woman");
	gentle.put(1,"man");
	gentle.put(2, "secret");
%>
<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<title>委域</title>
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">

					<!-- main -->
					
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">序號</th>
								<th scope="col">帳號</th>
								<th scope="col">姓名</th>
<!-- 								<th scope="col">性別</th> -->
								<th scope="col">角色名稱</th>
								<th scope="col">更改角色</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>

						<tbody>
											
							<c:forEach var="smVO" items="${list}" begin="">
							
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/server_manager/ServerManagerServlet">								
								<tr>
									<th>${smVO.smgrId}</th>
									<th>${smVO.smgrAccount}</th>
									<th>${smVO.smgrName}</th>
<%-- 									<th>${smVO.smgrGender}</th> --%>
									<th>
<%-- 										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session"> --%>
											<c:forEach var="auth" items="${smVO.authList}">
												${auth.smgeAuthId } -
											</c:forEach>
<%-- 										<c:forEach var="auth" items="${smVO.authList}"> --%>
<%-- 											<c:if test="${smVO.smgrId !=1}" var="varName" scope="session"> --%>
<!-- 											<input type="checkbox" checked> -->
<%-- 											</c:if> --%>
<%-- 											<label>${map[auth.smgeAuthId] }</label><br> --%>
<%-- 											<c:out value="${map[auth.smgeAuthId] }"></c:out> --%>
<%-- 										</c:forEach> --%>
<%-- 										</c:if> --%>
									</th>
									<th>
										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session">
										
										<c:set var="rights" scope="session" value="${20}"/>
										
										
										<%
											Set<Entry<Integer, String>> entrySet = map.entrySet();
											for(Entry<Integer, String> entry : entrySet){
												Integer rightNum = entry.getKey(); // 10 20 30 
												String right = entry.getValue(); // 活動 二手
										%>
										
												<input type="checkbox" name="smgeAuthId" value=<%=rightNum%>>
												<label><%=right %></label>	
										<% 	} %>
										
										
																	
<%-- 											<c:forEach var="auth" items="${smVO.authList}"> --%>
<%--  												<c:out value="${map[auth.smgeAuthId]}"></c:out> --%>
<%-- 													<input type="checkbox" name="smgeAuthId" value=10 <c:if test="${auth.smgeAuthId==10}">checked</c:if>> --%>
<!-- 													<label>活動</label> -->
<%-- 													<input type="checkbox" name="smgeAuthId" value=20 <c:if test="${auth.smgeAuthId==20}">checked</c:if>> --%>
<!-- 													<label>二手</label> -->
<%-- 													<input type="checkbox" name="smgeAuthId" value=30 <c:if test="${auth.smgeAuthId==30}">checked</c:if>> --%>
<!-- 													<label>搬家</label> -->
<%-- 													<input type="checkbox" name="smgeAuthId" value=40 <c:if test="${auth.smgeAuthId==40}">checked</c:if>> --%>
<!-- 													<label>會員</label>	 -->
<%-- 													<input type="checkbox" name="smgeAuthId" value=50 <c:if test="${auth.smgeAuthId==50}">checked</c:if>> --%>
<!-- 													<label>FAQ</label>																																														 -->
												
												
												
<%-- 												<c:if test="${auth.smgeAuthId==10}"> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" checked> -->
<%-- 													<label>${map[auth.smgeAuthId]}</label> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=20> -->
<!-- 													<label>二手</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=30> -->
<!-- 													<label>搬家</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=40> -->
<!-- 													<label>會員</label>	 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=50> -->
<!-- 													<label>FAQ</label>																																														 -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${auth.smgeAuthId==20}"> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=10> -->
<!-- 													<label>活動</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" checked> -->
<%-- 													<label>${map[auth.smgeAuthId]}</label> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=30> -->
<!-- 													<label>搬家</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=40> -->
<!-- 													<label>會員</label>	 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=50> -->
<!-- 													<label>FAQ</label>													 -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${auth.smgeAuthId==30}"> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=10> -->
<!-- 													<label>活動</label>												 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=20> -->
<!-- 													<label>二手</label>												 -->
<!-- 													<input type="checkbox" name="smgeAuthId" checked> -->
<%-- 													<label>${map[auth.smgeAuthId]}</label> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=40> -->
<!-- 													<label>會員</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=50> -->
<!-- 													<label>FAQ</label>													 -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${auth.smgeAuthId==40}"> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=10> -->
<!-- 													<label>活動</label>												 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=20> -->
<!-- 													<label>二手</label>				 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=30> -->
<!-- 													<label>搬家</label>																				 -->
<!-- 													<input type="checkbox" name="smgeAuthId" checked> -->
<%-- 													<label>${map[auth.smgeAuthId]}</label> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=50> -->
<!-- 													<label>FAQ</label>												 -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${auth.smgeAuthId==50}"> --%>
<!-- 													<input type="checkbox" name="smgeAuthId" value=10> -->
<!-- 													<label>活動</label>												 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=20> -->
<!-- 													<label>二手</label>				 -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=30> -->
<!-- 													<label>搬家</label> -->
<!-- 													<input type="checkbox" name="smgeAuthId" value=40> -->
<!-- 													<label>會員</label>																								 -->
<!-- 													<input type="checkbox" name="smgeAuthId" checked> -->
<%-- 													<label>${map[auth.smgeAuthId]}</label> --%>
<%-- 												</c:if>	 --%>																																									
<%-- 											</c:forEach> --%>
												<input type="hidden" name="smgrId" value="${smVO.smgrId}">
												<input type="hidden" name="action" value="update">		
												<input type="submit" value="修改">
										</c:if>
									</th>
									<th>
										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session">
											<input type="submit" value="刪除">
											<c:out value="${smVO.smgrId}"></c:out>
											<input type="hidden" name="smgrId"  value="${smVO.smgrId}">
											<input type="hidden" name="action" value="delete">
										</c:if>
									</th>
								</tr>
							</FORM>
							</c:forEach>
						
						</tbody>
					</table>
					
					
					<!-- end of main -->
					
				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>
	
	<!-- custom script -->
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
</body>

</html>