<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>

<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>委域刊登活動publishActivity.jsp</title>
<%-- <link href="<%=request.getContextPath()%>/css/activity/publishActivity.css" rel="stylesheet"> --%>

<!-- sweet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

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

.actFormInput, .actSelect, .actTimeFormInput{
	color: black;
}
/* .btn{ */
/* 	width: 100%; */
/* 	color: #fff; */
/*     padding: 16px 40px; */
/*     border-radius: 4px; */
/*     background-color: lightgreen; */
/* 	margin: 8px 0 60px 0; */
/* } */
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
	<h2>現在來舉辦活動囉!</h2>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font class="formLabel" style="color: red;">請修正以下錯誤:</font>
<!-- 			<ul>  -->
<%-- 				<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 					<li style="color: red">${message}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
		</c:if>
		
		<form action="${pageContext.request.contextPath}/activity/act.do" enctype="multipart/form-data" method="post" name="form1">
<!-- 			<p class="memId">會員名稱?</p> -->
			<label class="formLabel" for="name">活動名稱: <span style="color: red">${errorMsgs.name}</span></label>
			<input class="actFormInput" autofocus type="text" name="name"
				value="<%= (actVO == null) ? "線上水彩訓練冬令營" : actVO.getName() %>" /><br> 
			
			<label class="formLabel"for="type">活動種類: <span style="color: red">${errorMsgs.type}</span></label> 
			<select class="actSelect" name="type" id="">
			 	<option value="" style="display: none">請選擇類型</option>
				<option value="1" <%= (actVO == null || actVO.getType() != 1) ? "" : "selected" %>>活動</option>
				<option value="2" <%= (actVO == null || actVO.getType() != 2) ? "" : "selected" %>>聚餐</option>
				<option value="3" <%= (actVO == null || actVO.getType() != 3) ? "" : "selected" %>>講座</option>
				<option value="4" <%= (actVO == null || actVO.getType() != 4) ? "" : "selected" %>>其他</option>
			</select> 
			<br>
			<label class="formLabel" for="location">活動地點: <span style="color: red">${errorMsgs.location}</span></label>
			<input class="actFormInput" type="text" name="location" value="<%= (actVO == null) ? "406 臺中市北屯區豐樂五街13號" : actVO.getLocation() %>"/><br>
		 	
		 	<label class="formLabel" for="photo">活動照片: <span style="color: red">${errorMsgs.photo}</span></label>
           	<input class="actPhoto" name="actp" type="file" accept="image/*" 
           	value=""><br>
<!--       	多張照片 multiple     -->

			<label class="formLabel" for="content">活動內容: <span style="color: red">${errorMsgs.content}</span></label>
			<textarea class="actFormInput actContentFormInput" cols="55" name="content"><%= (actVO == null) ? "素描、水彩訓練營，跳脫一般傳統制式教學，藉由設定的藝術主題導入技法的應用，用創意與想像來觸動生活經驗中美的感受，深化美的經驗，讓學員們能夠運用自身具備的感受力，完成自己獨特的作品。由於色彩透明，一層顏色覆蓋另一層可以產生特殊的效果，" : actVO.getContent() %></textarea>
	
			<label class="formLabel" for="cost">活動費用: <span style="color: red">${errorMsgs.cost}</span></label>
			<input class="actFormInput actNumberFormInput" type="number" step="1" min="0"
				pattern="[0-9]" name="cost" 
				value="<%= (actVO == null) ? "1600" : actVO.getCost() %>"/><br>
	
			<label class="formLabel" for="applyStartDate">報名開始時間: <span style="color: red">${errorMsgs.applyStartDate}</span></label>
			<input class="actTimeFormInput" type="datetime-local" step="1" name="applyStartDate" 
			value=""/><br>
	
			<label class="formLabel" for="applyEndDate">報名截止時間: <span style="color: red">${errorMsgs.applyEndDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="applyEndDate" 
			value="<%= (actVO == null) ? "" : actVO.getApplyEndDate()%>"/><br>
	
			<label class="formLabel" for="startDate">活動開始時間: <span style="color: red">${errorMsgs.startDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="startDate" 
			value="<%= (actVO == null) ? "" : actVO.getStartDate()%>"/><br> 
			
			<label class="formLabel" for="endDate">活動結束時間: <span style="color: red">${errorMsgs.endDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="endDate" 
			value="<%= (actVO == null) ? "" : actVO.getEndDate()%>"/><br> 
				
			<label class="formLabel" for="maxMember">活動人數上限: <span style="color: red">${errorMsgs.maxMember}</span></label>
			<input class="actFormInput actNumberFormInput" type="number" step="" min="0"
				max="1000" pattern="[0-9]" name="maxMember"
				value="<%= (actVO == null) ? "120" : actVO.getMaxMember() %>"/><br> 
				
			<label class="formLabel" for="minMember">活動人數下限: <span style="color: red">${errorMsgs.minMember}</span></label>
			<input class="actFormInput actNumberFormInput" type="number" step="" min="0"
				max="1000" pattern="[0-9]" name="minMember"
				value="<%= (actVO == null) ? "10" : actVO.getMinMember() %>"/><br>
<!-- 			sweetalert 加在insert 就會有沒效果 -->
			<div style="text-align: center;">
				<input type="hidden" name="action" value="insert"/> 
	<!-- 			sweetalert 加在submit 有效果但不能insert -->
				<input style="margin: 20px 190px;" type="submit" class="btn-hover color-5" value="送出表單" />
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
    <script>
    </script>
</body>

</html>