<%@ page import="com.server_manager.model.*"%>
<%@ page import="com.server_manager_auth.model.*"%>
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
	map.put(60, "NEWS");
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
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/server_manager/ServerManagerServlet">								
											<!-- 【產生該員工的六組計數器】 -->		
											<% 
												int act=0; int prod=0; int move=0; int mem=0; int faq=0; int news=0; 
											%>
											<div style="display: none;">
												<c:forEach var="auth" items="${smVO.authList}">
													<c:if test="${auth.smgeAuthId==10}"><%=act++ %></c:if>
													<c:if test="${auth.smgeAuthId==20}"><%=prod++ %></c:if>
													<c:if test="${auth.smgeAuthId==30}"><%=move++ %></c:if>
													<c:if test="${auth.smgeAuthId==40}"><%=mem++ %></c:if>
													<c:if test="${auth.smgeAuthId==50}"><%=faq++ %></c:if>
													<c:if test="${auth.smgeAuthId==60}"><%=news++ %></c:if>
												</c:forEach>
											</div>
											<%if(act>0){%>
													<input type="checkbox" name="smgeAuthId" value=10 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=10> -->
													<label>活動</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=10>
<!-- 													<input type="hidden" name="smgeAuthId" value=10> -->
													<label>活動</label>
											<%	} %>
											<%if(prod>0){%>
													<input type="checkbox" name="smgeAuthId" value=20 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=20> -->
													<label>二手</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=20>
<!-- 													<input type="hidden" name="smgeAuthId" value=20> -->
													<label>二手</label>
											<%	} %>
											<%if(move>0){%>
													<input type="checkbox" name="smgeAuthId" value=30 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=30> -->
													<label>搬家</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=30>
<!-- 													<input type="hidden" name="smgeAuthId" value=30> -->
													<label>搬家</label>
											<%	} %>
											<%if(mem>0){%>
													<input type="checkbox" name="smgeAuthId" value=40 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=40> -->
													<label>會員</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=40>
<!-- 													<input type="hidden" name="smgeAuthId" value=40> -->
													<label>會員</label>
											<%	} %>
											<%if(faq>0){%>
													<input type="checkbox" name="smgeAuthId" value=50 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=50> -->
													<label>FAQ</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=50>
<!-- 													<input type="hidden" name="smgeAuthId" value=50> -->
													<label>FAQ</label>
											<%	} %>																																												
											<%if(news>0){%>
													<input type="checkbox" name="smgeAuthId" value=60 checked>
<!-- 													<input type="hidden" name="smgeAuthId" value=50> -->
													<label>NEWS</label>
											<% 	} else {%>
													<input type="checkbox" name="smgeAuthId" value=60>
<!-- 													<input type="hidden" name="smgeAuthId" value=50> -->
													<label>NEWS</label>
											<%	} %>								
											<input type="hidden" name="smgrId" value="${smVO.smgrId}">
											<input type="hidden" name="action" value="update">		
											<input type="submit" value="修改">
								</FORM>
										</c:if>												

									</th>
									<th>
										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session">
											<c:out value="${smVO.smgrId}"></c:out>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/server_manager/ServerManagerServlet">								
											
											<input type="hidden" name="smgrId"  value="${smVO.smgrId}">
											<input type="hidden" name="action" value="delete">
											<input type="submit" value="刪除">
								</FORM>
										</c:if>
									</th>
								</tr>
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