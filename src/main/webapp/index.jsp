<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域 | 主頁</title>
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
    <link href="vendor/bootstrap/css/styles.css" rel="stylesheet" />
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>New Life</h1>
                        <span class="subheading">迎 接 全 新 的 人 生</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- card -->
    <section  id="service">
        <div class="specialcontainer px-5 my-5">
            <h2 class="pb-2 border-bottom">服務</h2>
            <div class="row">
                <div class="col-md-4 col-sm-6 ">
                    <a href="front_end/move/homePage.jsp">
                        <div class="specialcard">
                            <img src="asset/img/move01.jpg" alt="前往搬家">
                            <div class="specialcard-text">
                                <h3>搬家</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6">
                    <a href="front_end/product/homePage.jsp">
                        <div class="specialcard">
                            <img src="asset/img/product01.jpg" alt="前往二手商城">
                            <div class="specialcard-text">
                                <h3>二手</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6">
                    <a href="front_end/activity/homePage.jsp">
                        <div class="specialcard">
                            <img src="asset/img/activity01.jpg" alt="前往活動">
                            <div class="specialcard-text">
                                <h3>活動</h3>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>


    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/front_end/scripts.js"></script>
</body>

</html>