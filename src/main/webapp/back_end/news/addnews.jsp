<%@page import="java.sql.Timestamp" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
                <%@ page import="com.news.model.*" %>

                    <%NewsVO vo=(NewsVO) request.getAttribute("vo");%>

                        <!doctype html>
                        <html lang="zh-TW">

                        <head>
                            <meta charset="utf-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                            <link href="/CFA104G3/css/back_end/sb-admin-2.min.css" rel="stylesheet">
                            <link href="/CFA104G3/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
                            <link href="/CFA104G3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
                                type="text/css">
                            <link
                                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                                rel="stylesheet">
                            <title>委域</title>
                        </head>

                        <body id="page-top">
                            <div id="wrapper">
                                <!-- Sidebar -->
                                <script type="text/javascript" src="/CFA104G3/js/back_end/common/sidebar.js"></script>
                                <div id="content-wrapper" class="d-flex flex-column">
                                    <div id="content">
                                        <!-- Topbar -->
                                        <script type="text/javascript"
                                            src="/CFA104G3/js/back_end/common/topbar.js"></script>
                                        <div class="container-fluid">

                                            <!-- main -->

                                            <%-- 錯誤表列 --%>
                                                <c:if test="${not empty errorMsgs}">
                                                    <font style="color: red">請修正以下錯誤:</font>
                                                    <ul>
                                                        <c:forEach var="message" items="${errorMsgs}">
                                                            <li style="color: red">${message}</li>
                                                        </c:forEach>
                                                    </ul>
                                                </c:if>

                                                <FORM METHOD="post"
                                                    ACTION="${pageContext.request.contextPath}/back_end/news/NewsServlet"
                                                    name="form1" enctype="multipart/form-data">
                                                    <table>
                                                        <tr>
                                                            <td>消息分類編號:</td>
                                                            <td><input class="form-control" list="datalistOptions"
                                                                    placeholder="Type to search..." name="type"
                                                                    size="15"
                                                                    value="<%=(vo == null) ? "" : vo.getType()%>" />
                                                            </td>
                                                            <datalist id="datalistOptions">
                                                                <option value="1">
                                                                <option value="2">
                                                                <option value="3">
                                                                <option value="4">
                                                                <option value="5">
                                                            </datalist>
                                                        </tr>
                                                        <tr>
                                                            <td>標題:</td>
                                                            <td><input type="TEXT" name="title" size="45"
                                                                    value="<%=(vo == null) ? "" : vo.getTitle()%>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>內容:</td>
                                                            <td><textarea class="form-control" name="content" size="45"
                                                                    value="<%=(vo == null) ? "" : vo.getContent()%>"
                                                                    rows="3" /></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td>圖片:</td>
                                                            <td><input type="file" name="image" size="45"
                                                                    value="<%=(vo == null) ? "" : vo.getImage()%>" />
                                                            </td>
                                                        </tr>
                                                        <jsp:useBean id="newsSvc" scope="page"
                                                            class="com.news.model.NewsServiceImpl" />


                                                    </table>
                                                    <br>
                                                    <input type="hidden" name="action" value="insert">
                                                    <input type="submit" value="送出新增">
                                                </FORM>
                                                <!-- end of main -->

                                        </div>
                                    </div>
                                    <script type="text/javascript"
                                        src="/CFA104G3/js/back_end/common/footer.js"></script>
                                </div>
                            </div>

                            <!-- Scroll to Top Button-->
                            <a class="scroll-to-top rounded" href="#page-top">
                                <i class="fas fa-angle-up"></i>
                            </a>

                            <!-- Logout Modal-->
                            <script type="text/javascript" src="/CFA104G3/js/back_end/common/logoutModal.js"></script>

                            <!-- custom script -->

                            <!-- Bootstrap core JavaScript-->
                            <script src="/CFA104G3/vendor/jquery/jquery.min.js"></script>
                            <script src="/CFA104G3/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
                            <script src="/CFA104G3/vendor/jquery-easing/jquery.easing.min.js"></script>
                            <script src="/CFA104G3/js/back_end/sb-admin-2.min.js"></script>
                        </body>

                        </html>