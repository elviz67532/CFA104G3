<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product_photo.model.*"%>
<%@	page import="com.product.model.*"%>
<%
	ProductServiceImpl productService = new ProductServiceImpl();
	List<ProductVO> list = productService.getProductsByType(4);
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
    <style>
	  .SEARCHFOR{
	  padding:10px;
	  margin-bottom: 30px;
	}
	#pagination{
	  bottom: 0;
	}
	.d-block{
	  height: 30%;
	}
	.myImg {
	  height:  400px;
	  background-repeat: no-repeat;
	  background-attachment: fixed;
	  background-position: center;
	  background-size: cover;
	}
	.pagination{
		margin: 10px
	}
	.card{
		margin: 5px
	}
	img{
	    max-height:256px;
	    width:auto;
	    height:auto;
	}	
	</style>
</head>

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
   	<div class="row justify-content-center">
      <div class="col-lg-6 SEARCHFOR">
      </div>
    </div>

	<!-- 輪播 (Carousel) -->
    <!-- 搭配圖片滿版 -->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="d-block w-100 myImg" style="background-image: url(assets/img/news1.jpg)"></div>
        </div>
        <div class="carousel-item">
          <div class="d-block w-100 myImg" style="background-image: url(assets/img/news2.jpg)"></div>
        </div>
        <div class="carousel-item">
          <div class="d-block w-100 myImg" style="background-image: url(assets/img/news3.jpg)"></div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
	
	<div class="container">
		<div class="row">
			<!-- 左邊3欄  list group 分類功能-->
			<div class="col-12 col-md-3 list-group">
				<FORM METHOD="post" ACTION="product/ProductServlet">
				  <a href="homePage.jsp" class="list-group-item list-group-item-action" aria-current="true">
				    總覽
				  </a>
				  <a href="<%=request.getContextPath() %>/front_end/product/browseElec.jsp"  name="prodType" value=4 class="list-group-item list-group-item-action active">電器類</a>
				  <a href="<%=request.getContextPath() %>/front_end/product/browseFurniture.jsp" class="list-group-item list-group-item-action">寢具</a>
				  <a href="<%=request.getContextPath() %>/front_end/product/browseOthers.jsp" class="list-group-item list-group-item-action">其他</a>
				  <a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp" class="list-group-item list-group-item-action">買賣家</a>				  
				</FORM>
			</div>
			<!-- 右邊9欄  card 卡片 & text-center -->
			<div class="col-12 col-md-9">
				<div class="row">
					<div class="col">
					    <div class="col-12 row justify-content-center">
						<c:forEach var="productVO" items="${list}">
					        <div class="card text-center" style="width: 18rem;">
					          <img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}" class="card-img-top" 
					          		alt="<%=request.getContextPath()%>/assets/img/home-bg.jpg"/>
					          <div class="card-body">
					            <h5 class="card-title">${productVO.name}</h5>
					<%--             <p class="card-text">${productVO.prodDesc}</p> --%>
					            <a href="#" class="btn btn-primary">查看詳情</a>
					<%--             <a href="#" class="btn btn-primary">${productVO.prodName}</a> --%>
					          </div>
					        </div>	
						</c:forEach>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>