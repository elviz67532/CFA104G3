<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>

<%
FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css"
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
<title>委域-Entrust Area</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">
					<!-- 全域錯誤、傳入參數 -->


					<!-- main -->



					<h4>
						<a href="back_FaqMain.jsp">回首頁</a>
					</h4>



					<h3>新增FAQ:</h3>

					<%-- 錯誤表列 --%>
					<c:if test="${not empty exception}">
						<font style="color: red">請修正以下錯誤:</font>
						<li style="color: red">${exception}</li>
					</c:if>

					<FORM METHOD="post" ACTION="faq" name="form1">
						<table>
							<tr>
								<td>FAQ編號:</td>
								<td><input type="TEXT" name="id" size="45"
									value="<%=(faqVO == null) ? "66" : faqVO.getId()%>" /></td>
							</tr>
							<tr>
								<td>問題:</td>
								<td><input type="TEXT" name="question" size="45"
									value="<%=(faqVO == null) ? "忘記密碼怎麼辦?" : faqVO.getQuestion()%>" /></td>
							</tr>

							<tr>
								<td>回答:</td>
								<td><input type="TEXT" name="answer" size="45"
									value="<%=(faqVO == null) ? "請付500美元找密碼!" : faqVO.getAnswer()%>" /></td>
							</tr>


							<jsp:useBean id="faqSvc" scope="page"
								class="com.faq.model.FaqServiceImpl" />


						</table>
						<br> <input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增">
					</FORM>
					<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
				</div>
			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

			<!-- Logout Modal-->
			<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

			<!-- Bootstrap core JavaScript-->
			<script
				src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script
				src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script
				src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

			<!-- Page level custom scripts -->
			<script
				src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>
</body>

</html>