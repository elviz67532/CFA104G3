<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_collection.model.*" %>
<%
List<ProductCollectionVO> productCollectionVO = (List<ProductCollectionVO>) request.getAttribute("productCollectionVO");
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
</tr>
<tr>
<td>${productCollectionVO.}</td>
</tr>
</table>
</body>
</html>