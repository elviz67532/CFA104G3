<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*" %>


<% 
NewsServiceImpl newsServiceImpl=new NewsServiceImpl(); 
List<NewsVO> list = newsServiceImpl.selectAllNews();
pageContext.setAttribute("list", list);


HashMap<Integer, String> type1 = new HashMap<>();
type1.put(1,"系統");
type1.put(2,"活動");
type1.put(3,"搬家");
type1.put(4,"二手");

HashMap<Integer, List<NewsVO>> newVOs = new HashMap<>();
type1.get(1);
type1.get(2);
type1.get(3);
type1.get(4);
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

<body>
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
    <section class="py-5 bg-light">
        <div class="container px-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-xl-12">
                    <!-- 公佈欄 -->
                    <h2 class="fw-bolder fs-5 mb-4">公佈欄</h2>
                    <!-- 標頭 -->
                    <div class="mb-5">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-all-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all"
                                    aria-selected="true">全部</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-act-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-act" type="button" role="tab" aria-controls="pills-act"
                                    aria-selected="false">活動</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-move-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-move" type="button" role="tab" aria-controls="pills-move"
                                    aria-selected="false">搬家</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-sec-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-sec" type="button" role="tab" aria-controls="pills-sec"
                                    aria-selected="false">二手商品</button>
                            </li>
                        </ul>
                        <!-- 表格 -->
                        <div class="tab-content " id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-all" role="tabpanel"
                                aria-labelledby="pills-all-tab">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" class="text-nowrap">類別</th>
                                            <th scope="col" class="text-nowrap">標題</th>
                                            <th scope="col" class="text-nowrap">時間</th>
                                        </tr>
                                    </thead>
                                    <tbody>
 									<c:forEach var="newsVO" items="${list}"> 																			
										<tr>
											<td>${newsVO.id}</td>															
											<td>${newsVO.type}</td>							
											<td>${newsVO.title}</td>			
											<td>${newsVO.date}</td>		
										</tr>											 									
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="pills-act" role="tabpanel" aria-labelledby="pills-move-tab">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" class="text-nowrap">類別</th>
                                            <th scope="col" class="text-nowrap">標題</th>
                                            <th scope="col" class="text-nowrap">時間</th>
                                        </tr>
                                    </thead>
                                    <tbody>
 									<c:forEach var="newsVO" items="${list}">
										<tr>
											<td>${newsVO.id}</td>
											<td>${newsVO.type}</td>
											<td>${newsVO.title}</td>			
											<td>${newsVO.date}</td>		
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="pills-move" role="tabpanel" aria-labelledby="pills-sec-tab">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" class="text-nowrap">類別</th>
                                            <th scope="col" class="text-nowrap">標題</th>
                                            <th scope="col" class="text-nowrap">時間</th>
                                        </tr>
                                    </thead>
                                    <tbody>
  									<c:forEach var="newsVO" items="${list}">
										<tr>
											<td>${newsVO.id}</td>
											<td>${newsVO.type}</td>
											<td>${newsVO.title}</td>			
											<td>${newsVO.date}</td>		
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="pills-sec" role="tabpanel" aria-labelledby="pills-sec-tab">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col" class="text-nowrap">類別</th>
                                            <th scope="col" class="text-nowrap">標題</th>
                                            <th scope="col" class="text-nowrap">時間</th>
                                        </tr>
                                    </thead>
                                    <tbody>
 									<c:forEach var="newsVO" items="${list}">
										<tr>
											<td>${newsVO.id}</td>
											<td>${newsVO.type}</td>
											<td>${newsVO.title}</td>			
											<td>${newsVO.date}</td>		
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer-->
    <jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>