<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>

<%
  ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

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

<title>為活動評分 - update_acta_input.jsp</title>

<style>
  table {
	width: 600px;
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

<h3>為活動評分:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="acta.do" name="form1">
<table>
	<tr>
		<td>參與會員編號<font color=red><b>*</b></font></td>
		<td><%=actaVO.getMemberId()%></td>
	</tr>
	<tr>
		<td>參與活動編號:</td>
		<td><%=actaVO.getActivityId()%></td>
	</tr>
	<tr>
		<td>評論內容:</td>
		<td><input type="TEXT" name="comment" size="45" value="<%=actaVO.getComment()%>" /></td>
	</tr>
	<tr>
		<td>活動內容備註:</td>
		<td><%=actaVO.getNote()%></td>
	</tr>
	<tr>
		<td>付款狀態:</td>
		<td><%=actaVO.getStatus()%></td>
	</tr>

	

</table>
<br>
				
				<input type="submit" value="送出修改">
 			     <input type="hidden" name="memberId"  value="${actaVO.memberId}">
 			     <input type="hidden" name="activityId"  value="${actaVO.activityId}">
 			     <input type="hidden" name="comment"  value="${actaVO.comment}">
 			     <input type="hidden" name="note"  value="${actaVO.note}">
 			     <input type="hidden" name="status"  value="${actaVO.status}">
 			     <input type="hidden" name="action" value="update">
 			     </FORM>
				
				 
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>		
</body>



</html>