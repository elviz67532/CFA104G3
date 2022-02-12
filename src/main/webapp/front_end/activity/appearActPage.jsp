<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>

<%
	ActivityServiceImpl actSvc = new ActivityServiceImpl();
	List<ActivityVO> list = actSvc.getAllAct();
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>全部活動頁面appearActPage.jsp</title>
<link href="${pageContext.request.contextPath}/css/activity/appearActPage.css" rel="stylesheet">
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
/* .table-striped{ */
/* 	color: table-color; */
/* 	bg-factor: .05; */
/* 	bg: rgba($black, $table-striped-bg-factor); */
/* 	order: odd; */
/* } */
/* .table-hover{ */
/* 	color: table-color; */
/* 	bg-factor: .075; */
/* 	bg: rgba($black, $table-hover-bg-factor); */
/* } */
.ellipsis {
	  overflow: hidden;
	  display: -webkit-box;
	  text-overflow: ellipsis;
	  -webkit-line-clamp: 2; /*行數*/
	  -webkit-box-orient: vertical;
	  white-space: normal;
}
div.tab_container div.tab_contents{
/*     border: 1px solid black; */
    /*   margin-top: 30px; */
}
div.tab_container div.tab_contents div.tab{
    padding: 10px;
    display: none;
}
div.tab_container div.tab_contents div.tab.-on{
    display: block;
}
/*頁籤超連結*/
.act_tab_a{
    text-decoration: none;
}
.wrap{
    width: 960px;
    margin: auto;
    display: fixed;
}
.item{
    width: 100%;
    margin: 10px;
    border: 1px solid #aaa;
    position: relative;
}
.item img{
    width: 40%;
}
.item .act_tab{ /*Hot的絕對定位*/
    border: 1px #888 ;
    border-style: outset;
    background-color: red;
    color: #fff;
    padding: 6px 10px;
	position: absolute; 
    top: -4px;
    left: -4px;
    /* right: -4px; */
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
                        <h1>New Life</h1>
                        <span class="subheading">迎 接 全 新 的 人 生</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
<div class="tab_container">
 	<div class="tab_contents">
	<c:forEach var="actVO" items="${list}" >
		<div class="wrap">
	        <div class="item">
	            <div class="act_tab">${actVO.type}</div>
		            <a class="act_tab_a" href="#">
		                <img src="http://picsum.photos/300/200?random=?" alt="">
		                <h2>${actVO.name}</h2>
		                <p class="ellipsis">${actVO.content}</p>
	                </a>
                </div>
	        </div>
   		</div>
	</c:forEach>
 	</div>
</div>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="編輯活動"> -->
<%-- 			     <input type="hidden" name="activity"  value="${actVO.activityId}"> --%>
<!-- 			     <input type="hidden" name="action"	value="update"></FORM> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除活動"> -->
<%-- 			     <input type="hidden" name="activity"  value="${actVO.activityId}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
	
   
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>