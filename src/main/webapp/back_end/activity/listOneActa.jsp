<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.activity_attend.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO"); //ActaServlet.java(Concroller), �s�Jreq��actaVO����
%>

<html>
<head>
<title>���u��� - listOneActa.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���W���ʸ�� - ListOneActa.jsp</h3>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ѻP�|���s��</th>
		<th>�ѻP���ʽs��</th>
		<th>���פ��e</th>
		<th>���ʤ��e�Ƶ�</th>
		<th>�I�ڪ��A</th>
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