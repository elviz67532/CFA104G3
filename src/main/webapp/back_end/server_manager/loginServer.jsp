<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">	
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/back_end/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/back_end/signin.css" rel="stylesheet">
	<title>Signin</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
</head>
<body id="page-top text-center">
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="container-fluid">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errMsgs}">
					<font style="color:red">請修正以下錯誤</font>
					<ul>
						<c:forEach var="msg" items="${errMsgs}">
							<li style="color:red">${msg}</li>
						</c:forEach>
					</ul>
				</c:if>
					<!-- main -->
					<main class="form-signin">
					  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/server_manager/ServerManagerServlet">
					    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
					    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
						<!-- 帳號 -->
					    <div class="form-floating">
					      <input type="text" name="account" class="form-control" id="floatingInput" placeholder="">
					      <label for="floatingInput">Account</label>
					    </div>
					    <!-- 密碼 -->
					    <div class="form-floating">
					      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
					      <label for="floatingPassword">Password</label>
					    </div>
					    <input type="submit" value="Sign in" class="w-100 btn btn-lg btn-primary" />
					    <input type="hidden" value="loginhandler" name="action">
					    <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
					  </FORM>
					</main>					
					
					
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