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
<link href="${pageContext.request.contextPath}/css/activity/publishActivity.css" rel="stylesheet">
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
   	<div style="border: 2px green solid; width: 70%; margin: 0 auto;">
	
	<h1>刊登活動</h1>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul> 
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		
		<form action="${pageContext.request.contextPath}/activity/act.do" method="post" name="form1">
			<label class="formLabel" for="name">活動名稱: <span style="color: red">${errorMsgs.name}</span></label>
			<input class="actFormInput" autofocus type="text" name="name"
				value="${param.name}"/><br> 
			
			<label class="formLabel"for="type">活動種類: <span style="color: red">${errorMsgs.type}</span></label> 
			<select class="actSelect" name="type" id="">
				<option value="0">請選擇類型</option>
				<option value="1">活動</option>
				<option value="2">聚餐</option>
				<option value="3">講座</option>
				<option value="4">其他</option>
			</select> 
			<br>
			<label class="formLabel" for="location">活動地點: <span style="color: red">${errorMsgs.location}</span></label>
			<input class="actFormInput" type="text" name="location" value="${param.location}"/><br>
		 	
		 	<label class="formLabel" for="actName">活動照片: <span style="color: red">${errorMsgs.photo}</span></label>
           	<input class="actPhoto" type="file" accept="image/*" value=""><br>
<!--       	多張 multiple     -->
			<label class="formLabel" for="content">活動內容: <span style="color: red">${errorMsgs.content}</span></label>
			<textarea class="actContentFormInput" cols="55" name="content">${param.content}</textarea>
	
			<label class="formLabel" for="cost">活動費用: <span style="color: red">${errorMsgs.cost}</span></label>
			<input class="actNumberFormInput" type="number" step="1" min="0"
				pattern="[0-9]" name="cost" 
				value="${param.cost}"/><br>
	
			<label class="formLabel" for="applyStartDate">報名開始時間: <span style="color: red">${errorMsgs.applyStartDate}</span></label>
			<input class="actTimeFormInput" type="datetime-local" step="1" name="applyStartDate" value="${param.applyStartDate}"/><br>
	
			<label class="formLabel" for="applyEndDate">報名截止時間: <span style="color: red">${errorMsgs.applyEndDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="applyEndDate" value="${param.applyEndDate}"/><br>
	
			<label class="formLabel" for="startDate">活動開始時間: <span style="color: red">${errorMsgs.startDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="startDate" value="${param.startDate}"/><br> 
			
			<label class="formLabel" for="endDate">活動結束時間: <span style="color: red">${errorMsgs.endDate}</span></label>
			<input class="actTimeFormInput" step="1" type="datetime-local" name="endDate" value="${param.endDate}"/><br> 
				
			<label class="formLabel" for="applyMemberExisting">報名人數倒數: <span style="color: red">${errorMsgs.applyMemberExisting}</span></label>
			<span class="actNumberFormInput" style="font-size: 36px; color: red;">${param.maxMember}</span><br> 
	
			<label class="formLabel" for="maxMember">活動人數上限: <span style="color: red">${errorMsgs.maxMember}</span></label>
			<input class="actNumberFormInput" type="number" step="" min="0"
				max="1000" pattern="[0-9]" name="maxMember"
				value="${param.maxMember}"/><br> 
				
			<label class="formLabel" for="minMember">活動人數下限: <span style="color: red">${errorMsgs.minMember}</span></label>
			<input class="actNumberFormInput" type="number" step="" min="0"
				max="1000" pattern="[0-9]" name="minMember"
				value="${param.minMember}"/><br>
	
			<input type="hidden" name="action" value="insert"/> 
			<input type="submit" class="shape-ex11" id="sweetBtn1" value="送出表單"/>
			
		</form>
	</div>
   
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    <script>
    	var btn1 = document.getElementById('sweetBtn1');
    	btn1.addEventListener('click', function() {
            swal('幹得漂亮！', '你的活動刊登完成了！', 'success');
        });
    	$('#sweetBtn1').click (function (e) {
   		   e.preventDefault(); //will stop the link href to call the blog page

   		   setTimeout(function () {
   		       window.location.href = "http://localhost:8081/CFA104G3/back_end/activity/selectAllActivityPage.jsp"; //will redirect to your blog page (an ex: blog.html)
   		    }, 2000); //will call the function after 2 secs.

   		});
    </script>
</body>

</html>