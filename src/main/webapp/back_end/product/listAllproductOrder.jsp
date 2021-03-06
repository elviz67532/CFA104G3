<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<%
// 傳入參數
ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
List<ProductOrderVO> list = poSvc.getAll();
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
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>委域後台商品訂單管理主頁</title>
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
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">


					<!-- main -->
					<h1>後台商品訂單管理</h1>


					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-nowrap">訂單編號</th>
								<th class="text-nowrap">商品編號</th>
								<th class="text-nowrap">買家編號</th>
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
						<tfoot>
							<tr>
								<th class="text-nowrap">訂單編號</th>
								<th class="text-nowrap">商品編號</th>
								<th class="text-nowrap">買家編號</th>
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
						</tfoot>
						<%@ include file="page1.jsp"%>
						<c:forEach var="productOrderVO" items="${list}"
							begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

							<tbody>
								<tr>
									<td>${productOrderVO.id}</td>
									<td>${productOrderVO.productId}</td>
									<td>${productOrderVO.customerMemberId}</td>
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
											ACTION="<%=request.getContextPath()%>/back_end/product/productorderback.do">
											<input type="hidden" name="action" value="accountTwo">
											<input type="hidden" name="id" value="${productOrderVO.id}">
											<input type="submit" value="撥款">
										</FORM>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/back_end/product/productorderback.do">
											<input type="hidden" name="action" value="returnTwo">
											<input type="hidden" name="id" value="${productOrderVO.id}">
											<input type="submit" value="退款">
										</FORM>
									</td>
								</tr>
						</c:forEach>
					</table>
					<%@ include file="page2.jsp"%>
					<!-- end of main -->
				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>
	<!-- End of Page Wrapper -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

	<!-- custom script -->


	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>

	<!-- 註冊按鈕觸發功能  -->
	<script>
		
	</script>
</body>

</html>