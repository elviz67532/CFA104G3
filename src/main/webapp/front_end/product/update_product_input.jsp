<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
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
	<div style="text-align: -webkit-center;">
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color:red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errMsgs}">
					<li style="color:red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	
		<!-- 麵包屑 (Breadcrumb) -->
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/homePage.jsp">總攬</a></li>
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp">買賣家</a></li>
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/sellerAllProducts.jsp">商品管理</a></li>
		    <li class="breadcrumb-item active" aria-current="page">修改商品</li>
		  </ol>
		</nav>	
	
		<FORM METHOD="post" ACTION="ProductServlet" name="form1">
		<table>
			<tr>
		<%-- 	--${productVO.prodId}-- --%>
				<td>商品編號:</td>
				<td class="input-group-text"><%=productVO.getId()%></td>
			</tr>
			<tr>
				<td>商品名稱:</td>
				<td><input type="text" name="prodName"
				value="<%= (productVO == null)? "": productVO.getName()%>"
				class="input-group-text"
				style="margin: 15px;"/></td>
			</tr>
			
			<tr>
				<td>會員編號:</td>
				<td><input type="text" name="memId"
				value="<%= (productVO == null)? "": productVO.getSellerMemberId() %>"
				class="input-group-text"
				style="margin: 15px;"/></td>
			</tr>
			<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>
		
			<tr>
				<td>商品類別:</td>
				<td><select size="1" name="prodType" class="input-group-text">
		<%-- 			<c:forEach var="type" items="${ProductUtil.prodType}"> --%>
		<!-- 				<option value="type">type -->
		<%-- 			</c:forEach> --%>
						<option>--請選擇--
						<option value=0 ${(productVO.type == 0)? 'selected':''}>其他類
						<option value=1 ${(productVO.type == 1)? 'selected':''}>桌椅類
						<option value=2 ${(productVO.type == 2)? 'selected':''}>寢具類
						<option value=3 ${(productVO.type == 3)? 'selected':''}>服飾類
						<option value=4 ${(productVO.type == 4)? 'selected':''}>電器類
					</select></td>
			</tr>
				<td>商品敘述:</td>
				<td><input type="text" name="prodDesc"
				value="<%= (productVO == null)? "": productVO.getDescription() %>"
				class="input-group-text"
				style="margin: 15px;"/></td>
			</tr>
				
			<tr>
				<td>價格:</td>
				<td><input type="text" name="prodPrice"
				value="<%= (productVO == null)? "": productVO.getPrice() %>"
				class="input-group-text"
				style="margin: 15px;"/></td>			
			</tr>
			<tr>
				<td>上架時間:</td>
				<td><input type="text" name="prodUpdate" disabled
				value="<%= new java.sql.Date(System.currentTimeMillis()) %>"
				class="input-group-text"
				style="margin: 15px;"/></td>			
			</tr>
			<tr>
				<td>所在地:</td>
				<td><input type="text" name="prodLoc"
				value="<%= (productVO == null)? "": productVO.getLocation() %>"
				class="input-group-text"
				style="margin: 15px;"/></td>			
			</tr>	
			<tr>
				<td>商品狀態:</td>
				<td><select size="1" name="prodStatus" class="input-group-text" style="margin: 15px;">
						<option>--請選擇--				
						<option value=0 ${(productVO.status == 0)? 'selected':''}>販售中
						<option value=1 ${(productVO.status == 1)? 'selected':''}>完售
					</select></td>
			</tr>			
		</table>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="prodId" value="<%=productVO.getId()%>">
		<input type="submit" value="送出修改" class="btn btn-outline-info" style="margin: 15px;">
		</FORM>
	</div>
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>
</html>