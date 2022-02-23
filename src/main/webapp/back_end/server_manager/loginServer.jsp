<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	Map<String, String> errMsgs = (Map<String, String>) request.getAttribute("errMsgs");
	//<!--錯誤訊息 -->	
	if (errMsgs != null) {
		if (errMsgs.get("account") != null)
			request.setAttribute("account", errMsgs.get("account"));
		if (errMsgs.get("password") != null)
			request.setAttribute("password", errMsgs.get("password"));
	}


%>

<!doctype html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">

	<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
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
<body id="text-center" style="background: aliceblue;">
		<!-- main -->
		<main class="form-signin">
		  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/server_manager/ServerManagerServlet">
<!-- 		    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
<!-- 			<h1 class="h2 mb-2 fw-normal">Entrust area</h1> -->
		    <h1 class="h3 mb-3 fw-normal" style="text-align: center;">Please sign in</h1>
			<!-- 帳號 -->
		    <div class="form-floating">
		      <input 
		        value="${requestScope.inputAccount}"
		      	type="text" name="account" class="form-control" id="floatingInput" placeholder="">
		      <label for="floatingInput">Account</label>
		    </div>
   			<c:if test="${not empty account}">
				<span style="color: red">"${account}"</span>
			</c:if>
			
		    <!-- 密碼 -->
		    <div class="form-floating">
		      <input 
		     	value="${requestScope.inputPassword}"
		      	type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
		      <label for="floatingPassword">Password</label>
		    </div>
   			<c:if test="${not empty password}">
				<span style="color: red"> "${password}" </span>
			</c:if>
			
		    <input type="submit" value="Sign in" class="w-100 btn btn-lg btn-primary" />
		    <input type="hidden" value="loginhandler" name="action">
		    <p class="mt-5 mb-3 text-muted" style="text-align: center;">&copy; 2022</p>
		  </FORM>
		</main>					

		<!-- end of main -->
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