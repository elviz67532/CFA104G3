
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=request.getContextPath()%>/vendors/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>委域</title>
</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	%>
	
	<h4>
		<a href="select_page.jsp"><img src="images/tomcat.png" width="100"
			height="100" border="0">回首頁</a>
	</h4>
	
	<FORM METHOD="post" ACTION="member.do" name="form1">
		<table>
			<tr>
				<td>問與答編號:</td>
				<td><input type="TEXT" name="id" size="45" value="${param.id}" /></td>
				<td>${errorMsgs.id}</td>
			</tr>
			<tr>
				<td>郵件:</td>
				<td><input type="TEXT" name="email" size="45"
					value="${param.email}" /></td>
				<td>${errorMsgs.email}</td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input name="account" id="f_date1" type="text" /></td>
				<td>${errorMsgs.account}</td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input name="password" id="f_date1" type="text" /></td>
				<td>${errorMsgs.password}</td>
			</tr>
			<tr>
				<td>暱稱:</td>
				<td><input name="nickname" id="f_date1" type="text" /></td>
				<td>${errorMsgs.nickname}</td>
			</tr>
			<tr>
				<td>名字:</td>
				<td><input name="name" id="f_date1" type="text" /></td>
				<td>${errorMsgs.name}</td>
			</tr>
			<tr>
				<td>電話:</td>
				<td><input name="phone" id="f_date1" type="text" /></td>
				<td>${errorMsgs.phone}</td>
			</tr>
			<tr>
				<td>性別:</td>
				<td><input name="gender" id="f_date1" type="text" /></td>
				<td>${errorMsgs.gender}</td>
			</tr>
			<tr>
				<td>城市:</td>
				<td><input name="city" id="f_date1" type="text" /></td>
				<td>${errorMsgs.city}</td>
			</tr>
			<tr>
				<td>鄉鎮:</td>
				<td><input name="cityArea" id="f_date1" type="text" /></td>
				<td>${errorMsgs.cityArea}</td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input name="address" id="f_date1" type="text" /></td>
				<td>${errorMsgs.address}</td>
			</tr>
			<tr>
				<td>郵遞區號:</td>
				<td><input name="code" id="f_date1" type="text" /></td>
				<td>${errorMsgs.code}</td>
			</tr>
			<tr>
				<td>頭像:</td>
				<td><input name="avatar" id="f_date1" type="text" /></td>
				<td>${errorMsgs.avatar}</td>
			</tr>
			<tr>
				<td>註冊時間:</td>
				<td><input name="account" id="f_date1" type="text" /></td>
				<td>${errorMsgs.account}</td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input name="registerDate" id="f_date1" type="text" /></td>
				<td>${errorMsgs.registerDate}</td>
			</tr>
			<tr>
				<td>權限:</td>
				<td><input name="status" id="f_date1" type="text" /></td>
				<td>${errorMsgs.status}</td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<script
		src="<%=request.getContextPath()%>/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

