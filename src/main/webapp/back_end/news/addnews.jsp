<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.news.model.*"%>

<%
NewsVO vo = (NewsVO) request.getAttribute("vo");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addEmp.jsp</title>

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
<body bgcolor='gray'>

	<table id="table-1">
		<tr>
			<td>
				<h3>最新消息新增 - addnews.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="selectnews_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back_end/news/NewsServlet" name="form1"enctype="multipart/form-data">
		<table>
			<!-- 	<tr> -->
			<!-- 		<td>最新消息編號:</td> -->
			<!-- 		<td><input type="TEXT" name="sal" size="45" -->
			<%-- 			 value="<%= (vo==null)? "" : vo.getId()%>" /></td> --%>
			<!-- 	</tr> -->
			<tr>
				<td>消息分類編號:</td>
				<td><input type="TEXT" name="type" size="15"
					value="<%=(vo == null) ? "" : vo.getType()%>" /></td>
			</tr>
			<tr>
				<td>標題:</td>
				<td><input type="TEXT" name="title" size="45"
					value="<%=(vo == null) ? "" : vo.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>內容:</td>
				<td><input type="TEXT" name="content" size="45"
					value="<%=(vo == null) ? "" : vo.getContent()%>" /></td>
			</tr>
			<tr>
				<td>圖片:</td>
				<td><input type="file" name="image" size="45"
					value="<%=(vo == null) ? "" : vo.getImage()%>" /></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>建立時間:</td> -->
<!-- 				<td><input name="date" type="TEXT"></td> -->
<!-- 			</tr> -->
			<jsp:useBean id="newsSvc" scope="page"
				class="com.news.model.NewsServiceImpl" />


		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>

</body>

</html>