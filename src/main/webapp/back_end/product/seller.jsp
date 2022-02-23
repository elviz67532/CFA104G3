<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="java.util.*"%>
<%@	page import="java.util.HashMap"%>
<%@	page import="com.product.model.ProductVO"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
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

					<!-- main -->
				   	<!-- 主體畫面設計  -->
					
					<div style="text-align:center;">
						<div style="width: 720px; display: inline-block; text-align: left;">
							<h3>商品管理</h3>
							
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
								<li><a href='<%=request.getContextPath()%>/back_end/product/listAll.jsp'><h5>List all Products</h5></a> 
								
								<li>
									<div class="input-group mb-3">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
										  <div class="input-group-append">
										    <input type="text" name="prodId" class="form-control" placeholder="輸入商品編號" aria-label="Recipient's username" aria-describedby="button-addon2">
										    <input type="submit" value="送出" class="btn btn-outline-secondary" id="button-addon2"></button>
										    <input type="hidden" name="action" value="getOne_For_Display_Backend">
										  </div>
										</FORM>
									</div>									
								</li>
								
								<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductServiceImpl"></jsp:useBean>
								<li>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
										<div class="input-group">
										  <select size="1" name="prodId" class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
										    <option selected>選擇商品編號...</option>
											<c:forEach var="productVO" items="${productSvc.all}">
												<option value="${productVO.id}">${productVO.id}
											</c:forEach>
										  </select>
										  <div class="input-group-append">
										    <input type="hidden" name="action" value="getOne_For_Display_Backend">
							        		<input type="submit" value="送出" class="btn btn-outline-secondary">   
										  </div>
										</div>
									</FORM>
								</li>
								<li>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
										<div class="input-group">
										  <select size="1" name="prodId" class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
										    <option selected>選擇商品名稱...</option>
											<c:forEach var="productVO" items="${productSvc.all}">
												<option value="${productVO.id}">${productVO.name}
											</c:forEach>
										  </select>
										  <div class="input-group-append">
										    <input type="hidden" name="action" value="getOne_For_Display_Backend">
							        		<input type="submit" value="送出" class="btn btn-outline-secondary">   
										  </div>
										</div>
									</FORM>								
								</li>
								<li>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet">
										<div class="input-group">
										  <select size="1" name="prodType" class="custom-select" id="inputGroupSelect04" aria-label="Example select with button addon">
										  	<%
											Map map = new HashMap();
											map.put(0, "其他類");
											map.put(1, "桌椅類");
											map.put(2, "寢具類");
											map.put(3, "服飾類");
											map.put(4, "電器類");
											%>
										    <option selected> 請選擇 ...</option>
											<option value=0> 其他類
											<option value=1> 桌椅類
											<option value=2> 寢具類
											<option value=3> 服飾類
											<option value=4> 電器類
										  </select>
										  <div class="input-group-append">
										    <input type="hidden" name="action" value="get_Display_From_Type_Backend">
							        		<input type="submit" value="送出" class="btn btn-outline-secondary">    
										  </div>
										</div>
									</FORM>								
								</li>															
							<%
								com.product.model.ProductDAOImpl dao = new com.product.model.ProductDAOImpl();
								pageContext.setAttribute("dao", dao);
							%>
							</ul>
						</div>
					</div>
<!-- 					<div style="text-align:center;"> -->
<!-- 						<div style="width: 720px;display: inline-block;text-align: left;"> -->
<!-- 							<h3>商品管理</h3> -->
<!-- 							<a href='addProduct.jsp'><h5>新增商品</h5></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
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