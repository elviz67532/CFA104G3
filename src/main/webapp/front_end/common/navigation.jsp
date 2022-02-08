<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container px-5">
		<!-- 標題及logo  -->
		<a class="navbar-brand" href="index.html">委域</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- 選單列表 -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">關於我們</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownBlog">
						<li><a class="dropdown-item" href="blog-home.html">我們是誰</a></li>
						<li><a class="dropdown-item" href="blog-post.html">我們的理念</a></li>
						<li><a class="dropdown-item" href="blog-post.html">目標使用者</a></li>
						<li><a class="dropdown-item" href="blog-post.html">聯絡我們</a></li>
					</ul>
				</li>
				<!-- 單一nav 搬家 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">搬家</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownBlog">
						<li><a class="dropdown-item" href="#">搬家首頁</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/move/moveRequest.jsp">申請搬家</a></li>
					</ul>
				</li>
				<!-- 單一nav 活動 -->
				<li class="nav-item"><a class="nav-link" href="activity.html">活動</a></li>
				<!-- 單一nav 二手 -->
				<li class="nav-item"><a class="nav-link" href="product.html">二手</a></li>
				<!-- 單一nav 會員中心 -->
				<li class="nav-item"><a class="nav-link" href="index.html">會員中心</a></li>
				<!-- 單一nav 登入 -->
				<li class="nav-item"><a class="nav-link" href="index.html">登入</a></li>
				<!-- 單一nav 註冊 -->
				<li class="nav-item"><a class="nav-link" href="index.html">註冊</a></li>
			</ul>
		</div>
	</div>
</nav>