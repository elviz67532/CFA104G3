<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.move_request.model.*"%>
<%@ page import="com.move_photo.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="/asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/move/moveCommon.css" rel="stylesheet" type="text/css"/>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
</head>

<body>
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>申請搬家</h1>
<!--                         <span class="subheading"></span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>

   	<!-- 主體畫面設計  -->
	<%
		MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
		if (memberVo == null) {
			RequestDispatcher failureView = request.getRequestDispatcher("/front_end/move/homePage.jsp");
			failureView.forward(request, response);
			return;
		}
		
		// 傳入參數
		MoveRequestVO moveRequestVO = (MoveRequestVO) request.getAttribute("moveRequestVO");
		MoveRequestService service = new MoveRequestServiceImpl();  
		List<byte[]> photos = (List<byte[]>) request.getAttribute("movePhotosVO");

		if (moveRequestVO == null || moveRequestVO.getEvaluateType() == null) {
			pageContext.setAttribute("onlineEva", true);
		} else {
			if (moveRequestVO.getEvaluateType() == 1) {
				pageContext.setAttribute("onlineEva", false);
			} else {
				pageContext.setAttribute("onlineEva", true);
			}
		}

		java.sql.Date moveDate = null;
		try {
			java.sql.Timestamp t = moveRequestVO.getMoveDate();
			moveDate = new java.sql.Date(t.getTime());
			pageContext.setAttribute("moveDate", moveDate);
		} catch (Exception e) {
		}
		java.sql.Date evaDate = null;
		try {
			java.sql.Timestamp t = moveRequestVO.getEvaluateDate();
			evaDate = new java.sql.Date(t.getTime());
			pageContext.setAttribute("evaDate", evaDate);
		} catch (Exception e) {
		}

		if (photos != null) {
			List<String> photosData = new ArrayList<>();
			for (byte[] photo : photos) {
				String base64data = Base64.getEncoder().encodeToString(photo);
				photosData.add(base64data);
			}
			pageContext.setAttribute("photosData", photosData);
		}
		
		// 文字比對
		Map<Boolean, String> handledMap = new HashMap<>();
		for (EHandled handled : EHandled.values()) {
			handledMap.put(handled.getHandledCode(), handled.getText());
		}
		pageContext.setAttribute("handledMap", handledMap);
		Map<Integer, String> moveRequestStatusMap = new HashMap<>();
		for (EMoveRequestStatus status : EMoveRequestStatus.values()) {
			moveRequestStatusMap.put(status.getStatusCode(), status.getText());
		}
		pageContext.setAttribute("moveRequestStatusMap", moveRequestStatusMap);
	%>
	
	<!-- TODO 限制上傳檔案大小、張數、數量 -->

	<!-- main -->
	<main id="outter" class=".flex-column">
		<div class="bd-content ps-lg-4">
		
			<!-- 成功/失敗訊息 -->
		 	<div class="container position-relative px-4 px-lg-5">
	            <div class="row gx-4 gx-lg-5 justify-content-center">
	                <div class="col-md-10 col-lg-8 col-xl-7">
	                    <div class="site-heading"  style="text-align:center;">
							<h1>處理狀態</h1>
							<span>${handledMap[moveRequestVO.handled]}</span>
							<h1>申請單狀態</h1>
							<span hidden id="status">${moveRequestVO.status}</span>
							<span>${moveRequestStatusMap[moveRequestVO.status]}</span>
						</div>		
	                </div>
	            </div>
	        </div>
			
			<!-- 申請人 -->
			<div class="col-12">
				<label for="requestName" class="form-label">申請人:</label>
				<input name="requestName" type="text" class="form-control" id="requestName"
					value="${sessionScope.memberVO.name}" 
					disabled/>
			</div>

			<!-- 收貨地址 -->
			<div class="col-12">
				<label for="fromAddress" class="form-label">收貨地址:</label>
				<input name="fromAddress" type="text" class="form-control" id="fromAddress"
					value="${moveRequestVO.fromAddress}" 
					disabled>
			</div>
			
			<!-- 送達地址 -->
			<div class="col-12">
				<label for="toAddress" class="form-label">送達地址:</label>
				<input name="toAddress" type="text" class="form-control" id="toAddress"
					value="${moveRequestVO.toAddress}"
					disabled>
			</div>
			
			<!-- 貨物描述 -->
			<div class="col-12">
				<label for="items" class="form-label">貨物描述:</label>
				<input name="items" type="text" class="form-control" id="items"
					value="${moveRequestVO.items}"
					disabled>
			</div>

			<!-- 搬家日期 -->
			<div class="col-12">
				<label for="moveDate" class="form-label">搬家日期:</label>
				<span data-toggle="tooltip" title="搬家日期請保留至少3天審核日期">ⓘ</span><br/>
				<input name="moveDate" type="date" class="form-control" id="moveDate"
					value="${moveDate}"
					disabled>
			</div>
			
			<!-- 申請模式 -->
			<div class="col-12">
				<label class="form-label">申請模式:</label><br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="requestMode"
						id="online" value="online" 
						<c:out value="${onlineEva eq true ? 'checked': ''}"/>
						disabled>
					<label class="form-check-label" for="online">線上估價</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="requestMode"
						id="site" value="site"
						<c:out value="${onlineEva eq true ? '': 'checked'}"/>
						disabled>
					<label class="form-check-label" for="site">現場估價</label>
				</div>
			</div>
			
			<!-- 現場估價日期 -->
			<div id="siteEvaDiv" class="col-12">
				<label for="evaDate" class="form-label">現場估價日期:</label>
				<span data-toggle="tooltip" title="現場估價時間須比搬家時間晚至少1周">ⓘ</span>
				<input name="evaDate" type="date" class="form-control" id="evaDate"
					value= "${evaDate}"
					disabled>
			</div>

			<!-- 線上估價照片 -->
			<div id="onlineEvaDiv" class="col-12">
				<label for="itemPhoto" class="form-label">線上估價照片:</label>
				<span data-toggle="tooltip" title="圖片最多僅能選擇3張, 任一張圖片大小不得超過3MB">ⓘ</span><br/>
				<c:forEach var="photo" items="${photosData}">
					<img alt="photo" class="itemPhoto"
					style="max-width: 25%; border: solid black 2px;"
					src="data:image/all;base64, ${photo}">
				</c:forEach>
			</div>

			<hr class="sidebar-divider">

			<div class="col-12">
				<!-- 結帳 -->
				<form id="payForm" class="row g-3" method="POST"
					action="${pageContext.request.contextPath}/move/moveRequest.do"
					name="moveRequest">
					<input type="hidden" name="action" value="moveRequestCtrl">
					<input type="hidden" name="type" value="pay">
					<input type="hidden" name="requestId" value="${moveRequestVO.id}">
					<button type="button" id="pay" class="btn btn-success mb-3">結帳</button>
				</form>
				
				<!-- 取消申請單 -->
				<form id="cancelForm" class="row g-3" method="POST"
					action="${pageContext.request.contextPath}/move/moveRequest.do"
					name="moveRequest">
					<input type="hidden" name="action" value="moveRequestCtrl">
					<input type="hidden" name="type" value="cancel">
					<input type="hidden" name="requestId" value="${moveRequestVO.id}">
					<button type="button" id="cancel" class="btn btn-danger mb-3">取消申請單</button>
				</form>
			</div>
		</div>
	</main>
	
	
	<!-- custom -->
	<script src="${pageContext.request.contextPath}/js/front_end/move/moveRequestCtrl.js"></script>
 	
	<!-- sweetAlert -->		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
	
 	<script>
		$(document).ready(function(){
	  		initMoveRequest();
	   	})
	 	function initMoveRequest() {
			var status = $('#status').text();
			if (status != 3) {
		  		$('#pay').attr('disabled', true);
			}
			
			if (status != 0 && status != 2 && status != 3) {
				$('#cancel').attr('disabled', true);
			}
	  	}
		
	  	$("#pay").click(function() {        
	  		function ok() {
	        	$("#payForm").submit(); // Submit the form
	  		}
	  		swal('付款完成模擬畫面', '付款完成', 'success').then((result) => {
	  			location.reload();
	  		});
	    });
		
	  	$("#cancel").click(function() {        
	  		function ok() {
	        	$("#cancelForm").submit(); // Submit the form
	  		}
	  		lastCheck("確認取消申請單", ok);
	    });
	  	
    	function lastCheck(title, okFun) {
   			swal({
            	title: title,
				html: "按下確定後申請單將取消",
               	type: "question",
               	showCancelButton: true,
               	showCloseButton: true,
           	}).then(function(result) {
           	    if (result) {
               		swal("申請單已取消", "");
           	 		okFun();
               	}
           	}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
               swal("取消審核動作", "");
           	}).catch(swal.noop);
    	}
	</script>
 	
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath}/js/front_end/scripts.js"></script>
</body>

</html>