<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<%
ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
List<ProductOrderVO> list = poSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�Ҧ��G��ӫ~�q����</title>

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
	width: 800px;
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
				<h3>�Ҧ��G��ӫ~�q��</h3>
				<h4>
					<a href="front_ProductOrderMain.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0"></a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�q��s��</th>
			<th>�ӫ~�s��</th>
			<th>�R�a�s��</th>
			<th>��a�s��</th>
			<th>����H�m�W</th>
			<th>����H�q��</th>
			<th>����H�a�}</th>
			<th>�q�榨�߮ɶ�</th>
			<th>�ӫ~�ƶq</th>
			<th>�q���`���B</th>
			<th>�q�檬�A</th>
		</tr>
		<c:forEach var="productOrderVO" items="${list}">
			<%@ include file="page1.file"%>


			<tr>
				<td>${productOrderVO.id}</td>
				<td>${productOrderVO.productId}</td>
				<td>${productOrderVO.customerMemberId}</td>
				<td>${productOrderVO.sellerMemberId}</td>
				<td>${productOrderVO.productName}</td>
				<td>${productOrderVO.phone}</td>
				<td>${productOrderVO.address}</td>
				<td>${productOrderVO.date}</td>
				<td>${productOrderVO.amountOfProduct}</td>
				<td>${productOrderVO.amountOfPrice}</td>
				<td>${productOrderVO.status}</td>
				<td>
					<FORM METHOD="post" ACTION="productorder.do">

						<input type="submit" value="�ק�"> <input type="hidden"
							name="empno" value="${ProductVO.id}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="submit" value="�R��"> <input type="hidden"
							name="empno" value="${ProductVO.id}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>