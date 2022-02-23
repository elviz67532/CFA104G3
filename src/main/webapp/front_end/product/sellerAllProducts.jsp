<%@ page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page import="com.product.model.ProductServiceImpl"%>
<%@ page import="com.product.model.ProductVO"%>
<%@ page import="com.member.model.*"%>
<%@ page import ="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="com.product.model.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<%

	ProductServiceImpl productService = new ProductServiceImpl();
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
	Integer account = memberVo.getId();
	List<ProductVO> list = productService.getFromMember(account);
// 	List<ProductVO> list = productService.getFromMember(17);
	pageContext.setAttribute("list", list);
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
	Map<Integer, String> status = new HashMap<>();
	status.put(0,"販售");
	status.put(1,"完售");
	pageContext.setAttribute("status", status);	
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
	    text-size:3px;
	  }
	  th {
	  	font-size:16px;
	  }
	  td {
	  	font-size:15px;
	  }	  
	  th, td {
	    padding: 5px;
	    text-align: center;
	  }
		img {
		    max-width:64px;
		    max-height:64px;
		    width:auto;
		    height:auto;
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
                        <h1>刊登商品</h1>
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
	
	<!-- 麵包屑 (Breadcrumb) -->
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/homePage.jsp">總覽</a></li>
	    <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/front_end/product/vendor.jsp">買賣家</a></li>
	    <li class="breadcrumb-item active" aria-current="page">商品管理</li>
	  </ol>
	</nav>	
	<div>
		<table class="table table-hover table-bordered table-sm align-middle border-light rounded-3">
			<thead>
				<tr>
					<th scope="col" style="text-align:center;">商品編號</th>
					<th scope="col" style="text-align:center;">會員編號_賣家</th>
					<th scope="col" style="text-align:center;">商品類型</th>
					<th scope="col" style="text-align:center;">商品敘述</th>
					<th scope="col" style="text-align:center;">商品價格</th>
					<th scope="col" style="text-align:center;">商品名稱</th>
					<th scope="col" style="text-align:center;">上架時間</th>
					<th scope="col" style="text-align:center;">商品所在</th>
					<th scope="col" style="text-align:center;">商品狀態</th>
					<th scope="col" style="text-align:center;">圖片</th>
					<th scope="col" style="text-align:center;">修改</th>
					<th scope="col" style="text-align:center;">刪除</th>
				</tr>
			</thead>
			<c:forEach var="productVO" items="${list}">
				<tr>
					<th scope="row" class="align-middle" style="text-align:center;">${productVO.id}</th>
					<td class="align-middle">${productVO.sellerMemberId}</td>
					<td class="align-middle">${map[productVO.type]}</td>
					<td class="align-middle">${productVO.description}</td>	
					<td class="align-middle">${productVO.price}</td>
					<td class="align-middle">${productVO.name}</td>
					<td class="align-middle">${productVO.launchedDate}</td>
					<td class="align-middle">${productVO.location}</td>
					<td class="align-middle">${status[productVO.status]}</td>
					<td class="align-middle" style="padding:0px">
						<img src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}" class="card-img-top">
					</td>
					<td class="align-middle">
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
							<input type="submit" value="資料">
							<input type="hidden" value="${productVO.id}" name="prodId">
		<%-- 					--${productVO.id}-- --%>
							<input type="hidden" value="getOne_For_Update" name="action"> 
						</FORM>
						<FORM ACTION="<%=request.getContextPath()%>/front_end/product/update_img.jsp" METHOD="post">	
							<input type="submit" value="圖片">
							<input type="hidden" value="${productVO.id}" name="prodId">
							<input type="hidden" value="getOne_For_Update_Img" name="action">
						</FORM>	
					</td>
					<td class="align-middle">
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