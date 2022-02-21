<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 報名用 -->
<%@ page import="com.activity_attend.model.*"%>
<!-- 問答用 -->
<%@ page import="com.activity_question.model.*"%>

<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	//ActivityServlet.java (Concroller) 存入req的actVO物件 (包括幫忙取出的actVO, 也包括輸入資料錯誤時的actVO物件)
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");
	ActivityQuestionVO actqVO = (ActivityQuestionVO) request.getAttribute("actqVO");
%>
<%
	request.setAttribute("findActivityTypeString", new String[]{"活動","聚餐","講座","其他"});
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>單一活動瀏覽頁面singleActPage.jsp</title>
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
    border-radius: 0 0 16px 16px ;
    width: 100%;
}
.actType{
    padding: 4px 24px;
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
    width: 20%;
}

.btn-hover.color-11 {
       background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);
        box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
}
.btn-hover.color-6 {
    background-image: linear-gradient(to right, #009245, #FCEE21, #00A8C5, #D9E021);
    box-shadow: 0 4px 15px 0 rgba(83, 176, 57, 0.75);
}
.btn-hover.color-8 {
    background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
    box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
}
.btn-hover.color-3 {
    background-image: linear-gradient(to right, #667eea, #764ba2, #6B8DD6, #8E37D7);
    box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
    width: 20%;
}
.detailP{
 	color: #000; 
 	word-wrap: break-word; 
 	font-weight: 700;
 	color: gray;
    font-family: Courier, monospace;
}

/* ================彈出視窗============== */
.main .overlay{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);

    display: none;
}

  
/* 元素 article 置中及基本樣式 */
.main .overlay > article{
    background-color: white;
    width: 90%;
    height: 90%;
    max-width: 60%;
    max-height: 80%;
    border-radius: 10px;
    box-shadow: 0 0 10px white;
    padding: 10px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* ================彈出視窗2============== */
.main2 .overlay2{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);

    display: none;
}

  
/* 元素 article 置中及基本樣式 */
.main2 .overlay2 > article{
    background-color: white;
    width: 90%;
    height: 90%;
    max-width: 60%;
    max-height: 80%;
    border-radius: 10px;
    box-shadow: 0 0 10px white;
    padding: 10px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* ================彈出視窗3============== */
.main3 .overlay3{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);

    display: none;
}

  
/* 元素 article 置中及基本樣式 */
.main3 .overlay3 > article{
    background-color: white;
    width: 90%;
    height: 90%;
    max-width: 60%;
    max-height: 80%;
    border-radius: 10px;
    box-shadow: 0 0 10px white;
    padding: 10px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* ================彈出視窗4============== */
.main4 .overlay4{
    position: fixed;
    top: 0;
    left: 0;
    width: 60%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);
    display: none;
}

  
/* 元素 article 置中及基本樣式 */
.main4 .overlay4 > article{
    background-color: white;
    width: 80%;
    height: 40%;
    max-width: 60%;
    max-height: 50%;
    border-radius: 10px;
    box-shadow: 0 0 10px white;
    padding: 10px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/*msg*/
.contact {
	width: 50px;
	height: 50px;
	position: fixed;
	top: 85%;
	left: 90%;
	opacity: 0.5; /*透明度50%*/
	transition: transform .3s;
}

.contact:hover { /*滑鼠滑過*/
	opacity: 0.8;
	transform: scale(1.02);
}
.contact2 {
/* border: 2px solid red; */
	font-size: 12px;
	width: 100px;
	height: 20px;
	position: fixed;
	color: black;
	top: 93%;
	left: 89.3%;
	opacity: 0.5; /*透明度50%*/
	transition: transform .3s;
}
.contact2:hover { /*滑鼠滑過*/
	opacity: 1;
	color: black;
	transform: scale(1.02);
}

/*問問題*/
.formLabel {
    font-size: 14px;
    font-weight: 600;
    color: #282828;
}
.actFormInput{
	width: 100%;
	height: 50%;
	max-height: 50%;
    flex: 1;
    border: 0;
    padding: 8px 24px;
    background-color: #f1f1f1;
    position: relative;
    font-size: 16px;
    border-radius: 0;
}
.h2{
	text-align: center;
}
.h2:hover{
	color: gray;
	cursor: grabbing;
}
textarea:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
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
                        <span class="subheading">與 你 分 享 的 快 樂<br><br>勝 過 獨 自 擁 有</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   <!-- 上與中之間 -->
   <section class="section2">
 	<div style="border: 2px white groove; width: 80%; margin: 0 auto 60px auto;">
 		<span>${actqVO.memberId}</span><br>
        	<span style="color: yellowgreen;">
           		<strong id="problemName"></strong>
           	</span>
 		<span>${actqVO.problem}</span><br>
 		<p class="detailP">
		<fmt:formatDate value="${actqVO.ProblemDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
        </p>
 	</div>
 	</section>
   	<script>
 		var askQuestion = document.getElementById('askQuestion');
 		askQuestion.addEventListener('click',function(){
 			document.getElementById('problemName').innerHTML = "提問內容";
 		})
 	</script>
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    
</body>
</html>