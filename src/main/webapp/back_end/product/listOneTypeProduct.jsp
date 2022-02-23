<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="java.util.*"%>
<%@	page import="java.util.HashMap"%>
<%
	Map<Integer, String> map = new HashMap<>();
	map.put(0,"其他");
	map.put(1,"桌椅");
	map.put(2,"寢具");
	map.put(3,"服飾");
	map.put(4, "電器");
	pageContext.setAttribute("map", map);
%>
<%
	Map<Integer, String> status = new HashMap<>();
	status.put(0,"販售");
	status.put(1,"完售");
	pageContext.setAttribute("status", status);	
%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<title>委域</title>
<style>
	  table, th, td {
	    border: 1px solid #CCCCFF;
	  }
	  th, td {
	    padding: 5px;
	    text-align: center;
	  }
	  th {
	  	font-size:16px;
	  }
	  td {
	  	font-size:15px;
	  }
	  img{
		    max-width:128px;
		    max-height:128px;
		    width:auto;
		    height:auto;	  	
	  }  
</style>
</head>
<body>
<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errMsgs}">
					<font style="color:red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				
				<!-- 麵包屑 (Breadcrumb) -->
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/back_end/product/seller.jsp">商品管理</a></li>
				    <li class="breadcrumb-item active" aria-current="page">查詢結果</li>
				  </ol>
				</nav>					
				<table>
						<tr>
							<th>商品編號</th>
							<th>會員編號_賣家</th>
							<th>商品類型</th>
							<th>商品敘述</th>
							<th>商品價格</th>
							<th>商品名稱</th>
							<th>圖片</th>
							<th>上架時間</th>
							<th>商品所在</th>
							<th>商品狀態</th>
						</tr>
					<c:forEach var="productVO" items="${list}">
						<tr>
							<td>${productVO.id}</td>
							<td>${productVO.sellerMemberId}</td>
							<td>${map[productVO.type]}</td>
							<td>${productVO.description}</td>	
							<td>${productVO.price}</td>
							<td>${productVO.name}</td>
							<td>
								<img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}" class="card-img-top">			
							</td>
							<td>${productVO.launchedDate}</td>
							<td>${productVO.location}</td>
							<td>${status[productVO.status]}</td>
						</tr>
						
					</c:forEach>
				</table>
				
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>
	
	<!-- custom script -->
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>	
</body>
</html>