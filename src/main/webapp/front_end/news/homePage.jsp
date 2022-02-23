<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*" %>


<% 
NewsServiceImpl newsServiceImpl=new NewsServiceImpl(); 
List<NewsVO> list = newsServiceImpl.selectAllNews();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">

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
</head>

<body id="page-top">
    <!-- Navigation-->
    <!-- nav -->
    <jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/news.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>最新消息</h1>
                        <span class="subheading">最新資訊都在這</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 主體畫面設計  -->
    
    <!-- Page Content-->
    
    <!-- About section one-->
    	<c:forEach var="newsVO" items="${list}"> 
            <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="<%=request.getContextPath()%>/news/newsimage.do?NEWS_ID=${newsVO.id}" alt="..." /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder text-truncate">${newsVO.title}</h2>
                            <p>${newsVO.date}</p>
<%--                             <p class="lead fw-normal text-muted mb-0 text-break">${newsVO.content}...</p> --%>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/news/NewsUserServlet.do">
			     					<input type="submit" value="查看詳情" class="btn btn-outline-primary"	>
			     					<input type="hidden" name="id"  value="${newsVO.id}">
			     					<input type="hidden" name="action"	value="getOne_For_User">
			     			</FORM>
			     			</div>
                        </div>
                    </div>
                </div>
            </section>
        </c:forEach>
        
        
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>    
    <!-- Footer-->
    <jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
</body>

</html>