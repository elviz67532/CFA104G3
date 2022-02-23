<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>

<%
FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>

<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="<%=request.getContextPath()%>/css/activity/backNewFile.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<title>委域後台FAQ管理主頁</title>
<style>
form {
	display: inline;
	border-radius: 16px;
}

form:hover {
	cursor: pointer;
	border-radius: 16px;
	margin-bottom: 0px;
}

table th {
	color: black;
	padding: 5px 10px;
	text-align: center;
}

td {
	text-align: center;
}
</style>
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



					<h3>後台FAQ修改成功!</h3>
					<table class="table table-striped table-hover">
						<tr>
							<th class="text-nowrap">FAQ編號</th>
							<th class="text-nowrap">問題</th>
							<th class="text-nowrap">回答</th>

						</tr>
						<tr>
							<td>${faqVO.id}</td>
							<td>${faqVO.question}</td>
							<td>${faqVO.answer}</td>

						</tr>
					</table>

					<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

		<!-- custom script -->

		<!-- Bootstrap core JavaScript-->
		ㄋ
		<script
			src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
</html>