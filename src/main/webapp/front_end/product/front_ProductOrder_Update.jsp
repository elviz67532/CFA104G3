<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>

<%
ProductOrderVO vo = (ProductOrderVO) request.getAttribute("vo");
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
form {
	display: inline;
	border-radius: 16px;
}

form:hover {
	cursor: pointer;
	border-radius: 16px;
	margin-bottom: 0px;
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
							買家訂單資料修改
							<h1>
								<span class="subheading">二手商城</span>
					</div>
				</div>
			</div>
		</div>
	</header>




	<%-- 錯誤表列 --%>
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

			<a href="listAllproductOrder.jsp"><img src="images/back1.gif"
				width="100" height="32" border="0"></a> <br>
			<h3>訂單資料修改:</h3>

			<FORM METHOD="post" ACTION="productorder.do">
			
			
				<table class="table table-hover">
					<tr>

						<td>收件人姓名:</td>
						<td><input type="TEXT" name="productName" size="45"
							value="${vo.productName}" /></td>
					</tr>
					<tr>
						<td>收件人電話:</td>
						<td><input type="TEXT" name="phone" size="45"
							value="${vo.phone}" /></td>
					</tr>
					<tr>
						<td>收件人地址:</td>
						<td><input type="TEXT" name="address" size="45"
							value="${vo.address}" /></td>
					</tr>


					<jsp:useBean id="poSvc" scope="page"
						class="com.product_order.model.ProductOrderServiceImpl" />


				</table>
				<br> <input type="hidden" name="action" value="reviseOrder">
				<input type="hidden" name="id" value="${vo.id}"> <input
					type="submit" value="送出修改">
			</FORM>


			<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
			<!-- Bootstrap core JS-->

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>