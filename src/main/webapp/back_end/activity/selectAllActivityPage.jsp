<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>

<%
	ActivityServiceImpl actSvc = new ActivityServiceImpl();
	List<ActivityVO> list = actSvc.getAllAct();
	pageContext.setAttribute("list",list);
%>

<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/activity/backNewFile.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<title>委域活動管理頁面selectAllActivityPage.jsp</title>
<style>
form{
	display: inline;
	border-radius: 16px;
}
form:hover{
	cursor: pointer;
	border-radius: 16px;
	margin-bottom: 0px;
}
table th {
	color: black;
	padding: 5px 10px;
	text-align:center;
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
					<h1>委域活動管理頁面</h1>
			<table class="table table-striped table-hover">	
				<tr>
					<th class="text-nowrap">活動編號</th>
					<th class="text-nowrap">會員編號</th>
					<th class="text-nowrap">活動建立時間</th>
					<th class="text-nowrap">種類</th>
					<th class="text-nowrap">名稱</th>
					<th class="text-nowrap">目前報名人數</th>
					<th class="text-nowrap">活動人數</th>
					<th class="text-nowrap">活動費用</th>
					<th class="text-nowrap">活動地點</th>
					<th class="text-nowrap">報名時間</th>
					<th class="text-nowrap">活動時間</th>
<!-- 					<th>活動內容</th> -->
					<th class="text-nowrap">活動狀態</th>
					<th class="text-nowrap">按鈕</th>
				</tr>
				<c:forEach var="actVO" items="${list}" >
				<tr> 
					<td>${actVO.activityId}</td>
					<td>${actVO.organizerMemberId}</td>			
					<td>${actVO.launchedDate}</td>
					<td>${actVO.type}</td>
					<td>${actVO.name}</td>
					<td></td>
<%-- 					<td>${actVO.applyMemberExisting}</td> --%>
					<td>${actVO.minMember} ~ ${actVO.maxMember}</td>
					<td>${actVO.cost}</td>
					<td>${actVO.location}</td>
					<td>${actVO.applyStartDate} ~ ${actVO.applyEndDate}</td> 
					<td>${actVO.startDate} ~ ${actVO.endDate}</td>
<%-- 					<td >${actVO.content}</td> --%>
					<td>${actVO.status}</td>
			<td>
			    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
				       <input type="hidden" name="action" value="normalBack"/> 
				       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" value="恢復活動"/>
			    </FORM>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
				       <input type="hidden" name="action" value="cancelBack"/> 
		  	      	   <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" value="取消活動"/>
		        </FORM>
			    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
				       <input type="hidden" name="action" value="removeBack"/> 
				       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" value="下架活動"/>
			    </FORM>
				<FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
				     <input type="hidden" name="activityId"  value="${actVO.activityId}">
				     <input type="hidden" name="action" value="deleteBack">
				     <input disabled type="submit" value="刪除活動">
				</FORM>
			</td>
				</tr>
				</c:forEach>
			</table>
					<!-- end of main -->
					
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