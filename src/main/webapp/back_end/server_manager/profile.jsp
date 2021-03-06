<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="com.server_manager.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%
	ServerManagerVO smVO = (ServerManagerVO)session.getAttribute("ServerManagerVO");
	pageContext.setAttribute("smVO", smVO);
%>
<%
	Map<Integer, String> gender = new HashMap<>();
	gender.put(0,"不透漏");
	gender.put(1,"男");
	gender.put(2,"女");
	pageContext.setAttribute("gender", gender);	
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
					<table class="table table-striped">
<!-- 					  <thead> -->
<!-- 					    <tr> -->
<!-- 					      <th scope="col">#</th> -->
<!-- 					      <th scope="col">First</th> -->
<!-- 					      <th scope="col">Last</th> -->
<!-- 					      <th scope="col">Handle</th> -->
<!-- 					    </tr> -->
<!-- 					  </thead> -->
					  <tbody>
					    <tr>
					      <th scope="row">管理員編號</th>
					      <td>${ServerManagerVO.smgrId}</td>
					    </tr>
					    <tr>
					      <th scope="row">email</th>
					      <td>${ServerManagerVO.smgrEmail}</td>
					    </tr>
					    <tr>
					      <th scope="row">account</th>
					      <td>${ServerManagerVO.smgrAccount}</td>
					    </tr>
					    <tr>
					      <th scope="row">password</th>
					      <td>${ServerManagerVO.smgrPassword}</td>
					    </tr>
					    <tr>
					      <th scope="row">權限</th>
					      <td>
							<c:forEach var="auth_" varStatus="s" items="${auth}">
								${map[auth_.smgeAuthId]}
								<c:if test="${s.last eq false}">、</c:if>
							</c:forEach>					      
					      </td>
					    </tr>					    
					    <tr>
					      <th scope="row">名稱</th>
					      <td>${ServerManagerVO.smgrName}</td>
					    </tr>
					    <tr>
					      <th scope="row">電話</th>
					      <td>${ServerManagerVO.smgrPhone}</td>
					    </tr>
					    <tr>
					      <th scope="row">性別</th>
					      <td>${gender[ServerManagerVO.smgrGender]}</td>
					    </tr>
					    <tr>
					      <th scope="row">地址</th>
					      <td>${ServerManagerVO.smgrAddress}</td>
					    </tr>					    					    					    					    					    
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