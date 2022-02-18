<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>商品資料修改</title>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="ProductServlet" name="form1">
<table>
	<tr>
<%-- 	--${productVO.prodId}-- --%>
		<td>商品編號:</td>
		<td><%=productVO.getProdId()%></td>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td><input type="text" name="prodName"
		value="<%= (productVO == null)? "呵呵~": productVO.getProdName()%>"/></td>
	</tr>
	
	<tr>
		<td>會員編號:</td>
		<td><input type="text" name="memId"
		value="<%= (productVO == null)? "123456": productVO.getProdMemId() %>"/></td>
	</tr>
	<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>

	<tr>
		<td>商品類別:</td>
		<td><select size="1" name="prodType">
<%-- 			<c:forEach var="type" items="${ProductUtil.prodType}"> --%>
<!-- 				<option value="type">type -->
<%-- 			</c:forEach> --%>
				<option>--請選擇--
				<option value=0 ${(productVO.prodType == 0)? 'selected':''}>其他類
				<option value=1 ${(productVO.prodType == 1)? 'selected':''}>桌椅類
				<option value=2 ${(productVO.prodType == 2)? 'selected':''}>寢具類
				<option value=3 ${(productVO.prodType == 3)? 'selected':''}>服飾類
				<option value=4 ${(productVO.prodType == 4)? 'selected':''}>電器類
			</select></td>
	</tr>
		<td>商品敘述:</td>
		<td><input type="text" name="prodDesc"
		value="<%= (productVO == null)? "商品敘述": productVO.getProdDesc() %>"/></td>
	</tr>
		
	<tr>
		<td>價格:</td>
		<td><input type="text" name="prodPrice"
		value="<%= (productVO == null)? "0": productVO.getProdPrice() %>"/></td>			
	</tr>
	<tr>
		<td>上架時間:</td>
		<td><input type="text" name="prodUpdate"
		value="<%= new java.sql.Date(System.currentTimeMillis()) %>"/></td>			
	</tr>
	<tr>
		<td>所在地:</td>
		<td><input type="text" name="prodLoc"
		value="<%= (productVO == null)? "unknown": productVO.getProdLoc() %>"/></td>			
	</tr>	
	<tr>
		<td>商品狀態:</td>
		<td><select size="1" name="prodStatus">
				<option>--請選擇--				
				<option value=0 ${(productVO.prodStatus == 0)? 'selected':''}>販售中
				<option value=1 ${(productVO.prodStatus == 1)? 'selected':''}>完售
			</select></td>
	</tr>			
</table>
<input type="hidden" name="action" value="update">
<input type="hidden" name="prodId" value="<%=productVO.getProdId()%>">
<input type="submit" value="送出修改">
</FORM>

</body>
</html>