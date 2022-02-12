<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.activity.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>showAct</title>
<link href="${pageContext.request.contextPath}/css/activity/activityFrontPage.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/activity/publishActivity.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/activity/appearActPage.css" rel="stylesheet">
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
<!--             <div class="middle_left"> -->
<!--                 <ul class="middle_left_ul"> -->
<!--                     <li><img src="image/house.png" alt=""><a href="">報名活動</a></li> -->
<!--                     <li><img src="image/camping.png" alt=""><a href="">退出活動</a></li> -->
<!--                     <li><img src="image/fish.png" alt=""><a href="">編輯活動</a></li> -->
<!--                     <li><img src="image/conversation.png" alt=""><a href="">下架活動</a></li> -->
<!--                     <li><img src="image/conversation.png" alt=""><a href="">取消活動</a></li> -->
<!--                     <li><img src="image/conversation.png" alt=""><a href="">刪除活動</a></li> -->
<!--                 </ul> -->
<!--             </div> -->
            <!-- <div class="shape-ex11"><p>拍照</p></div> -->
        </div>
		<!-- 中右 -->
        <div class="middle_blockDivRight">
            <div class="middle_right">
                <div class="actContentDiv1">

                    <div class="">
                        <span class="actType"><%=actVO.getType()%></span>
                        <span class="actmemId"><%=memVO.getId()%></span>
                        <span class="actTel"><%=memVO.getPhone()%></span>
                        <span class="actEmail"><%=memVO.getEmail()%></span>
                        <h1 class="article-title"><%=actVO.getName()%></h1>
                    </div>
                    <div>
                        <span>皮亞可頌</span>
                        <span>currentTime</span>
                    </div>
                    <div>
                        <div>
                            <button>報名活動</button><button>退出活動</button><button>編輯活動</button>
                            <button>下架活動</button><button>取消活動</button><button>刪除活動</button>
                        </div>
                        <div>
                            <img src="image/202.jpg" alt="" width="80%">
                            <div class="veryContentDiv">
                            	<span>活動地點: <%=actVO.getLocation()%></span>
                            	<span>活動費用:<%=actVO.getCost()%></span>
                            	<span>報名開始時間:<%=actVO.getApplyStartDate()%></span>
                        	    <span>報名截止時間:<%=actVO.getApplyEndDate()%></span>
                            	<span>活動開始時間:<%=actVO.getStartDate()%></span>
                            	<span>活動結束時間:<%=actVO.getEndDate()%></span>
                            	<span>目前報名人數:<%=actVO.getApplyMemberExisting()%></span>
                            	<span>活動人數上限:<%=actVO.getMaxMember()%></span>
                            	<span>活動人數下限:<%=actVO.getMinMember()%></span>
                                <span>活動內容:<%=actVO.getContent()%></span>
                            </div>
                        </div>
                    </div>
                </div>
                    <div>----------------我是分隔線----------------</div>
                <div class="actContentDiv2">
                    <div class="tab_container">
                        <div class="tab_list_block">
                            <ul class="tab_list">
                                <li><a href="#" data-target="tab1" class="tab -on">活動提問</a></li>
                                <li><a href="#" data-target="tab2" class="tab">檢舉活動</a></li>
                                <li><a href="#" data-target="tab3" class="tab">為活動評分</a></li>
                            </ul>
                            </div>
                        <div class="tab_contents">
                            <div class="tab tab1 -on">
                                <label for="">title:</label>
                                <input type="text" name="" id="">
                                <br>
                                <label for="">content:</label><br>
                                <textarea name="" id="" cols="55" rows="10"></textarea>
                                <button>寫完就按我</button>
                            </div>
                            
                            <div class="tab tab2">
                                <label for="">title:</label>
                                <input type="text" name="" id="">
                                <br>
                                <label for="">content:</label><br>
                                <textarea name="" id="" cols="55" rows="10"></textarea>
                                <button>寫完就按我</button>
                            </div>
                            <div class="tab tab3">
                                <label for="">title:</label>
                                <input type="text" name="" id="">
                                <br>
                                <label for="">content:</label><br>
                                <textarea name="" id="" cols="55" rows="10"></textarea>
                                <button>寫完就按我</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
			<div class="main"></div>
		</div>
	</div>
</body>
</html>