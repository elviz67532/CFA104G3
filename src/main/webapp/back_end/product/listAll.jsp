<%@page import="com.product.model.ProductServiceImpl"%>
<%@page import="com.product.model.ProductVO"%>
<%@page import ="java.util.List"%>
<%@page import="com.product.model.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<%
	ProductServiceImpl productService = new ProductServiceImpl();
	List<ProductVO> list = productService.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有商品資料 - listAll.jsp</title>

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
		<th>商品圖片</th>
		<th>上架時間</th>
		<th>商品所在</th>
		<th>商品狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<c:forEach var="productVO" items="${list}">
		<tr>
			<td>${productVO.id}</td>
			<td>${productVO.prodMemId}</td>
			<td>${productVO.prodType}</td>
			<td>${productVO.prodDesc}</td>	
			<td>${productVO.prodPrice}</td>
			<td>${productVO.prodName}</td>
			<td>圖片檔案</td>
			<td>${productVO.prodUptime}</td>
			<td>${productVO.prodLoc}</td>
			<td>${productVO.prodStatus}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
					<input type="submit" value="修改">
					<input type="hidden" value="${productVO.id}" name="prodId">
<%-- 					--${productVO.id}-- --%>
					<input type="hidden" value="getOne_For_Update" name="action"> 
				</FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
					<input type="submit" value="刪除">
					<input type="hidden" value="${productVO.id}" name="prodId">
					<input type="hidden" value="delete" name="action"> 
				</FORM>
			</td>			
		</tr>		
	</c:forEach>
</table>


</body>
</html>