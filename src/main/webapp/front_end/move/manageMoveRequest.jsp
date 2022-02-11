<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_request.model.*"%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css"
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="<%=request.getContextPath()%>/css/move/moveCommon.css" />
<title>委域</title>
</head>
<body class="d-flex flex-column h-100">
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>


	<!-- 全域錯誤、傳入參數 -->
	<%
	List<MoveRequestVO> moveRequestVOs = (List<MoveRequestVO>) request.getAttribute("moveRequestVOList");
	%>

	<!-- main -->
	<main id="outter" class=".flex-column">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Handle</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="moveRequestVO" items="${moveRequestVOs}"
					varStatus="status">
					<tr>
						<!-- 						TODO 內容調整 -->
						<th scope="row">${status.count}</th>
						<td>${moveRequestVO.memberId}</td>
						<td>${moveRequestVO.fromAddress}</td>
						<td>${moveRequestVO.toAddress}</td>
						<td>${moveRequestVO.evaluateDate}</td>
						<td>${moveRequestVO.items}</td>
						<td>${moveRequestVO.evaluatePrice}</td>
						<td>${moveRequestVO.moveDate}</td>
						<td>${moveRequestVO.evaluateType}</td>
						<td>${moveRequestVO.requestDate}</td>
						<td>${moveRequestVO.status}</td>
						<td>${moveRequestVO.handled}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>

	<!-- Footer -->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>