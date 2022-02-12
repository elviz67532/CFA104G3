<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.move_order.model.*"%>  

<%
	MoveOrderVO moveOrderVO = (MoveOrderVO) request.getAttribute("moveOrderVO");
%>
<!DOCTYPE html>
<html>
<head>
<title>MoveComment</title>
</head>
<body>
	<FORM METHOD="post" ACTION="moveorder.do">
       		<b>給我們一點評論吧</b>
        	<input type="hidden" name="action" value="updatecomment">
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
        	<input type="text" name="comment" size="45" value="${moveOrderVO.comment}">
        	<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
        	<input type="hidden" name="status" value="${moveOrderVO.status}">
        		
      		<input type="submit" value="送出">
    </FORM>

</body>
</html>