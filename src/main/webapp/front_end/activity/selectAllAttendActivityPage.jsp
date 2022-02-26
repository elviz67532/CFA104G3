<%@page import="com.activity_attend.model.ActivityAttendVO"%>
<%@page import="com.activity_attend.model.ActivityAttendServiceImpl"%>
<%@page import="com.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>

<%
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
if (memberVO == null) {
	response.sendRedirect(request.getContextPath() + "/front_end/member/login.jsp");
	return;
}
int memberId = memberVO.getId();

ActivityServiceImpl actSvc = new ActivityServiceImpl();
List<ActivityVO> aList = actSvc.getAllAct();
ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
List<ActivityAttendVO> tList = actaSvc.selectByMemberId(memberId);

pageContext.setAttribute("aList", aList);
pageContext.setAttribute("tList", tList);
%>

<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>委域</title>
<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css"
	rel="stylesheet" />
<title>我參與的活動</title>
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
<body>
	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>New Life</h1>
						<span class="subheading">迎 接 全 新 的 人 生</span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- main -->
	<h1>我參與的活動</h1>
	<table class="table table-striped table-hover">
		<tr>
			<th class="text-nowrap">種類</th>
			<th class="text-nowrap">名稱</th>
			<th class="text-nowrap">目前報名人數</th>
			<th class="text-nowrap">活動費用</th>
			<th class="text-nowrap">活動地點</th>
			<th class="text-nowrap">活動時間</th>
			<th class="text-nowrap">活動狀態</th>
		</tr>
		<c:forEach var="tVO" items="${tList}">
			<c:forEach var="actVO" items="${aList}">
				<c:if test="${tVO.activityId==actVO.activityId}">
					<tr>
						<td align='center' valign="middle">${(actVO.type=="0")? "其他":""}${(actVO.type=="1")? "活動":""}
							${(actVO.type=="2")? "聚餐":""} ${(actVO.type=="3")? "講座":""}</td>
						<td align='center' valign="middle">${actVO.name}</td>
						<td align='center' valign="middle">${actVO.applyMemberExisting}</td>
						<td align='center' valign="middle">${actVO.cost}</td>
						<td align='center' valign="middle">${actVO.location}</td>
						<td align='center' valign="middle">${actVO.startDate}~${actVO.endDate}</td>
						<td align='center' valign="middle">${(actVO.status=="0")? "正常":""}${(actVO.status=="1")? "取消":""}
							${(actVO.status=="2")? "下架":""}</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:forEach>
	</table>
	<!-- end of main -->

	</div>
	</div>
	<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
	</div>
	</div>

	<!-- Scroll to Top Button-->

	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>