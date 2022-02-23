<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
MemberVO tempMemberVO = (MemberVO) request.getAttribute("tempMemberVO");
if (tempMemberVO == null && memberVO != null) {
	tempMemberVO = new MemberVO();
	tempMemberVO.setId(memberVO.getId());
	tempMemberVO.setEmail(memberVO.getEmail());
	tempMemberVO.setAccount(memberVO.getAccount());
	tempMemberVO.setPassword(memberVO.getPassword());
	tempMemberVO.setNickname(memberVO.getNickname());
	tempMemberVO.setName(memberVO.getName());
	tempMemberVO.setPhone(memberVO.getPhone());
	tempMemberVO.setGender(memberVO.getGender());
	tempMemberVO.setCity(memberVO.getCity());
	tempMemberVO.setCityArea(memberVO.getCityArea());
	tempMemberVO.setAddress(memberVO.getAddress());
	tempMemberVO.setCode(memberVO.getCode());
	tempMemberVO.setAvatar(memberVO.getAvatar());
	tempMemberVO.setRegisterDate(memberVO.getRegisterDate());
	tempMemberVO.setStatus(memberVO.getStatus());
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

	<main>


				<div style="text-align: center;">
						<h1>會員資料修改</h1>
				</div>
			
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
     <div style="text-align: center;" >
		<FORM METHOD="post" enctype="multipart/form-data"ACTION="<%=request.getContextPath()%>/front_end/member/MemberServlet.do"name="form1">
			<table id="table-2">
				<tr>
					<td>會員編號:<font color=red><b>*</b></font></td>
					<td><%=tempMemberVO.getId()%></td>
				</tr>


				<tr>
					<td>EMAIL:</td>
					<td>
					<input placeholder="請輸入EMAIL" name="email" maxlength="45"autocomplete="off"value="<%=(tempMemberVO == null) ? "aaa" : tempMemberVO.getEmail()%>" />
					</td>
				</tr>

				<tr>
					<td>密碼:</td>
					<td>
					<input type="TEXT" name="password" maxlength="10"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getPassword()%>" />
					</td>
				</tr>

				<tr>
					<td>暱稱:</td>
					<td>
					<input type="TEXT" name="nickname" maxlength="10"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getNickname()%>" />
					</td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td>
					<input type="TEXT" name="name" maxlength="10"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getName()%>" />
					</td>
				</tr>
				<tr>
					<td>電話:</td>
					<td>
					<input placeholder="請輸入電話" name="phone" maxlength="10"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getPhone()%>" />
					</td>
				</tr>
				<tr>
					<td>居住城市:</td>
					<td>
					<input placeholder="請輸入居住城市" name="city" size="30"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getCity()%>" />
					</td>
				</tr>
				<tr>
					<td>居住鄉鎮:</td>
					<td>
					<input placeholder="請輸入居住鄉鎮" name="cityArea" size="30"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getCityArea()%>" />
					</td>
				</tr>
				<tr>
					<td>地址:</td>
					<td>
					<input placeholder="請輸入地址" name="address" size="30"autocomplete="off"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getAddress()%>" />
					</td>
				</tr>
				<tr>
					<td>圖片:</td>
					<td>
					<input type="file" name="avatar" size="45"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getAvatar()%>" />
					</td>
				</tr>
		</table>
			<br> 
			<input type="hidden" name="action"value="front_end_member_update"> 
			<input type="hidden"name="account" value="<%=tempMemberVO.getAccount()%>">
			<input type="hidden" name="id" value="<%=tempMemberVO.getId()%>"> 
			<input type="hidden" name="account" value="${tempMemberVO.account}"> 
			<input type="submit" value="送出" >
		</FORM>
	</div>
	</main>
	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
	

</body>

</html>