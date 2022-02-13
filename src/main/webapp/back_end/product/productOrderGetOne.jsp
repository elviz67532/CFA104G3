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

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<h2>�G��ӫ~�q��</h2>
	<table>

		<tr>
			<td>�q��s��:</td>
			<td>${productOrderVO.id}</td>
		</tr>
		<tr>
			<td>�ӫ~�s��:</td>
			<td>${productOrderVO.productId}</td>
		</tr>
		<tr>
			<td>�R�a�s��:</td>
			<td>${productOrderVO.customerMemberId}</td>
		</tr>
		<tr>
			<td>��a�s��:</td>
			<td>${productOrderVO.sellerMemberId}</td>
		</tr>
		<tr>
			<td>����H�m�W:</td>
			<td>${productOrderVO.productName}</td>
		</tr>
		<tr>
			<td>����H�q��:</td>
			<td>${productOrderVO.phone}</td>
		</tr>
		<tr>
			<td>����H�a�}:</td>
			<td>${productOrderVO.address}</td>
		</tr>
		<tr>
			<td>�q�榨�߮ɶ� :</td>
			<td>${productOrderVO.date}</td>
		</tr>
		<tr>
			<td>�ӫ~�ƶq :</td>
			<td>${productOrderVO.amountOfProduct}</td>
		</tr>
		<tr>
			<td>�q���`���B</td>
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
						type="submit" value="�e�X">
				</FORM>
			</td>
		</tr>
		<tr>
			<td>�q�榨�߮ɶ�:</td>
			<td>${productOrderVO.orderDate}</td>
		</tr>

		<tr>
			<td>�q�檬�A:</td>
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
					<button type="submit">�ݥX�f</button>
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
					<button type="submit">�w�X�f</button>
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
					<button type="submit">�����q��</button>
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
					<button type="submit">�ݼ���</button>
				</FORM>
			</td>
		</tr>
	</table>
</body>
</html>