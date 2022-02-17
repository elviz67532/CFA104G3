<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>

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
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

.box1 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box2 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box3 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
}

.box4 {
	width: 200px;
	background-color: black;
	margin-top: auto;
	margin-right: 0px;
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
							訂單管理前台主頁
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
	<c:if test="${not empty exception}">
		<font style="color: red">請修正以下錯誤:</font>
		<li style="color: red">${exception}</li>
	</c:if>

	<h3>訂單查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href="listAllproductOrder.jsp"><input type="submit"
				value="所有二手商品訂單"></a>
		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>輸入訂單編號 (如1):</b> <input type="text" name="id"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="proSvc" scope="page"
			class="com.product_order.model.ProductOrderServiceImpl" />

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>選擇賣家編號:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="product.do">
				<b>選擇買家編號:</b> <select size="1" name="id">
					<c:forEach var="productVO" items="${proSvc.all}">
						<option value="${productVO.id}">${productVO.productId}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>訂單管理</h3>

	<ul>
		<li><a href="listAllproductOrder.jsp"><input type="submit"
				value="新增二手商品訂單"></a>
	</ul>




	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>