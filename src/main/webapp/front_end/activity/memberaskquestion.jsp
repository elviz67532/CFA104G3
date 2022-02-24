<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--    ============================ 以下為會員問題區塊 ============================ -->
   		<div class="main4">
     <!-- 彈出視窗 -->
   <div class="overlay4">
        <article>
			<!-- 內容從這裡開始 -->
         <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/actq.do" style="display: inline;"> 
			<div style="height: 60%;">
               <h2 class="h2">來問問問題囉!</h2>
               <%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
			<ul> 
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
			<label class="formLabel" for="problem">輸入提問內容: <span style="color: red">${errorMsgs.problem}</span></label>
			<textarea class="actFormInput actContentFormInput" cols="55" name="problem">"<%= (actqVO == null) ? 
					"空想食時間帶消費" : actqVO.getProblem() %>"</textarea>
			</div>
			<!-- 內容從這裡結束 -->
			   <input type="hidden" name="actqid" value="${actqVO.id}"/>
		       <input type="hidden" name="action" value="question"/> 
		       <input type="hidden" name="activityId" value="${actVO.activityId}">
		       <input type="hidden" name="id" value="${memberVO.id}">
<!--                <input type="hidden" name="action" value="selectOneAct"/>  -->
<%-- 		       <a style="text-decoration:none;" href="<%=request.getContextPath()%>/front_end/activity/singleActPage.jsp?action=selectOneAct"> --%>
			       <input style="float:left;margin-top:30px;" id="askQuestion" type="submit" class="" value="詢問問題"/>
<!-- 		       </a> -->
	        </FORM>
	       		<button style="float:right;margin-top:30px;" type="button" class="btn_modal_close4">取消詢問</button>
         </article>
       </div>
   </div>
  <script>
//============================= 問題區 =============================
	var img = document.getElementById('imgContact');
	var span = document.getElementById('spanContact');
	img.addEventListener("mouseover", function() {
		span.innerHTML = "&nbsp;&nbsp;&nbsp;這是問號";
		setTimeout(function() {
			span.innerHTML = "按我詢問問題";
	  	}, 1500);
		setTimeout(function() {
			span.innerHTML = "";
	  	}, 5000);
  });
	 $(function(){
	        // 開啟 Moda4 彈跳視窗
	        $("img.btn_modal4").on("click", function(){
	            $("div.overlay4").fadeIn();
	        });
	        // 關閉 Moda4
	        $("button.btn_modal_close4").on("click", function(){
	            $("div.overlay4").fadeOut();
	        });
	    });
 
  </script>
<!--    ============================ 以上為問題區塊 ============================ -->  