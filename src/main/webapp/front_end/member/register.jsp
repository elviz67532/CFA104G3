<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�|�����U</title>

<style>
* {
	box-sizing: border-box;
	font-family: monospace;
	line-height: 150%;
}

img {
	max-width: 100%;
}

body {
	margin: 0;
	color: black;
}

table#table-1 {
	text-align: center;
	width: 55%;
	height: 100px;
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

table {
	width: 300px;
	/* 	background-color: white; */
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
	white-space: nowrap;
}

th, td {
	padding: 1px;
	line-height: 35px;
}

h2 {
	margin: 0 auto;
}

main {
	position: absolute;
	top: 3.5%;
	/* 	left: 12.5%; */
	height: calc(100vh - 100px);
	width: calc(100% - 200px);
	margin-left: 200px;
}
</style>

</head>
<center>
	<main>
		<body bgcolor='white'>
			<table id="table-1">
				<tr>
					<td>
						<h2>�|����Ƶ��U</h2>
					</td>
					<td>
						<h4>
							<a href="/CFA104G3/index.html">> HomePage</a>
						</h4>
					</td>
				</tr>
			</table>

			<%-- ���~��C --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">�Эץ��H�U���~:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<br>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/front_end/member/MemberServlet.do" name="form1"  enctype="multipart/form-data">
				<table>
					<tr>
						<td>�l��:</td>
						<td><input placeholder="�п�J�l��" name="email" size="10"
							value="<%=(memberVO == null) ? "encored98931@yahoo.com.tw" : memberVO.getEmail()%>" /></td>
					</tr>

					<tr id=account>
						<td>�b��:</td>
						<td><input placeholder="�п�J�b��" name="account"
							maxlength="10"
							value="<%=(memberVO == null) ? "Encored989" : memberVO.getAccount()%>" /></td>
					</tr>
					<tr id=password>
						<td>�K�X:</td>
						<td><input placeholder="�п�J�K�X" name="password"
							maxlength="10"
							value="<%=(memberVO == null) ? "A123456" : memberVO.getPassword()%>" /></td>
					</tr>
					<tr id=nickname>
						<td>�W�r:</td>
						<td><input placeholder="�п�J�ʺ�" name="nickname"
							maxlength="10"
							value="<%=(memberVO == null) ? "�p�W" : memberVO.getNickname()%>" /></td>
					</tr>
					<tr id=name>
						<td>�m�W:</td>
						<td><input placeholder="�п�J�W�r" name="name"
							maxlength="10"
							value="<%=(memberVO == null) ? "���O�W" : memberVO.getName()%>" /></td>
					</tr>
					<tr>
						<td>�q��:</td>
						<td><input placeholder="�п�J�q��" name="phone" maxlength="10"
							value="<%=(memberVO == null) ? "0930911283" : memberVO.getPhone()%>" /></td>
					</tr>

					<tr>
						<td>�ʧO:</td>
						<td><lable> <input type="radio" name="gender"
								value="1" checked>�k</lable> <lable> <input type="radio"
								name="gender" value="�k">�k</lable></td>
					</tr>
					<tr>
						<td>����:</td>
						<td><input placeholder="�п�J�~����" name="city" maxlength="10"
							value="<%=(memberVO == null) ? "��饫" : memberVO.getCity()%>" /></td>
					</tr>
					<tr>
						<td>�m��:</td>
						<td><input placeholder="�п�J�~��m��" name="cityArea" maxlength="10"
							value="<%=(memberVO == null) ? "�K�w��" : memberVO.getCityArea()%>" /></td>
					</tr>
					<tr>
						<td>�a�}:</td>
						<td><input placeholder="�п�J�a�}" name="address" maxlength="10"
							value="<%=(memberVO == null) ? "�s�ָ�394" : memberVO.getAddress()%>" /></td>
					</tr>
					<tr>
						<td>���ҽX:</td>
						<td><input placeholder="�п�J���ҽX" name="code" maxlength="10"
							value="<%=(memberVO == null) ? "331" : memberVO.getCode()%>" /></td>
					</tr>
					<tr>
				<td>�Ϥ�:</td>
				<td><input type="file" name="avatar" size="45"
					value="<%=(memberVO == null) ? "" : memberVO.getAvatar()%>" /></td>
			</tr>

					<tr>
						<td>�ͤ�:</td>
						<td><input name="registerDate" id="registerDate" type="Date"></td>
					</tr>
					
					

					
					
					
					
				</table>
				<br> <input type="hidden" name="action" value="register"><input
					type="submit" value="�e�X�s�W">
			</FORM>
		</main>
	</body>


	<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->


	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

	<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

	<script>
		//         $.datetimepicker.setLocale('zh');
		//         $('#f_date1').datetimepicker({
		// 	       theme: '',              //theme: 'dark',
		// 	       timepicker:false,       //timepicker:true,
		// 	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		// 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
	<%-- 		   value: '<%=hiredate%> --%>
		// 	', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.�H�U���Y�@�Ѥ��᪺����L�k���
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
	</script>
</html>