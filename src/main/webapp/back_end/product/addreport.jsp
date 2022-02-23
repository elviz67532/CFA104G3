<%@ page import="com.product_report.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@	page import="java.sql.Timestamp"%>

<%ProductReportVO productReportVO = (ProductReportVO) request.getAttribute("productReportVO");%>

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
                    <br><br>
                    <li><a href='productReportManage.jsp' class="btn btn-outline-primary">前往檢舉管理</a><br><br></li>
                    
                    <%-- 錯誤表列 --%>
                        <c:if test="${not empty errorMsgs}">
                            <font style="color: red">請修正以下錯誤:</font>
                            <ul>
                                <c:forEach var="message" items="${errorMsgs}">
                                    <li style="color: red">${message}</li>
                                </c:forEach>
                            </ul>
                        </c:if>

                        <h3 class="m-0 font-weight-bold text-primary">測試新增檢舉案:</h3><br>
                        
                        <!-- main -->
                        
                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/product/report.do"
                            name="form1" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td>商品編號:</td>
                                    <td><input type="TEXT" name="productId" size="45"
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getProductId()%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>會員編號:</td>
                                    <td><input type="TEXT" name="memberId" size="45"
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getMemberId()%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>內文:</td>
                                    <td><textarea class="form-control" name="content" size="45"
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getContent()%>"
                                            rows="3" /></textarea></td>
                                </tr>
                                <tr>
                                    <td>狀態:</td>
                                    <td><input type="TEXT" name="status" size="45"
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getStatus()%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>圖片:</td>
                                    <td><input type="file" name="photo" size="45"
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getPhoto()%>" />
                                    </td>
                                </tr>

                                <jsp:useBean id="reportSvc" scope="page"
                                    class="com.product_report.model.ProductReportServiceImpl" />

                            </table>
                            <input type="hidden" name="action" value="insert">
                            <input type="submit" value="送出新增" class="btn btn-outline-primary">
                        </FORM>
                        
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

</body>

</html>