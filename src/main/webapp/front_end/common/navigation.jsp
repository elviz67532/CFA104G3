<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.html">委域</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav md py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="<%=request.getContextPath()%>/about.html">關於我們</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="<%=request.getContextPath()%>/front_end/news/homePage.jsp">最新消息</a></li>
                    <li class="nav-item dropdown">
                    <a class="nav-link px-lg-3 py-3 py-lg-4 dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">服務</a>
                   		<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownBlog">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/move/homePage.jsp">前往搬家</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/product/homePage.jsp">前往二手商城</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/activity/homePage.jsp">前往活動</a></li>
						</ul>
                    </li>
					<li class="nav-item dropdown">
						<a class="nav-link px-lg-3 py-3 py-lg-4 dropdown-toggle" id="navbarDropdownHelp" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">幫助中心</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownHelp">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/front_end/faq/homePage.jsp">FAQ</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/contact.html">聯絡我們</a></li>
						</ul>
					</li>
                </ul>
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/front_end/member/register.jsp">註冊</a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${pageContext.request.contextPath}/front_end/member/login.jsp">登入</a></li>
                </ul>
            </div>
        </div>
    </nav>