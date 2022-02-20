<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<title>委域</title>
	<!-- 【同時提交兩個form表單】 -->
	<script type="text/javascript">
		submitForms = function(){
		    document.forms["form1"].submit();
		    document.forms["form2"].submit();
		}
	</script>
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
					<h4 style="text-align: -webkit-center;">新增管理員</h4>
					<div class="col-6 mx-auto my-5">
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/server_manager/ServerManagerServlet" name="form1">
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">信箱</span>
								  </div>
								  <input type="text" name="smgrEmail" class="form-control" placeholder="email" aria-label="Username" aria-describedby="basic-addon1">
								</div>
	
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">帳號</span>
								  </div>
								  <input type="text" name="smgrAccount" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">密碼</span>
								  </div>
								  <input type="text" name="smgrPassword" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">姓名</span>
								  </div>
								  <input type="text" name="smgrName" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">電話</span>
								  </div>
								  <input type="text" name="smgrPhone" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <span class="input-group-text" id="basic-addon1">地址</span>
								  </div>
								  <input type="text" name="smgrAddress" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
								</div>							
								
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <div class="input-group-text">
								      <span style="white-space:pre;"> 性別   </span>
								      <input type="radio" name="smgrGender" value=0 aria-label="Radio button for following text input">
								      <span style="white-space:pre;">男   </span>
								      <input type="radio" name="smgrGender" value=1 aria-label="Radio button for following text input">
								      <span style="white-space:pre;">女   </span>
								      <input type="radio" name="smgrGender" value=2 aria-label="Radio button for following text input">
								      <span style="white-space:pre;">不透漏   </span>
								    </div>
								  </div>
								</div>							
							
								<!-- 新增權限 -->
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
								    <div class="input-group-text">
								      <span style="white-space:pre;">賦予權限      </span>
								      <input type="checkbox" name="smgeAuthId" value="10" aria-label="Checkbox for following text input">
								      <span>活動管理</span>
								    </div>
								    <div class="input-group-text">
								      <input type="checkbox" name="smgeAuthId" value="20" aria-label="Checkbox for following text input">
								      <span>二手物資</span>
								    </div>
								    <div class="input-group-text">
								      <input type="checkbox" name="smgeAuthId" value="30" aria-label="Checkbox for following text input">
								      <span>搬家管理</span>
								    </div>
								    <div class="input-group-text">
								      <input type="checkbox" name="smgeAuthId" value="40" aria-label="Checkbox for following text input">
								      <span>會員管理</span>
								    </div>
								    <div class="input-group-text">
								      <input type="checkbox" name="smgeAuthId" value="50" aria-label="Checkbox for following text input">
								      <span>FAQ</span>
								    </div>
								    <div class="input-group-text">
								      <input type="checkbox" name="smgeAuthId" value="60" aria-label="Checkbox for following text input">
								      <span>最新消息</span>
								    </div>
								  </div>
								</div>				
						<div class="row justify-content-center">
							<button type="submit" name="action" value="insert_manager_and_auth" 
							class="btn btn-outline-info" onclick="submitForms()">submit</button>
						</div>
							</FORM>
					</div>
					<!-- end of main -->
					
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
	
	<!-- custom script -->
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
</body>

</html>