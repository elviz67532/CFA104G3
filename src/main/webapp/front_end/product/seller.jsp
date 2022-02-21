<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="java.util.*"%>
<%@	page import="java.util.HashMap"%>
<%@	page import="com.product.model.ProductVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
	  h4 {
	    color: blue;
	    display: inline;
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
    
   	<!-- 主體畫面設計  -->
	<p>This is a home page for PRODUCT: Home</p>
	
	<div style="text-align:center;">
		<div style="width: 720px; display: inline-block; text-align: left;">
			<h3>查詢資料:</h3>
			
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
				    <c:forEach var="message" items="${errMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			
			<ul>
				<li><a href='listAll.jsp'>List</a> all Products
				
				<li>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
						<b>輸入商品編號: </b>
						<input type="text" name="prodId">
						<input type="hidden" name="action" value="getOne_For_Display">
			        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4> 
					</FORM>
				</li>
				
				<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>
				
				<li>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
						<b>選擇商品編號: </b>
						<select  size="1" name="prodId">
							<c:forEach var="productVO" items="${productSvc.all}">
								<option value="${productVO.id}">${productVO.id}
							</c:forEach>
						</select>
			        	<input type="hidden" name="action" value="getOne_For_Display">
			        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
					</FORM>
				</li>
				
				<li>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
						<b>選擇商品名稱: </b>
						<select  size="1" name="prodId">
							<c:forEach var="productVO" items="${productSvc.all}">
								<option value="${productVO.id}">${productVO.name}
							</c:forEach>
						</select>
			        	<input type="hidden" name="action" value="getOne_For_Display">
			        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
					</FORM>
				</li>
				
				<li>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
						<b>選擇商品類別: </b>
						<select  size="1" name="prodType">
							<%
							Map map = new HashMap();
							map.put(0, "其他類");
							map.put(1, "桌椅類");
							map.put(2, "寢具類");
							map.put(3, "服飾類");
							map.put(4, "電器類");
							%>
								<option> -- 請選擇 --
			<%-- 				<c:forEach var="productVO" items="${productSvc.all}">  --%>
								<option value=0> 其他類
								<option value=1> 桌椅類
								<option value=2> 寢具類
								<option value=3> 服飾類
								<option value=4> 電器類
			<%-- 				</c:forEach> --%>
						</select>
			        	<input type="hidden" name="action" value="get_Display_From_Type">
			        	<input type="submit" value="送出">                   <h4>(資料格式驗證  by Controller ).</h4>	
					</FORM>
				</li>
			
			<%
				com.product.model.ProductDAOImpl dao = new com.product.model.ProductDAOImpl();
				pageContext.setAttribute("dao", dao);
			%>
				
			</ul>
		</div>
	</div>
	<div style="text-align:center;">
		<div style="width: 720px;display: inline-block;text-align: left;">
			<h3>商品管理</h3>
			<a href='addProduct.jsp'><h5>新增商品</h5></a>
		</div>
	</div>
	
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>
</html>