<%@page import="com.move_photo.model.MovePhotoServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_request.model.*"%>
<%@ page import="com.move_photo.model.*"%>
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
					// 傳入參數
					MoveRequestService moveRequestService = new MoveRequestServiceImpl();
					List<MoveRequestVO> allRequests = moveRequestService.findAllRequests();
					
					// 顯示格式
					SimpleDateFormat ymdtmFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
					SimpleDateFormat ymdFormat = new SimpleDateFormat("yyyy/MM/dd");
					%>

					<!-- main -->
					<h1 class="h3 mb-2 text-gray-800">搬家</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">申請單管理</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>處理狀態</th>
											<th>狀態</th>
											<th>估價方式</th>
											<th>會員</th>
											<th>搬家日期</th>
											<th>估價日期</th>
											<th>申請日期</th>
											<th>細節</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>處理狀態</th>
											<th>狀態</th>
											<th>估價方式</th>
											<th>會員</th>
											<th>搬家日期</th>
											<th>估價日期</th>
											<th>申請日期</th>
											<th>細節</th>
										</tr>
									</tfoot>
									<tbody>
										<%
                                    	for (MoveRequestVO vo : allRequests) {
                                       	%>
										<tr>
											<td><%=vo.getHandled() == null ? "" : EHandled.parseCode(vo.getHandled()).getText()%></td>
											<td><%=vo.getStatus() == null ? "" : EMoveRequestStatus.parseCode(vo.getStatus()).getText()%></td>
											<td><%=vo.getEvaluateType() == null ? "" : EMoveRequestEvaType.parseCode(vo.getEvaluateType()).getText()%></td>
											<td><%=vo.getMemberId()%></td>
											<td><%=vo.getMoveDate() == null ? "" : ymdFormat.format(vo.getMoveDate())%></td>
											<td><%=vo.getEvaluateDate() == null ? "" : ymdFormat.format(vo.getEvaluateDate())%></td>
											<td><%=vo.getRequestDate() == null ? "" : ymdtmFormat.format(vo.getRequestDate())%></td>
											<!-- 跳轉 -->
											<td><button type="button" class="viewRequest"
													value="<%=vo.getId()%>">查看</button></td>
										</tr>
										<%
                                    	}
                                    	%>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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
	<script>
		$("button[class='viewRequest']").click(function(){
	        let self = this;
	        let requestId = self.value;
			
	        document.cookie = 'requestId=' + requestId;

	        window.location.href='moveRequest.jsp';
		});
	</script>
</body>

</html>