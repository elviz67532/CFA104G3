<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<!-- ProductOrderServlet.java (Concroller) 存入req的eVO物件 (包括幫忙取出的eVO, 也包括輸入資料錯誤時的eVO物件) -->
<%
ProductOrderVO vo = (ProductOrderVO) request.getAttribute("vo");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>前台商品訂單修改</title>

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
				<h3>前台訂單資料修改</h3>
				<h4>
					<a href="front_ProductOrder_Retrieve.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>訂單修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="productorder.do">
		<table>
			<tr>
				<td>員工編號:<font color=red><b>*</b></font></td>
				<td><%=vo.getProductName()%></td>
			</tr>
			<tr>
				<td>員工姓名:</td>
				<td><input type="TEXT" name="ename" size="45"
					value="<%=vo.getPhone()%>" /></td>
			</tr>
			<tr>
				<td>職位:</td>
				<td><input type="TEXT" name="job" size="45"
					value="<%=vo.getAddress()%>" /></td>
			</tr>


			<jsp:useBean id="poSvc" scope="page"
				class="com.product_order.model.ProductOrderServiceImpl" />


		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="id" value="<%=vo.getId()%>"> <input
			type="submit" value="送出修改">
	</FORM>
</body>

</html>