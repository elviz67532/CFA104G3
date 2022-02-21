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

</head>
<style>
.section {
	/* 	border:2px black solid; */
	text-align: center;
	background-color: rgba(196, 220, 179, 0.2);
	font-size: 0;
	z-index: -100;
	top: 50px;
	bottom: 100px;
}

.titleh1 h1 {
	text-align: center;
	font-size: 25px;
	line-height: 50px;;
}

.buttondiv {
	position: absolute;
	top: 125px;
	display: inline;
	right: 120px;
}

.btn {
	box-sizing: border-box;
	appearance: none;
	background-color: transparent;
	border: 2px solid #3498db;
	border-radius: 0.6em;
	color: #3498db;
	cursor: pointer;
	align-self: center;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1;
	margin: 20px;
	padding: 1.2em 2.8em;
	text-decoration: none;
	text-align: center;
	text-transform: uppercase;
	font-family: 'Montserrat', sans-serif;
	font-weight: 700;
}

.btn {
	border-color: #3498db;
	color: #fff;
	box-shadow: 0 0 40px 40px #3498db inset, 0 0 0 0 #3498db;
	transition: all 150ms ease-in-out;
}

.btn:hover {
	color: black;
	outline: 0;
	box-shadow: 0 0 10px 0 #3498db inset, 0 0 10px 4px #3498db;
}

table {
	width: 800px;
	background-color: #DEFFFF;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #00C2C2;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
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
							前台買家訂單管理主頁
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
	<table id="table-1">
		<tr>
			<td>
				<h3>訂單資料</h3>
				<h4>
					<a href="front_ProductOrder_Retrieve.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0"></a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>

			<th>收件人姓名</th>
			<th>收件人電話</th>
			<th>收件人地址</th>

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