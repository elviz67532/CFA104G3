<%@ page import="com.member.model.MemberVO"%>
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
table{
  width: 100%;
  border-collapse: collapse;
}

table tr{
  border-bottom: solid 2px white;
}

table tr:last-child{
  border-bottom: none;
}

table th{
  position: relative;
  width: 30%;
  background-color: #7d7d7d;
  color: white;
  text-align: center;
  padding: 10px 0;
}

table th:after{
  display: block;
  content: "";
  width: 0px;
  height: 0px;
  position: absolute;
  top:calc(50% - 10px);
  right:-10px;
  border-left: 10px solid #7d7d7d;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
}

table td{
  text-align: left;
  width: 70%;
  text-align: center;
  background-color: #eee;
  padding: 10px 0;
}

.main {
  margin: 20px auto;
  item-align: center;
  width: 80%;
}
body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
</style>
<script>
$('#button1').click(function() {
	 alert('Hello World!');
});
</script>
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

	<h2>搬家訂單管理</h2>
	
<div class="main">

		<c:forEach var="moveOrderVO" items="${moveOrderVO}">
		
		<table>	
			<tr>
				<th class="text-nowrap">訂單編號:</th>
				<td>${moveOrderVO.id}</td>
			</tr>
			<tr>	
				<th class="text-nowrap">客戶姓名:</th>
				<td>${moveOrderVO.customer}</td>
			</tr>
			<tr>
				<th class="text-nowrap">客戶電話:</th>
				<td>${moveOrderVO.phone}</td>
			</tr>
			<tr>
				<th class="text-nowrap">搬家目前地址:</th>
				<td>${moveOrderVO.fromAddress}</td>
			</tr>
			<tr>
				<th class="text-nowrap">搬家目的地地址:</th>
				<td>${moveOrderVO.toAddress}</td>
			</tr>
			<tr>
				<th class="text-nowrap">搬家時間:</th>
				<td>${moveOrderVO.moveDate}</td>
			</tr>
			<tr>
				<th class="text-nowrap">估價金額:</th>
				<td>${moveOrderVO.amountFirst}元</td>
			</tr>
			<tr>
				<th class="text-nowrap">訂金:</th>
				<td>${moveOrderVO.deposit}元</td>
			</tr>
			<tr>
				<th class="text-nowrap">最終付款金額:</th>
				<td>${moveOrderVO.amountTotal}元</td>
			</tr>
			<tr>
				<th class="text-nowrap">訂單成立時間:</th>
				<td>${moveOrderVO.orderDate}</td>
			</tr>
			<tr>
				<th>給我們一點評論吧</th>
				<td>
					<FORM METHOD="post" ACTION="moveorder.do">
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
						<button id="button1" >送出</button>
					</FORM>
				</td>
			</tr>
		</table>
		<hr>
		
		</c:forEach>	
		
</div>


	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>