<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product_photo.model.*"%>
<%@	page import="com.product.model.*"%>
<%
ProductServiceImpl productService = new ProductServiceImpl();
List<ProductVO> list = productService.getAll();
pageContext.setAttribute("list", list);
%>
<jsp:useBean id="photoSvc" scope="page"
	class="com.product_photo.model.ProductPhotoServiceImpl" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>委域</title>
<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css"
	rel="stylesheet" />
<style>
.SEARCHFOR {
	padding: 10px;
	margin-bottom: 30px;
}

#pagination {
	bottom: 0;
}

.d-block {
	height: 30%;
}

.myImg {
	height: 400px;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
}

.pagination {
	margin: 10px
}

.card {
	margin: 5px
}
</style>
</head>

<body class="d-flex flex-column h-100">
	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/product01.jpg')">
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
	<div class="row justify-content-center">
		<div class="col-lg-6 SEARCHFOR"></div>
	</div>


	<div class="container">
		<div class="row">
			<!-- 左邊3欄  list group 分類功能-->
			<div class="col-12 col-md-3 list-group">
				<FORM METHOD="post" ACTION="product/ProductServlet">
					<a href="homePage.jsp"
						class="list-group-item list-group-item-action" aria-current="true">
						總覽 </a> <a href="browseElec.jsp" name="prodType" value=4
						class="list-group-item list-group-item-action">電器類</a> <a
						href="browseFurniture.jsp"
						class="list-group-item list-group-item-action">寢具</a> <a
						href="browseOthers.jsp"
						class="list-group-item list-group-item-action">其他</a> <a
						href="vendor.jsp"
						class="list-group-item list-group-item-action active">買賣家</a>
				</FORM>
			</div>
			<!-- 右邊9欄  card 卡片 & text-center -->
			<div class="col-12 col-md-9">
				<div class="row" >
					<div class="col">

					    <div class="col-12 row justify-content-center">
					        <div class="card text-center" style="width: 18rem;">
					          <img src="<%=request.getContextPath()%>/asset/img/product01.jpg" class="card-img-top" 
					          		alt=""/>
					          <div class="card-body">
					            <h5 class="card-title"></h5>
								<a href="<%=request.getContextPath()%>/product/productcollection.do?action=get_By_Mem" class="btn btn-primary">收藏商品</a>
					          </div>
					        </div>	
					    </div>					

					</div>
					<div class="col">
						<div class="col-12 row justify-content-center">
							<div class="card text-center" style="width: 18rem;">
								<img src="<%=request.getContextPath()%>/asset/img/product01.jpg"
									class="card-img-top" alt="" />
								<div class="card-body">
									<h5 class="card-title"></h5>
									<a
										href="<%=request.getContextPath()%>/front_end/product/sellerAllProducts.jsp"
										class="btn btn-primary">商品管理</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="col-12 row justify-content-center">
							<div class="card text-center" style="width: 18rem;">
								<img src="<%=request.getContextPath()%>/asset/img/product01.jpg"
									class="card-img-top" alt="" />
								<div class="card-body">
									<h5 class="card-title"></h5>
									<a
										href="<%=request.getContextPath()%>/front_end/product/sellerProduct.jsp"
										class="btn btn-primary">新增商品</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="col-12 row justify-content-center">
							<div class="card text-center" style="width: 18rem;">
								<img src="<%=request.getContextPath()%>/asset/img/product01.jpg"
									class="card-img-top" alt="" />
								<div class="card-body">
									<h5 class="card-title"></h5>
									<a
										href="<%=request.getContextPath()%>/front_end/product/front_ProductOrder_ListAll_Sell.jsp"
										class="btn btn-primary">賣家訂單</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="col-12 row justify-content-center">
							<div class="card text-center" style="width: 18rem;">
								<img src="<%=request.getContextPath()%>/asset/img/product01.jpg"
									class="card-img-top" alt="" />
								<div class="card-body">
									<h5 class="card-title"></h5>
									<a
										href="<%=request.getContextPath()%>/front_end/product/listAllproductOrder.jsp"
										class="btn btn-primary">買家訂單</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>