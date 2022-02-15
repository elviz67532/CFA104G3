<%@page import="com.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_order.model.*"%>
<%
List<MoveOrderVO> moveOrderVO = (List<MoveOrderVO>) request.getAttribute("moveOrderVO");
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
table {
	width: 500px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, td {
	border: 1px solid #CCCCFF;
}

td {
	padding: 5px;
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
		style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
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

	<!-- 主體畫面設計  -->
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<h2>搬家訂單</h2>

		<table>
			<tr>
				<th class="text-nowrap">訂單編號:</th>
				<th class="text-nowrap">客戶姓名:</th>
				<th class="text-nowrap">客戶電話:</th>
				<th class="text-nowrap">搬家目前地址:</th>
				<th class="text-nowrap">搬家目的地地址:</th>
				<th class="text-nowrap">搬家時間:</th>
				<th class="text-nowrap">估價金額:</th>
				<th class="text-nowrap">訂金:</th>
				<th class="text-nowrap">最終付款金額:</th>
				<th class="text-nowrap">訂單成立時間:</th>
			</tr>
			<c:forEach var="moveOrderVO" items="${moveOrderVO}">
			<tr>
				<td>${moveOrderVO.id}</td>
				<td>${moveOrderVO.customer}</td>
				<td>${moveOrderVO.phone}</td>
				<td>${moveOrderVO.fromAddress}</td>
				<td>${moveOrderVO.toAddress}</td>
				<td>${moveOrderVO.moveDate}</td>
				<td>${moveOrderVO.amountFirst}</td>
				<td>${moveOrderVO.deposit}</td>
				<td>${moveOrderVO.amountTotal}</td>
				<td>${moveOrderVO.orderDate}</td>
				<td>
					<FORM METHOD="post" ACTION="moveorder.do">
						<b>給我們一點評論吧>>></b> 
						<input type="hidden" name="action" value="updatecomment"> 
						<input type="hidden" name="id" value="${moveOrderVO.id}"> 
						<input type="hidden" name="memberId" value="${moveOrderVO.memberId}"> 
						<input type="hidden" name="customer" value="${moveOrderVO.customer}">
						<input type="hidden" name="phone" value="${moveOrderVO.phone}">
						<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}"> 
						<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}"> 
						<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
						<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}"> 
						<input type="hidden" name="deposit" value="${moveOrderVO.deposit}"> 
						<input type="hidden" name="amountTotal" value="${moveOrderVO.amountTotal}">
						<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}">
						<textarea style="height: 300px; width: 500px;" name="comment">${moveOrderVO.comment}</textarea>
						<input type="hidden" name="status" value="${moveOrderVO.status}">
						<input type="submit" value="送出">

					</FORM>
				</td>
			</tr>
			</c:forEach>
		</table>



	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>