<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>

<%
	ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");
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

					<!-- end of main -->


	<h3>活動報名資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" name="form1">
		<table>
			<tr>
				<td>參與會員編號:</td>
				<td><input type="TEXT" name="memberId" size="45"
					value="<%=(actaVO == null) ? "7" : actaVO.getMemberId()%>" /></td>
			</tr>
			<tr>
				<td>參與活動編號:</td>
				<td><input type="TEXT" name="activityId" size="45"
					value="<%=(actaVO == null) ? "1005" : actaVO.getActivityId()%>" /></td>
			</tr>
			<tr>
				<td>評論內容:</td>
				<td><input type="TEXT" name="comment" size="45"
					value="<%=(actaVO == null)?"不好玩":actaVO.getComment() %>" /></td>
			</tr>
			<tr>
				<td>活動內容備註:</td>
				<td><input type="TEXT" name="note" size="45"
					value="<%=(actaVO== null)?"佛教徒" : actaVO.getNote()%>" /></td>
			</tr>
			<tr>
<!-- 				<td>付款狀態:</td> -->
<!-- 				<td><input type="TEXT" name="status" size="45" -->
<%-- 					value="<%=(actaVO == null) ? "1" : actaVO.getStatus()%>" /></td> --%>				
<!-- 				<select name="status"> -->
<%--    					<option value="<%=(actaVO == null) ? "0" : actaVO.getStatus()%>">未付款</option> --%>
<%--    					<option value="<%=(actaVO == null) ? "1" : actaVO.getStatus()%>">已付款</option> --%>
<!-- 				</select>	 -->
<!-- 			</tr> -->

			<tr>
<!-- 		<td>付款狀態:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="status"> -->
<!-- 				<option value="-1">請選擇付款狀態</option> -->
<!-- 				<option value="0" >未付款</option> -->
<!--    				<option value="1">已付款</option> -->
					
<!-- 		</select></td> -->
		</tr>
			
			
			
		</table>
		<br> 
		<input type="hidden" name="action" value="insert">
		 <input	type="submit" value="送出新增">
	</FORM>
 
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