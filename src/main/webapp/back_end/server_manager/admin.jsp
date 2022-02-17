<%@ page import="com.server_manager.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%
	Object account = session.getAttribute("account");
	if(account == null){
		session.setAttribute("location", request.getRequestURI());
		response.sendRedirect(request.getContextPath()+"/back_end/server_manager/loginServer.jsp");
	}
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
								<th scope="col">性別</th>
								<th scope="col">角色名稱</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>

						<tbody>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/server_manager_function/ServerManageFunctionServlet">						
							<c:forEach var="smVO" items="${list}" begin="">
								<tr>
									<th>${smVO.smgrId}</th>
									<th>${smVO.smgrAccount}</th>
									<th>${smVO.smgrName}</th>
									<th>${smVO.smgrGender}</th>
									<th>
										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session">
											<select name="Auth">
												<!-- <option value=0>權限管理 -->
												<option value=10>活動管理
												<option value=20>二手買賣
												<option value=30>搬家管理
												<option value=40>會員管理
												<option value=50>FAQ管理
											</select>
										</c:if>
									</th>
									<th>
										<c:if test="${smVO.smgrId !=1}" var="varName" scope="session">
											<input type="submit" value="刪除">
											<input type="hidden" name="smgrId"  value="${smVO.smgrId}">
											<input type="hidden" name="action" value="delete">
										</c:if>
									</th>
								</tr>
							</c:forEach>
						</FORM>
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