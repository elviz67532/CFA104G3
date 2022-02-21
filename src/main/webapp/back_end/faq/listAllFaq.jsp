<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>
<%
// 傳入參數
FaqServiceImpl faqSvc = new FaqServiceImpl();
List<FaqVO> list = faqSvc.getAll();
request.setAttribute("list", list);
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
<title>委域-Entrust area</title>
</head>
<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

.box1 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box2 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box3 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box4 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}
</style>
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

					<h2>
						所有FAQ資料
						<td><a href='addFaq.jsp'><input type="submit"
								value="新增FAQ"></a></td>
					</h2>
					<a href="back_FaqMain.jsp">回首頁</a>
					</td>

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>

					<table>

						<thead>
							<tr>
								<th>FAQ編號</th>
								<th>問題</th>
								<th>回答</th>

							</tr>
							<%@ include file="page1.jsp"%>
							<c:forEach var="faqVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">
						</thead>




						<tr>
							<td>${faqVO.id}</td>
							<td>${faqVO.question}</td>
							<td>${faqVO.answer}</td>

							<td>
								<FORM METHOD="post" ACTION="faq.do">

									<input type="submit" value="修改"> <input type="hidden"
										name="id" value="${faqVO.id}"> <input type="hidden"
										name="action" value="getOne_For_Update">
								</FORM>
							</td>
							<td>
								<FORM METHOD="post" ACTION="faq.do">
									<input type="submit" value="刪除"> <input type="hidden"
										name="id" value="${faqVO.id}"> <input type="hidden"
										name="action" value="delete">
								</FORM>
						</tr>
						</c:forEach>
					</table>
					<%@ include file="page2.jsp"%>
				</div>
			</div>
		</div>
	</div>
	</div>
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
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
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
	<script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

	<!-- 註冊按鈕觸發功能  -->
	<script>
		
	</script>
</body>

</html>