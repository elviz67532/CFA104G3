<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.move_request.model.*"%>
<%@ page import="com.move_photo.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="/asset/favicon.ico" />
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
                        <h1>申請搬家</h1>
<!--                         <span class="subheading"></span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>

	<!-- 成功顯示, disabled, 隱藏送出 -->
   
   	<!-- 主體畫面設計  -->
	<%
		MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
		if (memberVo == null) {
			RequestDispatcher failureView = request.getRequestDispatcher("/front_end/move/homePage.jsp");
			failureView.forward(request, response);
			return;
		}
		
		// 錯誤訊息
		Map<String, String> errorMsgs = (Map<String, String>) request.getAttribute("errorMsgs");
		if (errorMsgs != null) {
			if(errorMsgs.get("fromAddress") != null) 
		pageContext.setAttribute("fromAddress", errorMsgs.get("fromAddress"));
			if(errorMsgs.get("toAddress") != null) 
		pageContext.setAttribute("toAddress", errorMsgs.get("toAddress"));
			if(errorMsgs.get("items") != null) 
		pageContext.setAttribute("items", errorMsgs.get("items"));
			if(errorMsgs.get("moveDate") != null) 
		pageContext.setAttribute("moveDateMsg", errorMsgs.get("moveDate"));
			if(errorMsgs.get("requestMode") != null) 
		pageContext.setAttribute("requestMode", errorMsgs.get("requestMode"));
			if(errorMsgs.get("evaDate") != null) 
		pageContext.setAttribute("evaDateMsg", errorMsgs.get("evaDate"));
			if(errorMsgs.get("itemPhoto") != null) 
		pageContext.setAttribute("itemPhoto", errorMsgs.get("itemPhoto"));
		}
		
		// 傳入參數
		MoveRequestVO moveRequestVO = (MoveRequestVO) request.getAttribute("moveRequestVO");
		List<byte[]> photos = (List<byte[]>) request.getAttribute("movePhotosVO");
		String result = (String) request.getAttribute("result");
		
		if (moveRequestVO == null || moveRequestVO.getEvaluateType() == null) {
			pageContext.setAttribute("onlineEva", true);
		} else {
			if (moveRequestVO.getEvaluateType() == 1) {
				pageContext.setAttribute("onlineEva", false);
			} else {
				pageContext.setAttribute("onlineEva", true);
			}
		}

		java.sql.Date moveDate = null;
		try {
			java.sql.Timestamp t = moveRequestVO.getMoveDate();
			moveDate = new java.sql.Date(t.getTime());
			pageContext.setAttribute("moveDate", moveDate);
		} catch (Exception e) {
		}
		java.sql.Date evaDate = null;
		try {
			java.sql.Timestamp t = moveRequestVO.getEvaluateDate();
			evaDate = new java.sql.Date(t.getTime());
			pageContext.setAttribute("evaDate", evaDate);
		} catch (Exception e) {
		}

		if (photos != null) {
			List<String> photosData = new ArrayList<>();
			for (byte[] photo : photos) {
				String base64data = Base64.getEncoder().encodeToString(photo);
				photosData.add(base64data);
			}
			pageContext.setAttribute("photosData", photosData);
		}
	%>
	
	<!-- TODO 限制上傳檔案大小、張數、數量 -->

	<!-- main -->
	<main id="outter" class=".flex-column">
		<div class="bd-content ps-lg-4">
		
			<!-- 成功/失敗訊息 -->
			<c:if test="${not empty result}">
			 	<div class="container position-relative px-4 px-lg-5">
		            <div class="row gx-4 gx-lg-5 justify-content-center">
		                <div class="col-md-10 col-lg-8 col-xl-7">
		                    <div class="site-heading"  style="text-align:center;">
							<c:choose>
								<c:when test="${result == 1}">
									</label>
									  <h1>申請成功</h1>
								</c:when>
								<c:otherwise>
									</label>
									  <h1>申請失敗，請重新申請</h1>
								</c:otherwise>
							</c:choose>
							</div>		
		                </div>
		            </div>
		        </div>
			</c:if>
			
			<!-- Form 模式 -->
			<c:choose>
				<c:when test="${empty result}">
					<form class="row g-3" method="POST"
						action="${pageContext.request.contextPath}/move/moveRequest.do"
						name="moveRequest" enctype="multipart/form-data">
						<input type="hidden" name="action" value="moveRequest">
				</c:when>
				<c:otherwise>
					<form class="row g-3"
						action="${pageContext.request.contextPath}/front_end/move/homePage.jsp">
				</c:otherwise>
			</c:choose>
			
				<!-- 申請人 -->
				<div class="col-12">
					<label for="requestName" class="form-label">申請人:</label>
					<input name="requestName" type="text" class="form-control" id="requestName"
						placeholder="申請人姓名"
						value="${sessionScope.memberVO.name}" 
						disabled/>
				</div>

				<!-- 收貨地址 -->
				<div class="col-12">
					<label for="fromAddress" class="form-label">收貨地址:</label>
					<input name="fromAddress" type="text" class="form-control" id="fromAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.fromAddress}" 
						<c:out value="${empty result ? '' : 'disabled'}"/>>
					<c:if test="${not empty fromAddress}">
						<label style="color: red">
							"${fromAddress}"
						</label>
					</c:if>
				</div>
				
				<!-- 送達地址 -->
				<div class="col-12">
					<label for="toAddress" class="form-label">送達地址:</label>
					<input name="toAddress" type="text" class="form-control" id="toAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.toAddress}"
						<c:out value="${empty result ? '' : 'disabled'}"/>>
					<c:if test="${not empty toAddress}">
						<label style="color: red">
							"${toAddress}"
						</label>
					</c:if>
				</div>
				
				<!-- 貨物描述 -->
				<div class="col-12">
					<label for="items" class="form-label">貨物描述:</label>
					<input name="items" type="text" class="form-control" id="items"
						placeholder="桌子*1,單人床*1"
						value="${moveRequestVO.items}"
						<c:out value="${empty result ? '' : 'disabled'}"/>>
					<c:if test="${not empty items}">
						<label style="color: red">
							"${items}"
						</label>
					</c:if>
				</div>

				<!-- 搬家日期 -->
				<div class="col-12">
					<label for="moveDate" class="form-label">搬家日期:</label>
					<span data-toggle="tooltip" title="搬家日期請保留至少3天審核日期">ⓘ</span><br/>
					<input name="moveDate" type="date" class="form-control" id="moveDate"
						value="${moveDate}"
							<c:out value="${empty result ? '' : 'disabled'}"/>>
					<c:if test="${not empty moveDateMsg}">
						<label style="color: red">
							"${moveDateMsg}"
						</label>
					</c:if>
				</div>
				
				<!-- 申請模式 -->
				<div class="col-12">
					<label class="form-label">申請模式:</label><br/>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="online" value="online" 
							<c:out value="${onlineEva eq true ? 'checked': ''}"/>
							<c:out value="${empty result ? '' : 'disabled'}"/>>
						<label class="form-check-label" for="online">線上估價</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="site" value="site"
							<c:out value="${onlineEva eq true ? '': 'checked'}"/>
							<c:out value="${empty result ? '' : 'disabled'}"/>>
						<label class="form-check-label" for="site">現場估價</label>
					</div>
					<c:if test="${not empty requestMode}">
						<label style="color: red">
							"${requestMode}"
						</label>
					</c:if>
				</div>
				
				<!-- 現場估價日期 -->
				<div id="siteEvaDiv" class="col-12">
					<label for="evaDate" class="form-label">現場估價日期:</label>
					<span data-toggle="tooltip" title="現場估價時間須比搬家時間晚至少1周">ⓘ</span>
					<input name="evaDate" type="date" class="form-control" id="evaDate"
					value= "${evaDate}"
					<c:out value="${empty result ? '' : 'disabled'}"/>>
					<c:if test="${not empty evaDateMsg}">
						<label style="color: red">
							"${evaDateMsg}"
						</label>
					</c:if>
				</div>

				<!-- 線上估價照片 -->
				<div id="onlineEvaDiv" class="col-12">
					<label for="itemPhoto" class="form-label">線上估價照片:</label>
					<span data-toggle="tooltip" title="圖片最多僅能選擇3張, 任一張圖片大小不得超過3MB">ⓘ</span><br/>
					<c:choose>
						<c:when test="${empty result}">
							<input name="itemPhoto" type="file" class="form-control"
								id="itemPhoto" accept="image/png, image/jpeg" multiple
								value="${result ? 'hidden': ''}">
							<c:if test="${not empty itemPhoto}">
								<label style="color: red">
									"${itemPhoto}"
								</label>
							</c:if>
							<div id="updatePhotosDiv"></div>
						</c:when>
						<c:otherwise>
							<c:forEach var="photo" items="${photosData}">
								<img alt="photo" class="itemPhoto"
								style="max-width: 25%; border: solid black 2px;"
								src="data:image/all;base64, ${photo}">
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- submit -->
				<div class="col-12">
					<button type="submit" class="btn btn-primary mb-3">
						<c:out value="${empty result ? '送出申請單' : '返回搬家首頁'}"/>
					</button>
				</div>
			</form>
		</div>
	</main>
	
	<!-- custom -->
	<script src="${pageContext.request.contextPath}/js/front_end/move/moveRequest.js"></script>
 		
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath}/js/front_end/scripts.js"></script>
</body>

</html>