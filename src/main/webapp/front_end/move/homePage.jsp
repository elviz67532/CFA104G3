<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
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
</head>

<body>
	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>搬家</h1>
						<span class="subheading">新的地點、新的體驗</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 主體畫面設計  -->
	<!-- card -->
    <section  id="service">
        <div class="specialcontainer px-5 my-5">
            <h2 class="pb-2 border-bottom">搬家服務</h2>
            <div class="row">
            	<div class="col-md-4 col-sm-6 ">
                    <a href="aboutUs.jsp">
                        <div class="specialcard">
                            <img src="<%=request.getContextPath()%>/asset/img/moveorderpic.jpg" style="background-color:red" alt="關於我們">
                            <div class="specialcard-text">
                                <h3>關於我們</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6 ">
                    <a href="moveRequest.jsp">
                        <div class="specialcard">
                            <img src="<%=request.getContextPath()%>/asset/img/moveorderpic.jpg" style="background-color:red" alt="申請搬家">
                            <div class="specialcard-text">
                                <h3>申請搬家</h3>
                            </div>
                        </div>
                    </a>
                </div>
                
				<!-- 以jsp語法去產生 -->
                <div class="col-md-4 col-sm-6">
                    <a href="moveRequestManage.jsp">
                        <div class="specialcard">
                            <img src="<%=request.getContextPath()%>/asset/img/moveorderpic.jpg" style="background-color:red" alt="申請單">
                            <div class="specialcard-text">
                                <h3>申請單管理</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6">
                    <a href="<%=request.getContextPath()%>/front_end/move/moveorder.do?action=get_By_Mem">
                        <div class="specialcard">
                            <img src="<%=request.getContextPath()%>/asset/img/moveorderpic.jpg" style="background-color:red" alt="訂單">
                            <div class="specialcard-text">
                                <h3>訂單管理</h3>
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
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>