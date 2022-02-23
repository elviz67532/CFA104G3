<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product.model.ProductVO"%>
<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	pageContext.setAttribute("productVO", productVO);
	System.out.println("productVO: " + productVO);
%>
<%
	Map<Integer, String> map = new HashMap<>();
	map.put(0,"其他");
	map.put(1,"桌椅");
	map.put(2,"寢具");
	map.put(3,"服飾");
	map.put(4, "電器");
	pageContext.setAttribute("map", map);
%>
<%
	Integer type = productVO.getType();
	request.setAttribute("type", map.get(type));
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
	  th {
	    padding: 5px;
	    text-align: center;
	  	font-size : 15px;
	  	 text-align: center;
	  }
	  td {
	  	font-size : 13px;
	  	padding : 0px;
	  	text-align: center;
	  }
		img {
		    max-width:128px;
		    max-height:128px;
		    width:auto;
		    height:auto;
		    padding:0px;
		}	  
	</style>

</head>
<body class="d-flex flex-column h-100" style="">
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
    
	<!-- 麵包屑 (Breadcrumb) -->
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/homePage.jsp">總攬</a></li>
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp">買賣家</a></li>
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/sellerAllProducts.jsp">商品管理</a></li>
	    <li class="breadcrumb-item active" aria-current="page">修改商品</li>
	    <li class="breadcrumb-item active" aria-current="page">查看修改結果</li>
	  </ol>
	</nav>	
    
	<table class="table table-bordered" style="background: mintcream;">
		<tr>
			<th>商品編號</th>
			<th>會員編號_賣家</th>
			<th>商品類型</th>
			<th>商品敘述</th>
			<th>商品價格</th>
			<th>商品名稱</th>
			<th>圖片</th>
			<th>上架時間</th>
			<th>商品所在</th>
			<th>商品狀態</th>
		</tr>
		<tr>
			<td><%=productVO.getId()%></td>
			<td><%=productVO.getSellerMemberId()%></td>
			<td><%=productVO.getType() %>
<%-- 				<c:set var="type" value="<%=productVO.getType() %>"/> --%>
<%-- 		         <c:choose> --%>
<%-- 		           <c:when test="${type == 0}"> --%>
<!-- 		           其他 -->
<%-- 		           </c:when>            --%>
<%-- 		           <c:when test="${type == 1}"> --%>
<!-- 		           桌椅 -->
<%-- 		           </c:when> --%>
<%-- 		           <c:when test="${type == 2}"> --%>
<!-- 		           寢具 -->
<%-- 		           </c:when> --%>
<%-- 		           <c:when test="${type == 3}"> --%>
<!-- 		           服飾 -->
<%-- 		           </c:when>		    --%>
<%-- 		           <c:when test="${type == 4}"> --%>
<!-- 		           電器 -->
<%-- 		           </c:when>				                    --%>
<%-- 				</c:choose>			 --%>
			</td>	
			<td><%=productVO.getDescription()%></td>
			<td><%=productVO.getPrice()%></td>
			<td><%=productVO.getName()%></td>
			<td style="padding: 0;">
				<img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}" class="card-img-top">			
			</td>
			<td><%=productVO.getLaunchedDate()%></td>
			<td><%=productVO.getLocation()%></td>
			<td><%=productVO.getStatus()%></td> 
	<%-- 		${(empVO.deptno==deptVO.deptno)?'selected':'' } --%>
			
		</tr>
	</table>
  <FORM METHOD="post" ACTION="moveorder.do">
    <input type="hidden" name="action" value="insert">
    <input type="hidden" name="productId">
    <input type="submit" value="加入收藏">
  </FORM>
  <FORM METHOD="post" ACTION="moveorder.do">
    <input type="hidden" name="action" value="delete_from_collection">
    <input type="hidden" name="productId">
    <input type="submit" value="取消收藏">
  </FORM>

    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>

</body>
</html>