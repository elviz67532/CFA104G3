<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--   =============================== 報名活動 ===============================   -->  
 <div class="main">
			       <!-- 彈出視窗 -->
				        <div class="overlay">
				            <article>
				                <h2 class="h2">來報名活動吧!</h2>
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
				  <input type="hidden" name="action" value="xxx"/> 
	      	      <input type="hidden" name="activityId" value="${actVO.activityId}">
				  <input type="submit" class="btn-hover color-1" value="送出表單"/>
			 </FORM>
			<button type="button" class="btn_modal_close btn-hover color-1">取消活動</button>
	     </article>
	 </div>
</div>
			        
<!--   =============================== 為活動評分 ===============================   -->  
	        <div class="main2">
	       <!-- 彈出視窗 -->
		        <div class="overlay2">
		            <article>
						<!-- 內容從這裡開始 -->
						<div style="height: 60%;">
		                <h2 class="h2">來評分活動囉!</h2>
			               <%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
						<ul> 
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
						</c:if>
						<div>
							<span style="font-size: 46px;">★</span>
						</div>
						</div>
						
						<!-- 內容從這裡結束 -->
		            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/acta.do" style="display: inline;"> 
					       <input type="hidden" name="action" value="score"/> 
		      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
					       <input type="submit" class="btn-hover color-1" value="為活動評分"/>
				        </FORM>
				       	<button type="button" class="btn_modal_close2 btn-hover color-1">取消評分</button>
		            </article>
		        </div>
	        </div>
			        
<!--   =============================== 檢舉活動 ===============================   -->  
	        <div class="main3">
	       <!-- 彈出視窗 -->
		        <div class="overlay3">
		            <article>
		                <h2 class="h2">來檢舉活動囉!</h2>
						<!-- 內容從這裡開始 -->
						
						
						
						
						<!-- 內容從這裡結束 -->
		            	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/acta.do" style="display: inline;"> 
					       <input type="hidden" name="action" value="attend"/> 
		      	           <input type="hidden" name="activityId" value="${actVO.activityId}">
					       <input type="submit" class="btn-hover color-1" value="檢舉活動"/>
				        </FORM>
				       	<button type="button" class="btn_modal_close3 btn-hover color-1">取消檢舉</button>
		            </article>
		        </div>
	        </div>