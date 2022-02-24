<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_order.model.*"%>
<%
MoveOrderVO moveOrderVO = (MoveOrderVO) request.getAttribute("moveOrderVO");

Map<Integer, String> statusMap = new HashMap<>();
statusMap.put(0, "等待簽訂契約");
statusMap.put(1, "不簽訂契約結束訂單");
statusMap.put(2, "等待運送貨物");
statusMap.put(3, "運送中");
statusMap.put(4, "完成訂單");

if (moveOrderVO != null) {
	Integer status = moveOrderVO.getStatus();
	request.setAttribute("status", statusMap.get(status));
	System.out.print(statusMap.get(status));
}


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
	
<!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<title>委域</title>
</head>
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
button{
  	width:200px;
  	color: light blue;
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


					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="">
					<h2>搬家訂單</h2>
					<div class="main">
					<table>

						<tr>
							<td>訂單編號:</td>
							<td>${moveOrderVO.id}</td>
						</tr>
						<tr>
							<td>會員編號:</td>
							<td>${moveOrderVO.memberId}</td>
						</tr>
						<tr>
							<td>客戶姓名:</td>
							<td>${moveOrderVO.customer}</td>
						</tr>
						<tr>
							<td>客戶電話:</td>
							<td>${moveOrderVO.phone}</td>
						</tr>
						<tr>
							<td>搬家目前地址:</td>
							<td>${moveOrderVO.fromAddress}</td>
						</tr>
						<tr>
							<td>搬家目的地地址:</td>
							<td>${moveOrderVO.toAddress}</td>
						</tr>
						<tr>
							<td>搬家時間:</td>
							<td>${moveOrderVO.moveDate}</td>
						</tr>
						<tr>
							<td>估價金額:</td>
							<td>${moveOrderVO.amountFirst}</td>
						</tr>
						<tr>
							<td>訂金:</td>
							<td>${moveOrderVO.deposit}</td>
						</tr>
						<tr>
							<td>最後付款金額</td>
							<td>
								<FORM METHOD="post" ACTION="moveorder.do">
									<input type="hidden" name="action" value="update"> 
									<input type="hidden" name="id" value="${moveOrderVO.id}"> 
									<input type="hidden" name="memberId" value="${moveOrderVO.memberId}">
									<input type="hidden" name="customer" value="${moveOrderVO.customer}"> 
									<input type="hidden" name="phone" value="${moveOrderVO.phone}"> 
									<input type="hidden" name="fromAddress" value="${moveOrderVO.fromAddress}"> 
									<input type="hidden" name="toAddress" value="${moveOrderVO.toAddress}"> 
									<input type="hidden" name="moveDate" value="${moveOrderVO.moveDate}"> 
									<input type="hidden" name="amountFirst" value="${moveOrderVO.amountFirst}"> 
									<input type="hidden" name="deposit" value="${moveOrderVO.deposit}">
									<input type="text" name="amountTotal" value="${moveOrderVO.amountTotal}"> 
									<input type="hidden" name="comment" value="${moveOrderVO.comment}">
									<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}"> 
									<input type="hidden" name="status" value="${moveOrderVO.status}"> 
									<button type="button" id="btn0">送出</button>
								</FORM>
							</td>
						</tr>
						<tr>
							<td>訂單成立時間:</td>
							<td>${moveOrderVO.orderDate}</td>
						</tr>
						<tr>
							<td>訂單狀態:</td>
							<td>${requestScope.status}</td>
						</tr>
						<tr>
							<td>更改訂單狀態:</td>
							<td>
								<FORM METHOD="post" ACTION="moveorder.do">
									<input type="hidden" name="action" value="updatestatusto1forone"> 
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
									<input type="hidden" name="comment" value="${moveOrderVO.comment}">
									<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}"> 
									<input type="hidden" name="status" value="${moveOrderVO.status}">
									<button type="button" id="btn1">不簽訂契約結束訂單</button>
								</FORM>

								<FORM METHOD="post" ACTION="moveorder.do">
									<input type="hidden" name="action" value="updatestatusto2forone"> 
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
									<input type="hidden" name="comment" value="${moveOrderVO.comment}">
									<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}"> 
									<input type="hidden" name="status" value="${moveOrderVO.status}">
									<button type="button" id="btn2">等待運送貨物</button>
								</FORM>

								<FORM METHOD="post" ACTION="moveorder.do">
									<input type="hidden" name="action" value="updatestatusto3forone"> 
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
									<input type="hidden" name="comment" value="${moveOrderVO.comment}">
									<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}"> 
									<input type="hidden" name="status" value="${moveOrderVO.status}">
									<button type="button" id="btn3">運送中</button>
								</FORM>

								<FORM METHOD="post" ACTION="moveorder.do">
									<input type="hidden" name="action" value="updatestatusto4forone"> 
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
									<input type="hidden" name="comment" value="${moveOrderVO.comment}">
									<input type="hidden" name="orderDate" value="${moveOrderVO.orderDate}"> 
									<input type="hidden" name="status" value="${moveOrderVO.status}">
									<button type="button" id="btn4">完成訂單</button>
								</FORM>
							</td>
						</tr>
						<tr>
							<td>回饋:</td>
							<td>${moveOrderVO.comment}</td>
						</tr>
					</table>
					<input type="button" value="回首頁" onclick="location.href='readMoveOrder.jsp'">
					</div>
					</div>
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
		
	<script>
	var btn0 = document.getElementById('btn0'); //新增按鈕
	btn0.addEventListener('click', function(e) {
			e.preventDefault(); // 阻擋瀏覽器預設行為
		    swal({
		        title: "確定要輸入最終金額？",
		        html: "按下確定後送出",
		        type: "question", // type can be "success", "error", "warning", "info", "question"
		        showCancelButton: true,
		        showCloseButton: true,
		       
		    }).then(function(result) {
		        if (result) {
		            swal("完成!", "金額已更改", "success")
		            	.then(function(result1){
		            		btn0.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
		            	}).catch(swal.noop);
		        }
		    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		        swal("取消", "金額未被更改", "error");
		    }).catch(swal.noop);
		});
	
	var btn1 = document.getElementById('btn1'); //新增按鈕
	btn1.addEventListener('click', function(e) {
			e.preventDefault(); // 阻擋瀏覽器預設行為
		    swal({
		        title: "確定要更改狀態？",
		        html: "按下確定後狀態會改為不簽訂契約結束訂單",
		        type: "question", // type can be "success", "error", "warning", "info", "question"
		        showCancelButton: true,
		        showCloseButton: true,
		       
		    }).then(function(result) {
		        if (result) {
		            swal("完成!", "狀態已改變", "success")
		            	.then(function(result1){
		            		btn1.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
		            	}).catch(swal.noop);
		        }
		    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		        swal("取消", "狀態未被更改", "error");
		    }).catch(swal.noop);
		});
	
	var btn2 = document.getElementById('btn2'); //新增按鈕
	btn2.addEventListener('click', function(e) {
			e.preventDefault(); // 阻擋瀏覽器預設行為
		    swal({
		        title: "確定要更改狀態？",
		        html: "按下確定後狀態會改為等待運送貨物",
		        type: "question", // type can be "success", "error", "warning", "info", "question"
		        showCancelButton: true,
		        showCloseButton: true,
		       
		    }).then(function(result) {
		        if (result) {
		            swal("完成!", "狀態已改變", "success")
		            	.then(function(result1){
		            		btn2.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
		            	}).catch(swal.noop);
		        }
		    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		        swal("取消", "狀態未被更改", "error");
		    }).catch(swal.noop);
		});
	
	var btn3 = document.getElementById('btn3'); //新增按鈕
	btn3.addEventListener('click', function(e) {
			e.preventDefault(); // 阻擋瀏覽器預設行為
		    swal({
		        title: "確定要更改狀態？",
		        html: "按下確定後狀態會改為運送中",
		        type: "question", // type can be "success", "error", "warning", "info", "question"
		        showCancelButton: true,
		        showCloseButton: true,
		       
		    }).then(function(result) {
		        if (result) {
		            swal("完成!", "狀態已改變", "success")
		            	.then(function(result1){
		            		btn3.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
		            	}).catch(swal.noop);
		        }
		    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		        swal("取消", "狀態未被更改", "error");
		    }).catch(swal.noop);
		});
	
	var btn4 = document.getElementById('btn4'); //新增按鈕
	btn4.addEventListener('click', function(e) {
			e.preventDefault(); // 阻擋瀏覽器預設行為
		    swal({
		        title: "確定要更改狀態？",
		        html: "按下確定後狀態會改為完成訂單",
		        type: "question", // type can be "success", "error", "warning", "info", "question"
		        showCancelButton: true,
		        showCloseButton: true,
		       
		    }).then(function(result) {
		        if (result) {
		            swal("完成!", "狀態已改變", "success")
		            	.then(function(result1){
		            		btn4.parentElement.submit(); // 返回當前節點的父元素節點 ,也就是上一層的form
		            	}).catch(swal.noop);
		        }
		    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
		        swal("取消", "狀態未被更改", "error");
		    }).catch(swal.noop);
		});

	</script>
</body>

</html>