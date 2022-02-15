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
    <title>委域 | 關於我們</title>
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
    <header class="masthead" style="background-image: url('asset/img/about-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h1>關於我們</h1>
                        <!-- <span class="subheading"></span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Main Content-->
    <main class="mb-4">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <h2>平台緣由</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque
                        architecto error, repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae
                        voluptatum in officia voluptas voluptatibus, minus!</p>
                    <h2>團隊理念</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut consequuntur magnam, excepturi
                        aliquid ex itaque esse est vero natus quae optio aperiam soluta voluptatibus corporis atque iste
                        neque sit tempora!</p>
                    <h2>展望抱負</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur
                        voluptates odit, fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam
                        ducimus consectetur?</p>
                </div>
            </div>
        </div>
    </main>
	
	<!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>

		
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/front_end/scripts.js"></script>
</body>

</html>