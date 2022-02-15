<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>會員資料修改</title>

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
	width: 450px;
	margin-top: 5px;
	margin-bottom: 1px;
}

table, th, td {
	white-space: nowrap;
}

th, td {
	padding: 1px;
	line-height: 35px;
}

h2 {
	margin: 0 auto;
}

table {
	width: 450px;
	margin-top: 1px;
	margin-bottom: 1px;
}

th, td {
	padding: 1px;
}
</style>

</head>
<center>

	<body>
		<main>
			<table id="table-1">
				<tr>
					<td>
						<h3>會員資料修改</h3>
						<h4>
							<a href="front_end_listOneMember.jsp"> 回會員中心</a>
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

			<FORM METHOD="post"
				enctype ="multipart/form-data"
				ACTION="<%=request.getContextPath()%>/front_end/member/MemberServlet.do"
				name="form1">
				<table>
					<tr>
						<td>會員編號:<font color=red><b>*</b></font></td>
						<td><%=memberVO.getId()%></td>
					</tr>
					
					
					<tr>
						<td>EMAIL:</td>
						<td><input placeholder="請輸入EMAIL" name="email" maxlength="45"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getEmail()%>" /></td>
					</tr>

					<tr>
						<td>密碼:</td>
						<td><input type="TEXT" name="password" maxlength="10"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getPassword()%>" /></td>
					</tr>

					<tr>
						<td>暱稱:</td>
						<td><input type="TEXT" name="nickname" maxlength="10"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getNickname()%>" /></td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td><input type="TEXT" name="name" maxlength="10"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getName()%>" /></td>
					</tr>
					<tr>
						<td>電話:</td>
						<td><input placeholder="請輸入電話" name="phone" maxlength="10"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getPhone()%>" /></td>
					</tr>



					<tr>
						<td>居住城市:</td>
						<td><input placeholder="請輸入居住城市" name="city" size="30"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getCity()%>" /></td>
					</tr>
					<tr>
						<td>居住鄉鎮:</td>
						<td><input placeholder="請輸入居住鄉鎮" name="cityArea" size="30"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getCityArea()%>" /></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input placeholder="請輸入地址" name="address" size="30"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getAddress()%>" /></td>
					</tr>
					<tr>
						<td>圖片:</td>
						<td><input type="file" name="avatar" size="45"
							value="<%=(memberVO == null) ? "" : memberVO.getAvatar()%>" /></td>
					</tr>






				</table>
				<br> <input type="hidden" name="action"
					value="front_end_member_update"> 
					<input type="hidden" name="account" value="<%=memberVO.getAccount()%>">
					<input type="hidden" name="id" value="<%=memberVO.getId()%>"> <input
					type="hidden" name="account" value="${memberVO.account}"> <input
					type="submit" value="送出">
			</FORM>
			<br> <br>
		</main>
	</body>
</html>