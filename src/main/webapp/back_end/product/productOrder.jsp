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
	<h1>�G��q���x</h1>
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
			<th>�q�榨�߮ɶ�</th>
			<th>�q�檬�A</th>

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
							value="�e�X">

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
						<button type="submit">�ݥX�f</button>
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
						<button type="submit">�w�X�f</button>
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
						<button type="submit">�����q��</button>
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
						<button type="submit">�ݼ���</button>
					</FORM>
				</td>
		</c:forEach>
	</table>
	<h3></h3>
</body>
</html>