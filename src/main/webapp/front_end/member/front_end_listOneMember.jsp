<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member.model.*"%>


<%
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<html>
<head>
<title>�|�����</title>

<style>
* {
	box-sizing: border-box;
	font-family: monospace;
	line-height: 150%;
}

table#table-1 {
	text-align: center;
	margin: 0 auto;
}

table#table-1 h4 {
	color: red;
	margin-bottom: 1px;
}

table#table-2 {
	font-size: 10 vmin;
	margin: 0 auto;
	white-space: nowrap;
}

h2 {
	margin-top: 40px;
}

h4 {
	color: blue;
	display: inline;
}

table {
	width: 1000px;
	margin-top: 5px;
	margin-bottom: 5px;
	color: black;
}

th, td {
	padding: 5px;
	text-align: center;
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
<main>
	<body>


		<h1>
			<a href="/CFA104G3/index.html"> �^����</a>
		</h1>

		<main>
			<table id="table-2">
				<h2 align="center" valign="center">�|�����</h2>

				<tr>
					<td>�l��</td>
					<td>${memberVO.email}</td>
				</tr>
				<tr>
					<td>�K�X</td>
					<td>${memberVO.password}</td>
				</tr>
				<tr>
					<td>�ʺ�</td>
					<td>${memberVO.nickname}</td>
				</tr>
				<tr>
					<td>�m�W</td>
					<td>${memberVO.name}</td>
				</tr>
				<tr>
					<td>�q��</td>
					<td>${memberVO.phone}</td>
				<tr>
					<td>�~����</td>
					<td>${memberVO.city}</td>
				</tr>
				</tr>
				<tr>
					<td>�~��m��</td>
					<td>${memberVO.cityArea}</td>
				</tr>
				<tr>
					<td>�a�}</td>
					<td>${memberVO.address}</td>
				</tr>
				<tr>
					<td>�Y��</td>
					<td>${memberVO.avatar}</td>
				</tr>



				<td style="width: 100px;">
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front_end/member/MemberServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�|�����"> <input type="hidden"
							name="id" value="${memberVO.id}"> <input type="hidden"
							name="action" value="getOne_For_Member_Update">


					</FORM> 
					<c:if test="${not empty memberVO.id}">
						<FORM style="margin: 0;" id="Logout" METHOD="post"
							class="logout-form"
							action="<%=request.getContextPath()%>/front_end/member/MemberServlet.do">
							<input type="hidden" name="action" value="logout"> 
							<input
								type="submit" value="�n�X" class="btn">
						</FORM>
					</c:if>
				</td>
			</table>
		</main>
		<br>
		<br>
		<br>
	</body>
</main>
</html>