<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 報名用 -->
<%@ page import="com.activity_attend.model.*"%>
<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	//ActivityServlet.java (Concroller) 存入req的actVO物件 (包括幫忙取出的actVO, 也包括輸入資料錯誤時的actVO物件)
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
	ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");
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
                   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
		               <input type="hidden" name="action" value="selectOneActForEdit"/> 
		               <input type="hidden" name="activityId" value="${actVO.activityId}">
	               	   <input type="submit" class="btn btn-hover color-3" value="編輯活動"/>
			       </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="delete"/> 
	      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn btn-hover color-3" value="刪除活動"/>
			       </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="cancel"/> 
    	      	       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn btn-hover color-3" value="取消活動"/>
               	   </FORM>
			       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
				       <input type="hidden" name="action" value="remove"/> 
				       <input type="hidden" name="activityId" value="${actVO.activityId}">
				       <input type="submit" class="btn btn-hover color-3" value="下架活動"/>
			       </FORM>
               </div>
<%-- 		      <c:set var="typeNum" scope="request" value="${actVO.type}"/> --%>
<%--              		<span class="actType">${findActivityTypeString[typeNum]}</span> --%>
		       <br>
		       <span class="actType">
				    <%	int type = actVO.getType();
						if (type == 1){ out.println("活動");
						} else if(type == 2){ out.println("聚餐");
						} else if(type == 3){ out.println("講座");
						} else { out.println("其他");}
					%>
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
	        			<button type="button" class="btn_modal btn btn-hover color-1">報名活動</button>
	        			<button type="button" class="btn_modal2 btn btn-hover color-1">為活動評分</button>
    				    <button type="button" class="btn_modal3 btn btn-hover color-1">檢舉活動</button>
    					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;">
					       <input type="hidden" name="action" value="quit"/> 
		      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
					       <input type="submit" class="btn btn-hover color-1" value="退出活動"/>
			       		</FORM>
	               </div>
				<!--   ==================== 報名活動 ====================   -->
	               <div class="main">
			       <!-- 彈出視窗 -->
				        <div class="overlay">
				            <article>
				                <h2>來報名活動吧!</h2>
				            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/acta.do" style="display: inline;">
<!-- =============================== 內容從這裡開始 =============================== -->
<table>
			<tr>
				<td>參與會員編號:</td>
				<td><input type="TEXT" name="memberId" size="45"
					value="<%=(actaVO == null) ? "7" : actaVO.getMemberId()%>" /></td>
			</tr>
			<tr>
				<td>參與活動編號:</td>
				<td><input type="TEXT" name="activityId" size="45"
					value="<%=(actaVO == null) ? "1005" : actaVO.getActivityId()%>" /></td>
			</tr>
			<tr>
				<td>評論內容:</td>
				<td><input type="TEXT" name="comment" size="45"
					value="<%=(actaVO == null)?"不好玩":actaVO.getComment() %>" /></td>
			</tr>
			<tr>
				<td>活動內容備註:</td>
				<td><input type="TEXT" name="note" size="45"
					value="<%=(actaVO== null)?"佛教徒" : actaVO.getNote()%>" /></td>
			</tr>
			<tr>
<!-- 				<td>付款狀態:</td> -->
<!-- 				<td><input type="TEXT" name="status" size="45" -->
<%-- 					value="<%=(actaVO == null) ? "1" : actaVO.getStatus()%>" /></td> --%>				
<!-- 				<select name="status"> -->
<%--    					<option value="<%=(actaVO == null) ? "0" : actaVO.getStatus()%>">未付款</option> --%>
<%--    					<option value="<%=(actaVO == null) ? "1" : actaVO.getStatus()%>">已付款</option> --%>
<!-- 				</select>	 -->
<!-- 			</tr> -->
			<tr>
		<td>付款狀態:<font color=red><b>*</b></font></td>
		<td><select size="1" name="status">
				<option value="-1">請選擇付款狀態</option>
				<option value="0" >未付款</option>
   				<option value="1">已付款</option>
					
		</select></td>
		</tr>
			
</table>
<!-- =============================== 內容從這裡結束 =============================== -->
							       <input type="hidden" name="action" value="insert"/> 
				      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
							       <input type="submit" class="btn btn-hover color-1" value="送出表單"/>
						       	</FORM>
						       	<button type="button" class="btn_modal_close btn btn-hover color-1">取消活動</button>
				            </article>
				        </div>
			        </div>
			        
			      <!--   ==================== 為活動評分 ====================   -->  
			        <div class="main2">
			       <!-- 彈出視窗 -->
				        <div class="overlay2">
				            <article>
				                <h2>來評分活動囉!</h2>
								<!-- 內容從這裡開始 -->
								
								
								
								
								<!-- 內容從這裡結束 -->
				            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;"> 
							       <input type="hidden" name="action" value="score"/> 
				      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
							       <input type="submit" class="btn btn-hover color-1" value="為活動評分"/>
						        </FORM>
						       	<button type="button" class="btn_modal_close2 btn btn-hover color-1">取消評分</button>
				            </article>
				        </div>
			        </div>
			        
			        <!--   ==================== 檢舉活動 ====================   -->  
			        <div class="main3">
			       <!-- 彈出視窗 -->
				        <div class="overlay3">
				            <article>
				                <h2>來檢舉活動囉!</h2>
								<!-- 內容從這裡開始 -->
								
								
								
								
								<!-- 內容從這裡結束 -->
				            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do" style="display: inline;"> 
							       <input type="hidden" name="action" value="attend"/> 
				      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
							       <input type="submit" class="btn btn-hover color-1" value="檢舉活動"/>
						        </FORM>
						       	<button type="button" class="btn_modal_close3 btn btn-hover color-1">取消檢舉</button>
				            </article>
				        </div>
			        </div>
		       </div>
               <p class="launchedDate" style="text-align: center;"><fmt:formatDate value="${actVO.launchedDate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
 	</section>
 	<section class="section2">
 		
 	</section>
   		</div>
<!-- 			<td> -->
<!-- 			</td> -->
	
   
   
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