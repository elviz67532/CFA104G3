<%@page import="com.mysql.cj.conf.ConnectionUrl.Type"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<!-- 改善時間用 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
// 	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");
// 	actVO.getOrganizerMemberId()
	ActivityServiceImpl actSvc = new ActivityServiceImpl();
	List<ActivityVO> list = actSvc.findByMemId(2);
	pageContext.setAttribute("list",list);
	
// 	List<ActivityVO> typeList1 = actSvc.getActType(1);
// 	pageContext.setAttribute("typeList1",typeList1);
	
// 	List<ActivityVO> typeList2 = actSvc.getActType(2);
// 	pageContext.setAttribute("typeList2",typeList2);
	
// 	List<ActivityVO> typeList3 = actSvc.getActType(3);
// 	pageContext.setAttribute("typeList3",typeList3);
	
// 	List<ActivityVO> typeList4 = actSvc.getActType(4);
// 	pageContext.setAttribute("typeList4",typeList4);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>全部活動頁面appearActPage.jsp</title>
<link href="${pageContext.request.contextPath}/css/activity/appearActPage.css" rel="stylesheet">
<!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

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

.ellipsis {
	  display: -webkit-box;
	  text-overflow: ellipsis;
	  -webkit-line-clamp: 1; /*行數*/
	  -webkit-box-orient: vertical;
	  overflow: hidden;
	  white-space: normal;
	  cursor: pointer;
      color: #959ba1;
      font-size: 18px;
      margin: 8px 0;  
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
.btn-hover.color-9 {
margin: 0 20px;
width: 200px;
height: 50px;
padding: 0;
    background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
}


.tab_container{
/* 	border: 2px solid blue; */
	margin:  auto auto auto 30px; 
}
div.tab_container div.tab_contents{
/*     border: 1px solid black; */
    /*   margin-top: 30px; */
}
div.tab_container div.tab_contents div.tab{
    padding: 10px;
    display: none;
}
div.tab_container div.tab_contents div.tab.-on{
    display: block;
}
/*頁籤超連結*/
.act_tab_a{
    text-decoration: none;
}
.wrap{
    width: 1260px;
	margin: auto;
/* 	margin-right: 30px;  */
/* 	border: 1px solid #aaa;  */
/*     display: fixed; */
}
.item{
    width: 30%;
    margin: 10px;
/*     border: 1px solid #aaa; */
    position: relative;
    display: inline-block;
    transition: transform .3s;
}
.item:hover{
opacity: 0.8;
background-color: white; 
transform: scale(1.02); 
border-radius: 16px;
}
.item .div1{
    padding: 8px 16px;
    min-height: 149px;
    display: flex;
    flex-direction: column;
    border-radius: 0 0 16px 16px;
    border: 1px solid gray;
height:200px;
}
.item .time{
    color: #b5bac1;
    font-size: 14px;
    font-weight: 500;
	margin: 4px 8px; 
}
.item img{
	box-shadow: none;
    border-radius: 16px 16px 0 0;
    width: 100%;
height: 200px;
transition: .5s; 
}
/* .item img:hover{  */
/* 	transform: scale(1.02);  */
/* 	border-radius: 16px; */
/* }  */
.location{
    margin: 0 20px 10px 0;
    color: gray;
    font-size: 14px;
    font-weight: 500;
}
.item .actName{
overflow: hidden;
white-space: normal;
/* border: 2px solid red; */
	height:auto;
padding: 10px 0;
	margin: 8px 0;  
    color: #000;
    line-height: 20px;
	letter-spacing: -.16px; 
/*     font-weight: 700; */
/*     overflow: hidden; */
/*     display: -webkit-box; */
/*     -webkit-box-orient: vertical; */
/*     -webkit-line-clamp: 2; */
}
/*=======================頁籤=======================*/

/* 頁籤區塊 */
div.tab_container div.tab_list_block{
    padding-left: 20px;
}

/* 頁籤列表 */
div.tab_container div.tab_list_block ul.tab_list{
    list-style: none;
    display: inline-block;
    margin: 0;
    padding: 0;
margin-top: -20px;
margin-left: -40px;
text-align: center;
width: 100%;
}
div.tab_container div.tab_list_block ul.tab_list > li{
    display: inline-block;
}
div.tab_container div.tab_list_block ul.tab_list > li > a{
    text-decoration: none;
display: inline-block; 
    padding: 14px 20px;
    border-radius: 50px;
    cursor: pointer;
    color: white;
    position: relative;
    top: 1px;
}

/* 畫出底部黑線 */
div.tab_container div.tab_list_block ul.tab_list > li > a::after{
    content: "";
    position: absolute;
    width: calc(100% + 2px);
    height: 1px;
    background-color: white; /*下面線的顏色*/
	bottom:-1px; /*下面線*/
    left: -1px;
    z-index: 1;
}
div.tab_container div.tab_list_block ul.tab_list > li > a.-on{
/* 	border: 1px solid black;  */
	color: black;  
}
/* 將底部黑線改成白色 */
div.tab_container div.tab_list_block ul.tab_list > li > a.-on::after{
	background-color: white; 
    width: 100%;
    left: 0;
}

/*btn*/
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

/*msg*/
.contact {
	width: 50px;
	height: 50px;
	position: fixed;
	top: 85%;
	left: 90%;
	opacity: 0.5; /*透明度50%*/
	transition: transform .3s;
}

.contact:hover { /*滑鼠滑過*/
	opacity: 0.8;
	transform: scale(1.02);
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
   
   <!-- 上與中之間 -->
    <%@ include file="specialcard.file" %> 
   	<img class="contact" src="<%=request.getContextPath()%>/asset/img/activityImage/message.png">
		
   	<!-- 主體畫面設計  -->
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
	        <div class="item">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
	            <img class="" src="http://picsum.photos/300/200?random=?" alt="">
            	<div class="div1">
	            	<p class="time">開始時間: 
	            	<fmt:formatDate value="${actVO.startDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
	            	</p>
	                <h2 class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
<%-- 			                <input type="hidden" name="organizerMemberId" value="${actVO.organizerMemberId}"> --%>
<!-- 			                <input type="hidden" name="action" value="xxx"/>  -->
			                <input type="submit" class="btn btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
	</c:forEach>
    </div>
</div>
                    
     <div class="tab tab2">
         <div class="wrap" >
	<c:forEach var="actVO" items="${typeList1}" >
	        <div class="item">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
	            <img class="" src="http://picsum.photos/300/200?random=?" alt="">
            	<div class="div1">
	            	<p class="time">${actVO.startDate}</p>
	                <h2 class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
		</c:forEach>
	    </div>
	</div>

         
    <div class="tab tab3">
        <div class="wrap" >
	<c:forEach var="actVO" items="${typeList2}" >
	        <div class="item">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
	            <img class="" src="http://picsum.photos/300/200?random=?" alt="">
            	<div class="div1">
	            	<p class="time">${actVO.startDate}</p>
	                <h2 class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
		</c:forEach>
	    </div>
    </div>

         <div class="tab tab4">
             <div class="wrap" >
	<c:forEach var="actVO" items="${typeList3}" >
	        <div class="item">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
	            <img class="" src="http://picsum.photos/300/200?random=?" alt="">
            	<div class="div1">
	            	<p class="time">${actVO.startDate}</p>
	                <h2 class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
		</c:forEach>
	   	</div>
  	</div>

         <div class="tab tab5">
            <div class="wrap" >
	<c:forEach var="actVO" items="${typeList4}" >
	        <div class="item">
<%-- 	            <div class="act_tab">${actVO.type}</div> --%>
	            <img class="" src="http://picsum.photos/300/200?random=?" alt="">
            	<div class="div1">
	            	<p class="time">${actVO.startDate}</p>
	                <h2 class="actName">${actVO.name}</h2>
	                <p class="location ellipsis"><img style="width:18px; height:18px;margin-right:5px;" src="<%=request.getContextPath()%>/asset/img/activityImage/placeholder.png">${actVO.location}</p>
	                <div style="margin: 0 50px;">
              			  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/activity/act.do">
			                <input type="hidden" name="activityId" value="${actVO.activityId}">
			                <input type="hidden" name="action" value="selectOneAct"/> 
			                <input type="submit" class="btn btn-hover color-9" value="查看該筆活動"/>
		                </FORM>
	                </div>
            	</div>
            </div>
		</c:forEach>
         </div>
		</div>
	</div>
	</div> <!-- tab_container -->
 
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    <script>
    /*=======頁籤相關=======*/   
        $(function(){
        $("a.tab").on("click", function(e){
            e.preventDefault();
            
            /* 將頁籤列表移除所有 -on，再將指定的加上 -on */
            $(this).closest("ul").find("a.tab").removeClass("-on");
            $(this).addClass("-on");
            
            /* 找到對應的頁籤內容，加上 -on 來顯示 */
            $("div.tab").removeClass("-on");
            $("div.tab." + $(this).attr("data-target")).addClass("-on");
        });
        });
    </script>
</body>

</html>