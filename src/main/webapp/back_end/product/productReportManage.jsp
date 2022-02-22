<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_report.model.*" %>
<%@page import="java.sql.Timestamp"%>


<% 
ProductReportServiceImpl reportSvc = new ProductReportServiceImpl(); 
List<ProductReportVO> list = reportSvc.selectAll();
pageContext.setAttribute("list", list);
ProductReportVO productReportVO = (ProductReportVO) request.getAttribute("productReportVO");
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

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
                <div class="container-fluid">
					
                    <!-- main -->
<!--                     <div class="mb-4"> -->
<!--                     <ul> -->
<!--                     <h3 class="m-0 font-weight-bold text-primary">單一查詢:</h3> -->
                    
<!--                     <FORM METHOD="post" ACTION="report.do"> -->
<!--                     	<li class="text-danger">提示:請同時輸入兩個編號</li> -->
<!--                         <li>輸入商品編號:</li> -->
<!--                         <input type="text" name="k2">               -->
<!--                         <li>輸入會員編號:</li> -->
<!--                         <input type="text" name="k1"> -->
<!--                         <input type="hidden" name="action" value="getOne_For_Display"><br><br> -->
<!--                         <input type="submit" value="送出" class="btn btn-outline-primary"> -->
<!--                     </FORM> -->
<!--                     </ul> -->
<!--                     </div> -->
                    <!-- DataTales Example 表格(注意vo import)-->
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
                                            <th>刪除</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th scope="col" class="text-nowrap">商品編號</th>
                                            <th scope="col" class="text-nowrap">會員編號</th>
                                            <th>內文</th>
                                            <th>圖片</th>
                                            <th>時間</th>
                                            <th>狀態</th>
                                            <th>刪除</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="productReportVO" items="${list}">
                                            <tr>
                                                <td>${productReportVO.productId}</td>
                                                <td>${productReportVO.memberId}</td>
                                                <td>${productReportVO.content}</td>
                                                <td><img src="<%=request.getContextPath()%>/product/reportphoto.do?PRODRP_PROD_ID=${productReportVO.productId}&PRODRP_MEM_ID=${productReportVO.memberId}"
                                                    alt=""
                                                    class="img-fluid d-none d-md-block rounded mb-2 shadow "></td>
                                                <td>${productReportVO.date}</td>
                                                <td>
                                                <c:choose>
   													<c:when test="${productReportVO.status==0}">未審核</c:when>  														  														   														
   													<c:when test="${productReportVO.status==1}">已審核</c:when>
													<c:otherwise>已下架</c:otherwise>
												</c:choose>
                                                </td>
                                                <td class="text-nowrap">

                                                    <FORM METHOD="post" ACTION="report.do" style="margin-bottom: 0px;">
                                                        <button type="button" class="btn btn-outline-danger"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal">刪除</button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            警告正在刪除</h5>
                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        您確定要刪除這一筆資料?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-primary"
                                                                            data-bs-dismiss="modal">取消</button>
                                                                        <input type="submit" value="確認"
                                                                            class="btn btn-outline-danger">
                                                                        <input type="hidden" name="k2"
                                                                            value="${productReportVO.productId}">
                                                                        <input type="hidden" name="k1"
                                                                            value="${productReportVO.memberId}">
                                                                        <input type="hidden" name="action"
                                                                            value="delete">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </FORM>
                                                </td>
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
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/js/demo/datatables-demo.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.js"></script>


</body>

</html>