<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
--%>
<%@ page import="com.activity_attend.model.*"%>
--%>

<%ActivityAttendVO actaVO = (ActivityAttendVO) request.getAttribute("actaVO");%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���ʳ��W��Ʒs�W - addAttend.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

* /
   table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
*
/
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
		<tr>
			<td>
				<h3>���u��Ʒs�W - addAttend.jsp</h3>
			</td>
			<td></td>
		</tr>
	</table>

	-
	<h3>���ʳ��W��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/activity/acta.do" name="form1">
		<table>
			<tr>
				<td>�ѻP�|���s��:</td>
				<td><input type="TEXT" name="memberId" size="45"
					value="<%=(actaVO == null) ? "7" : actaVO.getMemberId()%>" /></td>
			</tr>
			<tr>
				<td>�ѻP���ʽs��:</td>
				<td><input type="TEXT" name="activityId" size="45"
					value="<%=(actaVO == null) ? "1005" : actaVO.getActivityId()%>" /></td>
			</tr>
			<tr>
				<td>���פ��e:</td>
				<td><input type="TEXT" name="comment" size="45"
					value="<%=(actaVO == null)?"���n��":actaVO.getComment() %>" /></td>
			</tr>
			<tr>
				<td>���ʤ��e�Ƶ�:</td>
				<td><input type="TEXT" name="note" size="45"
					value="<%=(actaVO== null)?"��Ю{" : actaVO.getNote()%>" /></td>
			</tr>
			<tr>
				<td>�I�ڪ��A:</td>
				<td><input type="TEXT" name="status" size="45"
					value="<%=(actaVO == null) ? "1" : actaVO.getStatus()%>" /></td>
			</tr>
			
		</table>
		<br> 
		<input type="hidden" name="action" value="insert">
		 <input	type="submit" value="�e�X�s�W">
	</FORM>

</body>
</html>