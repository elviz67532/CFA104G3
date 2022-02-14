<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="zh-TW">
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
<title>委域</title>
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
					<%
					// 傳入參數
					FaqServiceImpl faqSvc = new FaqServiceImpl();
					List<FaqVO> list = faqSvc.getAll();
					pageContext.setAttribute("list", list);
					%>

					<!-- main -->
					</head>
					<body bgcolor='white'>

						<table id="table-1">
							<tr>
								<td><h3>FAQ後台管理主畫面</h3>
							</tr>
						</table>
						<h3>FAQ查詢:</h3>

						<ul>
							<li><a href="listAllFaq.jsp">所有FAQ資料</a>
							<li>
								<FORM METHOD="post" ACTION="faq.do">
									<b>輸入FAQ編號 (如1):</b> <input type="text" name="id"> <input
										type="hidden" name="action" value="getOne_For_Display">
									<input type="submit" value="送出">
								</FORM>
							</li>

							<jsp:useBean id="proSvc" scope="page"
								class="com.faq.model.FaqServiceImpl" />


						</ul>


						<h3>FAQ管理</h3>

						<ul>
							<li><a href='addFaq.jsp'>新增FAQ</a>
						</ul>
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

			<!-- 註冊按鈕觸發功能  -->
			<script>
				
			</script>
</body>

</html>