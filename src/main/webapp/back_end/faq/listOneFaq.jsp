<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.faq.model.*"%>
<%@ page import="java.util.*"%>

<%
FaqVO faqVO = (FaqVO) request.getAttribute("faqVO");
%>

<html>
<head>
<title>FAQ資料</title>

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
<body bgcolor='white'>


	<table id="table-1">
		<tr>
			<td>
				<h3>FAQ資料</h3>
				<h4>
					<a href="back_FaqMain.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>FAQ編號</th>
			<th>問題</th>
			<th>回答</th>

		</tr>
		<tr>
			<td><%=faqVO.getId()%></td>
			<td><%=faqVO.getQuestion()%></td>
			<td><%=faqVO.getAnswer()%></td>

		</tr>
	</table>

</body>
</html>