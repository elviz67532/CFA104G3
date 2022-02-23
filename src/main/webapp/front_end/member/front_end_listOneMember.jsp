<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>


<%
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html lang="en">

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
<style>
* {
	box-sizing: border-box;
	font-family: monospace;
	line-height: 150%;
}

table#table-2 {
	font-size: 10 vmin;
	margin: 0 auto;
	white-space: nowrap;
}

h2 {
	margin-top: 40px;
}

table {
	width: 400px;
	margin-top: 5px;
	margin-bottom: 5px;
	color: black;
}

td {
	padding: 7px;
	font-weight: bold;
	/* 	text-align: center; */
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


	<h1 href="/CFA104G3/index.jsp" align="center" valign="center" >
		<a href="/CFA104G3/index.jsp"> 首頁</a>
	</h1>

	<main>
	<div >
		<table id="table-2">
			<h2 align="center" valign="center">會員資料</h2>

			<tr>
				<td>郵件</td>
				<td>${memberVO.email}</td>
			</tr>
			<tr>
				<td>密碼</td>
				<td>${memberVO.password}</td>
			</tr>
			<tr>
				<td>暱稱</td>
				<td>${memberVO.nickname}</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td>${memberVO.name}</td>
			</tr>
			<tr>
				<td>電話</td>
				<td>${memberVO.phone}</td>
			<tr>
				<td>居住城市</td>
				<td>${memberVO.city}</td>
			</tr>
			</tr>
			<tr>
				<td>居住鄉鎮</td>
				<td>${memberVO.cityArea}</td>
			</tr>
			<tr>
				<td>地址</td>
				<td>${memberVO.address}</td>
			</tr>
			<tr>
				<td>頭像</td>
				<td><img src="<%=request.getContextPath()%>/front_end/member/MemberServlet.do?action=getImage&MEM_ID=${memberVO.id}" ></td>
			</tr>


			<td style="width: 100px;" >
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member/front_end_update.jsp" style="margin-bottom: 0px;" >
					<input type="submit" value="修改會員資料">
					<input type="hidden"name="id" value="${memberVO.id}">
					<input type="hidden"name="action" value="getOne_For_Member_Update">
                </FORM>
			</td>
	
			</table>
		</div>
	</main>
	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>

</body>
</html>