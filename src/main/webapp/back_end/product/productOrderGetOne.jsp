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
<title>productOrderGetOne</title>


</head>
<body>
	<%=productOrderVO == null%>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<h2>二手商品訂單</h2>
	<table>

		<tr>
			<td>訂單編號:</td>
			<td>${productOrderVO.id}</td>
		</tr>
		<tr>
			<td>商品編號:</td>
			<td>${productOrderVO.productId}</td>
		</tr>
		<tr>
			<td>買家編號:</td>
			<td>${productOrderVO.customerMemberId}</td>
		</tr>
		<tr>
			<td>賣家編號:</td>
			<td>${productOrderVO.sellerMemberId}</td>
		</tr>
		<tr>
			<td>收件人姓名:</td>
			<td>${productOrderVO.productName}</td>
		</tr>
		<tr>
			<td>收件人電話:</td>
			<td>${productOrderVO.phone}</td>
		</tr>
		<tr>
			<td>收件人地址:</td>
			<td>${productOrderVO.address}</td>
		</tr>
		<tr>
			<td>訂單成立時間 :</td>
			<td>${productOrderVO.date}</td>
		</tr>
		<tr>
			<td>商品數量 :</td>
			<td>${productOrderVO.amountOfProduct}</td>
		</tr>
		<tr>
			<td>訂單總金額</td>
			<td>
				<FORM METHOD="post" ACTION="productorder.do">
					<input type="hidden" name="action" value="update"> <input
						type="hidden" name="id" value="${productOrderVO.id}"> <input
						type="hidden" name="productId" value="${productOrderVO.productId}">
					<input type="hidden" name="customerMemberId"
						value="${productOrderVO.customerMemberId}"> <input
						type="hidden" name="sellerMemberId"
						value="${productOrderVO.sellerMemberId}"> <input
						type="hidden" name="productName"
						value="${productOrderVO.productName}"> <input
						type="hidden" name="phone" value="${productOrderVO.phone}">
					<input type="hidden" name="address"
						value="${productOrderVO.address}"> <input type="hidden"
						name="date" value="${productOrderVO.date}"> <input
						type="hidden" name="amountOfProduct"
						value="${productOrderVO.amountOfProduct}"> <input
						type="text" name="amountTotal"
						value="${productOrderVO.amountTotal}"> <input
						type="hidden" name="comment" value="${productOrderVO.comment}">
					<input type="hidden" name="orderDate"
						value="${productOrderVO.orderDate}"> <input type="hidden"
						name="status" value="${productOrderVO.status}"> <input
						type="submit" value="送出">
				</FORM>
			</td>
		</tr>
		<tr>
			<td>訂單成立時間:</td>
			<td>${productOrderVO.orderDate}</td>
		</tr>

		<tr>
			<td>訂單狀態:</td>
			<td>
				<FORM METHOD="post" ACTION="productorder.do">
					<input type="hidden" name="action" value="updatestatusto1forone">
					<input type="hidden" name="id" value="${productOrderVO.id}">
					<input type="hidden" name="productId"
						value="${productOrderVO.productId}"> <input type="hidden"
						name="customerMemberId" value="${productOrderVO.customerMemberId}">
					<input type="hidden" name="sellerMemberId"
						value="${productOrderVO.sellerMemberId}"> <input
						type="hidden" name="productName"
						value="${productOrderVO.productName}"> <input
						type="hidden" name="phone" value="${productOrderVO.phone}">
					<input type="hidden" name="address"
						value="${productOrderVO.address}"> <input type="hidden"
						name="date" value="${productOrderVO.date}"> <input
						type="hidden" name="amountOfProduct"
						value="${productOrderVO.amountOfProduct}"> <input
						type="hidden" name="amountTotal"
						value="${productOrderVO.amountTotal}"> <input
						type="hidden" name="comment" value="${productOrderVO.comment}">
					<input type="hidden" name="orderDate"
						value="${productOrderVO.orderDate}"> <input type="hidden"
						name="status" value="${productOrderVO.status}">
					<button type="submit">待出貨</button>
				</FORM>

				<FORM METHOD="post" ACTION="productorder.do">
					<input type="hidden" name="action" value="updatestatusto2forone">
					<input type="hidden" name="id" value="${productOrderVO.id}">
					<input type="hidden" name="productId"
						value="${productOrderVO.productId}"> <input type="hidden"
						name="customerMemberId" value="${productOrderVO.customerMemberId}">
					<input type="hidden" name="sellerMemberId"
						value="${productOrderVO.sellerMemberId}"> <input
						type="hidden" name="productName"
						value="${productOrderVO.productName}"> <input
						type="hidden" name="phone" value="${productOrderVO.phone}">
					<input type="hidden" name="address"
						value="${productOrderVO.address}"> <input type="hidden"
						name="date" value="${productOrderVO.date}"> <input
						type="hidden" name="amountOfProduct"
						value="${productOrderVO.amountOfProduct}"> <input
						type="hidden" name="amountTotal"
						value="${productOrderVO.amountTotal}"> <input
						type="hidden" name="comment" value="${productOrderVO.comment}">
					<input type="hidden" name="orderDate"
						value="${productOrderVO.orderDate}"> <input type="hidden"
						name="status" value="${productOrderVO.status}">
					<button type="submit">已出貨</button>
				</FORM>

				<FORM METHOD="post" ACTION="productorder.do">
					<input type="hidden" name="action" value="updatestatusto3forone">
					<input type="hidden" name="id" value="${productOrderVO.id}">
					<input type="hidden" name="productId"
						value="${productOrderVO.productId}"> <input type="hidden"
						name="customerMemberId" value="${productOrderVO.customerMemberId}">
					<input type="hidden" name="sellerMemberId"
						value="${productOrderVO.sellerMemberId}"> <input
						type="hidden" name="productName"
						value="${productOrderVO.productName}"> <input
						type="hidden" name="phone" value="${productOrderVO.phone}">
					<input type="hidden" name="address"
						value="${productOrderVO.address}"> <input type="hidden"
						name="date" value="${productOrderVO.date}"> <input
						type="hidden" name="amountOfProduct"
						value="${productOrderVO.amountOfProduct}"> <input
						type="hidden" name="amountTotal"
						value="${productOrderVO.amountTotal}"> <input
						type="hidden" name="comment" value="${productOrderVO.comment}">
					<input type="hidden" name="orderDate"
						value="${productOrderVO.orderDate}"> <input type="hidden"
						name="status" value="${productOrderVO.status}">
					<button type="submit">完成訂單</button>
				</FORM>

				<FORM METHOD="post" ACTION="productorder.do">
					<input type="hidden" name="action" value="updatestatusto4forone">
					<input type="hidden" name="id" value="${productOrderVO.id}">
					<input type="hidden" name="productId"
						value="${productOrderVO.productId}"> <input type="hidden"
						name="customerMemberId" value="${productOrderVO.customerMemberId}">
					<input type="hidden" name="sellerMemberId"
						value="${productOrderVO.sellerMemberId}"> <input
						type="hidden" name="productName"
						value="${productOrderVO.productName}"> <input
						type="hidden" name="phone" value="${productOrderVO.phone}">
					<input type="hidden" name="address"
						value="${productOrderVO.address}"> <input type="hidden"
						name="date" value="${productOrderVO.date}"> <input
						type="hidden" name="amountOfProduct"
						value="${productOrderVO.amountOfProduct}"> <input
						type="hidden" name="amountTotal"
						value="${productOrderVO.amountTotal}"> <input
						type="hidden" name="comment" value="${productOrderVO.comment}">
					<input type="hidden" name="orderDate"
						value="${productOrderVO.orderDate}"> <input type="hidden"
						name="status" value="${productOrderVO.status}">
					<button type="submit">待撥款</button>
				</FORM>
			</td>
		</tr>
	</table>
</body>
</html>