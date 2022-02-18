<%@page import="java.util.HashMap"%>
<%@page import="com.product.model.ProductVO"%>
<%@page import="java.util.*"%>
<%-- <%@ page language="java" contentType="text/html; charset=Big5" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  h4 {
    color: blue;
    display: inline;
  }
</style>
</head>
<body>

<p>This is a home page for PRODUCT: Home</p>

<h3>查詢資料:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li><a href='listAll.jsp'>List</a> all Products
	
	<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
			<b>輸入商品編號: </b>
			<input type="text" name="prodId">
			<input type="hidden" name="action" value="getOne_For_Display">
        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4> 
		</FORM>
	</li>
	
	<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>
	
	<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
			<b>選擇商品編號: </b>
			<select  size="1" name="prodId">
				<c:forEach var="productVO" items="${productSvc.all}">
					<option value="${productVO.prodId}">${productVO.prodId}
				</c:forEach>
			</select>
        	<input type="hidden" name="action" value="getOne_For_Display">
        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
		</FORM>
	</li>
	
	<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
			<b>選擇商品名稱: </b>
			<select  size="1" name="prodId">
				<c:forEach var="productVO" items="${productSvc.all}">
					<option value="${productVO.prodId}">${productVO.prodName}
				</c:forEach>
			</select>
        	<input type="hidden" name="action" value="getOne_For_Display">
        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
		</FORM>
	</li>
	
	<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
			<b>選擇商品類別: </b>
			<select  size="1" name="prodType">
				<%
				Map map = new HashMap();
				map.put(0, "其他類");
				map.put(1, "桌椅類");
				map.put(2, "寢具類");
				map.put(3, "服飾類");
				map.put(4, "電器類");
				%>
					<option> -- 請選擇 --
<%-- 				<c:forEach var="productVO" items="${productSvc.all}">  --%>
					<option value=0> 其他類
					<option value=1> 桌椅類
					<option value=2> 寢具類
					<option value=3> 服飾類
					<option value=4> 電器類
<%-- 				</c:forEach> --%>
			</select>
        	<input type="hidden" name="action" value="get_Display_From_Type">
        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
		</FORM>
	</li>

<%
	com.product.model.ProductDAOImpl dao = new com.product.model.ProductDAOImpl();
	pageContext.setAttribute("dao", dao);
%>
	
</ul>

<h3>商品管理</h3>
<a href='addProduct.jsp'><h3>新增商品</h3></a>
</body>
</html>