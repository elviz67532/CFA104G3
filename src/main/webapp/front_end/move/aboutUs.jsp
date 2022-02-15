<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ page
import="java.util.*"%>
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
						<h1>關於我們</h1>
						<span class="subheading">委 域 搬 家</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 主體畫面設計  -->
	<main class="mb-4">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<a href='aboutUs.jsp'><b>經營理念</b></a><br>
					<a href='aboutService.jsp'><b>服務說明</b></a>
					<p>
					<h3>經營理念</h3>
					委域搬家成立於2021年12月，目前是台灣最新的搬家公司，參照前者經驗並且網羅許多具備經驗的員工，使得我們的服務完全不輸其他老字號的搬家公司。車隊規模擁有50輛貨車，師傅90名，是台灣唯一一個以網路平台為主體的搬家公司，
					因此在線上服務方面可以稱為台灣最強，我們可以保證，在線上服務方面我們擁有最完整並且最符合使用者的需求的功能，雖然才成立不到幾個月，但已經擁有20萬的會員申辦，1000件以上的服務成立，獲得大眾的支持是我們持續努力的動力。完全以使用者角度考量的流程設計能夠完全的保證消費者權益，
					服務完成後的評論功能能夠讓我們更加了解使用者的想法並且持續更新我們的服務，提供給用戶最完整的體驗
					</p>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>