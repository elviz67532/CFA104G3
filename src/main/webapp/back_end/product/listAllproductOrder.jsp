
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order.model.*"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>委域</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">
					<!-- 全域錯誤、傳入參數 -->
					<%
					// 傳入參數
					ProductOrderServiceImpl poSvc = new ProductOrderServiceImpl();
					List<ProductOrderVO> list = poSvc.getAll();
					pageContext.setAttribute("list", list);

					// 顯示格式
					SimpleDateFormat ymdtmFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
					SimpleDateFormat ymdFormat = new SimpleDateFormat("yyyy/MM/dd");
					%>

					<!-- main -->
					<h1 class="h3 mb-2 text-gray-800">二手商城</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">訂單管理</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tr>
										<td>
											<h3>所有二手商品訂單</h3>
											<h4></h4>
										</td>
									</tr>
								</table>

								<%-- 錯誤表列 --%>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>

								<table>
									<tr>
										<th>訂單編號</th>
										<th>商品編號</th>
										<th>買家編號</th>
										<th>賣家編號</th>
										<th>收件人姓名</th>
										<th>收件人電話</th>
										<th>收件人地址</th>
										<th>訂單成立時間</th>
										<th>商品數量</th>
										<th>訂單總金額</th>
										<th>訂單狀態</th>
									</tr>
									<c:forEach var="productOrderVO" items="${list}">
										<%@ include file="page1.file"%>


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
											<td>${productOrderVO.status}</td>
											<td>
												<FORM METHOD="post" ACTION="productorder.do">

													<input type="submit" value="修改"> <input
														type="hidden" name="empno" value="${ProductVO.id}">
													<input type="hidden" name="action"
														value="getOne_For_Update">
												</FORM>
											</td>
											<td>
												<FORM METHOD="post" ACTION="productorder.do">
													<input type="submit" value="刪除"> <input
														type="hidden" name="empno" value="${ProductVO.id}">
													<input type="hidden" name="action" value="delete">
												</FORM>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
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

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

	<!-- 註冊按鈕觸發功能  -->
	<script>
		
	</script>
</body>

</html>