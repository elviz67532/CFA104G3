<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product_photo.model.*"%>
<%@	page import="com.product.model.*"%>
<%@ page import="com.product_collection.model.*"%>
<%
List<ProductVO> productVO = (List<ProductVO>) request.getAttribute("productVO");
%>
<%
	ProductServiceImpl productService = new ProductServiceImpl();
	List<ProductVO> list = productService.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="photoSvc" scope="page" class="com.product_photo.model.ProductPhotoServiceImpl" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />

</head>
<style>
th{
/* 	border: 1px solid black; */
	width: 200px;
	padding: 4px;
	font-size: 16px;
}
td{
color: black;
/* 	border: 1px solid black; */
	text-overflow: ellipsis;
	overflow:hidden;
white-space: nowrap;
max-width: 200px;
	font-size: 16px;
	padding-left: 14px;
}
tr:nth-child(even) {
   	background-color: #F0F0F0;
}
.btnCollect{
	color: black;
	width:100%;
	cursor: pointer;
	border: none;
	background-color: white;
	transition: .3s;
}

.btnCollect:hover {
	color: black;
	background-color: #F0F0F0;
	width: 50%;
}
.imgCollect {
	width: 40px;
	height: 40px;
}
</style>

<body class="d-flex flex-column h-100">
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/product01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>二手商城</h1>
                        <span class="subheading">愛地球，資源再利用</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
 <div style="width: 100%;">
	<div class="main" style="width: 50%; margin: 0 auto;">
	<table style="margin: 0 auto; ">
		<tr>
			<th><img class="imgCollect" src="<%=request.getContextPath()%>/asset/img/productCollect/brand-identity.png"> 商品名稱</th>
			<th><img class="imgCollect" src="<%=request.getContextPath()%>/asset/img/productCollect/price-tag.png"> 商品價格</th>
			<th><img class="imgCollect" src="<%=request.getContextPath()%>/asset/img/productCollect/cargo.png"> 再見收藏</th>
		</tr>
		<c:forEach var="productCollection" items="${productVO}">
			<tr class="price">
				<td>${productCollection.name}</td>
				<td>NT$ ${productCollection.price} 元</td>
				<td style="text-align:center;">
					<FORM METHOD="post" ACTION="productcollection.do">
						<input type="hidden" name="action" value="delete_from_collection">
						<input type="hidden" name="productId" value="${productCollection.id}">
						<input style=""class="btnCollect"type="submit" value="取消收藏">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</div>

	
	<div class="container">
		<div class="row">
			<!-- 左邊3欄  list group 分類功能-->
<!-- 			<div class="col-12 col-md-3 list-group"> -->
<!-- 				<FORM METHOD="post" ACTION="product/ProductServlet"> -->
<%-- 				  <a href="<%=request.getContextPath() %>/front_end/product/homePage.jsp" class="list-group-item list-group-item-action active" aria-current="true"> --%>
<!-- 				    總覽 -->
<!-- 				  </a> -->
<%-- 				  <a href="<%=request.getContextPath() %>/front_end/product/browseElec.jsp"  name="prodType" value=4 class="list-group-item list-group-item-action">電器類</a> --%>
<%-- 				  <a href="<%=request.getContextPath() %>/front_end/product/browseFurniture.jsp" class="list-group-item list-group-item-action">寢具</a> --%>
<%-- 				  <a href="<%=request.getContextPath() %>/front_end/product/browseOthers.jsp" class="list-group-item list-group-item-action">其他</a> --%>
<%-- 				  <a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp" class="list-group-item list-group-item-action">買賣家</a> --%>
<!-- 				</FORM> -->
<!-- 			</div> -->
			<!-- 右邊9欄  card 卡片 & text-center -->
		</div>
	</div>
	
	<br>
	<br>
	
	<!-- card 卡片 & text-center-->
	<!-- Pages-->
<!-- 	<nav aria-label="Page navigation example"> -->
<!-- 	  <ul class="pagination justify-content-center"> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 	    <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
<!-- 	  </ul> -->
<!-- 	</nav> -->
	
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>