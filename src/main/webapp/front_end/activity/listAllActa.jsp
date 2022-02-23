<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
    List<ActivityAttendVO> list = actaSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html lang="zh-TW">
<head>
	 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
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
  table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body>
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
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


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>參於會員編號</th>
		<th>參與活動編號</th>
		<th>評論內容</th>
		<th>活動內容備註</th>
		<th>付款狀態</th>
	
	</tr>
	<%@ include file="page1.jsp" %> 
	<c:forEach var="actaVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${actaVO.memberId}</td>
			<td>${actaVO.activityId}</td>
			<td>${actaVO.comment}</td>
			<td>${actaVO.note}</td>
			<td>
			${(actaVO.status=="0")? "未付款":"已付款"}
			</td>
	
 			<td>
 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;"> 
 			     <input type="submit" value="活動評分"> 
 			     <input type="hidden" name="activityId"  value="${actaVO.activityId}">
 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> 
			</td> 
 			<td> 
 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/actr.do" style="margin-bottom: 0px;"> 
			     <input type="submit" value="活動檢舉">
  			     <input type="hidden" name="activityId"  value="${actVO.activityId}"> 
 			     <input type="hidden" name="action" value="getOne_For_Insert"></FORM> 
			</td>
			<td> 
 			  <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" style="margin-bottom: 0px;">
				       <input type="submit" value="取消活動">
		  	      	   <input type="hidden" name="memberId" value="${actaVO.memberId}">
		  	      	    <input type="hidden" name="activityId"  value="${actaVO.activityId}"> 
				       <input type="hidden" name="action" value="cancel"> 
		        </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.jsp" %>

 <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>