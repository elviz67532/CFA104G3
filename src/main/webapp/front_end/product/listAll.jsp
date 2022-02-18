<%@page import="com.product.model.ProductServiceImpl"%>
<%@page import="com.product.model.ProductVO"%>
<%@page import ="java.util.List"%>
<%@page import="com.product.model.ProductDAOImpl"%>
<%-- <%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<%
	ProductServiceImpl productService = new ProductServiceImpl();
	List<ProductVO> list = productService.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
	<title>所有商品資料 - listAll.jsp</title>
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
	  table, th, td {
	    border: 3px solid #CCCCFF;
	    margin: 20px;
	  }
	  th, td {
	    padding: 5px;
	    text-align: center;
	  }
	</style>
</head>
<body>
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>New Life</h1>
                        <span class="subheading">迎 接 全 新 的 人 生</span>
                    </div>
                </div>
            </div>
        </div>
    </header>


	<%-- 錯誤表列 --%>
	<c:if test="${not empty errMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<br><br>
	<div>
		<table class="table table-hover border-light rounded-3">
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
				<th>圖片</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
			<c:forEach var="productVO" items="${list}">
				<tr>
					<td>${productVO.id}</td>
					<td>${productVO.sellerMemberId}</td>
					<td>${productVO.type}</td>
					<td>${productVO.description}</td>	
					<td>${productVO.price}</td>
					<td>${productVO.name}</td>
					<td>${productVO.launchedDate}</td>
					<td>${productVO.location}</td>
					<td>${productVO.status}</td>
					<td>
						<img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}" class="card-img-top">
					</td>
					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
							<input type="submit" value="修改">
							<input type="hidden" value="${productVO.id}" name="prodId">
		<%-- 					--${productVO.id}-- --%>
							<input type="hidden" value="getOne_For_Update" name="action"> 
						</FORM>
					</td>
					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
							<input type="submit" value="刪除">
							<input type="hidden" value="${productVO.id}" name="prodId">
							<input type="hidden" value="delete" name="action"> 
						</FORM>
					</td>			
				</tr>		
			</c:forEach>
		</table>
	</div>
    
    
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>
</html>