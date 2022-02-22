<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%

MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");

Map<Integer, String> statusMap = new HashMap<>();
statusMap.put(0, "未驗證");
statusMap.put(1, "正常");
statusMap.put(2, "停權");

if (memberVO != null) {
	Integer status = memberVO.getStatus();
	request.setAttribute("status", statusMap.get(status));
	System.out.print(statusMap.get(status));
}
%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="<%=request.getContextPath()%>/css/back_end/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<title>委域</title>
</head>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

table tr {
	border-bottom: solid 2px white;
}

table tr:last-child {
	border-bottom: none;
}

table th {
	position: relative;
	width: 30%;
	background-color: #7d7d7d;
	color: white;
	text-align: center;
	padding: 10px 0;
}

table th:after {
	display: block;
	content: "";
	width: 0px;
	height: 0px;
	position: absolute;
	top: calc(50% - 10px);
	right: -10px;
	border-left: 10px solid #7d7d7d;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
}

table td {
	text-align: left;
	width: 70%;
	text-align: center;
	background-color: #eee;
	padding: 10px 0;
}

.main {
	margin: 20px auto;
	item-align: center;
	width: 80%;
}

button {
	width: 200px;
	color: light blue;
	margin-top: auto;
	margin-right: 0px;
}
</style>
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


					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="">
						<h2>會員資訊狀態</h2>
						<div class="" main>
							<table>
								<tr>
									<td>會員狀態:</td>
									<td>${requestScope.status}</td>
								</tr>

								<tr>
									<td>會員編號:</td>
									<td>${memberVO.id}</td>
								</tr>
								<tr>
									<td>會員郵件:</td>
									<td>${memberVO.email}</td>
								</tr>
								<tr>
									<td>會員帳號:</td>
									<td>${memberVO.account}</td>
								</tr>
								<tr>
									<td>會員密碼:</td>
									<td>${memberVO.password}</td>
								</tr>
								<tr>
									<td>會員暱稱:</td>
									<td>${memberVO.nickname}</td>
								</tr>
								<tr>
									<td>會員姓名:</td>
									<td>${memberVO.name}</td>
								</tr>
								<tr>
									<td>會員電話:</td>
									<td>${memberVO.phone}</td>
								</tr>
								<tr>
									<td>會員性別:</td>
									<c:if test="${memberVO.gender==0}">
										<td>不透漏</td>
									</c:if>
									<c:if test="${memberVO.gender==1}">
										<td>男</td>
									</c:if>
									<c:if test="${memberVO.gender==2}">
										<td>女</td>
									</c:if>
								</tr>
								<tr>
									<td>居住地:</td>
									<td>${memberVO.city}</td>
								</tr>

								<tr>
									<td>鄉/鎮:</td>
									<td>${memberVO.cityArea}</td>
								</tr>
								<tr>
									<td>地址:</td>
									<td>${memberVO.address}</td>
								</tr>
								<tr>
									<td>驗證碼:</td>
									<td>${memberVO.code}</td>
								</tr>
								<tr>
									<td>頭像:</td>
									<td><img src="<%=request.getContextPath()%>/front_end/member/MemberServlet.do?action=getImage&MEM_ID=${memberVO.id}"></td>
								</tr>
								<tr>
									<td>註冊日期:</td>
									<td>${memberVO.registerDate}</td>
								</tr>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/BackMemberServlet.do">
       										<input type="radio" value="1" name="status" />恢復權限
       										<input type="radio" value="2" name="status" />會員停權
											<input type="hidden" name="id" value="${memberVO.id}"> 
											<input type="hidden" name="action"value="updateStatus"> 
										    <input type="submit" value="送出"> 
										</FORM>
								</td>								
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

	<!-- custom script -->

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
</body>

</html>