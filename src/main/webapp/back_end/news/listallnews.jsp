<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.news.model.*" %>	
<%@	page import="java.sql.Timestamp"%>

<% 
NewsServiceImpl newsServiceImpl=new NewsServiceImpl(); 
List<NewsVO> list = newsServiceImpl.selectAllNews();
pageContext.setAttribute("list", list);
NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
%>

<!doctype html>
<html lang="zh-TW">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <title>委域-最新消息</title>

</head>

<body id="page-top">
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
                <div class="container-fluid">

                    <!-- main -->
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-5 col-md-5 mb-5">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                編號查詢</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <%-- 錯誤表列 --%>
                                                    <c:if test="${not empty errorMsgs}">
                                                        <!-- <font style="color:red">請修正以下錯誤:</font>
                                <ul>
                                    <c:forEach var="message" items="${errorMsgs}">
                                        <li style="color:red">${message}</li>
                                    </c:forEach>
                                </ul> -->
                                                    </c:if>
                                                    <FORM METHOD="post" ACTION="NewsServlet">
                                						請輸入編號:
                                                        <input type="text" name="id">
                                                        <input type="hidden" name="action" value="getOne_For_Display">
                                                        <input type="submit" value="送出" class="btn btn-outline-primary">
                                                    </FORM>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-5 col-md-5 mb-5">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                新增消息</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                <!-- Button trigger modal  新增按鈕和互動元件-->
                                                <div><br>
                                                    <FORM METHOD="post"
                                                        ACTION="${pageContext.request.contextPath}/back_end/news/NewsServlet"
                                                        name="form1" enctype="multipart/form-data">
                                                        <button type="button" class="btn btn-outline-warning"
                                                            data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                            發佈消息
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="staticBackdrop"
                                                            data-bs-backdrop="static" data-bs-keyboard="false"
                                                            tabindex="-1" aria-labelledby="staticBackdropLabel"
                                                            aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-scrollable">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title"
                                                                            id="staticBackdropLabel">快速新增</h5>
                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <table>
                                                                            <tr>
                                                                                <td class="text-nowrap">類別:</td>
                                                                                <td><select size="1" name="type">				
																					<option>--請選擇--
																					<option value=0>活動
																					<option value=1>二手
																					<option value=2>搬家
																					<option value=3>其他
																					<option value=4>系統
																					</select>
																				</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>標題:</td>
                                                                                <td><input type="TEXT" name="title"
                                                                                        size="45"
                                                                                        value="<%=(newsVO == null) ? "" : newsVO.getTitle()%>" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>內容:</td>
                                                                                <td><textarea class="form-control"
                                                                                        name="content" size="45"
                                                                                        value="<%=(newsVO == null) ? "" : newsVO.getContent()%>"
                                                                                        rows="3" /></textarea></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>圖片:</td>
                                                                                <td><input type="file" name="image"
                                                                                        size="45"
                                                                                        value="<%=(newsVO == null) ? "" : newsVO.getImage()%>" />
                                                                                </td>
                                                                            </tr>
                                                                            <jsp:useBean id="newsSvc" scope="page"
                                                                                class="com.news.model.NewsServiceImpl" />
                                                                        </table>
                                                                        <br>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Close</button>
                                                                        <input type="hidden" name="action"
                                                                            value="insert">
                                                                        <input type="submit" class="btn btn-primary"
                                                                            value="送出新增">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </FORM>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- DataTales Example 表格(注意vo import)-->
                    <div class="row">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">最新消息管理</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-nowrap">編號</th>
                                                <th scope="col" class="text-nowrap">類別</th>
                                                <th scope="col" class="text-nowrap">標題</th>
                                                <th scope="col" class="text-nowrap">內容</th>
                                                <th scope="col" class="text-nowrap">圖片</th>
                                                <th scope="col" class="text-nowrap">建立時間</th>
                                                <th scope="col" class="text-nowrap"></th>
                                                <th scope="col" class="text-nowrap"></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th scope="col" class="text-nowrap">編號</th>
                                                <th scope="col" class="text-nowrap">類別</th>
                                                <th scope="col" class="text-nowrap">標題</th>
                                                <th scope="col" class="text-nowrap">內容</th>
                                                <th scope="col" class="text-nowrap">圖片</th>
                                                <th scope="col" class="text-nowrap">建立時間</th>
                                                <th scope="col" class="text-nowrap"></th>
                                                <th scope="col" class="text-nowrap"></th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="newsVO2" items="${list}">
                                                <tr>
                                                    <td>${newsVO2.id}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${newsVO2.type==0}">活動</c:when>
                                                            <c:when test="${newsVO2.type==1}">二手</c:when>
                                                            <c:when test="${newsVO2.type==2}">搬家</c:when>
                                                            <c:when test="${newsVO2.type==3}">其他</c:when>
                                                            <c:otherwise>系統</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${newsVO2.title}</td>
                                                    <td>${newsVO2.content}</td>
                                                    <td><img src="<%=request.getContextPath()%>/news/newsimage.do?NEWS_ID=${newsVO2.id}"
                                                            alt=""
                                                            class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                                    </td>
                                                    <td>${newsVO2.date}</td>
                                                    <td>
                                                        <FORM METHOD="post"
                                                            ACTION="<%=request.getContextPath()%>/back_end/news/NewsServlet"
                                                            style="margin-bottom: 0px;">
                                                            <input type="submit" value="修改"
                                                                class="btn btn-outline-warning">
                                                            <input type="hidden" name="id" value="${newsVO2.id}">
                                                            <input type="hidden" name="action"
                                                                value="getOne_For_Update">
                                                        </FORM>
                                                    </td>
                                                    <td class="text-nowrap">
                                                        <FORM METHOD="post"
                                                            ACTION="<%=request.getContextPath()%>/back_end/news/NewsServlet"
                                                            style="margin-bottom: 0px;">
                                                            
                                                                            <input type="submit" value="刪除"
                                                                                class="btn btn-outline-danger">
                                                                            <input type="hidden" name="id"
                                                                                value="${newsVO2.id}">
                                                                            <input type="hidden" name="action"
                                                                                value="delete">
                                                        </FORM>        
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="/back_end/common/footer.jsp"></jsp:include>
                </div>
            </div>
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
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

</body>

</html>