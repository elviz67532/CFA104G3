<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title></title>
<meta http-equiv="refresh" content="3; url=login.jsp">
<style>
* {
	box-sizing: border-box;
	font-family: monospace;
	line-height: 150%;
	text-align: center;
	font-size: 50px;
	background: #2c3338;
	color: white;
	background: url(<%=request.getContextPath()%>/front-end/pic/bricks.jpg);
}

a {
	font-size: 10px;
	color: white;
}

</style>
</head>
<body>
	<h1 style= color:black;>帳號未驗證</h1>
	<div>
		<a href="login.jsp" style = "color : black;">本頁面將自動跳轉至登入頁面，若不想等待請點擊此處</a>
	</div>
</body>
</html>