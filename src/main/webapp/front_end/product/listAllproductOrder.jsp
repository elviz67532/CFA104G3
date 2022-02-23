<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
if (memberVo == null) {
	System.out.println("尚未登入");
	response.sendRedirect(request.getContextPath() + "/front_end/member/login.jsp");
	return;
}
Integer id = memberVo.getId();
List<ProductOrderVO> list = poSvc.retrieveByBuyerId(id);
pageContext.setAttribute("list", list);
%>
<%
Map<Integer, String> map = new HashMap<>();
map.put(0, "待出貨");
map.put(1, "已出貨");
map.put(2, "完成訂單(待撥款給賣方)");
map.put(3, "待撥款");
map.put(4, "已撥款給賣方");
map.put(5, "待退款(買方取消訂單)"); //買家取消訂單
map.put(6, "待退款(買方退貨)");
map.put(7, "已退款(買方取消訂單)");
map.put(8, "已退款(買方退貨)");
map.put(9, "待退款(賣方取消訂單)"); //賣家取消訂單
map.put(10, "已退款(賣方取消訂單)");
pageContext.setAttribute("map", map);
%>



<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link href="<%=request.getContextPath()%>/css/activity/backNewFile.css"
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
							買家訂單管理主頁
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
	<!-- 	<li> -->
	<!-- 		<FORM METHOD="post" -->
	<%-- 			ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do"> --%>
	<!-- 			<b>輸入訂單編號 (如1):</b> <input type="text" name="id"> <input -->
	<!-- 				type="hidden" name="action" value="getOne_For_Displayfront"> -->
	<!-- 			<input type="submit" value="送出"> -->
	<!-- 		</FORM> -->
	<!-- 	</li> -->
	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do">
		<b>請輸入會員編號檢索訂單:</b> <input type="text" name="id"> <input
			type="hidden" name="action" value="retrieveByBuyerId"> <input
			type="submit" value="送出">
	</FORM>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th class="text-nowrap">訂單編號</th>
				<th class="text-nowrap">商品編號</th>
				<th class="text-nowrap">賣家編號</th>
				<th class="text-nowrap">收件人姓名</th>
				<th class="text-nowrap">收件人電話</th>
				<th class="text-nowrap">收件人地址</th>
				<th class="text-nowrap">訂單成立時間</th>
				<th class="text-nowrap">商品數量</th>
				<th class="text-nowrap">訂單總金額</th>
				<th class="text-nowrap">訂單狀態</th>
				<th class="text-nowrap">訂單變動</th>
			</tr>
		</thead>

		<%@ include file="page1.jsp"%>
		<c:forEach var="productOrderVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tbody>
				<tr>
					<td>${productOrderVO.id}</td>
					<td>${productOrderVO.productId}</td>

					<td>${productOrderVO.sellerMemberId}</td>
					<td>${productOrderVO.productName}</td>
					<td>${productOrderVO.phone}</td>
					<td>${productOrderVO.address}</td>
					<td>${productOrderVO.date}</td>
					<td>${productOrderVO.amountOfProduct}</td>
					<td>${productOrderVO.amountOfPrice}</td>

					<td>${map[productOrderVO.status]}</td>
					<td>

						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do">

							<input type="hidden" name="action"
								value="getOne_For_Update_Order_Front"><input
								type="hidden" name="id" value="${productOrderVO.id}"><input
								type="submit" value="修改">
						</FORM>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do">
							<input type="hidden" name="action" value="cancelOne"> <input
								type="hidden" name="id" value="${productOrderVO.id}"> <input
								type="submit" value="取消">
						</FORM>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do">
							<input type="hidden" name="action" value="returnOne"> <input
								type="hidden" name="id" value="${productOrderVO.id}"> <input
								type="submit" value="退貨">
						</FORM>


						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front_end/product/productorder.do">
							<input type="hidden" name="action" value="complete"> <input
								type="hidden" name="id" value="${productOrderVO.id}"> <input
								type="submit" value="完成訂單">
						</FORM>


					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<%@ include file="page2.jsp"%>
	<!-- Footer-->


	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>