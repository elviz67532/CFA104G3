<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>


ProductCollectionVO vo = (ProductCollectionVO) request.getAttribute("");



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
   	
    <!-- Product section-->
    <section class="py-5">
        <div class="container px-5 px-lg-6 my-6">
            <div class="row gx-4 gx-lg-5 align-items-start">
                <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x400/000000/fff.jpg"
                        alt="..." />
                </div>
                <div class="col-md-6 align-items-start">
                    <div class="mb-1">
                        <h1 class="fw-bolder">鬼滅之刃1-23【套書】</h1>
                    </div>
                    <div class="small mb-1">商品編號: BST-498</div>

                    <div class="small mb-1">會員編號:

                    </div>
                    <div class="small mb-1">上架時間:

                    </div>
                    <div class="small mb-1">商品地點:

                    </div>
                    <div class="small mb-1">商品描述:
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem
                            quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius
                            blanditiis delectus ipsam minima ea iste laborum vero?</p>
                    </div>
                    <div class="fs-4 mb-4">
                        <span class="text-decoration-line-through">$45.00</span>
                        <span>$40.00</span>
                    </div>
                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 下方-->
                    <div class="d-flex">
                        <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1"
                            style="max-width: 3rem" readonly />
                        <button class="btn btn-outline-dark flex-shrink-0 me-1" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            購買
                        </button>
                        <FORM METHOD="post" ACTION="productcollection.do">
                        <input type="hidden" name="action" value="insert">
                        <button type="button"> 
                            收藏
                        </button>
                        </FORM>
                        <button class="btn btn-outline-dark flex-shrink-0 me-1" type="button">
                            <i class="bi bi-people-fill"></i>
                            回報
                        </button>
                    </div>
                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 上方-->
                </div>
            </div>
        </div>
    </section>



   	<!-- Related items section-->
   	<jsp:include page="/front_end/common/relatedItems.jsp"></jsp:include>
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>