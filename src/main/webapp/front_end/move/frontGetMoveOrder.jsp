<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.move_order.model.*"%>

<%
MoveOrderVO moveOrderVO = (MoveOrderVO) request.getAttribute("moveOrderVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>moveOrderGetOne</title>

</head>
<body>
	<%=moveOrderVO == null%>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<h2>�h�a�q��</h2>
	<table>

		<tr>
			<td>�q��s��:</td>
			<td>${moveOrderVO.id}</td>
		</tr>
		<tr>
			<td>�Ȥ�m�W:</td>
			<td>${moveOrderVO.customer}</td>
		</tr>
		<tr>
			<td>�Ȥ�q��:</td>
			<td>${moveOrderVO.phone}</td>
		</tr>
		<tr>
			<td>�h�a�ثe�a�}:</td>
			<td>${moveOrderVO.fromAddress}</td>
		</tr>
		<tr>
			<td>�h�a�ت��a�a�}:</td>
			<td>${moveOrderVO.toAddress}</td>
		</tr>
		<tr>
			<td>�h�a�ɶ�:</td>
			<td>${moveOrderVO.moveDate}</td>
		</tr>
		<tr>
			<td>�������B:</td>
			<td>${moveOrderVO.amountFirst}</td>
		</tr>
		<tr>
			<td>�q��:</td>
			<td>${moveOrderVO.deposit}</td>
		</tr>
		<tr>
			<td>�̲ץI�ڪ��B:</td>
			<td>${moveOrderVO.amountTotal}</td>
		</tr>
		<tr>
			<td>�q�榨�߮ɶ�:</td>
			<td>${moveOrderVO.orderDate}</td>
		</tr>
		<tr>
			<td>�^�X:</td>
			<td>${moveOrderVO.comment}</td>
			
	</table>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/moveorderfrontend/moveorder.do" style="margin-bottom: 0px;">
		<input type="submit" value="���ڭ̤@�Ǧ^�X�a"> 
		<input type="hidden" name="id" value="${moveOrderVO.id}"> 
		<input type="hidden" name="action" value="getOne_For_Update">
	</FORM>

</body>
</html>