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
<title>productOrder</title>
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

button {
	width: 200px;
	background-color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
</style>
</head>
<body>
	<h1>二手訂單後台</h1>
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
			<th>訂單成立時間</th>
			<th>訂單狀態</th>

		</tr>
		<c:forEach var="productOrderVO" items="${list}">
			<tr>
				<td>${productOrderVO.id}</td>
				<td>${productOrderVO.productId}</td>
				<td>${productOrderVO.customerMemberId}</td>
				<td>${productOrderVO.sellerMemberId}</td>
				<td>${productOrderVO.productName}</td>
				<td>${productOrderVO.phone}</td>
				<td>${productOrderVO.address}</td>
				<td>${productOrderVO.status}</td>
				<td>${productOrderVO.date}</td>

				<td>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="hidden" name="action" value="upstatus"> <input
							type="hidden" name="id" value="${productOrderVO.id}"> <input
							type="hidden" name="productId"
							value="${productOrderVO.productId}"> <input type="hidden"
							name="customerMemberId"
							value="${productOrderVO.customerMemberId}"> <input
							type="hidden" name="sellerMemberId"
							value="${productOrderVO.sellerMemberId}"> <input
							type="hidden" name="productName"
							value="${productOrderVO.productName}"> <input
							type="hidden" name="phone" value="${productOrderVO.phone}">
						<input type="hidden" name="address"
							value="${productOrderVO.address}"> <input type="hidden"
							name="status" value="${productOrderVO.status}"> <input
							type="hidden" name="amountOfProduct"
							value="${productOrderVO.amountOfProduct}"> <input
							type="text" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="date" value="${productOrderVO.date}">
						<input type="hidden" name="status"
							value="${productOrderVO.status}"> <input type="submit"
							value="送出">

					</FORM>


				</td>
				<td>${productOrderVO.date}</td>
				<td>${productOrderVO.amountOfPrice}</td>
				<td>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="hidden" name="action" value="upstatusstatusto1">
						<input type="hidden" name="id" value="${productOrderVO.id}">
						<input type="hidden" name="productId"
							value="${productOrderVO.productId}"> <input type="hidden"
							name="customerMemberId"
							value="${productOrderVO.customerMemberId}"> <input
							type="hidden" name="sellerMemberId"
							value="${productOrderVO.sellerMemberId}"> <input
							type="hidden" name="productName"
							value="${productOrderVO.productName}"> <input
							type="hidden" name="phone" value="${productOrderVO.phone}">
						<input type="hidden" name="address"
							value="${productOrderVO.address}"> <input type="hidden"
							name="status" value="${productOrderVO.status}"> <input
							type="hidden" name="amountOfProduct"
							value="${productOrderVO.amountOfProduct}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="date" value="${productOrderVO.date}">
						<input type="hidden" name="status"
							value="${productOrderVO.status}">
						<button type="submit">待出貨</button>
					</FORM>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="hidden" name="action" value="upstatusstatusto2">
						<input type="hidden" name="id" value="${productOrderVO.id}">
						<input type="hidden" name="productId"
							value="${productOrderVO.productId}"> <input type="hidden"
							name="customerMemberId"
							value="${productOrderVO.customerMemberId}"> <input
							type="hidden" name="sellerMemberId"
							value="${productOrderVO.sellerMemberId}"> <input
							type="hidden" name="productName"
							value="${productOrderVO.productName}"> <input
							type="hidden" name="phone" value="${productOrderVO.phone}">
						<input type="hidden" name="address"
							value="${productOrderVO.address}"> <input type="hidden"
							name="status" value="${productOrderVO.status}"> <input
							type="hidden" name="amountOfProduct"
							value="${productOrderVO.amountOfProduct}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="date" value="${productOrderVO.date}">
						<input type="hidden" name="status"
							value="${productOrderVO.status}">
						<button type="submit">已出貨</button>
					</FORM>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="hidden" name="action" value="upstatusstatusto3">
						<input type="hidden" name="id" value="${productOrderVO.id}">
						<input type="hidden" name="productId"
							value="${productOrderVO.productId}"> <input type="hidden"
							name="customerMemberId"
							value="${productOrderVO.customerMemberId}"> <input
							type="hidden" name="sellerMemberId"
							value="${productOrderVO.sellerMemberId}"> <input
							type="hidden" name="productName"
							value="${productOrderVO.productName}"> <input
							type="hidden" name="phone" value="${productOrderVO.phone}">
						<input type="hidden" name="address"
							value="${productOrderVO.address}"> <input type="hidden"
							name="status" value="${productOrderVO.status}"> <input
							type="hidden" name="amountOfProduct"
							value="${productOrderVO.amountOfProduct}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="date" value="${productOrderVO.date}">
						<input type="hidden" name="status"
							value="${productOrderVO.status}">
						<button type="submit">完成訂單</button>
					</FORM>
					<FORM METHOD="post" ACTION="productorder.do">
						<input type="hidden" name="action" value="upstatusstatusto4">
						<input type="hidden" name="id" value="${productOrderVO.id}">
						<input type="hidden" name="productId"
							value="${productOrderVO.productId}"> <input type="hidden"
							name="customerMemberId"
							value="${productOrderVO.customerMemberId}"> <input
							type="hidden" name="sellerMemberId"
							value="${productOrderVO.sellerMemberId}"> <input
							type="hidden" name="productName"
							value="${productOrderVO.productName}"> <input
							type="hidden" name="phone" value="${productOrderVO.phone}">
						<input type="hidden" name="address"
							value="${productOrderVO.address}"> <input type="hidden"
							name="status" value="${productOrderVO.status}"> <input
							type="hidden" name="amountOfProduct"
							value="${productOrderVO.amountOfProduct}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="amountOfPrice"
							value="${productOrderVO.amountOfPrice}"> <input
							type="hidden" name="date" value="${productOrderVO.date}">
						<input type="hidden" name="status"
							value="${productOrderVO.status}">
						<button type="submit">待撥款</button>
					</FORM>
				</td>
		</c:forEach>
	</table>
	<h3></h3>
</body>
</html>