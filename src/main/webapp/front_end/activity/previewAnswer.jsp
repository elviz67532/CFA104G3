<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="com.activity.model.*"%>
<!-- 報名用 -->
<%@ page import="com.activity_attend.model.*"%>
<!-- 問答用 -->
<%@ page import="com.activity_question.model.*"%>

<%@ page import="com.member.model.*"%>

<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	
	ActivityQuestionVO actqVO = (ActivityQuestionVO) request.getAttribute("actqVO");
%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>活動問答previewQuestion.jsp</title>
<%-- <link href="${pageContext.request.contextPath}/css/activity/appearActPage.css" rel="stylesheet"> --%>

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

.problemDate{
    color: #b5bac1;
    font-size: 14px;
    font-weight: 500;
	margin: 4px 8px; 
}

.idSpan{
	padding: 2px 24px;
	background-color: #212121;
	color: white;
    border-radius: 16px;
/* 	background-color: #ff93c2; */
    box-shadow: 0 2px 4px rgb(255 147 194 / 30%);
    font-family: Courier, monospace;
    font-size: 16px;
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
.question{
	font-size:20px; 
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
<!--                問題預覽頁面 -->
   		<div style="border: 2px white groove; width: 40%; margin: 0 auto 60px auto;">
<!-- 				<img class="showImage" src="http://picsum.photos/300/200?random=?" alt=""> -->
   	<section class="section1">
               <div class="idDiv">
	               <span class="idSpan">會員編號: ${memberVO.id} </span><br>
		           <span class="idSpan">活動編號: ${actqVO.activityId} </span><br>
               </div>
		           <br>
               <span class="question">
               我的回應是:
               <br>
               ${actqVO.problem} </span>
               <br>
               
               <input type="submit" class="btn-hover color-1" id="sweetBtnPreview" value="結束預覽"/>
               <p style="text-align:center;" class="problemDate"><fmt:formatDate value="${actqVO.problemDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
 	</section>
   		</div>
	<script>
    	var btn1 = document.getElementById('sweetBtnPreview');
    	btn1.addEventListener('click', function() {
            swal('幹得漂亮！', '你回答了這個問題！', 'success');
        });
    	$('#sweetBtnPreview').click (function (e) {
   		   e.preventDefault(); //will stop the link href to call the blog page

   		   setTimeout(function () {
   		       window.location.href = "http://localhost:8081/CFA104G3/front_end/activity/homePage.jsp"; //will redirect to your blog page (an ex: blog.html)
   		    }, 1000); //will call the function after 2 secs.

   		});
    </script>
</body>
</html>