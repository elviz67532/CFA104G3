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
<link href="${pageContext.request.contextPath}/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
<link type="text/css" href="${pageContext.request.contextPath}/css/move/moveCommon.css" />
<title>委域</title>
</head>
<body class="d-flex flex-column h-100">
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- 程式例外錯誤 -->
	<c:if test="${not empty exception}">
		<font style="color:red">請修正以下錯誤:</font>
		<li style="color:red">${exception}</li>
	</c:if>

	<!-- 全域錯誤、傳入參數 -->
	<%
	Map<String, String> errorMsgs = (Map<String, String>) request.getAttribute("errorMsgs");
	MoveRequestVO moveRequestVO = (MoveRequestVO) request.getAttribute("moveRequestVO");
	java.sql.Date moveDate = null;
	try {
		java.sql.Timestamp t = moveRequestVO.getMoveDate();
		moveDate = new java.sql.Date(t.getTime());
	} catch (Exception e) {
	}
	java.sql.Date evaDate = null;
	try {
		java.sql.Timestamp t = moveRequestVO.getEvaluateDate();
		evaDate = new java.sql.Date(t.getTime());
	} catch (Exception e) {
	}
	%>

	<!-- main -->
	<main id="outter" class=".flex-column">
		<div class="bd-content ps-lg-4">
			<form class="row g-3" method="POST" action="${pageContext.request.contextPath}/move/move.req" name="moveRequest" enctype="multipart/form-data">
				<input type="hidden" name="action" value="moveRequest">
				<!-- TODO 範圍調整 -->
				<!-- TODO 模式選擇-> disable -->
				<!-- TODO 限制上傳檔案大小、張數、數量 -->
				<!-- TODO 指定允許時間(EVA、MOVE) -->
				<div class="col-12">
					<label for="fromAddress" class="form-label">收貨地址:</label>
					<input name="fromAddress" type="text" class="form-control" id="fromAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.fromAddress}">
					<% if (errorMsgs != null && errorMsgs.get("fromAddress") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("fromAddress")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<label for="toAddress" class="form-label">送達地址:</label>
					<input name="toAddress" type="text" class="form-control" id="toAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.toAddress}">
					<% if (errorMsgs != null && errorMsgs.get("toAddress") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("toAddress")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<label for="items" class="form-label">貨物描述:</label>
					<input name="items" type="text" class="form-control" id="items"
						placeholder="桌子*1,單人床*1"
						value="${moveRequestVO.items}">
					<% if (errorMsgs != null && errorMsgs.get("items") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("items")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<%
						Date d;
						if (moveRequestVO != null && moveRequestVO.getMoveDate() != null) {
							d = new Date(moveRequestVO.getMoveDate().getTime()); 
						} else {
							d = new Date(System.currentTimeMillis());
						}
					%>
					<label for="moveDate" class="form-label">搬家日期:</label> <input name="moveDate" type="text" class="form-control"
						id="moveDate">
					<% if (errorMsgs != null && errorMsgs.get("moveDate") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("moveDate")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<label class="form-label">申請模式:</label><br/>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="online" value="online" checked>
						<label class="form-check-label" for="online">線上估價</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="site" value="site">
						<label class="form-check-label" for="site">現場估價</label>
					</div>
					<% if (errorMsgs != null && errorMsgs.get("requestMode") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("requestMode")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<label for="evaDate" class="form-label">現場估價日期:</label>
					<input name="evaDate" type="text" class="form-control" id="evaDate">
					<% if (errorMsgs != null && errorMsgs.get("evaDate") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("evaDate")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<label for="itemPhoto" class="form-label">線上估價照片:</label>
					<input name="itemPhoto" type="file" class="form-control" id="itemPhoto" accept="image/png, image/jpeg" multiple>
					<% if (errorMsgs != null && errorMsgs.get("itemPhoto") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("itemPhoto")%>
					</label>
					<%}%>
				</div>
				<div class="col-12">
					<button type="submit" class="btn btn-primary mb-3">送出申請單</button>
				</div>
			</form>
		</div>
	</main>
	
	<!-- custom -->
	<script src="${pageContext.request.contextPath}/datetimepicker/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script>
		$.datetimepicker.setLocale('zh');
		$('#moveDate').datetimepicker({
			theme : '',
			timepicker : false,
			step : 1,
			format : 'Y-m-d',
			value : '${moveDate}'
		});
		$('#evaDate').datetimepicker({
			theme : '',
			timepicker : false,
			step : 1,
			format : 'Y-m-d',
			value : '${evaDate}'
		});
		</script>

	<!-- Footer -->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>