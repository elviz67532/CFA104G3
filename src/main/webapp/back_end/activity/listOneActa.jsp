<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.activity_attend.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO"); //ActaServlet.java(Concroller), 存入req的actaVO物件
%>

<html>
<head>
<title>員工資料 - listOneActa.jsp</title>

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
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>報名活動資料 - ListOneActa.jsp</h3>
	</td></tr>
</table>

<table>
	<tr>
		<th>參與會員編號</th>
		<th>參與活動編號</th>
		<th>評論內容</th>
		<th>活動內容備註</th>
		<th>付款狀態</th>
	</tr>
	<tr>
		<td><%=actaVO.getMemberId()%></td>
		<td><%=actaVO.getActivityId()%></td>
		<td><%=actaVO.getComment()%></td>
		<td><%=actaVO.getNote()%></td>
		<td><%=actaVO.getStatus()%></td>

	</tr>
</table>

</body>
</html>