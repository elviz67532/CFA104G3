<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
	<style>
		.btn{
			padding: 0px;
			height: 100%;
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

					<!-- TODO 調整時間格式 -->

					<!-- main -->
					<main id="outter" class=".flex-column">
						<div class="bd-content ps-lg-4">
						
							<!-- Form 模式 -->
							<form class="row g-3" method="POST"
								action="<%=request.getContextPath()%>/move/moveManage.do"
								name="moveManage">
								<input type="hidden" name="action" value="moveManage">
								<input type="hidden" id="requestId" value="moveManage">
								
								<!-- 客戶名稱 -->
								<div class="col-12">
									<label for="memberName" class="form-label">客戶名稱:</label>
									<input id="memberName" name="memberName" type="text" class="form-control"
										disabled>
								</div>
				
								<!-- 收貨地址 -->
								<div class="col-6">
									<label for="fromAddress" class="form-label">收貨地址:</label>
									<input id="fromAddress" name="fromAddress" type="text" class="form-control"
										disabled>
								</div>
									
								<!-- 送達地址 -->
								<div class="col-6">
									<label for="toAddress" class="form-label">送達地址:</label>
									<input id="toAddress" name="toAddress" type="text" class="form-control"
										disabled>
								</div>
									
								<!-- 貨物描述 -->
								<div class="col-12">
									<label for="items" class="form-label">貨物描述:</label>
									<input id="items" name="items" type="text" class="form-control"
										disabled>
								</div>
				
								<!-- 搬家日期 -->
								<div class="col-12">
									<label for="moveDate" class="form-label">搬家日期:</label> 
									<input id="moveDate" name="moveDate" type="text" class="form-control"
										disabled>
								</div>
									
								<!-- 申請模式 -->
								<div class="col-12">
									<label class="form-label">申請模式:</label><br/>
									<div class="form-check form-check-inline col-6">
										<input class="form-check-input" type="radio" name="requestMode"
											id="online" disabled/>
										<label class="form-check-label" for="online">線上估價</label>
									</div>
									<div class="form-check form-check-inline col-6">
										<input class="form-check-input" type="radio" name="requestMode"
											id="site" value="site" disabled/>
										<label class="form-check-label" for="site">現場估價</label>
									</div>
								</div>
								
								<!-- 現場估價日期 -->
								<div id="siteEvaDiv" class="col-12">
									<label for="evaDate" class="form-label">現場估價日期:</label>
									<input name="evaDate" type="text" class="form-control" id="evaDate"
									disabled>
								</div>

								<div class="col-12">
									<label for="itemPhoto" class="form-label">線上估價照片:</label><br/>
									<div id="photos">
									</div>
								</div>
								
								<hr style="border: 1px solid black; width: 100%;" />
								
								<div class="col-3">
									<label for="status" class="form-label">申請單狀態:</label><br/>
									<input name="status" type="text" class="form-control" id="status"
									disabled>
								</div>

							    <div class="col-3">
							   		<label for="evaulatePrice" class="form-label">估價金額:</label><br/>
							      	<input type="text" id="evaulatePrice" class="form-control">
							  	</div>
								<div class="col-2">
								  	<button type="button" class="btn btn-success btn-block align-middle" id="verifyOK" value="">審核成功</button><br/>
								</div>
								<div class="col-2">
								  	<button type="button" class="btn btn-danger btn-block align-middle" id="verifyNAK" value="">審核失敗</button>
								</div>
								<div class="col-2">
								  	<button type="button" class="btn btn-warning btn-block align-middle" id="siteEvaOk" value="">現場估價</button><br/>
								</div>
							</form>
						</div>
					</main>
				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- sweetAlert -->		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>

	<!-- 註冊按鈕觸發功能  -->
	<script src="<%=request.getContextPath()%>/js/common/utility.js"></script>
	<script>
	    $(document).ready(function(){
	        initMoveRequest();
	    })
	    function initMoveRequest() {
	        const value = `${document.cookie}`;
	        
	        // 先禁用所有input
	        let requestId = getCookie('requestId');
	        if (!requestId) {
	        	$('#evaulatePrice').attr('disabled', true);
	        	$('#siteEvaOk').attr('disabled', true);
	        	$('#verifyOK').attr('disabled', true);
	        	$('#verifyNAK').attr('disabled', true);
	        	return;
	        }
	        
	        $('#requestId').val(requestId);
	        $.ajax({
	            url: "<%=request.getContextPath()%>/move/moveManage.do",
	            type: "POST",
	            data: JSON.stringify({'action':'backManage', 'id':requestId}),
	            success: function(data){
	        		let jsonObj = JSON.parse(data);
	        		if(jsonObj.errorCode==='success') {
	        			let body = jsonObj.body;
	        			$('#memberName').val(body.memberName);
		        		
		        		$('#fromAddress').val(body.fromAddress);
		        		$('#toAddress').val(body.toAddress);
		        		$('#items').val(body.items);
		        		$('#moveDate').val(body.moveDate);
		        		
		        		if ("0" == body.evaluateType) {
		        			$('#online').attr('checked', true);
		        			$('#siteEvaDiv').hide();
		        		} else if ("1" == body.evaluateType) {
		        			$('#site').attr('checked', true);
		        		}
		        		$('#evaDate').val(body.evaluateDate);
		        		$('#photos').val('');
		        		
		        		$.each(body.movePhotoTransVOs, function(index, moveRequestPhoto) {
	        			  let img = document.createElement("img");
	        			  img.setAttribute("alt", "photo");
	        			  img.setAttribute("class", "itemPhoto");
	        			  img.setAttribute("style", "max-width: 50%; border: solid black 2px;");
	        			  img.setAttribute("src", 'data:image/all;base64, '+ moveRequestPhoto.photo);
	        			  $("#photos").append(img);
	        			}); 	
		        		
		        		$('#status').val(body.status);
        				$('#evaulatePrice').val(body.evaluatePrice);
        				
        				if ("0" == body.evaluateType) {
        					if (body.statusCode != 0) {
        						$('#evaulatePrice').attr('disabled', true);
        					}	
        					$('#siteEvaOk').attr('disabled', true);
		        		} else if ("1" == body.evaluateType) {
							if (body.statusCode != 2) {
								$('#evaulatePrice').attr('disabled', true);
								$('#siteEvaOk').attr('disabled', true);
        					} 
		        		}

        				if (body.statusCode != 0) {
        					$('#verifyNAK').attr('disabled', true);
        					$('#verifyOK').attr('disabled', true);
        				}
	        		} else if(jsonObj.errorCode==='login'){
	        	        window.location.href = jsonObj.body;
	        		}
        		},
	    	});
    	};
    	
    	$("#verifyOK").click(function() {
			function ok() {
 			 	let self = this;
 			    let price = $('#evaulatePrice').val();
 			    let status = $('#reqStatus').val();
 		  		let requestId = $('#requestId').val();
 		  		if (price <= 0) {
 		  		 	swal("請輸入估價金額");
 		  			return;
 		  		}
 		  		
 	            $.ajax({
 		            url: "<%=request.getContextPath()%>/move/moveManage.do",
 		            type: "POST",
 		            data: JSON.stringify({'action':'verifyOK', 'id':requestId, 'price' : price}),
 		            success: function(data){
 		            	if (jsonObj.errorCode==='login') {
 		        	        window.location.href = jsonObj.body;
 		        		} else {
	     			 		location.reload();
 		        		}
		            }
 	            })
    		}
    		lastCheck("確認審核成功", ok);
		});
    	
    	$("#verifyNAK").click(function(){
    		function ok() {
    			let self = this;
   	  		    let price = $('#evaulatePrice').val();
   	  		    let status = $('#reqStatus').val();
   		  		let requestId = $('#requestId').val();

   		  		$.ajax({
   		            url: "<%=request.getContextPath()%>/move/moveManage.do",
   		            type: "POST",
   		            data: JSON.stringify({'action':'verifyNAK', 'id':requestId, 'price' : price}),
   		            success: function(data){
   		          		if (jsonObj.errorCode==='login') {
		        	        window.location.href = jsonObj.body;
		        		} else {
     			 			location.reload();
		        		}
   		            }
   	            })
    		}
    		lastCheck("確認審核失敗", ok);
		});
    	
    	$("#siteEvaOk").click(function(){
    		function ok() {
    			let self = this;
   	  		    let price = $('#evaulatePrice').val();
   	  		    let status = $('#reqStatus').val();
   		  		let requestId = $('#requestId').val();
   		  		if (price <= 0) {
 		  		 	swal("請輸入估價金額");
 		  			return;
 		  		}
   		  		
   		  		$.ajax({
		            url: "<%=request.getContextPath()%>/move/moveManage.do",
		            type: "POST",
		            data: JSON.stringify({'action':'siteEvaOk', 'id':requestId, 'price' : price}),
		            success: function(data){
		          		if (jsonObj.errorCode==='login') {
		        	        window.location.href = jsonObj.body;
		        		} else {
	 			 			location.reload();	// FIXME
		        		}
		            }
	            })
    		}
   			lastCheck("確認寫入現場估價金額", ok);
   		});
    	
    	function lastCheck(title, okFun) {
   			swal({
            	title: title,
				html: "按下確定後申請單狀態將無法變更",
               	type: "question",
               	showCancelButton: true,
               	showCloseButton: true,
           	}).then(function(result) {
           	    if (result) {
               		swal("完成審核");
           	 		okFun();
               	}
           	}, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
               swal("取消審核動作");
           	}).catch(swal.noop);
    	}
    	$("#evaulatePrice").keyup(function(){
   		  	let price = $('#evaulatePrice').val();
   		 	price=price.replace(/^(0+)|[^\d]+/g,'');
   		 	if (price == '') {
   		 		price = 0;
   		 	}
   		 	console.log(price)
   		 	$('#evaulatePrice').val(price);
   		}); 
	</script>
</body>
</html>