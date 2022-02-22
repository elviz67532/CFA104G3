<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_report.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
ActivityReportServiceImpl actrSvc = new ActivityReportServiceImpl();
List<ActivityReportVO> list = actrSvc.getAll();
pageContext.setAttribute("list", list);
%>


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
<title>委域活動檢舉管理頁面listAllActr.jsp</title>
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

					<!-- main -->
					<h1>委域活動檢舉管理頁面</h1>
					<table class="table table-striped table-hover">
						<table class="table table-striped table-hover">
							<tr>
								<th class="text-nowrap">檢舉單編號</th>
								<th class="text-nowrap">檢舉活動編號</th>
								<th class="text-nowrap">檢舉會員編號</th>
								<th class="text-nowrap">檢舉內容</th>
								<th class="text-nowrap">審核結果</th>
								<th class="text-nowrap">檢舉圖片</th>
								<th class="text-nowrap">活動狀態</th>
							</tr>
							<c:forEach var="actrVO" items="${list}">
								<tr>
									<td>${actrVO.id}</td>
									<td>${actrVO.activityId}</td>
									<td>${actrVO.memberId}</td>
									<td>${actrVO.content}</td>
									<td>${(actrVO.status=="0")? "尚未審核完畢":""}
										${(actrVO.status=="1")? "活動未違規":""} ${(actrVO.status=="2")? "活動違規":""}
									</td>
									<td><img
										src="<%=request.getContextPath()%>/activity/ActrImage.do?ACTC_ID=${actrVO.id}"
										alt="" width=150px
										class="img-fluid d-none d-md-block rounded mb-2 s"></td>
									<td>
										 <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;">
											<input type="submit" value="活動違規" />
											<input type="hidden" name="id" value="${actrVO.id}">
											<input type="hidden" name="action" value="normalReport" /> 
											
										</FORM>
										 <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;">
											<input type="submit" value="活動未違規" />
											<input type="hidden" name="id" value="${actrVO.id}">
											<input type="hidden" name="action" value="cancelReport" /> 
											
											
										</FORM>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	 <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>