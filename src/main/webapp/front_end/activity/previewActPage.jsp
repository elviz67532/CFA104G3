<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- switch -->
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%
	ActivityVO actVO = new ActivityVO();
	ActivityServiceImpl actSvc = new ActivityServiceImpl();
	List<ActivityVO> list = actSvc.getAllAct();
	pageContext.setAttribute("list",list);
%>
<%
	request.setAttribute("findActivityTypeString", new String[]{"活動","聚餐","講座","其他"});
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>活動預覽頁面previewActPage.jsp</title>
<link href="${pageContext.request.contextPath}/css/activity/appearActPage.css" rel="stylesheet">

<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- sweet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

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
.ellipsis {
	  overflow: hidden;
	  display: -webkit-box;
	  text-overflow: ellipsis;
	  -webkit-line-clamp: 2; /*行數*/
	  -webkit-box-orient: vertical;
	  white-space: normal;
}
.section1{ 
	padding: 24px 48px 32px 48px; 
    background-color: #fff; 
} 
.section2{
	padding: 2% 48px 0 48px;
    background-color: #fff;
}

.launchedDate{
    color: #b5bac1;
    font-size: 14px;
    font-weight: 500;
	margin: 4px 8px; 
}
.showImage{
	box-shadow: none;
    border-radius: 16px;
    width: 100%;
}
.actType{
    padding: 2px 24px;
	background-color: #212121;
	color: white;
    border-radius: 16px;
    font-size: 16px;
/* 	background-color: #ff93c2; */
    box-shadow: 0 2px 4px rgb(255 147 194 / 30%);
    font-family: Courier, monospace;
}

.actName{
	font-size: 32px;
    font-weight: 600;
    color: #212121;
    margin-top: 10px;
    margin-bottom: 24px;
	font-family: Courier, monospace;
}
.innerDiv{
	box-shadow: 0 2px 8px rgb(0 0 0 / 10%);
    padding: 16px;
    border-radius: 16px;
    font-size: 16px;
    margin: auto 20px auto auto;
}
.timeDiv{
	font-weight: 700;
    color: #595e64;
    font-family: Courier, monospace;
}
.actInformation{
	margin: 20px auto 1rem auto;
	text-align: left;
    padding-bottom: 10px;
    border-bottom: 1px solid #f5f5f5;
    color: #262626;
    font-weight: 600;
    font-size: 24px;
}
.btn{
	width: 100%;
    padding: 16px 40px;
	margin: 8px 0 60px 0;
}
.btn-hover {
    width: 200px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
    
    font-family: Courier, monospace;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}
.btn-hover.color-1 {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
}
.btn-hover.color-11 {
       background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);
        box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
}
.detailP{
 	color: #000; 
 	word-wrap: break-word; 
 	font-weight: 700;
 	color: gray;
	font-family: Courier, monospace;
}
</style>    
   
</head>

<body>
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/activity01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>New Activity</h1>
                        <span class="subheading">至 今 我 仍 深 深 感 動</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
<!--                活動預覽頁面 -->
   		<div style="border: 2px white groove; width: 70%; margin: 0 auto 60px auto;">
<!-- 				<img class="showImage" src="http://picsum.photos/300/200?random=?" alt=""> -->
        <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?activityId=${actVO.activityId}" >
   	<section class="section1">
               <div style="display: block;margin-right:20px; padding: 4px;">
             		<c:set var="typeNum" scope="request" value="${actVO.type}"/>
             		<span class="actType">${findActivityTypeString[typeNum]}</span>
					
             		<button class="btn-hover color-11" style=" float:right; padding: 20px;">報名人數倒數: ${actVO.applyMemberExisting}</button></div>
               <div>
               	<h2 class="actName">活動名稱: ${actVO.name}</h2>
               </div>
               <div class="innerDiv">
               		<div class="timeDiv">
            				活動報名時間: <fmt:formatDate value="${actVO.applyStartDate}" pattern="yyyy-MM-dd hh:mm:ss"/>  ~  <fmt:formatDate value="${actVO.applyEndDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
               		</div>
              	</div>
               <div class="actInformation">
					活動資訊
               </div>
               <span style="font-size:20px; font-family: Courier, monospace;">${actVO.content} </span>
               <p style="margin-bottom: 20px;"></p>
               <p class="detailP">
               	<span style="color: yellowgreen;">
               		<strong>活動時間: </strong>
               	</span>
               		<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
               </p>
               <p class="detailP">
               	<span style="color: yellowgreen;">
               		<strong>活動費用:  </strong>
               	</span>
               		${actVO.cost} 元
               </p>
                <p class="detailP">
               	<span style="color: yellowgreen;">
               		<strong>活動地點:  </strong>
               	</span>
               		${actVO.location}
               </p>
                <p class="detailP">
               	<span style="color: yellowgreen;">
               		<strong>活動人數限制:  </strong>
               	</span>
               		${actVO.minMember}  ~  ${actVO.maxMember}
               </p>
               <input type="submit" class="btn btn-hover color-1" id="sweetBtnPreview" value="結束預覽"/>
               <p class="launchedDate"><fmt:formatDate value="${actVO.launchedDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
 	</section>
 	<section class="section2">
 		
 	</section>
   		</div>
   	
<!-- 			<td> -->
<!-- 			</td> -->
	
   
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    <script>
    	var btn1 = document.getElementById('sweetBtnPreview');
    	btn1.addEventListener('click', function() {
            swal('幹得漂亮！', '你刊登了這筆活動！', 'success');
        });
    	$('#sweetBtnPreview').click (function (e) {
   		   e.preventDefault(); //will stop the link href to call the blog page

   		   setTimeout(function () {
   		       window.location.href = "http://localhost:8081/CFA104G3/front_end/activity/appearActPage.jsp"; //will redirect to your blog page (an ex: blog.html)
   		    }, 2000); //will call the function after 2 secs.

   		});
    </script>
</body>
</html>