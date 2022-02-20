<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product.model.ProductVO"%>
<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	System.out.println("productVO: " + productVO);
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
    <style>
	  .SEARCHFOR{
	  padding:10px;
	  margin-bottom: 30px;
	}
	#pagination{
	  bottom: 0;
	}
	.d-block{
	  height: 30%;
	}
	.myImg {
	  height:  400px;
	  background-repeat: no-repeat;
	  background-attachment: fixed;
	  background-position: center;
	  background-size: cover;
	}
	.pagination{
		margin: 10px
	}
	.card{
		margin: 5px
	}
	</style>
	<style>
	  table {
		width: 600px;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
		padding: 10px;
	  }
	  table, th, td {
	    border: 1px solid #CCCCFF;
	  }
	  th, td {
	    padding: 5px;
	    text-align: center;
	  }
	</style>

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
	<table class="table table-bordered" style="background: mintcream;">
		<tr>
			<th>商品編號</th>
			<th>會員編號_賣家</th>
			<th>商品類型</th>
			<th>商品敘述</th>
			<th>商品價格</th>
			<th>商品名稱</th>
			<th>上架時間</th>
			<th>商品所在</th>
			<th>商品狀態</th>
		</tr>
		<tr>
			<td><%=productVO.getId()%></td>
			<td><%=productVO.getSellerMemberId()%></td>
			<td><%=productVO.getType()%></td>	
			<td><%=productVO.getDescription()%></td>
			<td><%=productVO.getPrice()%></td>
			<td><%=productVO.getName()%></td>
			<td><%=productVO.getLaunchedDate()%></td>
			<td><%=productVO.getLocation()%></td>
			<td><%=productVO.getStatus()%></td> 
	<%-- 		${(empVO.deptno==deptVO.deptno)?'selected':'' } --%>
			
		</tr>
	</table>
	
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>
</html>