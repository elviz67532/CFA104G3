<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.product.model.ProductUtil" %>
<% 
	ProductVO prodVO = (ProductVO)request.getAttribute("productVO");
%>

<!DOCTYPE html>
<html>
<head>

<title>新增商品 - addProduct.jsp</title>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
	<font style="color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var="msg" items="${errMsgs}">
			<li style="color:red">${msg}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="ProductServlet" name="form1">
<table>
	<tr>
		<td>商品名稱:</td>
		<td><input type="text" name="prodName"
		value="<%= (prodVO == null)? "呵呵~": prodVO.getProdName()%>"/></td>
	</tr>
	
	<tr>
		<td>會員編號:</td>
		<td><input type="text" name="memId"
		value="<%= (prodVO == null)? "123456": prodVO.getProdMemId() %>"/></td>
	</tr>
	<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>

	<tr>
		<td>商品類別:</td>
		<td><select size="1" name="prodType">
<%-- 			<c:forEach var="type" items="${ProductUtil.prodType}"> --%>
<!-- 				<option value="type">type -->
<%-- 			</c:forEach> --%>
				<option>--請選擇--
				<option value=0>其他類
				<option value=1>桌椅類
				<option value=2>寢具類
				<option value=3>服飾類
				<option value=4>電器類
			</select></td>
	</tr>
		<td>商品敘述:</td>
		<td><input type="text" name="prodDesc"
		value="<%= (prodVO == null)? "商品敘述": prodVO.getProdDesc() %>"/></td>
	</tr>
		
	<tr>
		<td>價格:</td>
		<td><input type="text" name="prodPrice"
		value="<%= (prodVO == null)? "0": prodVO.getProdPrice() %>"/></td>			
	</tr>
	<tr>
		<td>上架時間:</td>
		<td><input type="text" name="prodUpdate"
		value="<%= new java.sql.Date(System.currentTimeMillis()) %>"/></td>			
	</tr>
	<tr>
		<td>所在地:</td>
		<td><input type="text" name="prodLoc"
		value="<%= (prodVO == null)? "unknown": prodVO.getProdLoc() %>"/></td>			
	</tr>	
	<tr>
		<td>商品狀態:</td>
		<td><select size="1" name="prodStatus">
				<option>--請選擇--				
				<option value=0>販售中
				<option value=0>完售
				
			</select></td>
	</tr>		
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</FORM>
</body>
</html>