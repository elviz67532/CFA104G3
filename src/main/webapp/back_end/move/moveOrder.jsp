<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.move_order.model.*"%>  
<%@ page import="java.util.*"%>
<%
	MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
	List<MoveOrderVO> list = moSvc.getAll();
	pageContext.setAttribute("list", list);
%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>moveOrder</title>
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
  button{
  	width:200px;
  	background-color: light blue;
  	margin-top: auto;
  	margin-right: 0px;
  }
</style>
</head>
<body>
<h1>�W�����x�e��</h1>
<table>

	<tr>
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th>�Ȥ�m�W</th>
		<th>�Ȥ�q��</th>
		<th>�h�a�ثe�a�}</th>
		<th>�h�a�ت��a�a�}</th>
		<th>�h�a�ɶ�</th>
		<th>�������B</th>
		<th>�q��</th>
		<th>�̫�I�ڪ��B</th>
		<th>�q�榨�߮ɶ�</th>
		<th>����</th>
		<th>�q�檬�A</th>		
	</tr>
<c:forEach var="moveOrderVO" items="${list}">
	<tr>	
		<td>${moveOrderVO.id}</td>
		<td>${moveOrderVO.memberId}</td>
		<td>${moveOrderVO.customer}</td>
		<td>${moveOrderVO.phone}</td>
		<td>${moveOrderVO.fromAddress}</td>
		<td>${moveOrderVO.toAddress}</td>
		<td>${moveOrderVO.moveDate}</td>
		<td>${moveOrderVO.amountFirst}</td>
		<td>${moveOrderVO.deposit}</td>
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
    	<td>${moveOrderVO.orderDate}</td>
		<td>${moveOrderVO.comment}</td>
		<td>
		<FORM METHOD="post" ACTION="moveorder.do">
        	<input type="hidden" name="action" value="updatestatusto1">
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
        	<input type="hidden" name="action" value="updatestatusto2">
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
        	<input type="hidden" name="action" value="updatestatusto3">
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
        	<input type="hidden" name="action" value="updatestatusto4">
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
</c:forEach>
</table>
<h3>�ڥΫܤ[��</h3>
</body>
</html>