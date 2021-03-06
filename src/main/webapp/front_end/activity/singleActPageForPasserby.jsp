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
	//ActivityServlet.java (Concroller) 存入req的actVO物件 (包括幫忙取出的actVO, 也包括輸入資料錯誤時的actVO物件)
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	
%>
<%
	request.setAttribute("findActivityType", new String[]{"活動","聚餐","講座","其他"});
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>單一活動瀏覽遊客頁面singleActPageForPasserby.jsp</title>
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
   
   	<!-- 主體畫面設計  -->
<div style="border: 2px white groove; width: 70%; margin: 0 auto 60px auto;">
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
<%--                     <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?activityId=${actVO.activityId}" > --%>
   	<section class="section1">
               <div style="display: block; margin-left: 10px; padding: 4px;">
               <div style="width: 100%;">
               </div>
		       <br>
		       <c:set var="actType" scope="session" value="${actVO.type}"/>
		       <span class="actType">
		       <c:choose>
		       		<c:when test="${actType == 1}">
		       		活動
		       		</c:when>
		       		<c:when test="${actType == 2}">
		       		聚餐
		       		</c:when>
		       		<c:when test="${actType == 3}">
		       		講座
		       		</c:when>
		       		<c:when test="${actType == 4}">
		       		其他
		       		</c:when>	
		       </c:choose>
		       
		       </span>
             		<button class="btn-hover color-11" style=" float:right; padding: 20px;">報名人數倒數: ${actVO.maxMember}</button>
             		</div>
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
               		<strong>活動時間:  </strong>
               	</span>
               		<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
               </p>
               <p class="detailP">
               	<span style="color: yellowgreen;">
               		<strong>活動費用:  </strong>
               	</span>
               		${actVO.cost}  元
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
               <div style=" display: block; margin-left: 10px; padding: 4px; width: 100%;">
<!-- 	               <div style="border: 2px solid red;"> -->
	               <div>
	        			<button id="attendActivity" type="button" class="btn_modal btn-hover color-1">報名活動</button>
	               </div>
		       </div>
		       <input id="hiddenStatus" type="hidden" value="${actVO.status}"/>
               <p class="launchedDate" style="text-align: center;"><fmt:formatDate value="${actVO.launchedDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
 	</section>
   		</div>
<script>
var hiddenStatus = document.getElementById('hiddenStatus');
var attendActivity = document.getElementById('attendActivity');
if(hiddenStatus.value == 1){
	attendActivity.style.display = "none";
}
</script>   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>
</html>