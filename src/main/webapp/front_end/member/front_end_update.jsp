<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>會員資料修改</title>

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
	width: 450px;
	margin-top: 5px;
	margin-bottom: 1px;
}

table, th, td {
	white-space: nowrap;
}

th, td {
	padding: 1px;
	line-height: 35px;
}

h2 {
	margin: 0 auto;
}

table {
	width: 450px;
	margin-top: 1px;
	margin-bottom: 1px;
}

th, td {
	padding: 1px;
}
</style>

</head>
<center>

	<body>

		<main>
			<table id="table-1">
				<tr>
					<td>
						<h3>會員資料修改</h3>
						<h4>
							<a href="front_end_listOneMember.jsp"><img
								src="icon/light-bulb.png" width="30" height="30" border="0">
								HomePage</a>
						</h4>
					</td>
				</tr>
			</table>

			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<FORM METHOD="post" ACTION="MemberServlet.do" name="form1">
				<table>

					<tr>
						<td>會員姓名:</td>
						<td><input type="TEXT" name="neme" size="10"
							autocomplete="off" value="<%=memberVO.getName()%>" /></td>
					</tr>

					
					<tr>
						<td>生日:</td>
						<td><input name="registerDate" id="registerDate" type="Date"
							value="<%=(memberVO == null) ? "" : memberVO.getRegisterDate()%>"></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input placeholder="請輸入地址" name="address" size="30"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getAddress()%>" /></td>
					</tr>
					<tr>
						<td>電話:</td>
						<td><input placeholder="請輸入電話" name="phone" maxlength="10"
							autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getPhone()%>" /></td>
					</tr>

					<tr>
						<td>EMAIL:</td>
						<td><input placeholder="請輸入EMAIL" name="email"
							maxlength="45" autocomplete="off"
							value="<%=(memberVO == null) ? "" : memberVO.getEmail()%>" /></td>
					</tr>

					<tr>
						<td>密碼:</td>
						<td><input type="PASSWORD" name="password" size="15"
							value="<%=(memberVO == null) ? "" : memberVO.getPassword()%>" /></td>
					</tr>

				</table>
				<br> <input type="hidden" name="action" value="member_update">
				<input type="hidden" name="id" value="<%=memberVO.getId()%>">
				<input type="hidden" name="state" value="${memberVO.state}">
				 <input type="hidden"
					name="account" value="${memberVO.account}"> <input
					type="submit" value="送出">
			</FORM>
		<br>
		<br>
		</main>
	</body>


	<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=memberVO.getRegisterDate()%>
		', // value:   new Date(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	            '2017/07/10',  // 起始日
		//minDate:               '-1970-01-01', // 去除今日(不含)之前
		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		});

		// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

		//      1.以下為某一天之前的日期無法選擇
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

		//      2.以下為某一天之後的日期無法選擇
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

		//      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
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