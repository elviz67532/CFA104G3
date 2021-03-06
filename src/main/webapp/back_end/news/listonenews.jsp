<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.news.model.*" %>	
<%@page import="java.sql.Timestamp"%>

<% 
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

                    <%-- 錯誤表列 --%>
                        <c:if test="${not empty errorMsgs}">
                            <font style="color: red">請修正以下錯誤:</font>
                            <ul>
                                <c:forEach var="message" items="${errorMsgs}">
                                    <li style="color: red">${message}</li>
                                </c:forEach>
                            </ul>
                        </c:if>

                        <!-- main -->

                        
                        <!-- DataTales Example 表格(注意vo import)-->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">最新消息管理</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-nowrap">消息編號</th>
                                                <th scope="col" class="text-nowrap">類別編號</th>
                                                <th scope="col" class="text-nowrap">標題</th>
                                                <th scope="col" class="text-nowrap">內容</th>
                                                <th scope="col" class="text-nowrap">圖片</th>
                                                <th scope="col" class="text-nowrap">建立時間</th>
                                                <th scope="col" class="text-nowrap">修改</th>
                                                <th scope="col" class="text-nowrap">刪除</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th scope="col" class="text-nowrap">消息編號</th>
                                                <th scope="col" class="text-nowrap">類別編號</th>
                                                <th scope="col" class="text-nowrap">標題</th>
                                                <th scope="col" class="text-nowrap">內容</th>
                                                <th scope="col" class="text-nowrap">圖片</th>
                                                <th scope="col" class="text-nowrap">建立時間</th>
                                                <th scope="col" class="text-nowrap">修改</th>
                                                <th scope="col" class="text-nowrap">刪除</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            
                                                <tr>
                                                    <td>${newsVO.id}</td>
                                                    <td>${newsVO.type}</td>
                                                    <td>${newsVO.title}</td>
                                                    <td>${newsVO.content}</td>
                                                    <td><img src="<%=request.getContextPath()%>/news/newsimage.do?NEWS_ID=${newsVO.id}" alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow "></td>
                                                    <td>${newsVO.date}</td>
                                                    <td>
                                                        <FORM METHOD="post"
                                                            ACTION="<%=request.getContextPath()%>/back_end/news/NewsServlet"
                                                            style="margin-bottom: 0px;">
                                                            <input type="submit" value="修改" class="btn btn-outline-warning">
                                                            <input type="hidden" name="id" value="${newsVO.id}">
                                                            <input type="hidden" name="action"
                                                                value="getOne_For_Update">
                                                        </FORM>
                                                    </td>
                                                    <td class="text-nowrap">
                                                        <FORM METHOD="post"
                                                            ACTION="<%=request.getContextPath()%>/back_end/news/NewsServlet"
                                                            style="margin-bottom: 0px;">
                                                            <button type="button" class="btn btn-outline-danger"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#exampleModal">刪除</button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title"
                                                                                id="exampleModalLabel">警告正在刪除</h5>
                                                                            <button type="button" class="btn-close"
                                                                                data-bs-dismiss="modal"
                                                                                aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            您確定要刪除這一筆資料?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                class="btn btn-outline-primary"
                                                                                data-bs-dismiss="modal">取消</button>
                                                                            <input type="submit" value="確認"
                                                                                class="btn btn-outline-danger">
                                                                            <input type="hidden" name="id"
                                                                                value="${newsVO.id}">
                                                                            <input type="hidden" name="action"
                                                                                value="delete">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </FORM>
                                                    </td>
                                                </tr>
                                            
                                        </tbody>
                                    </table>
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