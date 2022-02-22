<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<%
ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
List<ProductOrderVO> list = poSvc.getAll();
pageContext.setAttribute("list", list);

Map<Integer, String> statusMap = new HashMap<>();
statusMap.put(0, "待出貨");
statusMap.put(1, "已出貨");
statusMap.put(2, "完成訂單");
statusMap.put(3, "待撥款");
statusMap.put(4, "已撥款");
statusMap.put(5, "待退款1");
statusMap.put(6, "待退款2");
statusMap.put(7, "已退款1");
statusMap.put(8, "已退款2");

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
<link
	href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

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
							前台賣家訂單管理主頁
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
	<li><a href="front_ProductOrder_Retrieve.jsp"><input
			type="submit" value="商品訂單查詢"></a>
	<li>
		<table>
			<thead>
				<tr>
					<th class="text-nowrap">訂單編號</th>
					<th class="text-nowrap">商品編號</th>

					<th class="text-nowrap">買家編號</th>
					<th class="text-nowrap">收件人姓名</th>
					<th class="text-nowrap">收件人電話</th>
					<th class="text-nowrap">收件人地址</th>
					<th class="text-nowrap">訂單成立時間</th>
					<th class="text-nowrap">商品數量</th>
					<th class="text-nowrap">訂單總金額</th>
					<th class="text-nowrap">訂單狀態</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th class="text-nowrap">訂單編號</th>
					<th class="text-nowrap">商品編號</th>

					<th class="text-nowrap">買家編號</th>
					<th class="text-nowrap">收件人姓名</th>
					<th class="text-nowrap">收件人電話</th>
					<th class="text-nowrap">收件人地址</th>
					<th class="text-nowrap">訂單成立時間</th>
					<th class="text-nowrap">商品數量</th>
					<th class="text-nowrap">訂單總金額</th>
					<th class="text-nowrap">訂單狀態</th>
				</tr>
			</tfoot>
			<%@ include file="page1.jsp"%>
			<c:forEach var="productOrderVO" items="${list}"
				begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

				<tbody>
					<tr>
						<td>${productOrderVO.id}</td>
						<td>${productOrderVO.productId}</td>

						<td>${productOrderVO.customerMemberId}</td>
						<td>${productOrderVO.productName}</td>
						<td>${productOrderVO.phone}</td>
						<td>${productOrderVO.address}</td>
						<td>${productOrderVO.date}</td>
						<td>${productOrderVO.amountOfProduct}</td>
						<td>${productOrderVO.amountOfPrice}</td>
						<td>${productOrderVO.status}</td>


					</tr>
				</tbody>
			</c:forEach>
		</table> <%@ include file="page2.jsp"%> <!-- Footer-->
		<jsp:include page="/front_end/common/footer.jsp"></jsp:include> <!-- Bootstrap core JS-->

		<script
			src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts --> <script
			src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>
</body>

</html>