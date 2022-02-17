<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.faq.model.*"%>
<%
// 傳入參數
FaqServiceImpl faqSvc = new FaqServiceImpl();
List<FaqVO> list = faqSvc.getAll();
request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/styles.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/move/moveCommon.css"
	rel="stylesheet" type="text/css" />

</head>

<body>

	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('${pageContext.request.contextPath}/asset/img/bgHome01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>FAQ</h1>
						<span class="subheading">常見問題</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 成功顯示, disabled, 隱藏送出 -->

	<!-- 主體畫面設計  -->

	<!-- 程式例外錯誤 -->
	<c:if test="${not empty exception}">
		<font style="color: red">請修正以下錯誤:</font>
		<li style="color: red">${exception}</li>
	</c:if>

	<div class="accordion accordion-flush" id="accordionFlushExample">
		<c:forEach var="faqVO" items="${list}" varStatus="s">
			<div style="margin: 0 auto; width: 80%" class="accordion-item">
				<h2 class="accordion-header" id="flush-heading${s.count}">
					<button style="background-color: #ECF5FF;"
						class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#flush-collapse${s.count}" aria-expanded="false"
						aria-controls="flush-collapse${s.count}">${faqVO.id}.
						${faqVO.question}</button>
				</h2>
				<div id="flush-collapse${s.count}"
					class="accordion-collapse collapse"
					aria-labelledby="flush-heading${s.count}"
					data-bs-parent="#accordionFlushExample">
					<div class="accordion-body">${faqVO.answer}</div>
				</div>
			</div>
	</div>
	</c:forEach>



	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>