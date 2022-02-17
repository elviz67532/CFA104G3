<%-- <%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="BIG5">
<title>Insert title here</title>
<style>
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
		<tr>
			<th>商品編號</th>
			<th>會員編號_賣家</th>
			<th>商品類型</th>
			<th>商品敘述</th>
			<th>商品價格</th>
			<th>商品名稱</th>
			<th>上架時間</th>
			<th>商品所在</th>
			<th>商品狀態</th>
		</tr>
	<c:forEach var="productVO" items="${list}">
		<tr>
			<td>${productVO.prodId}</td>
			<td>${productVO.prodMemId}</td>
			<td>${productVO.prodType}</td>
			<td>${productVO.prodDesc}</td>	
			<td>${productVO.prodPrice}</td>
			<td>${productVO.prodName}</td>
			<td>${productVO.prodUptime}</td>
			<td>${productVO.prodLoc}</td>
			<td>${productVO.prodStatus}</td>
		</tr>
		
	</c:forEach>
</table>
</body>
</html>