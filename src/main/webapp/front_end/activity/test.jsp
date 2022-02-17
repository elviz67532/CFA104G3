<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>

<%
ActivityServiceImpl actSvc = new ActivityServiceImpl();
List<ActivityVO> list = actSvc.getAllActDesc();
pageContext.setAttribute("list", list);

List<ActivityVO> typeList1 = actSvc.getActType(1);
pageContext.setAttribute("typeList1", typeList1);

List<ActivityVO> typeList2 = actSvc.getActType(2);
pageContext.setAttribute("typeList2", typeList2);

List<ActivityVO> typeList3 = actSvc.getActType(3);
pageContext.setAttribute("typeList3", typeList3);

List<ActivityVO> typeList4 = actSvc.getActType(4);
pageContext.setAttribute("typeList4", typeList4);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="UTF-8">
<title>全部活動頁面appearActPage.jsp</title>
<link
	href="${pageContext.request.contextPath}/css/activity/appearActPage.css"
	rel="stylesheet">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css"
	rel="stylesheet" />

<style>
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
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/activity01.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>New Activity</h1>
						<span class="subheading">與 你 分 享 的 快 樂<br>
						<br>勝 過 獨 自 擁 有
						</span>
					</div>
				</div>
			</div>
		</div>
	</header>
<%  int rowsPerPage = 3;  //每頁的筆數    
    int rowNumber=0;      //總筆數
    int pageNumber=0;     //總頁數      
    int whichPage=1;      //第幾頁
    int pageIndexArray[]=null;
    int pageIndex=0; 
%>

<%  
    rowNumber=list.size();
    if (rowNumber%rowsPerPage !=0)
         pageNumber=rowNumber/rowsPerPage + 1;
    else pageNumber=rowNumber/rowsPerPage;    

    pageIndexArray=new int[pageNumber]; 
    for (int i=1 ; i<=pageIndexArray.length ; i++)
         pageIndexArray[i-1]=i*rowsPerPage-rowsPerPage;
%>

<%  try {
       whichPage = Integer.parseInt(request.getParameter("whichPage"));
       pageIndex=pageIndexArray[whichPage-1];
    } catch (NumberFormatException e) { //第一次執行的時候
       whichPage=1;
       pageIndex=0;
    } catch (ArrayIndexOutOfBoundsException e) { //總頁數之外的錯誤頁數
         if (pageNumber>0){
              whichPage=pageNumber;
              pageIndex=pageIndexArray[pageNumber-1];
         }
    } 
%>

<%if (pageNumber>0){%>
  <b><font color=red>第<%=whichPage%>/<%=pageNumber%>頁</font></b>
<%}%>


 <%if (rowsPerPage<rowNumber) {%>
    <%if(pageIndex>=rowsPerPage){%>
        <A href="<%=request.getRequestURI()%>?whichPage=1">至第一頁</A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>">上一頁 </A>&nbsp;
    <%}%>
  
    <%if(pageIndex<pageIndexArray[pageNumber-1]){%>
        <A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>">下一頁 </A>&nbsp;
        <A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">至最後一頁</A>&nbsp;
    <%}%>
  <%}%>  

<br><br>

  <%if (pageNumber>1) {%>
    <FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">   
       <select size="1" name="whichPage">
         <%for (int i=1; i<=pageNumber; i++){%>
            <option value="<%=i%>">跳至第<%=i%>頁
         <%}%> 
       </select>
       <input type="submit" value="確定" >  
    </FORM>
  <%}%>
	<!-- 主體畫面設計  -->
		<img class="contact" src="<%=request.getContextPath()%>/asset/img/activityImage/message.png">
		
		
	<div style="text-align:center; font-size: 24px;">
		活 動 專 區
		
	</div>
	<div style="border: 2px solid blue;">
		
	</div>

	<!-- Footer-->
	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
	<script>
		/*=======頁籤相關=======*/
		$(function() {
			$("a.tab").on("click", function(e) {
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