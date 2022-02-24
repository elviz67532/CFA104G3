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
<title>委域 | 聯絡我們</title>
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
<link href="vendor/bootstrap/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('asset/img/contact-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>聯絡我們</h1>
						<span class="subheading">很高興為您服務</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<c:if test="${not empty result}">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading" style="text-align: center;">
						<c:choose>
							<c:when test="${result == 1}">
								</label>
								<h1>訊息傳送成功</h1>
							</c:when>
							<c:otherwise>
								</label>
								<h1>訊息傳送失敗</h1>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- Main Content-->
	<main class="mb-4">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<p>遇到問題了嗎？留下您的聯絡方式，讓我們連繫您。</p>
					<div class="my-5">
						<!-- 						* * * * * * * * * * * * * * * * * SB Forms Contact Form * * * * * -->
						<!-- 						* * * * * * * * * * * * This form is pre-integrated with SB Forms. -->
						<!-- 						To make this form functional, sign up at -->
						<!-- 						https://startbootstrap.com/solution/contact-forms to get an API -->
						<!-- 						token! -->
						<form id="contactForm" METHOD="post" ACTION="contact.do">
							<div class="form-floating">
								<input name="name" class="form-control" id="name" type="text"
									placeholder="Enter your name..." data-sb-validations="required" />
								<label for="name">您的大名</label>
								<div class="invalid-feedback" data-sb-feedback="name:required">名字尚未填寫</div>
							</div>
							<div class="form-floating">
								<input name="email" class="form-control" id="email" type="email"
									placeholder="Enter your email..."
									data-sb-validations="required,email" /> <label for="email">電子信箱</label>
								<div class="invalid-feedback" data-sb-feedback="email:required">信箱尚未填寫</div>
								<div class="invalid-feedback" data-sb-feedback="email:email">信箱錯誤</div>
							</div>
							<div class="form-floating">
								<input name="phone" class="form-control" id="phone" type="tel"
									placeholder="Enter your phone number..."
									data-sb-validations="required" /> <label for="phone">連絡電話</label>
								<div class="invalid-feedback" data-sb-feedback="phone:required">電話號碼尚未填寫</div>
							</div>
							<div class="form-floating">
								<textarea name="massage" class="form-control" id="message"
									placeholder="Enter your message here..." style="height: 12rem"
									data-sb-validations="required"></textarea>
								<label for="message">給我們的訊息</label>
								<div class="invalid-feedback"
									data-sb-feedback="message:required">電子信箱尚未填寫</div>
							</div>
							<br />
							<div class="d-none" id="submitSuccessMessage">
								<div class="text-center mb-3">
									<div class="fw-bolder">Form submission successful!</div>
									To activate this form, sign up at <br /> <a
										href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
								</div>
							</div>
							<div class="d-none" id="submitErrorMessage">
								<div class="text-center text-danger mb-3">Error sending
									message!</div>
							</div>
							<input type="hidden" name="action" value="addmassage">
							<button type="submit">傳送</button>
						</form>


					</div>
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
	<script src="js/front_end/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
