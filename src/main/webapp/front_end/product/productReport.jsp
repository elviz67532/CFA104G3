<%@ page import="com.product_report.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@	page import="java.sql.Timestamp"%>


<%
ProductReportVO productReportVO = (ProductReportVO) request.getAttribute("productReportVO");
System.out.println("productReportVO: " + productReportVO);

String prodId = (String)request.getParameter("prodId");
pageContext.setAttribute("prodId", prodId);
%>

<!DOCTYPE html>
<html lang="zh-TW">

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

<body class="d-flex flex-column h-100">
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/product01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>二手商城</h1>
                        <span class="subheading">愛地球，資源再利用</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
  	
   	<!-- 主體畫面設計  -->
	<main class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <h2>回報單</h2>
                           	<%-- 錯誤表列 --%>
   							<div class="my-5">
     						<c:if test="${not empty errorMsgs}">
                            <font style="color: red">請修正以下錯誤:</font>
                            <ul>
                                <c:forEach var="message" items="${errorMsgs}">
                                    <li style="color: red">${message}</li>
                                </c:forEach>
                            </ul>
    						</c:if>
    						</div>
    						 
                        <div class="my-5">
                            <form METHOD="Post" name="form1" ACTION="<%=request.getContextPath()%>/product/report.do" enctype="multipart/form-data">
                            <table>    
                            <!-- 商品編號 input 加上class="form-control-plaintext" 變成只能看-->                                
                            <tr>
                                <td>
                                <input class="form-control"  type="text" placeholder="商品編號...*" data-sb-validations="required" name="productId"
                                value="${prodId}" /></td>                        
                            </tr>
                            
                            <!-- 會員編號 input-->                                
                            <tr>
                                <td><input class="form-control" type="text" placeholder="會員編號...*" data-sb-validations="required" name="memberId"
                                value="${memberVO.id}"/></td>                             
                            </tr>
                            
                            <!-- 狀態 input-->                                
                            <tr> 
                                <td><input type="hidden" name="status" value="<%=(productReportVO == null) ? "0" : productReportVO.getContent()%>"/></td>                                                               
                            </tr>
                            
                            <!-- 內文 input-->                                
                            <tr>
                                <td><textarea class="form-control" name="content" 
                                            value="<%=(productReportVO == null) ? "" : productReportVO.getContent()%>"
                                            rows="3" /></textarea></td>                                
                            </tr>
                                                        
                            <!-- 圖片 input-->                                                
                            <tr>
                                <td>
                                <input class="form-control" type="file" name="photo"   
                                value="<%=(productReportVO == null) ? "" : productReportVO.getPhoto()%>"/>
                                </td>
                            </tr>   
                            
                                
                            <jsp:useBean id="reportSvc" scope="session" class="com.product_report.model.ProductReportServiceImpl"/>                             	                           
                            
                            </table><br>
                            
                                <!-- Submit Button-->
                                <input type="hidden" name="action" value="insert">
   								<input type="submit" value="回報" class="btn btn-outline-primary btn-xl">
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
		
		


    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
   	
    <!-- Bootstrap core JS-->
    <script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
    
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>