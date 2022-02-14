<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>

<%
ProductOrderVO productOrderVO = (ProductOrderVO) request.getAttribute("productOrderVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>二手商品訂單查詢結果</title>

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

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>訂單資料</h3>
				<h4>
					<a href="productOrderMain.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>訂單編號</th>
			<th>商品編號</th>
			<th>買家編號</th>
			<th>賣家編號</th>
			<th>收件人姓名</th>
			<th>收件人電話</th>
			<th>收件人地址</th>
			<th>訂單成立時間</th>
			<th>商品數量</th>
			<th>訂單總金額</th>
			<th>訂單狀態</th>
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