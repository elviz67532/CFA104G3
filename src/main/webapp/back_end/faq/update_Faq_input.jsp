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
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>FAQ修改</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>FAQ資料修改</h3>
				<h4>
					<a href="back_FaqMain.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>FAQ修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="faq" name="form1">
		<table>
			<tr>
				<td>FAQ編號:<font color=red><b>*</b></font></td>
				<td><%=faqVO.getId()%></td>
			</tr>

			<tr>
				<td>問題:</td>
				<td><input type="TEXT" name="question" size="45"
					value="<%=faqVO.getQuestion()%>" /></td>
			</tr>
			<tr>
				<td>回答:</td>
				<td><input type="TEXT" name="answer" size="45"
					value="<%=faqVO.getAnswer()%>" /></td>
			</tr>
			<jsp:useBean id="faqSvc" scope="page"
				class="com.faq.model.FaqServiceImpl" />
		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="id" value="<%=faqVO.getId()%>"> <input
			type="submit" value="送出修改">
	</FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->


</html>