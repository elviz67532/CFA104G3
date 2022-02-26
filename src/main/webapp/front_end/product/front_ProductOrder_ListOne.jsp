<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>

<%
ProductOrderVO productOrderVO = (ProductOrderVO) request.getAttribute("productOrderVO");
%>

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
.innerDiv {
	width: 60%;
	margin: 0 auto;
	padding: 60px 20px 0;
}

.innerDiv h2 {
	text-align: center;
}

.innerDiv h2:hover {
	color: gray;
	cursor: grabbing;
}

.memId {
	margin: 0;
	padding: 0;
}

.formLabel {
	font-size: 14px;
	font-weight: 600;
	color: #282828;
	/*     line-height: 1.71; */
	/*     padding-bottom: 10px; */
	/* text-align: center; */
	/* font: 1rem 'Fira Sans', sans-serif; */
}

.launchedDate {
	color: #b5bac1;
	font-size: 14px;
	font-weight: 500;
	margin: 4px 8px;
}

.actFormInput {
	width: 100%;
	flex: 1;
	border: 0;
	padding: 8px 24px;
	background-color: #f1f1f1;
	position: relative;
	font-size: 16px;
	border-radius: 0;
}

.actSelect {
	width: 100%;
	flex: 1;
	border: 0;
	padding: 0 24px;
	background-color: #f1f1f1;
	position: relative;
	font-size: 16px;
	border-radius: 0;
}

.actSelect:hover {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

.actPhoto {
	width: 100%;
	flex: 1;
	border: 0;
	padding: 0 24px;
	background-color: #f1f1f1;
	position: relative;
	font-size: 16px;
	border-radius: 0;
}

.actTimeFormInput {
	width: 100%;
	flex: 1;
	border: 0;
	padding: 0 24px;
	background-color: #f1f1f1;
	position: relative;
	font-size: 16px;
	border-radius: 0;
}

/*input hover*/
input[type="text"]:focus {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

input[type="number"]:focus {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

input[type="date"]:focus {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

input[type="datetime-local"]:focus {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

textarea:focus {
	border: 2px solid black;
	opacity: 0.8;
	background-color: #30dd8a;
}

.btn {
	width: 100%;
	padding: 16px 40px;
	margin: 8px 0 60px 0;
}

.btn-hover {
	width: 200px;
	font-size: 16px;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
	margin: 20px;
	height: 55px;
	text-align: center;
	border: none;
	background-size: 300% 100%;
	border-radius: 50px;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
}

.btn-hover:hover {
	background-position: 100% 0;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
}

.btn-hover:focus {
	outline: none;
}

.btn-hover.color-5 {
	background-image: linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673);
	box-shadow: 0 4px 15px 0 rgba(23, 168, 108, 0.75);
}

table th {
	color: black;
	padding: 5px 10px;
	text-align: center;
}

td {
	text-align: center;
}
</style>

</head>
<body>

	<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('${pageContext.request.contextPath}/asset/img/product01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>
							買家訂單檢索
							<h1>
								<span class="subheading">二手商城</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- 成功顯示, disabled, 隱藏送出 -->

	<!-- 主體畫面設計  -->

	<!-- 程式例外錯誤 -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div style="width: 100%;">
		<div style="margin: 0 auto; width: 36%;">
			<table class="table table-hover">
				<tr>
					<td>

						<h4>
							<a href="listAllproductOrder.jsp"><img src="images/back1.gif"
								width="100" height="32" border="0"></a>
						</h4>
					</td>
				</tr>
			</table>

			<table>
				<tr>


					<th class="text-nowrap">收件人姓名</th>
					<th class="text-nowrap">收件人電話</th>
					<th class="text-nowrap">收件人地址</th>


				</tr>
				<tr>

					<td>${productOrderVO.productName}</td>
					<td>${productOrderVO.phone}</td>
					<td>${productOrderVO.address}</td>


				</tr>
			</table>
			</script>
			<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
			<!-- Bootstrap core JS-->

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>