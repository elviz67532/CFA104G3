<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
//<!--錯誤訊息 -->
Map<String, String> errorMsgs = (Map<String, String>) request.getAttribute("errorMsgs");
if (errorMsgs != null) {
	if (errorMsgs.get("email") != null)
		request.setAttribute("email", errorMsgs.get("email"));
	if (errorMsgs.get("account") != null)
		request.setAttribute("account", errorMsgs.get("account"));
	if (errorMsgs.get("password") != null)
		request.setAttribute("password", errorMsgs.get("password"));
	if (errorMsgs.get("nickname") != null)
		request.setAttribute("nickname", errorMsgs.get("nickname"));
	if (errorMsgs.get("name") != null)
		request.setAttribute("name", errorMsgs.get("name"));
	if (errorMsgs.get("phone") != null)
		request.setAttribute("phone", errorMsgs.get("phone"));
	if (errorMsgs.get("gender") != null)
		request.setAttribute("gender", errorMsgs.get("gender"));
}
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
	text-align: center; 
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
 	text-align: center; 
}
tr {
	padding: 7px;
	font-weight: bold;
 	text-align: center; 
}
</style>
</head>

<div style="text-align: center;">
	<body>
		<!-- Navigation-->
		<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

		<!-- nav -->

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
		<div style="text-align: center;" >
			<body bgcolor='white'>
				<table id="table-1">
					<tr>

						<td>
							<h1>會員資料註冊</h1>
						</td>
					</tr>
				</table>
		

		<%-- 錯誤表列 --%>
		<%-- 		<c:if test="${not empty errorMsgs}"> --%>
		<!-- 			<font style="color: red">請修正以下錯誤:</font> -->
		<!-- 			<ul> -->
		<%-- 				<c:forEach var="message" items="${errorMsgs}"> --%>
		<%-- 					<li style="color: red">${message}</li> --%>
		<%-- 				</c:forEach> --%>
		<!-- 			</ul> -->
		<%-- 		</c:if> --%>
		<br>
		<FORM METHOD="post"
			ACTION="${pageContext.request.contextPath}/front_end/member/MemberServlet.do"
			name="form1" enctype="multipart/form-data">
			<table>
				<tr>
					<td>郵件:</td>
					<td><input placeholder="請輸入郵件" name="email" size="10"value="<%=(memberVO == null) ? "" : memberVO.getEmail()%>" /></td>
				</tr>
				 <c:if test="${not empty email}">
					<span style="color: red"> "${email}" </span>
				</c:if>

				<tr >
					<td>帳號:</td>
					<td><input placeholder="請輸入帳號" name="account" maxlength="10"value="<%=(memberVO == null) ? "" : memberVO.getAccount()%>" /></td>
				</tr>
				 <c:if test="${not empty account}">
					<span style="color: red"> "${account}" </span>
				</c:if>

				<tr >
					<td>密碼:</td>
					<td><input placeholder="請輸入密碼" name="password" maxlength="10"value="<%=(memberVO == null) ? "" : memberVO.getPassword()%>" /></td>
				</tr>
				 <c:if test="${not empty password}">
					<span style="color: red"> "${password}" </span>
				</c:if>

				<tr >
					<td>暱稱:</td>
					<td><input placeholder="請輸入暱稱" name="nickname" maxlength="10"value="<%=(memberVO == null) ? "" : memberVO.getNickname()%>" /></td>
				</tr>
                   <c:if test="${not empty nickname}">
					<span style="color: red"> "${nickname}" </span>
				</c:if>
				<tr >
					<td>姓名:</td>
					<td><input placeholder="請輸入名字" name="name" maxlength="10"value="<%=(memberVO == null) ? "" : memberVO.getName()%>" /></td>
				</tr>
				 <c:if test="${not empty name}">
					<span style="color: red"> "${name}" </span>
				</c:if>
				<tr>
					<td>電話:</td>
					<td><input placeholder="請輸入電話" name="phone" maxlength="10"value="<%=(memberVO == null) ? "" : memberVO.getPhone()%>" /></td>
				</tr>
				 <c:if test="${not empty phone}">
					<span style="color: red"> "${phone}" </span>
				</c:if>
				<tr>
					<td>性別:</td>
					<td>
					<input type="radio" name="gender"value="0" checked>不透漏</lable> 
					<input type="radio" name="gender" value="1" checked>男</lable>
					<input type="radio" name="gender" value="2" checked>女</lable>
					</td>
				</tr>
				 <c:if test="${not empty gender}">
					<span style="color: red"> "${gender}" </span>
				</c:if>

				<!-- 				<tr> -->
				<!-- 					<td>城市:</td> -->
				<!-- 					<td><input placeholder="請輸入居住城市" name="city" maxlength="10" -->
				<%-- 						value="<%=(memberVO == null) ? "桃園市" : memberVO.getCity()%>" /></td> --%>
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<td>鄉鎮:</td> -->
				<!-- 					<td><input placeholder="請輸入居住鄉鎮" name="cityArea" -->
				<!-- 						maxlength="10" -->
				<%-- 						value="<%=(memberVO == null) ? "八德市" : memberVO.getCityArea()%>" /></td> --%>
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<td>地址:</td> -->
				<!-- 					<td><input placeholder="請輸入地址" name="address" maxlength="10" -->
				<%-- 						value="<%=(membervo == null) ? "廣福路394" : membervo.getaddress()%>" /></td> --%>
				<!-- 				</tr> -->

				<!-- 				<tr> -->
				<!-- 					<td>圖片:</td> -->
				<!-- 					<td><input type="file" accept="image/*" name="avatar" -->
				<!-- 						size="45" -->
				<%-- 						value="<%=(memberVO == null) ? "" : memberVO.getAvatar()%>" /></td> --%>
				<!-- 				</tr> -->
			</table>
			<br> <input type="hidden" name="action" value="register"><input type="submit" value="送出新增">
		</FORM>
		</main>
	</body>
</div>

	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
	</body>
</html>