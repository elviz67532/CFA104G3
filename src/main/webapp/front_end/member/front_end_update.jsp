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

//<!--錯誤訊息 -->
Map<String, String> errorMsgs = (Map<String, String>) request.getAttribute("errorMsgs");
if (errorMsgs != null) {
	if (errorMsgs.get("email") != null)
		request.setAttribute("email", errorMsgs.get("email"));
	if (errorMsgs.get("password") != null)
		request.setAttribute("password", errorMsgs.get("password"));
	if (errorMsgs.get("nickname") != null)
		request.setAttribute("nickname", errorMsgs.get("nickname"));
	if (errorMsgs.get("name") != null)
		request.setAttribute("name", errorMsgs.get("name"));
	if (errorMsgs.get("phone") != null)
		request.setAttribute("phone", errorMsgs.get("phone"));
	if (errorMsgs.get("city") != null)
		request.setAttribute("city", errorMsgs.get("city"));
	if (errorMsgs.get("cityArea") != null)
		request.setAttribute("cityArea", errorMsgs.get("cityArea"));
	if (errorMsgs.get("address") != null)
		request.setAttribute("address", errorMsgs.get("address"));
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
<link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
</head>

<body style="background-image: url('<%=request.getContextPath()%>/asset/img/bnet-bg.jpg')">
	
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>
<style>
.classH4{
color: white;
font-size: 32px;
font-family: "Core Sans N W01 35 Light";
font-weight: normal;
}
.inputholder{
	opacity: 0.6;
	transition: transform .3s;
	height: 34px;
	border: 1px groove black;
	background-color: lightgray;
width:100%;
padding: 0 10px;
margin-top: 3px;
margin-bottom: 10px;
font-size: 15px;
line-height: 20px;
border: 1px solid rgba(255, 255, 255, 0.3)
}
input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="tel"]:focus{
	background-color: white;
	border: 1px  groove lightgray;
	opacity: 0.8; 
	-webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  -webkit-transition: background-position 0.2s, background-color 0.2s, border-color 0.2s, box-shadow 0.2s;
  transition: background-position 0.2s, background-color 0.2s, border-color 0.2s, box-shadow 0.2s;   
}
.submitBtn{
	width: 100%; 
	border: none;
	height: 34px;
	background-image: linear-gradient(to right, #003E3E, #005757,#003E3E);
    box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
	color: white;
}
.submitBtn:hover{
	border: 1px solid rgba(255, 255, 255, 0.3);
	 transition: background-position 0.2s, background-color 0.2s, border-color 0.2s, box-shadow 0.2s; 
}
</style>
	
		<div style=" padding: 40px; margin: 100px auto ; width:40%; background-color: rgba(,255,204,0.2);">
			<div style="float: left;">
				<h4 class="classH4" >會員資料修改</h4>
			</div>
		<FORM METHOD="post" enctype="multipart/form-data"ACTION="<%=request.getContextPath()%>/front_end/member/MemberServlet.do"name="form1">
		        	<br>
					<br>
				<div style="color:white;">
				<tr>
					<td>會員編號:<font color=red><b>*</b></font></td>
					<td><%=tempMemberVO.getId()%></td>
				</tr>
				<br>
				<br>
					<c:if test="${not empty email}">
					 您的email: <span style="color: red"> "${email}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入郵件" type="email" name="email" size="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getEmail()%>" />
					<br>

					<c:if test="${not empty password}">
						您的密碼: <span style="color: red"> "${password}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入密碼" type="password" name="password" maxlength="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getPassword()%>" />
					<br>

					<c:if test="${not empty nickname}">
						您的暱稱: <span style="color: red"> "${nickname}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入暱稱" type="text" name="nickname" maxlength="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getNickname()%>" />
					<br>
					<c:if test="${not empty name}">
						<span style="color: red"> "${name}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入名字" type="text" name="name" maxlength="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getName()%>" />
					<br>
					<c:if test="${not empty phone}">
						<span style="color: red"> "${phone}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入電話" type="tel" name="phone" maxlength="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getPhone()%>" />
					<br>
					<c:if test="${not empty city}">
						<span style="color: red"> "${city}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入居住城市" type="text" name="city" maxlength="10"value="${memberVO.city}" />
					<br>
					<c:if test="${not empty cityArea}">
						<span style="color: red"> "${cityArea}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入居住鄉鎮" type="text" name="cityArea" maxlength="10"value="${memberVO.cityArea}" />
					<br>
					<c:if test="${not empty address}">
						<span style="color: red"> "${address}" </span>
					</c:if>
						<input class="inputholder" placeholder="請輸入地址" type="text" name="address" maxlength="10"value="${memberVO.address}" />
					<br>
						<input class="inputholder" placeholder="請上傳圖片" type="file" name="avatar" maxlength="10"value="<%=(tempMemberVO == null) ? "" : tempMemberVO.getAvatar()%>" />
				    <br>
		
					<br> 
				</div>	
			<input type="hidden" name="action"value="front_end_member_update"> 
			<input type="hidden"name="account" value="<%=tempMemberVO.getAccount()%>">
			<input type="hidden" name="id" value="<%=tempMemberVO.getId()%>"> 
			<input type="hidden" name="account" value="${tempMemberVO.account}"> 
			<input class="submitBtn" type="submit" value="更新會員資料" >
		</FORM>
	</div>

    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
	
</body>
</html>