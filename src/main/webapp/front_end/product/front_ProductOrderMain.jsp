<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
<title>�G��ӫ~�q�歺��</title>

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
			<td><h3>�G��ӫ~�q�歺��</h3>
				<h4>�e��G��ӫ�</h4></td>
		</tr>
	</table>


	<h3>�q��d��:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllproductOrder.jsp'>�Ҧ��G��ӫ~�q��</a> <br>
		<br></li>


		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>��J�q��s�� (�p1):</b> <input type="text" name="id"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="�e�X">
			</FORM>
		</li>

		<jsp:useBean id="proSvc" scope="page"
			class="com.product_order.model.ProductOrderServiceImpl" />

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>��ܽ�a�s��:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>��ܶR�a�s��:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.productId}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>


	<h3>�q��޲z</h3>

	<ul>
		<li><a href='addEmp.jsp'>�s�W�G��ӫ~�q��</a>
	</ul>

</body>
</html>