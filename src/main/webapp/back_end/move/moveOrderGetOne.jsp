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

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<h2>搬家訂單</h2>
	<table>

		<tr>
			<td>訂單編號:</td>
			<td>${moveOrderVO.id}</td>
		</tr>
		<tr>
			<td>會員編號:</td>
			<td>${moveOrderVO.memberId}</td>
		</tr>
		<tr>
			<td>客戶姓名:</td>
			<td>${moveOrderVO.customer}</td>
		</tr>
		<tr>
			<td>客戶電話:</td>
			<td>${moveOrderVO.phone}</td>
		</tr>
		<tr>
			<td>搬家目前地址:</td>
			<td>${moveOrderVO.fromAddress}</td>
		</tr>
		<tr>
			<td>搬家目的地地址:</td>
			<td>${moveOrderVO.toAddress}</td>
		</tr>
		<tr>
			<td>搬家時間:</td>
			<td>${moveOrderVO.moveDate}</td>
		</tr>
		<tr>
			<td>估價金額:</td>
			<td>${moveOrderVO.amountFirst}</td>
		</tr>
		<tr>
			<td>訂金:</td>
			<td>${moveOrderVO.deposit}</td>
		</tr>
		<tr>
		<td>最後付款金額</td>
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
        	<input type="submit" value="送出">  		
    	</FORM>
    	</td>
    	</tr>
		<tr>
			<td>訂單成立時間:</td>
			<td>${moveOrderVO.orderDate}</td>
		</tr>
		<tr>
			<td>回饋:</td>
			<td>${moveOrderVO.comment}</td>
		</tr>
    	<tr>
    	<td>訂單狀態:</td>
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
        	<button type="submit">不簽訂契約結束訂單</button>
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
        	<button type="submit">等待運送貨物</button>
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
        	<button type="submit">運送中</button>
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
        	<button type="submit">完成訂單</button>
  	  	</FORM>
  	  	</td>		
  	  	</tr>
	</table>
</body>
</html>