<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<!DOCTYPE html>
<html lang="en">
<%
	MemberVO memberVo = (MemberVO) session.getAttribute("memberVO");
	if (memberVo == null) {
	response.sendRedirect(request.getContextPath() + "/front_end/member/login.jsp");
	}
%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/checkout/">
	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}
		
		@media ( min-width : 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}
	</style>
	<style>
		.SEARCHFOR {
			padding: 10px;
			margin-bottom: 30px;
		}
		
		#pagination {
			bottom: 0;
		}
		
		.d-block {
			height: 30%;
		}
		
		.myImg {
			height: 400px;
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-position: center;
			background-size: cover;
		}
	</style>
</head>

<body>
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>New Life</h1>
                        <span class="subheading">迎 接 全 新 的 人 生</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errMsgs}">
		<font style="color:red">請修正以下錯誤</font>
		<ul>
			<c:forEach var="msg" items="${errMsgs}">
				<li style="color:red">${msg}</li>
			</c:forEach>
		</ul>
	</c:if>
	<br><br>
	
	<!-- 麵包屑 (Breadcrumb) -->
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/homePage.jsp">總覽</a></li>
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp">買賣家</a></li>
	    <li class="breadcrumb-item active" aria-current="page">新增商品</li>
	  </ol>
	</nav>	
		
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<h2>新增商品</h2>
			</div>
				<!-- 目前手動輸入 -->
				<!-- 取得會員ID -->
				<jsp:useBean id="memberVO" class="com.member.model.MemberVO"/>
				<div class="col-12">
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet" class="needs-validation" 
						  name="form1" novalidate>
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="" class="form-label">會員編號:</label><br> 
								<input type="text" value="${sessionScope.memberVO.id}" class="form-control" name="memId"/>
							</div>
							<!-- 商品名稱 -->
							<div class="col-sm-6">
								<label for="lastName" class="form-label">商品名稱</label> 
								<input type="text" name="prodName" class="form-control" required/>
								<div class="invalid-feedback">Valid last name is required.</div>
							</div>
							<!-- 商品內容 -->
							<div class="col-12">
								<label for="lastName" class="form-label">商品內容</label> 
								<input type="text" name="prodDesc" class="form-control" required>
								<div class="invalid-feedback">Valid last name is required.</div>
							</div>
							<!-- 商品地址 -->
							<div class="col-sm-6">
								<label for="address" class="form-label">地址</label> 
								<input type="text" name="prodLoc" class="form-control" id="address" required>
							</div>
							<!-- 商品價格 -->
							<div class="col-sm-6">
								<label for="address" class="form-label">金額</label> <input
									type="text" name="prodPrice" 
									class="form-control" id="prodPrice"
									placeholder="NT$" required>
							</div>
							<!-- 商品種類 -->
							<div class="col-md-5">
								<label for="country" class="form-label">類型</label> 
								<select name="prodType" class="form-select" id="country" required>
									<option>Choose...</option>
									<option value=4>電器類</option>
									<option value=2>寢具類</option>
									<option value=0>其他</option>
								</select>
							</div>
						</div>
						<!-- 送出文字資訊 -->
						<br><br>
						<input type="hidden" name="action" value="insert">	
						<input class="w-100 btn btn-primary btn-lg" type="submit" value="送出">
					</FORM>			
				</div>
			</div>
		</main>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2017–2021 Company Name</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">Privacy</a></li>
			<li class="list-inline-item"><a href="#">Terms</a></li>
			<li class="list-inline-item"><a href="#">Support</a></li>
		</ul>
	</footer>
</div>


	<script
		src="<%=request.getContextPath()%>/vendors/bootstrap/css/bootstrap.min.css"></script>

	<script src="form-validation.js"></script>
 

   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>