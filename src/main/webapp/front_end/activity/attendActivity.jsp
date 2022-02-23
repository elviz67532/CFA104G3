<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>
<%@ page import="com.member.model.*"%>
<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
// ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");
MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
int memberId =memberVO.getId();
ActivityAttendVO actaVO=(ActivityAttendVO)request.getAttribute("activityId");
int activityId = actaVO.getActivityId();		

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>委域報名活動使用attendActivity.jsp</title>
<%-- <link href="${pageContext.request.contextPath}/css/activity/publishActivity.css" rel="stylesheet"> --%>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
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
<link href="${pageContext.request.contextPath}/css/activity/input.css" rel="stylesheet"/>
<style>
.innerDiv{
	width: 60%;
    margin: 0 auto;
    padding: 60px 20px 0;
}
.innerDiv h2{
	text-align: center;
}
.innerDiv h2:hover{
	color: gray;
	cursor: grabbing;
}
.memId{
	margin: 0;
    padding: 0;
}
.formLabel {
    font-size: 14px;
    font-weight: 600;
    color: #282828;
/*     line-height: 1.71; */
/*     padding-bottom: 10px; */
    /* text-align: center; */
    /* font: 1rem 'Fira Sans', sans-serif; */
}
.launchedDate{
    color: #b5bac1;
    font-size: 14px;
    font-weight: 500;
	margin: 4px 8px; 
}
.actFormInput{
	width: 100%;
    flex: 1;
    border: 0;
    padding: 8px 24px;
    background-color: #f1f1f1;
    position: relative;
    font-size: 16px;
    border-radius: 0;
}
.actSelect{
	width: 100%;
    flex: 1;
    border: 0;
    padding: 0 24px;
    background-color: #f1f1f1;
    position: relative;
    font-size: 16px;
    border-radius: 0;
}
.actSelect:hover{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
}
.actPhoto{
	width: 100%;
    flex: 1;
    border: 0;
    padding: 0 24px;
    background-color: #f1f1f1;
    position: relative;
    font-size: 16px;
    border-radius: 0;
}
.actTimeFormInput{
	width: 100%;
    flex: 1;
    border: 0;
    padding: 0 24px;
    background-color: #f1f1f1;
    position: relative;
    font-size: 16px;
    border-radius: 0;
}

/*input hover*/
input[type="text"]:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
}

input[type="number"]:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
}
input[type="date"]:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
}
input[type="datetime-local"]:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
}
textarea:focus{
	border: 2px solid black;
	opacity: 0.8;
    background-color: #30dd8a;
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

.btn-hover.color-5 {
    background-image: linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(23, 168, 108, 0.75);
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
		<div class="innerDiv">
		<h2>進來報名活動囉!</h2>
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul> 
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			
			<label class="formLabel" for="member">活動人數: <span style="color: red">${errorMsgs.member}</span></label>
			<input class="actFormInput" autofocus type="text" name="member" /><br>
				
			<form action="${pageContext.request.contextPath}/activity/acta.do" method="post" name="form1">
			<label class="formLabel" for="note">活動內容備註: <span style="color: red">${errorMsgs.note}</span></label>
			<textarea class="actFormInput actContentFormInput" cols="55" name="note"><%= (actaVO == null) ? 
					"空想食境Fantasy MEALity 為 Manga'Z 所打造出的獨特餐飲體驗，將餐飲結合虛擬實境，用120分鐘的時間帶消費者走入空想王國體驗超乎想像的美食饗宴。" 
																			 :actaVO.getNote()%></textarea>
			
																			 
			<div style="padding: 0 0 0 220px;">
				<input type="submit" class="btn-hover color-5" value="送出報名"/>
				<input type="hidden" name="activityId"  value="${actaVO.activityId}">
				<input type="hidden" name="memberId"  value="${actaVO.memberId}">
				<input type="hidden" name="comment"  value="${actaVO.comment}">
				<input type="hidden" name="note"  value="${actaVO.note}">
 			     <input type="hidden" name="status"  value="1">
 			     <input type="hidden" name="action" value="insert">	
			</div>
			</form>
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