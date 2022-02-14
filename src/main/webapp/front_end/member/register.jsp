<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>會員註冊</title>

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
						<h2>會員資料註冊</h2>
					</td>
					<td>
						<h4>
							<a href="/CFA104G3/index.html">> HomePage</a>
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
			<br>
			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/front_end/member/MemberServlet.do" name="form1"  enctype="multipart/form-data">
				<table>
					<tr>
						<td>郵件:</td>
						<td><input placeholder="請輸入郵件" name="email" size="10"
							value="<%=(memberVO == null) ? "encored98931@yahoo.com.tw" : memberVO.getEmail()%>" /></td>
					</tr>

					<tr id=account>
						<td>帳號:</td>
						<td><input placeholder="請輸入帳號" name="account"
							maxlength="10"
							value="<%=(memberVO == null) ? "Encored989" : memberVO.getAccount()%>" /></td>
					</tr>
					<tr id=password>
						<td>密碼:</td>
						<td><input placeholder="請輸入密碼" name="password"
							maxlength="10"
							value="<%=(memberVO == null) ? "A123456" : memberVO.getPassword()%>" /></td>
					</tr>
					<tr id=nickname>
						<td>名字:</td>
						<td><input placeholder="請輸入暱稱" name="nickname"
							maxlength="10"
							value="<%=(memberVO == null) ? "小名" : memberVO.getNickname()%>" /></td>
					</tr>
					<tr id=name>
						<td>姓名:</td>
						<td><input placeholder="請輸入名字" name="name"
							maxlength="10"
							value="<%=(memberVO == null) ? "曾令名" : memberVO.getName()%>" /></td>
					</tr>
					<tr>
						<td>電話:</td>
						<td><input placeholder="請輸入電話" name="phone" maxlength="10"
							value="<%=(memberVO == null) ? "0930911283" : memberVO.getPhone()%>" /></td>
					</tr>

					<tr>
						<td>性別:</td>
						<td><lable> <input type="radio" name="gender"
								value="1" checked>男</lable> <lable> <input type="radio"
								name="gender" value="女">女</lable></td>
					</tr>
					<tr>
						<td>城市:</td>
						<td><input placeholder="請輸入居住城市" name="city" maxlength="10"
							value="<%=(memberVO == null) ? "桃園市" : memberVO.getCity()%>" /></td>
					</tr>
					<tr>
						<td>鄉鎮:</td>
						<td><input placeholder="請輸入居住鄉鎮" name="cityArea" maxlength="10"
							value="<%=(memberVO == null) ? "八德市" : memberVO.getCityArea()%>" /></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input placeholder="請輸入地址" name="address" maxlength="10"
							value="<%=(memberVO == null) ? "廣福路394" : memberVO.getAddress()%>" /></td>
					</tr>
					<tr>
						<td>驗證碼:</td>
						<td><input placeholder="請輸入驗證碼" name="code" maxlength="10"
							value="<%=(memberVO == null) ? "331" : memberVO.getCode()%>" /></td>
					</tr>
					<tr>
				<td>圖片:</td>
				<td><input type="file" name="avatar" size="45"
					value="<%=(memberVO == null) ? "" : memberVO.getAvatar()%>" /></td>
			</tr>

					<tr>
						<td>生日:</td>
						<td><input name="registerDate" id="registerDate" type="Date"></td>
					</tr>
					
					

					
					
					
					
				</table>
				<br> <input type="hidden" name="action" value="register"><input
					type="submit" value="送出新增">
			</FORM>
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
		//         $.datetimepicker.setLocale('zh');
		//         $('#f_date1').datetimepicker({
		// 	       theme: '',              //theme: 'dark',
		// 	       timepicker:false,       //timepicker:true,
		// 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		// 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
	<%-- 		   value: '<%=hiredate%> --%>
		// 	', // value:   new Date(),
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