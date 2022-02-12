<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_attend.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    ActivityAttendServiceImpl actaSvc = new ActivityAttendServiceImpl();
    List<ActivityAttendVO> list = actaSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ����ʳ��W��� - listAllActa.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����ʳ��W��� - listAllActa.jsp</h3>
		
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�ѩ�|���s��</th>
		<th>�ѻP���ʽs��</th>
		<th>���פ��e</th>
		<th>���ʤ��e�Ƶ�</th>
		<th>�I�ڪ��A</th>
	
	</tr>
	<%@ include file="page1.jsp" %> 
	<c:forEach var="actaVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${actaVO.memberId}</td>
			<td>${actaVO.activityId}</td>
			<td>${actaVO.comment}</td>
			<td>${actaVO.note}</td>
			<td>${actaVO.status}</td>
	
<!--  			<td> --> -->
<%--  			  <FORM METHOD="post" ACTION="/CFA104G3/acta.do" style="margin-bottom: 0px;">  --%>
<!--  			     <input type="submit" value="�����ʵ���">  -->
<%--  			     <input type="hidden" name="memberId"  value="${actaVO.memberId}">  --%>
<!--  			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>  -->
<!-- 			</td>  -->
<!--  			<td>  -->
<%-- 			  <FORM METHOD="post" ACTION="/CFA104G3/emp/emp.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�R��"> -->
<%-- 			     <input type="hidden" name="empno"  value="${empVO.empno}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.jsp" %>

</body>
</html>