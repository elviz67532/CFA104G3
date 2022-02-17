<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="/CFA104G3/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="/CFA104G3/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="/CFA104G3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<title>委域</title>
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
								action="/CFA104G3/move/moveManage.do"
								name="moveManage">
								<input type="hidden" name="action" value="moveManage">
				
								<!-- 收貨地址 -->
								<div class="col-6">
									<label for="fromAddress" class="form-label">收貨地址:</label>
									<input id="fromAddress" name="fromAddress" type="text" class="form-control" id="fromAddress"
										disabled>
								</div>
									
								<!-- 送達地址 -->
								<div class="col-6">
									<label for="toAddress" class="form-label">送達地址:</label>
									<input id="toAddress" name="toAddress" type="text" class="form-control" id="toAddress"
										disabled>
								</div>
									
								<!-- 貨物描述 -->
								<div class="col-12">
									<label for="items" class="form-label">貨物描述:</label>
									<input id="items" name="items" type="text" class="form-control" id="items"
										disabled>
								</div>
				
								<!-- 搬家日期 -->
								<div class="col-12">
									<label for="moveDate" class="form-label">搬家日期:</label> 
									<input id="moveDate" name="moveDate" type="text" class="form-control" id="moveDate"
										disabled>
								</div>
									
								<!-- 申請模式 -->
								<div class="col-12">
									<label class="form-label">申請模式:</label><br/>
									
									<label id="mode"></label>
<!-- 									<div class="form-check form-check-inline col-6"> -->
<!-- 										<input class="form-check-input" type="radio" name="requestMode" -->
<!-- 											id="online" disabled/> -->
<!-- 										<label class="form-check-label" for="online">線上估價</label> -->
<!-- 									</div> -->
<!-- 									<div class="form-check form-check-inline col-6"> -->
<!-- 										<input class="form-check-input" type="radio" name="requestMode" -->
<!-- 											id="site" value="site" disabled/> -->
<!-- 										<label class="form-check-label" for="site">現場估價</label> -->
<!-- 									</div> -->
								</div>
								
								<!-- 現場估價日期 -->
								<div id="siteEvaDiv" class="col-12">
									<label for="evaDate" class="form-label">現場估價日期:</label>
									<input name="evaDate" type="text" class="form-control" id="evaDate"
									disabled>
								</div>

								<hr style="border: 1px solid black; width: 100%;" />

								<div class="col-12">
									<label for="itemPhoto" class="form-label">線上估價照片:</label><br />
									<div id="photos">
									</div>
								</div>
								
								<hr>
	
<!-- 線上估價模式 -> 填入金額 -> 審核成功	 -->
<!-- 線上估價模式 -> 填入金額 -> 審核失敗			 -->
<!-- 現場場估價模式 -> 審核成功 -->
<!-- 現場估價模式 -> 審核失敗 -->
<!-- 狀態 -->


<!-- 								修改估價 -->
<!-- 				審核完成 -->
<!-- 任意狀態皆能變為					審核失敗 -->



<!-- 								submit -->
<!-- 								<div class="col-12"> -->
<!-- 									<button type="submit" class="btn btn-primary mb-3"> -->
<!-- 										<c:out value="審核成功/失敗/關閉/估價"></c:out> -->
<!-- 									</button> -->
<!-- 								</div> -->
							</form>
						</div>
					</main>
				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript-->
	<script src="/CFA104G3/vendor/jquery/jquery.min.js"></script>
	<script src="/CFA104G3/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script src="/CFA104G3/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/CFA104G3/js/back_end/sb-admin-2.min.js"></script>

	<!-- jQuery -->
	<script src="/CFA104G3/vendor/datatables/jquery.dataTables.min.js"></script>

	<!-- 註冊按鈕觸發功能  -->
	<script src="/CFA104G3/js/common/utility.js"></script>
	<script>
	    $(document).ready(function(){
	        initMoveRequest();
	    })
	    function initMoveRequest() {
	        const value = `${document.cookie}`;
	        
	        let requestId = getCookie('requestId');
	        
	        $.ajax({
	            url: "/CFA104G3/move/moveManage.do",
	            type: "POST",
	            data: JSON.stringify({'mode':'backManage', 'id':requestId}),
	            success: function(data){
	            	console.log('success');
	        		let jsonObj = JSON.parse(data);
	        		if(jsonObj.errorCode==='success') {
		        		let moveRequestVO = jsonObj.body.moveRequestVO;
		        		let movePhotoTransVO = jsonObj.body.movePhotoTransVO;	        		
		        		
		        		$('#fromAddress').val(moveRequestVO.fromAddress);
		        		$('#toAddress').val(moveRequestVO.toAddress);
		        		$('#items').val(moveRequestVO.items);
		        		$('#moveDate').val(moveRequestVO.moveDate);
		        		
		        		if ("0" == moveRequestVO.evaluateType) {
		        			$('#mode').text('#線上估價');
// 		        			$('#online').attr('checked', true);
		        			$('#siteEvaDiv').hide();

		        		} else if ("1" == moveRequestVO.evaluateType) {
		        			$('#mode').text('#現場估價');
// 		        			$('#site').attr('checked', true);

		        		}
		        		$('#evaDate').val(moveRequestVO.evaluateDate);
		        		$('#photos').val('');
		        		
		        		console.log(movePhotoTransVO);
		        		$.each(movePhotoTransVO, function(index, moveRequestPhoto) {
	        			  console.log(moveRequestPhoto);
	        			  console.log(moveRequestPhoto.moveRequestId);
	        			  
	        			  let img = document.createElement("img");
	        			  img.setAttribute("alt", "photo");
	        			  img.setAttribute("class", "itemPhoto");
	        			  img.setAttribute("style", "max-width: 50%; border: solid black 2px;");
	        			  img.setAttribute("src", 'data:image/all;base64, '+ moveRequestPhoto.photo);
	        			  $("#photos").append(img);

	        			  console.log(moveRequestPhoto.photo);
	        			}); 		
	        		}
        		},
	    	});
    	};
	</script>
</body>

</html>