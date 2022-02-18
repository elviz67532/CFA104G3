<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.product_photo.model.ProductPhotoService"%>
<%
	ProductPhotoService	photoService = new ProductPhotoService();
%>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<img src="<%= photoService.getByProdId(1) %>>">
</body>
</html>