<%@page import="com.move_photo.model.MovePhotoServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_order.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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
					MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
					List<MoveOrderVO> list = moSvc.getAll();
					pageContext.setAttribute("list", list);
					
					Map<Integer, String> statusMap = new HashMap<>();
					statusMap.put(0, "等待簽訂契約");
					statusMap.put(1, "不簽訂契約結束訂單");
					statusMap.put(2, "等待運送貨物");
					statusMap.put(3, "運送中");
					statusMap.put(4, "完成訂單");
					pageContext.setAttribute("map", statusMap);

					
					// 顯示格式
					SimpleDateFormat ymdtmFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
					SimpleDateFormat ymdFormat = new SimpleDateFormat("yyyy/MM/dd");
					%>

					<!-- main -->
					<h1 class="h3 mb-2 text-gray-800">搬家</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">訂單管理</h6>
						</div>
							<FORM METHOD="post" ACTION="moveorder.do">
								<b>請輸入訂單編號:</b><br> <input type="text" name="id"> 
								<input type="hidden" name="action" value="getOne_For_Display"> 
								<input type="submit" value="送出" style="background-color: #4e73df; color: white; text-align: center; border: 2px solid #4e73df;">
							</FORM>
							<FORM METHOD="post" ACTION="moveorder.do">
								<b>請輸入會員編號:</b><br> <input type="text" name="memberid">
								<input type="hidden" name="action" value="getMem_For_Display">
								<input type="submit" value="送出" style="background-color: #4e73df; color: white; text-align: center; border: 2px solid #4e73df;">
							</FORM>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>訂單編號</th>
											<th>會員編號</th>
											<th>客戶姓名</th>
											<th>客戶電話</th>
											<th>搬家目前地址</th>
											<th>搬家目的地地址</th>
											<th>搬家時間</th>
											<th>估價金額</th>
											<th>訂金</th>
											<th>最後付款金額</th>
											<th>訂單成立時間</th>
											<th>訂單狀態</th>
											<th>修改訂單</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>訂單編號</th>
											<th>會員編號</th>
											<th>客戶姓名</th>
											<th>客戶電話</th>
											<th>搬家目前地址</th>
											<th>搬家目的地地址</th>
											<th>搬家時間</th>
											<th>估價金額</th>
											<th>訂金</th>
											<th>最後付款金額</th>
											<th>訂單成立時間</th>
											<th>訂單狀態</th>
											<th>修改訂單</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="moveOrderVO" items="${list}">
										<tr>
											<td class="align-middle">${moveOrderVO.id}</td>
											<td class="align-middle">${moveOrderVO.memberId}</td>
											<td class="align-middle">${moveOrderVO.customer}</td>
											<td class="align-middle">${moveOrderVO.phone}</td>
											<td class="align-middle">${moveOrderVO.fromAddress}</td>
											<td class="align-middle">${moveOrderVO.toAddress}</td>
											<td class="align-middle">${moveOrderVO.moveDate}</td>
											<td class="align-middle">${moveOrderVO.amountFirst}</td>
											<td class="align-middle">${moveOrderVO.deposit}</td>
											<td class="align-middle">${moveOrderVO.amountTotal}</td>
											<td class="align-middle">${moveOrderVO.orderDate}</td>
											<td class="align-middle">${map[moveOrderVO.status]}</td>
											<td class="align-middle">
												<FORM METHOD="post"
													ACTION="<%=request.getContextPath()%>/back_end/move/moveorder.do"
													style="margin-bottom: 0px;">
													<input type="submit" value="修改"> 
													<input type="hidden" name="id" value="${moveOrderVO.id}"> 
													<input type="hidden" name="action" value="getOne_For_Update">
												</FORM>
											</td>
										</tr>
										</c:forEach>
									</tbody>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js" ></script>

	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>
	
	<!--  -->	
</body>

</html>