<%@page import="com.product.model.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	System.out.println("productVO: " + productVO);
%>

<html>
<head>
<title>商品資料 listOneProduct.jsp</title>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
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
	<tr>
		<td><%=productVO.getId()%></td>
		<td><%=productVO%></td>
		<td><%=productVO.getType()%></td>	
		<td><%=productVO.getDescription()%></td>
		<td><%=productVO.getPrice()%></td>
		<td><%=productVO.getName()%></td>
		<td><%=productVO.getLaunchedDate()%></td>
		<td><%=productVO.getLocation()%></td>
		<td><%=productVO.getStatus()%></td> 
<%-- 		${(empVO.deptno==deptVO.deptno)?'selected':'' } --%>
		
	</tr>
	
</table>
<FORM METHOD="post" ACTION="moveorder.do">
	<input type="hidden" name="action" value="insert">
	<input type="hidden" name="productId">
	<input type="submit" value="加入收藏">
</FORM>
<FORM METHOD="post" ACTION="moveorder.do">
	<input type="hidden" name="action" value="delete_from_collection">
	<input type="hidden" name="productId">
	<input type="submit" value="取消收藏">
</FORM>
</body>
</html>