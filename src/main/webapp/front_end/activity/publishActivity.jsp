<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>


<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>addAct</title>
<link href="${pageContext.request.contextPath}/css/activity/activityFrontPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/activity/publishActivity.css" rel="stylesheet">
</head>
<body>

	<!-- 上 -->
	<div class="header">
		<h1>Entrust Area</h1>
		<input type="text" placeholder="search" class="header_input">
		<button class="header_input_button">
			<i class="fas fa-search"></i>
		</button>
		<div class="header_right">
			<nav class="header_list">
				<a href="#">委域官網</a> <a href="#">個人資料</a> <a href="#">活動紀錄</a> <a
					href="#">登入/註冊</a>
				<!-- <button class="header_hamber"></button><i class="fas fa-grip-lines"></i></button> -->
			</nav>
		</div>
	</div>
	<!-- 上 與 中的距離 -->
	<div class="header_to_middle">
		<!-- 跑馬燈 -->
		<marquee direction="left" height="20" scrollamount="5" Loop="10">
			<!-- 停止音樂 -->
			<!-- <marquee direction="left" height="20" scrollamount="5" Loop="10" onmouseup="audio2.play()"></marquee> -->
			<!-- <button class="btn_run" onmousemove="audio.pause()"></button> -->
			2022-01-17
			17:26:00【活動】【線上水彩訓練冬令營】-素描、水彩訓練營，跳脫一般傳統制式教學，藉由設定的藝術主題導入技法的應用，用創意與想像來觸動生活經驗中美的感受，深化美的經驗，讓學員們能夠運用自身具備的感受力，完成自己獨特的作品。
			2022-01-13
			09:10:00【講座】【用腦很快學習英文】-還學不會英文嗎快來報名用腦很快學習英文單字講座，讓你有效吸收學習促進英文單字進步很棒
			2022-02-02
			03:50:00【活動】【2022亞洲洗澡營】-今天你洗澡了嗎？該洗澡了吧！我們所有哺乳動物，都有分泌一些稱為皮脂的油性/蠟狀物質的腺體，有些人可能會分泌很多皮脂(sebum)，只要不洗，這些油垢，也就可能會粘在皮膚上，黃軒表示，異常粘稠或濕冷的皮膚，再加上彈性皮膚，在人體皮膚表層產生摩擦力就會比較大，物體就容易吸附在上面，所以如何有效學習洗澡，今天就學會他
			2022-05-18
			08:00:00【聚餐】【水果忍者】-趣味遊戲吃水果比賽：將水果擺放在桌上，然後所有參賽的人員在5分鐘內儘量吃更多的水果，每吃掉一個水果就會得到相應的分數，吃不乾淨要扣分，時間到後，統計每隊的總分，得分最多的隊伍獲勝，獲勝者獲得水果忍者的稱號，並給予獎勵。水果對應的分值：一牙兒西瓜3分，桃子2分，梨4分，香蕉3分，西紅柿4分，黃瓜5分……，每隊都將自己吃完的水果皮或果胡等放在自己隊伍的盤子裡面，最後用於統計分數，由裁判判定是否吃乾淨，吃的不淨要減分。
		</marquee>
	</div>
	<!-- 中 -->
	<div class="middle">
		<!-- 中左 -->
		<div class="middle_blockDivLeft">
			<!-- <div class="middle_left">
                <ul class="middle_left_ul">
                    <li><img src="image/house.png" alt=""><a href="">全部類別</a></li>
                    <li><img src="image/camping.png" alt=""><a href="">活動</a></li>
                    <li><img src="image/fish.png" alt=""><a href="">聚餐</a></li>
                    <li><img src="image/conversation.png" alt=""><a href="">講座</a></li>
                </ul>
                
            </div> -->
			<!-- <div class="shape-ex11"><p>拍照</p></div> -->
		</div>
		<!-- 中右 -->
		<div class="middle_blockDivRight">
			<div class="middle_right">


				<fieldset>
					<!-- Form Name -->
					<legend>刊登活動囉!</legend>
					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
<!-- 						<ul> --> 
<!-- 								這邊不使用，將錯誤移動到各標題前面 -->
<%-- 							<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 								<li style="color: red">${message}</li> --%>
<%-- 							</c:forEach> --%>
<!-- 						</ul> -->
					</c:if>
					<form action="${pageContext.request.contextPath}/activity/act.do" method="post" name="form1">
						<!-- <label class="formLabel" for="actName">活動上架時間:</label>
                    <input class="actTimeFormInput" type="datetime-local" > -->

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
						
						<label class="formLabel" for="location">活動地點: <span style="color: red">${errorMsgs.location}</span></label>
						<input class="actFormInput" type="text" name="location"
							value="${param.location}"/><br>

						<!--fk-member? <label class="formLabel" for="actTel">聯絡電話:</label> -->
						<!-- <input class="actFormInput" type="tel" size="10" minlength="0" maxlength="10" name="actTel"> -->

						<!-- <label class="formLabel" for="actEmail">email:</label> -->
						<!-- <input class="actFormInput" type="email" name="actEmail"><br> -->

						<!--fk-actp? <label class="formLabel" for="actpPhoto">活動照片:</label> -->
						<!-- <input class="actPhoto" type="file" accept="image/*" multiple name="actpPhoto"><br> -->

						<label class="formLabel" for="content">活動內容: <span style="color: red">${errorMsgs.content}</span></label>
						<textarea class="actContentFormInput" cols="55" name="content">${param.content}</textarea>

						<label class="formLabel" for="cost">活動費用: <span style="color: red">${errorMsgs.cost}</span></label>
						<input class="actNumberFormInput" type="number" step="100" min="0"
							pattern="[0-9]" name="cost" 
							value="${param.cost}"/><br>

						<label class="formLabel" for="applyStartDate">報名開始時間: <span style="color: red">${errorMsgs.applyStartDate}</span></label>
<%-- 			測試空值用	<input class="actTimeFormInput" id="applyStartDate" type="text" name="applyStartDate" value="<%= actVO.getApplyStartDate() %>"><br> --%>
						<input class="actTimeFormInput" type="datetime-local" step="1" name="applyStartDate" value="${param.applyStartDate}"/><br>
<!-- id="applyStartDate" -->
						<label class="formLabel" for="applyEndDate">報名截止時間: <span style="color: red">${errorMsgs.applyEndDate}</span></label>
						<input class="actTimeFormInput" step="1" type="datetime-local" name="applyEndDate" value="${param.applyEndDate}"/><br>

						<label class="formLabel" for="startDate">活動開始時間: <span style="color: red">${errorMsgs.startDate}</span></label>
						<input class="actTimeFormInput" step="1" type="datetime-local" name="startDate" value="${param.startDate}"/><br> 
						
						<label class="formLabel" for="endDate">活動結束時間: <span style="color: red">${errorMsgs.endDate}</span></label>
						<input class="actTimeFormInput" step="1" type="datetime-local" name="endDate" value="${param.endDate}"/><br> 
							
						<label class="formLabel" for="applyMemberExisting">報名人數倒數: <span style="color: red">${errorMsgs.applyMemberExisting}</span></label>
						<span class="actNumberFormInput">${param.maxMember}</span><br> 
							
						<label class="formLabel" for="maxMember">活動人數上限: <span style="color: red">${errorMsgs.maxMember}</span></label>
						<input class="actNumberFormInput" type="number" step="" min="0"
							max="1000" pattern="[0-9]" name="maxMember"
							value="${param.maxMember}"/><br> 
							
						<label class="formLabel" for="minMember">活動人數下限: <span style="color: red">${errorMsgs.minMember}</span></label>
						<input class="actNumberFormInput" type="number" step="" min="0"
							max="1000" pattern="[0-9]" name="minMember"
							value="${param.minMember}"/><br>

						<!--可新增 <label class="formLabel" for="actComment">備註:</label> -->
						<!-- <textarea class="actCommentFormInput" cols="55" name="actComment"></textarea> -->
						<input type="hidden" name="action" value="insert"/> 
						<input type="submit" class="shape-ex11" value="送出表單"/>
					</form>
				</fieldset>
			</div>
			<div class="main"></div>
		</div>
	</div>
</body>
</html>