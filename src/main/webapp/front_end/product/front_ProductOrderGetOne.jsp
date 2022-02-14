<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>

<%
ProductOrderVO productOrderVO = (ProductOrderVO) request.getAttribute("productOrderVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�G��ӫ~�q��d�ߵ��G</title>

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

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�q����</h3>
				<h4>
					<a href="productOrderMain.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

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
			<td>${productOrderVO.status}</td>
			<td>${productOrderVO.amountOfPrice}</td>
		</tr>
	</table>

</body>
</html>