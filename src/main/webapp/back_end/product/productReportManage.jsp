<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_report.model.*" %>	


<% 
ProductReportServiceImpl reportscv = new ProductReportServiceImpl(); 
List<ProductReportVO> list = reportscv.selectAll();
pageContext.setAttribute("list", list);
ProductReportVO vo = (ProductReportVO) request.getAttribute("vo");
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
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">檢舉管理</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-nowrap">商品編號</th>
                                            <th scope="col" class="text-nowrap">會員編號</th>
                                            <th scope="col">內文</th>
                                            <th scope="col">圖片</th>
                                            <th scope="col">時間</th>
                                            <th scope="col">狀態</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>商品編號</th>
                                            <th>會員編號</th>
                                            <th>內文</th>
                                            <th>圖片</th>
                                            <th>時間</th>
                                            <th>狀態</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="productReportVO" items="${list}">
                                            <tr>
                                                <td>${productReportVO.productId}</td>
                                                <td>${productReportVO.memberId}</td>
                                                <td>${productReportVO.content}</td>
                                                <td>${productReportVO.photo}</td>
                                                <td>${productReportVO.date}</td>
                                                <td>${productReportVO.status}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>
    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>
</body>

</html>