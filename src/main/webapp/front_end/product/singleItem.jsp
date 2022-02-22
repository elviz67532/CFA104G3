<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product.model.ProductVO"%>

<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	System.out.println("productVO: " + productVO);
%>




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
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
       	  rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
</head>

<body>
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
   	
    <!-- 商品簡述 section-->
    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-start">
                <div class="col-md-6">
                    <img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}"
                        alt="..." />
                </div>
                
                <div class="col-md-6 gy-3">
                    
                    <div class="mb-2">
                        <h1 class="fw-bolder text-dark"><%=productVO.getName()%></h1>
                    </div>
                    
                    <div class="fs-5 mb-2 fw-bold text-dark">上架時間: <%=productVO.getLaunchedDate()%></div>
                    
                    <div class="fs-5 mb-2 fw-bold text-dark">商品地點: <%=productVO.getLocation()%></div>
                    
                    <div class="fs-5 mb-2 fw-bold text-dark">商品狀態: <%=productVO.getStatus()%></div>                     
                                        
                    <div class="fs-4 mb-4 fw-bold text-dark">商品金額:                    
                        <span class="text-decoration-line-through">$3999.00</span>
                        <span class="text-danger">$<%=productVO.getPrice()%>.00</span>
                    </div>
                    
                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 下方-->
                    <div class="d-flex">
                        <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1"
                            style="max-width: 3rem" readonly />
                        <button class="btn btn-outline-dark flex-shrink-0 me-1" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            購買
                        </button>
                        <button class="btn btn-outline-dark flex-shrink-0 me-1" type="button">
                            <i class="bi bi-bookmarks-fill"></i>
                            收藏
                        </button>
                        <button class="btn btn-outline-dark flex-shrink-0 me-1" type="button">
                            <i class="bi bi-people-fill"></i>
                            回報
                        </button>
                    </div>
                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 上方-->
                </div>
            </div>
        </div>
    </section >
    
	<!-- 商品詳情 section-->
	<section class="py-5">
    <div class="container my-5 d-grid gap-5">
       <div class="p-5 border border-dark rounded">     	
		   <div class="fs-4 mb-2 fw-bold text-dark">商品名稱: <%=productVO.getName()%></div>
		   
           <div class="fs-4 mb-2 fw-bold text-dark">商品編號: <%=productVO.getId()%></div>

           <div class="fs-4 mb-2 fw-bold text-dark">會員編號: <%=productVO.getSellerMemberId()%></div>
                    
           <div class="fs-4 mb-2 fw-bold text-dark">上架時間: <%=productVO.getLaunchedDate()%></div>
                    
           <div class="fs-4 mb-2 fw-bold text-dark">商品地點: <%=productVO.getLocation()%></div>
                                                           
           <div class="fs-4 mb-2 fw-bold text-dark">商品描述: <p class=" fs-5 mb-2 text-dark"><%=productVO.getDescription()%></p></div>                                           
       </div>
    </div>         
	</section>


   	<!-- Related items section-->
   	<jsp:include page="/front_end/product/relatedItems.jsp"></jsp:include>
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>