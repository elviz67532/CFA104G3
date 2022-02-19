<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.move_request.model.*"%>
<%@ page import="com.member.model.*"%>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>委域</title>
	<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
	<!-- Font Awesome icons (free version)-->
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/styles.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/css/move/moveCommon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
    <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>申請單管理</h1>
<!--                         <span class="subheading"></span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>

	<!-- 全域錯誤、傳入參數 -->
	<%
// 		MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
// 		if (memberVo == null) {
// 			RequestDispatcher failureView = request.getRequestDispatcher("/front_end/move/homePage.jsp");
// 			failureView.forward(request, response);
// 			return;
// 		}
// 		Integer memberId = memberVo.getId();

		Integer memberId = 1;

		MoveRequestService moveRequestService = new MoveRequestServiceImpl(); 
		List<MoveRequestVO> moveRequestVOs = moveRequestService.findMemberRequests(memberId);
		pageContext.setAttribute("moveRequestVOs", moveRequestVOs);

		// 文字比對
		Map<Boolean, String> handledMap = new HashMap<>();
		for (EHandled handled : EHandled.values()) {
			handledMap.put(handled.getHandledCode(), handled.getText());
		}
		pageContext.setAttribute("handledMap", handledMap);
		Map<Integer, String> moveRequestEvaTypeMap = new HashMap<>();
		for (EMoveRequestEvaType type : EMoveRequestEvaType.values()) {
			moveRequestEvaTypeMap.put(type.getTypeCode(), type.getText());
		}
		pageContext.setAttribute("moveRequestEvaTypeMap", moveRequestEvaTypeMap);
		Map<Integer, String> moveRequestStatusMap = new HashMap<>();
		for (EMoveRequestStatus status : EMoveRequestStatus.values()) {
			moveRequestStatusMap.put(status.getStatusCode(), status.getText());
		}
		pageContext.setAttribute("moveRequestStatusMap", moveRequestStatusMap);
	%>

	<!-- main -->
	<main id="outter" class=".flex-column">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">單號</th>
					<th>已處理</th>
					<th>狀態</th>
					<th>估價方式</th>
					<th>估價日期</th>
					<th>搬家日期</th>
					<th>申請日期</th>
					<th>細節</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="moveRequestVO" items="${moveRequestVOs}"
					varStatus="status">
					<tr>
						<!-- TODO 內容調整 -->
						<th scope="row">${moveRequestVO.id}</th>
<%-- 						<td>${moveRequestVO.handled}</td> --%>
						<td><c:out value="${handledMap[moveRequestVO.handled]}"/></td>
						<td>${moveRequestStatusMap[moveRequestVO.status]}</td>
						<td>${moveRequestEvaTypeMap[moveRequestVO.evaluateType]}</td>
						<td><fmt:formatDate value="${moveRequestVO.evaluateDate}" pattern="yyyy-M-dd"/></td>
						<td><fmt:formatDate value="${moveRequestVO.moveDate}" pattern="yyyy-M-dd"/></td>
						<td><fmt:formatDate value="${moveRequestVO.requestDate}" pattern="yyyy-M-dd"/></td>
						<td><button type="button" class="viewRequest" value="${status.count}">查看</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	
	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	
	<script>
		$("button[class='viewRequest']").click(function(){
	        let self = this;
	        let requestId = self.value;
			
	        document.cookie = 'requestId=' + requestId;

	        // TODO 編輯用申請單
	        window.location.href='moveRequest.jsp';
		});
	</script>

	<!-- Footer -->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>