<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<title>二手商品訂單首頁</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>二手商品訂單首頁</h3>
				<h4>委域二手商城</h4></td>
		</tr>
	</table>


	<h3>訂單查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllproductOrder.jsp'>所有二手商品訂單</a> <br>
		<br></li>


		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>輸入訂單編號 (如1):</b> <input type="text" name="id"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="proSvc" scope="page"
			class="com.product_order.model.ProductOrderServiceImpl" />

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>選擇賣家編號:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>選擇買家編號:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.productId}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>訂單管理</h3>

	<ul>
		<li><a href='addEmp.jsp'>新增二手商品訂單</a>
	</ul>

</body>
</html>