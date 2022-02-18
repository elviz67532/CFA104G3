<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_order.model.*"%>
<%
MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
List<MoveOrderVO> list = moSvc.getAll();
pageContext.setAttribute("list", list);
%>
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
	background-color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
.box2 {
	width: 200px;
	background-color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
.box3 {
	width: 200px;
	background-color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
.box4 {
	width: 200px;
	background-color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
</style>
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
					<h1>超精美後台畫面</h1>
					<table>

						<tr>
							<th class="text-nowrap">訂單編號</th>
							<th class="text-nowrap">會員編號</th>
							<th class="text-nowrap">客戶姓名</th>
							<th class="text-nowrap">客戶電話</th>
							<th class="text-nowrap">搬家目前地址</th>
							<th class="text-nowrap">搬家目的地地址</th>
							<th class="text-nowrap">搬家時間</th>
							<th class="text-nowrap">估價金額</th>
							<th>訂金</th>
							<th class="text-nowrap">最後付款金額</th>
							<th class="text-nowrap">訂單成立時間</th>
							<th>評論</th>
							<th class="text-nowrap">訂單狀態</th>
						</tr>
						<c:forEach var="moveOrderVO" items="${list}">
							<tr>
								<td>${moveOrderVO.id}</td>
								<td>${moveOrderVO.memberId}</td>
								<td>${moveOrderVO.customer}</td>
								<td>${moveOrderVO.phone}</td>
								<td>${moveOrderVO.fromAddress}</td>
								<td>${moveOrderVO.toAddress}</td>
								<td>${moveOrderVO.moveDate}</td>
								<td>${moveOrderVO.amountFirst}</td>
								<td>${moveOrderVO.deposit}</td>
								<td>
									<FORM METHOD="post" ACTION="moveorder.do">
										<input type="hidden" name="action" value="update"> <input
											type="hidden" name="id" value="${moveOrderVO.id}"> <input
											type="hidden" name="memberId" value="${moveOrderVO.memberId}">
										<input type="hidden" name="customer"
											value="${moveOrderVO.customer}"> <input type="hidden"
											name="phone" value="${moveOrderVO.phone}"> <input
											type="hidden" name="fromAddress"
											value="${moveOrderVO.fromAddress}"> <input
											type="hidden" name="toAddress"
											value="${moveOrderVO.toAddress}"> <input
											type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
										<input type="hidden" name="amountFirst"
											value="${moveOrderVO.amountFirst}"> <input
											type="hidden" name="deposit" value="${moveOrderVO.deposit}">
										<input type="text" name="amountTotal"
											value="${moveOrderVO.amountTotal}"> <input
											type="hidden" name="comment" value="${moveOrderVO.comment}">
										<input type="hidden" name="orderDate"
											value="${moveOrderVO.orderDate}"> <input
											type="hidden" name="status" value="${moveOrderVO.status}">
										<input type="submit" value="送出">

									</FORM>
								</td>
								<td>${moveOrderVO.orderDate}</td>
								<td>${moveOrderVO.comment}</td>
								<td>
									<FORM METHOD="post" ACTION="moveorder.do">
										<input type="hidden" name="action" value="updatestatusto1">
										<input type="hidden" name="id" value="${moveOrderVO.id}">
										<input type="hidden" name="memberId"
											value="${moveOrderVO.memberId}"> <input type="hidden"
											name="customer" value="${moveOrderVO.customer}"> <input
											type="hidden" name="phone" value="${moveOrderVO.phone}">
										<input type="hidden" name="fromAddress"
											value="${moveOrderVO.fromAddress}"> <input
											type="hidden" name="toAddress"
											value="${moveOrderVO.toAddress}"> <input
											type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
										<input type="hidden" name="amountFirst"
											value="${moveOrderVO.amountFirst}"> <input
											type="hidden" name="deposit" value="${moveOrderVO.deposit}">
										<input type="hidden" name="amountTotal"
											value="${moveOrderVO.amountTotal}"> <input
											type="hidden" name="comment" value="${moveOrderVO.comment}">
										<input type="hidden" name="orderDate"
											value="${moveOrderVO.orderDate}"> <input
											type="hidden" name="status" value="${moveOrderVO.status}">
										<button type="submit" id="foo1" class="box1">不簽訂契約結束訂單</button>
									</FORM>
									<FORM METHOD="post" ACTION="moveorder.do">
										<input type="hidden" name="action" value="updatestatusto2">
										<input type="hidden" name="id" value="${moveOrderVO.id}">
										<input type="hidden" name="memberId"
											value="${moveOrderVO.memberId}"> <input type="hidden"
											name="customer" value="${moveOrderVO.customer}"> <input
											type="hidden" name="phone" value="${moveOrderVO.phone}">
										<input type="hidden" name="fromAddress"
											value="${moveOrderVO.fromAddress}"> <input
											type="hidden" name="toAddress"
											value="${moveOrderVO.toAddress}"> <input
											type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
										<input type="hidden" name="amountFirst"
											value="${moveOrderVO.amountFirst}"> <input
											type="hidden" name="deposit" value="${moveOrderVO.deposit}">
										<input type="hidden" name="amountTotal"
											value="${moveOrderVO.amountTotal}"> <input
											type="hidden" name="comment" value="${moveOrderVO.comment}">
										<input type="hidden" name="orderDate"
											value="${moveOrderVO.orderDate}"> <input
											type="hidden" name="status" value="${moveOrderVO.status}">
										<button type="submit" id="foo2" class="box2">等待運送貨物</button>
									</FORM>
									<FORM METHOD="post" ACTION="moveorder.do">
										<input type="hidden" name="action" value="updatestatusto3">
										<input type="hidden" name="id" value="${moveOrderVO.id}">
										<input type="hidden" name="memberId"
											value="${moveOrderVO.memberId}"> <input type="hidden"
											name="customer" value="${moveOrderVO.customer}"> <input
											type="hidden" name="phone" value="${moveOrderVO.phone}">
										<input type="hidden" name="fromAddress"
											value="${moveOrderVO.fromAddress}"> <input
											type="hidden" name="toAddress"
											value="${moveOrderVO.toAddress}"> <input
											type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
										<input type="hidden" name="amountFirst"
											value="${moveOrderVO.amountFirst}"> <input
											type="hidden" name="deposit" value="${moveOrderVO.deposit}">
										<input type="hidden" name="amountTotal"
											value="${moveOrderVO.amountTotal}"> <input
											type="hidden" name="comment" value="${moveOrderVO.comment}">
										<input type="hidden" name="orderDate"
											value="${moveOrderVO.orderDate}"> <input
											type="hidden" name="status" value="${moveOrderVO.status}">
										<button type="submit" id="foo3" class="box3">運送中</button>
									</FORM>
									<FORM METHOD="post" ACTION="moveorder.do">
										<input type="hidden" name="action" value="updatestatusto4">
										<input type="hidden" name="id" value="${moveOrderVO.id}">
										<input type="hidden" name="memberId"
											value="${moveOrderVO.memberId}"> <input type="hidden"
											name="customer" value="${moveOrderVO.customer}"> <input
											type="hidden" name="phone" value="${moveOrderVO.phone}">
										<input type="hidden" name="fromAddress"
											value="${moveOrderVO.fromAddress}"> <input
											type="hidden" name="toAddress"
											value="${moveOrderVO.toAddress}"> <input
											type="hidden" name="moveDate" value="${moveOrderVO.moveDate}">
										<input type="hidden" name="amountFirst"
											value="${moveOrderVO.amountFirst}"> <input
											type="hidden" name="deposit" value="${moveOrderVO.deposit}">
										<input type="hidden" name="amountTotal"
											value="${moveOrderVO.amountTotal}"> <input
											type="hidden" name="comment" value="${moveOrderVO.comment}">
										<input type="hidden" name="orderDate"
											value="${moveOrderVO.orderDate}"> <input
											type="hidden" name="status" value="${moveOrderVO.status}">
										<button type="submit" id="foo4" class="box4">完成訂單</button>
									</FORM>
								</td>
						</c:forEach>
					</table>
					<h3>我用很久ㄟ</h3>
					<script>
						function triggerAlert1() {
							var box1 = document.querySelector('.box1');
							box1.style.backgroundColor = "black";

						}
						var ele1 = document.getElementById('foo1');
						ele1.onclick = triggerAlert1;
						
						function triggerAlert2() {
							var box2 = document.querySelector('.box2');
							box2.style.backgroundColor = "green";

						}
						var ele2 = document.getElementById('foo2');
						ele2.onclick = triggerAlert2;
						
						function triggerAlert3() {
							var box3 = document.querySelector('.box3');
							box3.style.backgroundColor = "red";

						}
						var ele3 = document.getElementById('foo3');
						ele3.onclick = triggerAlert3;
						
						function triggerAlert4() {
							var box4 = document.querySelector('.box4');
							box4.style.backgroundColor = "blue";

						}
						var ele4 = document.getElementById('foo4');
						ele4.onclick = triggerAlert4;

					</script>
					<!-- end of main -->

				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

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
</body>

</html>