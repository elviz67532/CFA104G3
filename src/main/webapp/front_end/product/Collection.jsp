<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_collection.model.*"%>
<%@ page import="com.product.model.*"%>
<%
List<ProductVO> productCollectionVO = (List<ProductVO>) request.getAttribute("productVOs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>商品名稱</th>
			<th>商品價格</th>
		</tr>
		<c:forEach var="productCollection" items="${productCollectionVO}">
			<tr>
				<td>${productCollectionVO.name}</td>
				<td>${productCollectionVO.price}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>