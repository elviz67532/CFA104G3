<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>委域更新活動使用updateActivity.jsp</title>
<link href="${pageContext.request.contextPath}/css/activity/publishActivity.css" rel="stylesheet">

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
		<h2>進來編輯活動囉!</h2>
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul> 
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			
			<form action="${pageContext.request.contextPath}/activity/act.do" enctype="multipart/form-data" method="post" name="form1">
	<!-- 			<p class="memId">會員名稱?</p> -->
<!-- 				隱藏的其他欄位 -->
<%-- 				<input type="hidden" name="activityId" value="<%= (actVO==null)? "" : actVO.getActivityId() %>"/> --%>
<%-- 				<input type="hidden" name="organizerMemberId" value="<%= (actVO==null) ? "9" : actVO.getOrganizerMemberId() %> "/> --%>
				
				<label class="formLabel" for="name">活動名稱: <span style="color: red">${errorMsgs.name}</span></label>
				<input class="actFormInput" autofocus type="text" name="name"
					value="<%= (actVO == null) ? "美式咖啡好喝活動" : actVO.getName() %>" /><br> 
				
				<label class="formLabel"for="type">活動種類: <span style="color: red">${errorMsgs.type}</span></label> 
				<select class="actSelect" name="type" id="sfs">
					<option value="" style="display: none">請選擇類型</option>
<%-- 					<%= (actVO == null || actVO.getType() != 1) ? "" : "selected" %> --%>
<!-- 					selected -->
					<option value="1" <%= (actVO == null || actVO.getType() != 1) ? "" : "selected" %>>活動</option>
					<option value="2" <%= (actVO == null || actVO.getType() != 2) ? "" : "selected" %>>聚餐</option>
					<option value="3" <%= (actVO == null || actVO.getType() != 3) ? "" : "selected" %>>講座</option>
					<option value="4" <%= (actVO == null || actVO.getType() != 4) ? "" : "selected" %>>其他</option>
				</select> 
				
				<br>
				<label class="formLabel" for="location">活動地點: <span style="color: red">${errorMsgs.location}</span></label>
				<input class="actFormInput" type="text" name="location" value="<%= (actVO == null) ? "207 新北市萬里區坪頂32號" : actVO.getLocation() %>"/><br>
			 	
			 	<label class="formLabel" for="actName">活動照片: <span style="color: red">${errorMsgs.photo}</span></label>
	           	<input class="actPhoto" name="actp" type="file" accept="image/*" value=""><br>
	<!--       	多張 multiple     -->
				<label class="formLabel" for="content">活動內容: <span style="color: red">${errorMsgs.content}</span></label>
				<textarea class="actFormInput actContentFormInput" cols="55" name="content">"<%= (actVO == null) ? 
						"新鮮無毒農草莓，讓你自己摘也自己吃在東林這座群山環抱、林木參天的世外桃源，全家大小都能一同探索生態的奇妙除了能夠親自體驗摘下草莓的樂趣外，你還能夠帶走價值200元的草莓禮盒當天也有草莓果醬DIY的活動。天然無添加的草莓手工果醬，親手熬煮最放心貼心的園長還會準備豐盛的農場午餐＆草莓奶酪，讓你真正體驗別於都市的慢活！" 
																				: actVO.getContent() %>"</textarea>
		
				<label class="formLabel" for="cost">活動費用: <span style="color: red">${errorMsgs.cost}</span></label>
				<input class="actFormInput actNumberFormInput" type="number" step="1" min="0"
					pattern="[0-9]" name="cost" 
					value="<%= (actVO == null) ? "1500" : actVO.getCost() %>"/><br>
		
				<label class="formLabel" for="applyStartDate">報名開始時間: <span style="color: red">${errorMsgs.applyStartDate}</span></label>
				<input class="actTimeFormInput" type="datetime-local" step="1" name="applyStartDate" 
				value="<fmt:formatDate value="${actVO.applyStartDate}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actVO.applyStartDate}" pattern="hh:mm:ss"/>"/><br>

				<label class="formLabel" for="applyEndDate">報名截止時間: <span style="color: red">${errorMsgs.applyEndDate}</span></label>
				<input class="actTimeFormInput" step="1" type="datetime-local" name="applyEndDate" 
				value="<fmt:formatDate value="${actVO.applyEndDate}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actVO.applyEndDate}" pattern="hh:mm:ss"/>"/><br>

				<label class="formLabel" for="startDate">活動開始時間: <span style="color: red">${errorMsgs.startDate}</span></label>
				<input class="actTimeFormInput" step="1" type="datetime-local" name="startDate" 
				value="<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actVO.startDate}" pattern="hh:mm:ss"/>"/><br> 
				
				<label class="formLabel" for="endDate">活動結束時間: <span style="color: red">${errorMsgs.endDate}</span></label>
				<input class="actTimeFormInput" step="1" type="datetime-local" name="endDate" 
				value="<fmt:formatDate value="${actVO.endDate}" pattern="yyyy-MM-dd"/>T<fmt:formatDate value="${actVO.endDate}" pattern="hh:mm:ss"/>"/><br> 
					
				<input type="hidden" name="applyMemberExisting" value="<%=(actVO==null) ? "" : actVO.getMaxMember() %>"/>
			
				<label class="formLabel" for="maxMember">活動人數上限: <span style="color: red">${errorMsgs.maxMember}</span></label>
				<input class="actFormInput actNumberFormInput" type="number" step="" min="0"
					max="1000" pattern="[0-9]" name="maxMember"
					value="<%= (actVO == null) ? "200" : actVO.getMaxMember() %>"/><br> 
					
				<label class="formLabel" for="minMember">活動人數下限: <span style="color: red">${errorMsgs.minMember}</span></label>
				<input class="actFormInput actNumberFormInput" type="number" step="" min="0"
					max="1000" pattern="[0-9]" name="minMember"
					value="<%= (actVO == null) ? "40" : actVO.getMinMember() %>"/><br>
				
				<!--可新增 <label class="formLabel" for="actComment">備註:</label> -->
				<!-- <textarea class="actCommentFormInput" cols="55" name="actComment"></textarea> -->
	<!-- 			id="sweetBtn2" -->
			<div style="padding: 0 0 0 220px;">
				<input type="hidden" name="action" value="update"/> 
				<input type="hidden" name="activityId" value="<%=actVO.getActivityId()%>">
				<input type="submit" class="btn-hover color-5" value="送出修改"/>
			</div>
<%-- 				<input type="hidden" name="status" value="<%=(actVO==null) ? "0" : actVO.getStatus()%>"/> --%>
<%-- 				${actVO.getStatus} --%>
               <input type="hidden" class="launchedDate" name="launchedDate" value="<%= (actVO==null) ? "" : actVO.getLaunchedDate()%>"/>
			
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