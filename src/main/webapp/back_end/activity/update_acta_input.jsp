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
<title>為活動評分 - update_acta_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>為活動評分 - update_acta_input.jsp</h3>

	</td></tr>
</table>

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
				
</body>



</html>