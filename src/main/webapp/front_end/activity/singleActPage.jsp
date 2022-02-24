<%@page import="com.activity_report.model.ActivityReportVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 報名用 -->
<%@ page import="com.activity_attend.model.*"%>
<!-- 問答用 -->
<%@ page import="com.activity_question.model.*"%>

<%@ page import="com.member.model.*"%>

<%@ page import="com.activity_report.model.*"%>

<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	//ActivityServlet.java (Concroller) 存入req的actVO物件 (包括幫忙取出的actVO, 也包括輸入資料錯誤時的actVO物件)
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	
	ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");
	
	ActivityReportVO actrVO=(ActivityReportVO)request.getAttribute("actrVO");
	
	ActivityQuestionVO actqVO = (ActivityQuestionVO) request.getAttribute("actqVO");
	
	ActivityQuestionServiceImpl actqSvc = new ActivityQuestionServiceImpl();
	
	List<ActivityQuestionVO> list = null;
	if (actVO != null){
		list = actqSvc.findActAllQuestion(actVO.getActivityId());
	} else {
		list = new ArrayList<>();
	}
		pageContext.setAttribute("list",list);
		
		
	
%>
<%
	request.setAttribute("findActivityType", new String[]{"活動","聚餐","講座","其他"});
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
	padding: 24px 48px 32px 48px; 
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
/*回答問題按鈕 6*/
.btn-hover.color-6 {
    background-image: linear-gradient(to right, #29323c, #485563, #6B8DD6, #8E37D7);
    box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
    width: 30%;
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
/* .main .overlay{ */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*     width: 100%; */
/*     height: 100vh; */
/*     background-color: hsla(0, 0%, 0%, .5); */

/*     display: none; */
/* } */

  
/* /* 元素 article 置中及基本樣式 */ 
/* .main .overlay > article{ */
/*     background-color: white; */
/*     width: 90%; */
/*     height: 90%; */
/*     max-width: 60%; */
/*     max-height: 80%; */
/*     border-radius: 10px; */
/*     box-shadow: 0 0 10px white; */
/*     padding: 10px; */
/*     position: absolute; */
/*     top: 50%; */
/*     left: 50%; */
/*     transform: translate(-50%, -50%); */
/* } */

/* /* ================彈出視窗2============== */ 
/* .main2 .overlay2{ */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*     width: 100%; */
/*     height: 100vh; */
/*     background-color: hsla(0, 0%, 0%, .5); */

/*     display: none; */
/* } */

  
/* /* 元素 article 置中及基本樣式 */ 
/* .main2 .overlay2 > article{ */
/*     background-color: white; */
/*     width: 90%; */
/*     height: 90%; */
/*     max-width: 60%; */
/*     max-height: 80%; */
/*     border-radius: 10px; */
/*     box-shadow: 0 0 10px white; */
/*     padding: 10px; */
/*     position: absolute; */
/*     top: 50%; */
/*     left: 50%; */
/*     transform: translate(-50%, -50%); */
/* } */

/* /* ================彈出視窗3============== */ 
/* .main3 .overlay3{ */
/*     position: fixed; */
/*     top: 0; */
/*     left: 0; */
/*     width: 100%; */
/*     height: 100vh; */
/*     background-color: hsla(0, 0%, 0%, .5); */

/*     display: none; */
/* } */

  
/* /* 元素 article 置中及基本樣式 */ 
/* .main3 .overlay3 > article{ */
/*     background-color: white; */
/*     width: 90%; */
/*     height: 90%; */
/*     max-width: 60%; */
/*     max-height: 80%; */
/*     border-radius: 10px; */
/*     box-shadow: 0 0 10px white; */
/*     padding: 10px; */
/*     position: absolute; */
/*     top: 50%; */
/*     left: 50%; */
/*     transform: translate(-50%, -50%); */
/* } */

/* ================彈出視窗4============== */
.main4 .overlay4{
    position: fixed;
    top: 0;
    left: 0;
    width: 50%;
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

/* ================彈出視窗4============== */
.main5 .overlay5{
    position: fixed;
    top: 0;
    right: 0;
    width: 50%;
    height: 100vh;
    background-color: hsla(0, 0%, 0%, .5);
    display: none;
}

  
/* 元素 article 置中及基本樣式 */
.main5 .overlay5 > article{
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
/* left: 5%; */
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
/* left: 4.3%; */
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
   <div>
   		<img id="imgContact" class="contact btn_modal4" src="<%=request.getContextPath()%>/asset/img/activityImage/question.png">
   		<span id="spanContact" class="contact2"></span>
   </div>
   
   	<!-- 主體畫面設計  -->
<div style="border: 2px white groove; width: 70%; margin: 0 auto 60px auto;">
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
<%--                     <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?activityId=${actVO.activityId}" > --%>
   	<section id="section1" class="section1">
               <div style="display: block; margin-left: 10px; padding: 4px;">
               <div style="width: 100%;">
                   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
		               <input type="hidden" name="action" value="selectOneActForEdit"/> 
		               <input type="hidden" name="activityId" value="${actVO.activityId}">
	               	   <input type="submit" class="btn-hover color-3" value="編輯活動"/>
			       </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="delete"/> 
	      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn-hover color-3" value="刪除活動"/>
			       </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="cancel"/> 
    	      	       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn-hover color-3" value="取消活動"/>
               	   </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="remove"/> 
				       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn-hover color-3" value="下架活動"/>
			       </FORM>
               </div>
<%-- 		      <c:set var="typeNum" scope="request" value="${actVO.type}"/> --%>
<%--              		<span class="actType">${findActivityType[typeNum]}</span> --%>
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
             		<button class="btn-hover color-11" style=" float:right; padding: 20px;">報名人數倒數: ${actVO.applyMemberExisting}</button>
             		</div>
               <div>
               	<h2 class="actName">活動名稱: ${actVO.name} id: ${actVO.activityId}</h2>
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
				<!-- ==================== 參與者功能 ==================== -->
	               <div>
	        	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="報名活動"> 
 			     <input type="hidden" name="activityId"  value="${actVO.activityId}">
<%--  			     <input type="hidden" name="applyStartDate"  value="${actVO.applyStartDate}"> --%>
<%--  			     <input type="hidden" name="maxMember"  value="${actVO.maxMember}"> --%>
<%--  			     <input type="hidden" name="applyMemberExisting"  value="${actVO.applyMemberExisting}"> --%>
 			     <input type="hidden" name="action"	value="getOne_For_Insert"></FORM> 
	        			</td>
 			  	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="活動評分"> 
 			     <input type="hidden" name="activityId"  value="${actVO.activityId}">
 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> 
				</td> 
    			<td>	    	
 			  	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="活動檢舉"> 
 			     <input type="hidden" name="activityId"  value="${actVO.activityId}">
 			     <input type="hidden" name="action"	value="getOne_For_Insert"></FORM> 
				</td> 
    					<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="活動取消"> 
 			     <input type="hidden" name="activityId"  value="${actVO.activityId}">

 			     <input type="hidden" name="action"	value="cancel"></FORM> 
	               </div>
				<!--   ==================== 報名活動 ====================   -->
<%-- 	         <%@ include file="secondActivity.jsp" %>       --%>
		       </div>
               <p class="launchedDate" style="text-align: center;"><fmt:formatDate value="${actVO.launchedDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
 	
 	<!-- =============== 顯示問題  =============== -->
	
 	</section>
   		</div>
   		<!--                問題預覽頁面 -->
   		<div style=" width: 70%; margin: 0 auto 60px auto;">
   			<c:forEach var="actqVO" items="${list}" >
   					<div style="">
						<div class="divproblem${actqVO.memberId}" style="margin: 0 12px;border-radius: 16px; border: 1px lightgray solid;">
			                <div style="margin-left:30px;">
				                <button type="button" class="btn-hover color-8 btnFor${actqVO.memberId}" style="border-radius: 50px;">發問會員編號: ${actqVO.memberId}</button>
			                </div>
			                <div style="margin-left:50px;width: 90%;">
								${actqVO.problem}<br>
								<p class="launchedDate" style="text-align: center;">問題建立時間: <fmt:formatDate value="${actqVO.problemDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
			                </div>
			                <div style="padding:16px;margin-left:50px;width: 90%; background-color: lightgray; color: black; border-radius: 16px;">
				                主辦方的回覆:
									<br>
									${actqVO.reply}
			                </div>
									<p class="launchedDate" style="text-align: center;">主辦回應時間: <fmt:formatDate value="${actqVO.replyDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
									
			                <div style="text-align: center">
								<input id="answerInput${actqVO.memberId}" style="border-radius: 50px;" type="button" class="btn_modal5 btn-hover color-6" value="回答問題"/>
			                </div>
						</div>
   					</div>
						<br>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	   			<script>
		   			$(document).ready(function(){
		   				$(".btnFor${actqVO.memberId}").click(function(){
		   					$(".divproblem${actqVO.memberId}").toggle();
		   				});
		   			});
		   			//按鈕交換
		   			document.getElementById('answerInput${actqVO.memberId}').addEventListener('click',function(){
		   				document.getElementById('imgContact').style.left = "5%";
		   				document.getElementById('spanContact').style.left = "4.3%";
		   			})
		   			
/*==============================================================================================*/
   		var answerInput${actqVO.memberId} = document.getElementById('answerInput${actqVO.memberId}');
   		answerInput${actqVO.memberId}.addEventListener('click',function(){
   			var input${actqVO.memberId} = document.createElement('input');
   			var inputB${actqVO.memberId} = document.createElement('input');
   			var inputC${actqVO.memberId} = document.createElement('input');
   			document.getElementById('appendChildDiv').prepend(inputB${actqVO.memberId});
   			inputB${actqVO.memberId}.id = "inputB${actqVO.id}";
   			inputB${actqVO.memberId}.value = "${actqVO.activityId}";
   			inputB${actqVO.memberId}.name = "activityId";
   			inputB${actqVO.memberId}.type = "hidden";
   			document.getElementById('appendChildDiv').prepend(inputC${actqVO.memberId});
   			inputC${actqVO.memberId}.id = "inputB${actqVO.id}";
   			inputC${actqVO.memberId}.value = "${actqVO.memberId}";
   			inputC${actqVO.memberId}.name = "id";
   			inputC${actqVO.memberId}.type = "hidden";
   			document.getElementById('appendChildDiv').prepend(input${actqVO.memberId});
   			input${actqVO.memberId}.id = "input${actqVO.id}";
   			input${actqVO.memberId}.value = "${actqVO.id}";
   			input${actqVO.memberId}.name = "id";
   			input${actqVO.memberId}.type = "hidden";
   		})
  </script>
   			</c:forEach>
   		</div>
 <!--  ==================== 最下方活動問答  ==================== -->  		
 		
<!--    ============================ 以上為問題區塊 ============================ --> 
<!--    ============================ 以下為會員回答區塊 ============================ -->
   		<div class="main5">
     <!-- 彈出視窗 -->
   <div class="overlay5">
        <article>
			<!-- 內容從這裡開始 -->
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/actq.do" style="display: inline;"> 
			<div style="height: 60%;">
               <h2 class="h2">來回答問題囉!</h2>
               <%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
			<ul> 
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
			<label class="formLabel" for="answer">輸入回應內容: <span style="color: red">${errorMsgs.reply}</span></label>
			<textarea class="actFormInput actContentFormInput" cols="55" name="reply">"<%= (actqVO == null) ? 
					"空想食時間帶消費" : actqVO.getReply() %>"</textarea>
			</div>
			<!-- 內容從這裡結束 -->
			<div id="appendChildDiv">
		       <input  type="hidden" name="action" value="answer"/> 
			   <input id="answerQuestion" type="submit" class="" value="回答問題"/>
			</div>
<!-- 		       </a> -->
	        </FORM>
	       	<button type="button" class="btn_modal_close5">取消回答</button>
         </article>
       </div>
   </div>
  <script>

//============================= 回答區 =============================
	 $(function(){
	        // 開啟 Moda5 彈跳視窗
	        $(".btn_modal5").on("click", function(){
	            $("div.overlay5").fadeIn();
	        });
	        // 關閉 Moda5
	        $("button.btn_modal_close5").on("click", function(){
	            $("div.overlay5").fadeOut();
	        });
	    });

  </script>
<!--    ============================ 以上為回答區塊 ============================ -->   
		
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    <script>
    /*======= 彈出視窗 =======*/   
    $(function(){
        // 開啟 Modal 彈跳視窗
        $("button.btn_modal").on("click", function(){
            $("div.overlay").fadeIn();
        });
        // 關閉 Modal
        $("button.btn_modal_close").on("click", function(){
            $("div.overlay").fadeOut();
        });
    });
    
    $(function(){
        // 開啟 Modal 彈跳視窗
        $("button.btn_modal2").on("click", function(){
            $("div.overlay2").fadeIn();
        });
        // 關閉 Modal
        $("button.btn_modal_close2").on("click", function(){
            $("div.overlay2").fadeOut();
        });
    });
    
    $(function(){
        // 開啟 Modal 彈跳視窗
        $("button.btn_modal3").on("click", function(){
            $("div.overlay3").fadeIn();
        });
        // 關閉 Modal
        $("button.btn_modal_close3").on("click", function(){
            $("div.overlay3").fadeOut();
        });
    });
    
		
	</script>
</body>
</html>