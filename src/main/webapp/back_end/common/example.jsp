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
				       <!-- Contact section-->
        
            <div class="container px-5 my-5 px-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                    <h2 class="fw-bolder">編輯消息</h2>            
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN" METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/news/NewsServlet"
                            name="form1" enctype="multipart/form-data">
                            
                            <div class="form-floating mb-3">
                            <label>消息編號:</label>
                            <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${newsVO.id}">
                            </div>
                            <!-- type input-->
                            <div class="form-floating mb-3">
                                <label for="type">類別編號:</label>
                                <input class="form-control" id="type" type="text" placeholder="請輸入類別編號..." name="type" value="${newsVO.type}"/>                                
                            </div>
                            <!-- title address input-->
                            <div class="form-floating mb-3">
                                <label for="title">標題:</label>
                                <input class="form-control" id="title" type="text" placeholder="請輸入標題..." name="title" value="${newsVO.title}"/>
                                                             
                            </div>              
                            <!-- content input-->
                            <div class="form-floating mb-3">
                                <label for="content">內文:</label>
                                <textarea class="form-control" id="content" type="text" placeholder="請輸入文字..." style="height: 10rem"  name="content" value="${newsVO.content}"></textarea>
                                
                            </div>
                            <!-- Phone number input-->
                            <div class="mb-3">
                                <label>建立日期:</label>                                
                                <input class="form-control" type="datetime-local" name="date" value="${newsVO.date}" />
                            </div>
                            <div class="mb-3">
                                <label for="formFile" class="form-label">圖片:</label>                                
                                <input class="form-control" type="file" id="formFile" name="image" value="${newsVO.image}" />
                            </div>                         
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
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