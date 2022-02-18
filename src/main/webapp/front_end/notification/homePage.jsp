<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.notification.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	NotificationService service = new NotificationServiceImpl();	
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
	if (memberVo != null) {
		Integer memberId = memberVo.getId();
		List<NotificationVO> notificationVOs = service.getMemberAllNotification(memberId);
		pageContext.setAttribute("notifications", notificationVOs);
	}
%>
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
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
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
                        <h1>訊息通知</h1>
<!--                         <span class="subheading">迎 接 全 新 的 人 生</span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
    <nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="nav-all" aria-selected="true">全部通知</button>
		    <button class="nav-link" id="nav-move-tab" data-bs-toggle="tab" data-bs-target="#nav-move" type="button" role="tab" aria-controls="nav-move" aria-selected="false">搬家</button>
		    <button class="nav-link" id="nav-product-tab" data-bs-toggle="tab" data-bs-target="#nav-product" type="button" role="tab" aria-controls="nav-product" aria-selected="false">二手買賣</button>
	   	    <button class="nav-link" id="nav-activity-tab" data-bs-toggle="tab" data-bs-target="#nav-activity" type="button" role="tab" aria-controls="nav-activity" aria-selected="false">活動舉辦</button>
			<button class="nav-link" id="nav-other-tab" data-bs-toggle="tab" data-bs-target="#nav-other" type="button" role="tab" aria-controls="nav-other" aria-selected="false">其他</button>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
		...
		</div>
		<div class="tab-pane fade" id="nav-move" role="tabpanel" aria-labelledby="nav-move-tab">
		...
		</div>
		<div class="tab-pane fade" id="nav-product" role="tabpanel" aria-labelledby="nav-product-tab">
		...
		</div>
		<div class="tab-pane fade" id="nav-activity" role="tabpanel" aria-labelledby="nav-activity-tab">
		...
		</div>
		<div class="tab-pane fade" id="nav-other" role="tabpanel" aria-labelledby="nav-other-tab">
		...
		</div>
	</div>
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>