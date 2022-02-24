<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="tab_container">
			<div class="tab_list_block">
                <ul class="tab_list">
                    <li><a data-target="tab1" class="tab -on btn-hover color-5">全部類別</a></li>
                    <li><a data-target="tab2" class="tab btn-hover color-5" >活動</a></li>
                    <li><a data-target="tab3" class="tab btn-hover color-5">聚餐</a></li>
                    <li><a data-target="tab4" class="tab btn-hover color-5">講座</a></li>
                    <li><a data-target="tab5" class="tab btn-hover color-5">其他</a></li>
                </ul>
           </div>
<div class="tab_contents">
<div class="tab tab1 -on">
		<div class="wrap" >
	<c:forEach var="actVO" items="${list}" >
	        <div id="item${actVO.activityId}" class="item${actVO.activityId}">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
			            <c:set var="statusNum" scope="request" value="${actVO.status}"/>
	             		<span class="actStatus">狀態:${findActivityStatus[statusNum]}</span>
	            	</p>
	                <h2 id="actName${actVO.activityId}" class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input id="input${actVO.activityId}" type="submit" class="btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
            
<!-- 	取消與下架 -->
<style>
.item${actVO.activityId}{
    width: 30%;
    margin: 10px;
/*     border: 1px solid #aaa; */
    position: relative;
    display: inline-block;
    transition: transform .3s;
}
.item${actVO.activityId}:hover{
opacity: 0.8;
background-color: white; 
transform: scale(1.02); 
border-radius: 16px;
}
.item${actVO.activityId} .div1{
    padding: 8px 16px;
    min-height: 149px;
    display: flex;
    flex-direction: column;
    border-radius: 0 0 16px 16px;
    border: 1px solid gray;
height:200px;
}
.item${actVO.activityId} .time{
    color: #b5bac1;
    font-size: 14px;
    font-weight: 500;
	margin: 4px 8px; 
}
.item${actVO.activityId} img{
	box-shadow: none;
    border-radius: 16px 16px 0 0;
    width: 100%;
height: 200px;
transition: .5s; 
}
.item${actVO.activityId} .actName{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	white-space: normal;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	height:auto; 
	color: #000; 
}
</style>

<script>
		var item${actVO.activityId} = document.getElementById('item${actVO.activityId}');
		var actName${actVO.activityId} = document.getElementById('actName${actVO.activityId}');
		if(${actVO.status} == 1 ){
			item${actVO.activityId}.style.backgroundColor = "black";
			item${actVO.activityId}.style.opacity = 0.5;
			item${actVO.activityId}.style.borderRadius = '16px';
			actName${actVO.activityId}.style.color = "white";
		}
		if(${actVO.status} == 2){
			item${actVO.activityId}.remove();
		}
</script>
	</c:forEach>
    </div>
</div>
                    
     <div class="tab tab2">
         <div class="wrap" >
	<c:forEach var="actVO" items="${typeList1}" >
	        <div id="item1${actVO.activityId}" class="item${actVO.activityId}">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		            <c:set var="statusNum" scope="request" value="${actVO.status}"/>
             		<span class="actStatus">狀態:${findActivityStatus[statusNum]}</span>
	                <h2 id="actName1${actVO.activityId}" class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
<script>
		var item1${actVO.activityId} = document.getElementById('item1${actVO.activityId}');
		var actName1${actVO.activityId} = document.getElementById('actName1${actVO.activityId}');
		if(${actVO.status} == 1){
			item1${actVO.activityId}.style.backgroundColor = "black";
			item1${actVO.activityId}.style.opacity = 0.5;
			item1${actVO.activityId}.style.borderRadius = '16px';
			actName1${actVO.activityId}.style.color = "white";
		}
		if(${actVO.status} == 2){
			item1${actVO.activityId}.remove();
		}
</script>
		</c:forEach>
	    </div>
	</div>

         
    <div class="tab tab3">
        <div class="wrap" >
	<c:forEach var="actVO" items="${typeList2}" >
	        <div id="item2${actVO.activityId}" class="item${actVO.activityId}">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		            <c:set var="statusNum" scope="request" value="${actVO.status}"/>
             		<span class="actStatus">狀態:${findActivityStatus[statusNum]}</span>
	                <h2 id="actName2${actVO.activityId}" class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
<script>
		var item2${actVO.activityId} = document.getElementById('item2${actVO.activityId}');
		var actName2${actVO.activityId} = document.getElementById('actName2${actVO.activityId}');
		if(${actVO.status} == 1 ){
			item2${actVO.activityId}.style.backgroundColor = "black";
			item2${actVO.activityId}.style.opacity = 0.5;
			item2${actVO.activityId}.style.borderRadius = '16px';
			actName2${actVO.activityId}.style.color = "white";
		}
		if(${actVO.status} == 2){
			item2${actVO.activityId}.remove();
		}
</script>            
		</c:forEach>
	    </div>
    </div>

         <div class="tab tab4">
             <div class="wrap" >
	<c:forEach var="actVO" items="${typeList3}" >
	        <div id="item3${actVO.activityId}" class="item${actVO.activityId}">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		            <c:set var="statusNum" scope="request" value="${actVO.status}"/>
             		<span class="actStatus">狀態:${findActivityStatus[statusNum]}</span>
	                <h2 id="actName3${actVO.activityId}" class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
<script>
		var item3${actVO.activityId} = document.getElementById('item3${actVO.activityId}');
		var actName3${actVO.activityId} = document.getElementById('actName3${actVO.activityId}');
		if(${actVO.status} == 1 ){
			item3${actVO.activityId}.style.backgroundColor = "black";
			item3${actVO.activityId}.style.opacity = 0.5;
			item3${actVO.activityId}.style.borderRadius = '16px';
			actName3${actVO.activityId}.style.color = "white";
		}
		if(${actVO.status} == 2){
			item3${actVO.activityId}.remove();
		}
</script>           
		</c:forEach>
	   	</div>
  	</div>
         <div class="tab tab5">
            <div class="wrap" >
	<c:forEach var="actVO" items="${typeList4}" >
	        <div id="item4${actVO.activityId}" class="item${actVO.activityId}">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
                <img class="showImage" src="<%=request.getContextPath()%>/activity/actp.do?ACTP_ACT_ID=${actVO.activityId}" >
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		            <c:set var="statusNum" scope="request" value="${actVO.status}"/>
             		<span class="actStatus">狀態:${findActivityStatus[statusNum]}</span>
	                <h2 id="actName4${actVO.activityId}" class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
<script>
		var item4${actVO.activityId} = document.getElementById('item4${actVO.activityId}');
		var actName4${actVO.activityId} = document.getElementById('actName4${actVO.activityId}');
		if(${actVO.status} == 1 ){
			item4${actVO.activityId}.style.backgroundColor = "black";
			item4${actVO.activityId}.style.opacity = 0.5;
			item4${actVO.activityId}.style.borderRadius = '16px';
			actName4${actVO.activityId}.style.color = "white";
		}
		if(${actVO.status} == 2){
			item4${actVO.activityId}.remove();
		}
</script>            
		</c:forEach>
         </div>
		</div>
	</div>
	</div> <!-- tab_container -->