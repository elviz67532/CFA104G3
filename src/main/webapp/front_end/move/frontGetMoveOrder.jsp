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
			<td>最終付款金額:</td>
			<td>${moveOrderVO.amountTotal}</td>
		</tr>
		<tr>
			<td>訂單成立時間:</td>
			<td>${moveOrderVO.orderDate}</td>
		</tr>
		<tr>
			<td>回饋:</td>
			<td>${moveOrderVO.comment}</td>
			
	</table>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/moveorderfrontend/moveorder.do" style="margin-bottom: 0px;">
		<input type="submit" value="給我們一些回饋吧"> 
		<input type="hidden" name="id" value="${moveOrderVO.id}"> 
		<input type="hidden" name="action" value="getOne_For_Update">
	</FORM>

</body>
</html>