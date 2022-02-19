<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
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

img {
	max-width: 100%;
}

body {
	margin: 0;
	color: black;
}

table#table-1 {
	text-align: center;
	width: 55%;
	height: 100px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

table {
	width: 300px;
	/* 	background-color: white; */
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
	white-space: nowrap;
}

th, td {
	padding: 1px;
	line-height: 35px;
}

h2 {
	margin: 0 auto;
}

main {
	position: absolute;
	top: 3.5%;
	/* 	left: 12.5%; */
	height: calc(100vh - 100px);
	width: calc(100% - 200px);
	margin-left: 200px;
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
<body bgcolor='white'>
	<table id="table-1">
		<tr>
			z
			<td>
				<h2>會員資料註冊</h2>
			</td>
			<td>
				<h4>
					<a href="/CFA104G3/index.jsp">> HomePage</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<br>
	<FORM METHOD="post"
		ACTION="${pageContext.request.contextPath}/front_end/member/MemberServlet.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>郵件:</td>
				<td><input placeholder="請輸入郵件" name="email" size="10"
					value="<%=(memberVO == null) ? "encored98931@yahoo.com.tw" : memberVO.getEmail()%>" /></td>
			</tr>

			<tr id=account>
				<td>帳號:</td>
				<td><input placeholder="請輸入帳號" name="account" maxlength="10"
					value="<%=(memberVO == null) ? "Encored989" : memberVO.getAccount()%>" /></td>
			</tr>
			<tr id=password>
				<td>密碼:</td>
				<td><input placeholder="請輸入密碼" name="password" maxlength="10"
					value="<%=(memberVO == null) ? "A123456" : memberVO.getPassword()%>" /></td>
			</tr>
			<tr id=nickname>
				<td>名字:</td>
				<td><input placeholder="請輸入暱稱" name="nickname" maxlength="10"
					value="<%=(memberVO == null) ? "小名" : memberVO.getNickname()%>" /></td>
			</tr>
			<tr id=name>
				<td>姓名:</td>
				<td><input placeholder="請輸入名字" name="name" maxlength="10"
					value="<%=(memberVO == null) ? "曾令名" : memberVO.getName()%>" /></td>
			</tr>
			<tr>
				<td>電話:</td>
				<td><input placeholder="請輸入電話" name="phone" maxlength="10"
					value="<%=(memberVO == null) ? "0930911283" : memberVO.getPhone()%>" /></td>
			</tr>

			<tr>
				<td>性別:</td>
				<td><lable> <input type="radio" name="gender" value="1"
						checked>男</lable> <lable> <input type="radio"
						name="gender" value="女">女</lable></td>
			</tr>
			<tr>
				<td>城市:</td>
				<td><input placeholder="請輸入居住城市" name="city" maxlength="10"
					value="<%=(memberVO == null) ? "桃園市" : memberVO.getCity()%>" /></td>
			</tr>
			<tr>
				<td>鄉鎮:</td>
				<td><input placeholder="請輸入居住鄉鎮" name="cityArea" maxlength="10"
					value="<%=(memberVO == null) ? "八德市" : memberVO.getCityArea()%>" /></td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input placeholder="請輸入地址" name="address" maxlength="10"
					value="<%=(memberVO == null) ? "廣福路394" : memberVO.getAddress()%>" /></td>
			</tr>
			<tr>
				<td>驗證碼:</td>
				<td><input placeholder="請輸入驗證碼" name="code" maxlength="10"
					value="<%=(memberVO == null) ? "331" : memberVO.getCode()%>" /></td>
			</tr>
			<tr>
				<td>圖片:</td>
				<td><input type="file" name="avatar" size="45"
					value="<%=(memberVO == null) ? "" : memberVO.getAvatar()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="register"><input
			type="submit" value="送出新增">
	</FORM>
	</main>
</body>


<!-- Footer-->
<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>