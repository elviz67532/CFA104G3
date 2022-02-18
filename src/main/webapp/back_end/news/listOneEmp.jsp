<%@page import="com.news.model.NewsVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.news.model.*"%>


<%
NewsVO newsVO = (NewsVO) request.getAttribute("newsVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneNews.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
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
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='gray'>


	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料 - ListOneNews.jsp</h3>				
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>最新消息編號</th>
			<th>內容</th>
			<th>圖片</th>
			<th>建立時間</th>
			<th>消息分類編號</th>
		</tr>
		<tr>
			<td>${newsVO.id}</td>
			<td>${newsVO.content}</td>
			<td>${newsVO.image}</td>
			<td>${newsVO.date}</td>
			<td>${newsVO.type}</td>
		</tr>
	</table>

</body>
</html>