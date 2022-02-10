<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<%=request.getContextPath()%>/vendors/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>委域</title>
</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<FORM METHOD="post" ACTION="member.do">
		<input type="hidden" name="action" value="login"> <input
			type="text" id="account" name="account" placeholder="請輸入帳號" required>
		<div class="tab"></div>
		<br> <input type="text" id="password" name="password"
			placeholder="請輸入密碼" required>
		<div class="tab"></div>
		<br> <input type="submit" value="login">
	</form>
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<script
		src="<%=request.getContextPath()%>/vendors/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>