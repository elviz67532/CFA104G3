<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
    List<ActivityAttendVO> list = actaSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<title>委域</title>
	
	<style>
  table {
	width: 100%;
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


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>參於會員編號</th>
		<th>參與活動編號</th>
		<th>評論內容</th>
		<th>活動內容備註</th>
		<th>付款狀態</th>
	
	</tr>
	<%@ include file="page1.jsp" %> 
	<c:forEach var="actaVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${actaVO.memberId}</td>
			<td>${actaVO.activityId}</td>
			<td>${actaVO.comment}</td>
			<td>${actaVO.note}</td>
			<td>${actaVO.status}</td>
	
 			<td>
 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="活動評分"> 
 			     <input type="hidden" name="memberId"  value="${actaVO.memberId}">
 			     <input type="hidden" name="activityId"  value="${actaVO.activityId}">
 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> 
			</td> 
 			<td> 
<%-- 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;"> --%>
			     <input type="submit" value="活動檢舉">
<%-- 			     <input type="hidden" name="memberId"  value="${actrVO.memberId}"> --%>
<%--  			     <input type="hidden" name="activityId"  value="${actrVO.activityId}"> --%>
<!-- 			     <input type="hidden" name="action" value="insert"></FORM> -->
			</td>
			<td> 
<%-- 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;"> --%>
			     <input type="submit" value="活動取消">
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.jsp" %>

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