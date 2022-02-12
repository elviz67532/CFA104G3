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
			<td>�|���s��:</td>
			<td>${moveOrderVO.memberId}</td>
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
		<td>�̫�I�ڪ��B</td>
		<td>
		<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="update">
        	<input type="hidden" name="id" value="${moveOrderVO.id}">
        	<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
        	<input type="hidden" name="customer" value="${moveOrderVO.customer}">
        	<input type="hidden" name="phone" value="${moveOrderVO.phone}">
        	<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}">
        	<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}">
        	<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
        	<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}">
        	<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
        	<input type="text" name="amountTotal" value="${moveOrderVO.amountTotal}">
        	<input type="hidden" name="comment" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        	<input type="submit" value="�e�X">  		
    	</FORM>
    	</td>
    	</tr>
		<tr>
			<td>�q�榨�߮ɶ�:</td>
			<td>${moveOrderVO.orderDate}</td>
		</tr>
		<tr>
			<td>�^�X:</td>
			<td>${moveOrderVO.comment}</td>
		</tr>
    	<tr>
    	<td>�q�檬�A:</td>
    	<td>
		<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="updatestatusto1forone">
        	<input type="hidden" name="id" value="${moveOrderVO.id}">
        	<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
        	<input type="hidden" name="customer" value="${moveOrderVO.customer}">
        	<input type="hidden" name="phone" value="${moveOrderVO.phone}">
        	<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}">
        	<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}">
        	<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
        	<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}">
        	<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
        	<input type="hidden" name="amountTotal" value="${moveOrderVO.amountTotal}">
        	<input type="hidden" name="comment" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        	<button type="submit">��ñ�q���������q��</button>
  	  	</FORM>

  	  	<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="updatestatusto2forone">
        	<input type="hidden" name="id" value="${moveOrderVO.id}">
        	<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
        	<input type="hidden" name="customer" value="${moveOrderVO.customer}">
        	<input type="hidden" name="phone" value="${moveOrderVO.phone}">
        	<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}">
        	<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}">
        	<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
        	<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}">
        	<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
        	<input type="hidden" name="amountTotal" value="${moveOrderVO.amountTotal}">
        	<input type="hidden" name="comment" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        	<button type="submit">���ݹB�e�f��</button>
  	  	</FORM>

  	  	<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="updatestatusto3forone">
        	<input type="hidden" name="id" value="${moveOrderVO.id}">
        	<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
        	<input type="hidden" name="customer" value="${moveOrderVO.customer}">
        	<input type="hidden" name="phone" value="${moveOrderVO.phone}">
        	<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}">
        	<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}">
        	<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
        	<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}">
        	<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
        	<input type="hidden" name="amountTotal" value="${moveOrderVO.amountTotal}">
        	<input type="hidden" name="comment" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        	<button type="submit">�B�e��</button>
  	  	</FORM>

  	  	<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="updatestatusto4forone">
        	<input type="hidden" name="id" value="${moveOrderVO.id}">
        	<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
        	<input type="hidden" name="customer" value="${moveOrderVO.customer}">
        	<input type="hidden" name="phone" value="${moveOrderVO.phone}">
        	<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}">
        	<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}">
        	<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
        	<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}">
        	<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
        	<input type="hidden" name="amountTotal" value="${moveOrderVO.amountTotal}">
        	<input type="hidden" name="comment" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        	<button type="submit">�����q��</button>
  	  	</FORM>
  	  	</td>		
  	  	</tr>
	</table>
</body>
</html>