<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_request.model.*"%>
<%@ page import="com.move_photo.model.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/css/move/moveCommon.css" rel="stylesheet" type="text/css"/>
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

	<!-- 成功顯示, disabled, 隱藏送出 -->

   
   	<!-- 主體畫面設計  -->

	<!-- 程式例外錯誤 -->
	<c:if test="${not empty exception}">
		<font style="color:red">請修正以下錯誤:</font>
		<li style="color:red">${exception}</li>
	</c:if>

	<!-- 全域錯誤、傳入參數 -->
	<%
	Map<String, String> errorMsgs = (Map<String, String>) request.getAttribute("errorMsgs");
	MoveRequestVO moveRequestVO = (MoveRequestVO) request.getAttribute("moveRequestVO");
	List<byte[]> photos = (List<byte[]>) request.getAttribute("movePhotosVO");
	String result = (String) request.getAttribute("result");
	boolean addRequestMode = result == null;
	boolean hasErrorMsgs = errorMsgs != null;
	boolean onlineEva = moveRequestVO == null || moveRequestVO.getEvaluateType() == 0;
	
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
	
			<!-- TODO 範圍調整 -->
				<!-- TODO 模式選擇-> disable -->
				<!-- TODO 限制上傳檔案大小、張數、數量 -->
				<!-- TODO 指定允許時間(EVA、MOVE) -->
			<!-- TODO 日期 -->
			<!-- 想應試圖片大小調整 -->

	<!-- main -->
	<main id="outter" class=".flex-column">
		<div class="bd-content ps-lg-4">
		
			<!-- Form 模式 -->
			<%if (addRequestMode) {%>
			<form class="row g-3" method="POST" action="<%=request.getContextPath()%>/move/moveRequest.do" name="moveRequest" enctype="multipart/form-data">
				<input type="hidden" name="action" value="moveRequest">
			<%} else {%>
			<form class="row g-3" action="<%=request.getContextPath()%>/front_end/move/homePage.jsp">
			<%}%>
			
				<!-- 收貨地址 -->
				<div class="col-12">
					<label for="fromAddress" class="form-label">收貨地址:</label>
					<input name="fromAddress" type="text" class="form-control" id="fromAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.fromAddress}" 
						<%= addRequestMode ? "" : "disabled"%>>
					<%if (hasErrorMsgs && errorMsgs.get("fromAddress") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("fromAddress")%>
					</label>
					<%}%>
				</div>
				
				<!-- 送達地址 -->
				<div class="col-12">
					<label for="toAddress" class="form-label">送達地址:</label>
					<input name="toAddress" type="text" class="form-control" id="toAddress"
						placeholder="桃園市中壢區復興路46號8樓"
						value="${moveRequestVO.toAddress}"
						<%= addRequestMode ? "" : "disabled"%>>
					<%if (hasErrorMsgs && errorMsgs.get("toAddress") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("toAddress")%>
					</label>
					<%}%>
				</div>
				
				<!-- 貨物描述 -->
				<div class="col-12">
					<label for="items" class="form-label">貨物描述:</label>
					<input name="items" type="text" class="form-control" id="items"
						placeholder="桌子*1,單人床*1"
						value="${moveRequestVO.items}"
						<%= addRequestMode ? "" : "disabled"%>>
					<%if (hasErrorMsgs && errorMsgs.get("items") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("items")%>
					</label>
					<%}%>
				</div>

				<!-- 搬家日期 -->
				<div class="col-12">
					<label for="moveDate" class="form-label">搬家日期:</label> 
					<input name="moveDate" type="text" class="form-control" id="moveDate"
						<%= addRequestMode ? "" : "disabled"%>
						value="${moveRequestVO.moveDate}">
					<%if (hasErrorMsgs && errorMsgs.get("moveDate") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("moveDate")%>
					</label>
					<%}%>
				</div>
				
				<!-- 申請模式 -->
				<div class="col-12">
					<label class="form-label">申請模式:</label><br/>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="online" value="online" checked 
							<%= addRequestMode ? "" : "disabled"%>
							<%= onlineEva ? "checked" : ""%>>
						<label class="form-check-label" for="online">線上估價</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="requestMode"
							id="site" value="site"
							<%= addRequestMode ? "" : "disabled"%>
							<%= onlineEva ? "" : "checked"%>>
						<label class="form-check-label" for="site">現場估價</label>
					</div>
					<%if (hasErrorMsgs && errorMsgs.get("requestMode") != null) {%>
					<br/>
					<label style="color: red">
						<%=errorMsgs.get("requestMode")%>
					</label>
					<%}%>
				</div>
				
				<!-- 現場估價日期 -->
				<div class="col-12">
					<label for="evaDate" class="form-label">現場估價日期:</label>
					<input name="evaDate" type="text" class="form-control" id="evaDate"
					value="${moveRequestVO.evaluateDate}"
					<%= addRequestMode ? "" : "disabled"%> 
					>
					<%if (hasErrorMsgs && errorMsgs.get("evaDate") != null) {%>
					<label style="color: red">
						<%=errorMsgs.get("evaDate")%>
					</label>
					<%}%>
				</div>
				
				<!-- 線上估價照片 -->
				<div class="col-12">
					<label for="itemPhoto" class="form-label">線上估價照片:</label><br/>
					<%if (addRequestMode) {%>
						<input name="itemPhoto" type="file" class="form-control" id="itemPhoto" accept="image/png, image/jpeg" multiple
						<%= result == null ? "" : "hidden"%>>
						<%if (hasErrorMsgs && errorMsgs.get("itemPhoto") != null) {%>
						<label style="color: red">
							<%=errorMsgs.get("itemPhoto")%>
						</label>
						<%}%>
						<div id="updatePhotosDiv">
						
						</div>
					<%
					} else {
						if (photos != null ) {
							for (byte[] photo : photos) {
								String base64data= Base64.getEncoder().encodeToString(photo);						
					%>	
								<img alt="photo" class="itemPhoto"
								style="max-width:25%;border: solid black 2px;"
								src="data:image/all;base64, <%=base64data%>">
					<%	
							}
						}
					}
					%>				
				</div>
				
				<!-- submit -->
				<div class="col-12">
					<button type="submit" class="btn btn-primary mb-3">
					<%=(addRequestMode) ? "送出申請單" : "返回搬家首頁"%>
					</button>
				</div>
			</form>
		</div>
	</main>
	
	<!-- custom -->
	<script src="<%=request.getContextPath()%>/js/front_end/move/moveRequest.js"></script>
 	
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>