<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>MoveOrder</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
    margin-left: 600px;
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
  h1 {
  	color: green;
  	text-align: center;
  	font-size: 100px;
  }
  form {
  	text-align: center;
  	font-size: 100px;
  }
  input {
  	text-align: left;
  	font-size: 50px;
  	height: 100px;
  	width: 150px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>搬家訂單管理</h3></td></tr>
</table>


<%-- 錯誤列表 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
  
  
    <FORM METHOD="post" ACTION="move/moveorder.do" >
        <b>請輸入編號:</b><br>
        <input type="text" name="id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  	<h1><a href='moveOrder.jsp'><b>請點這裡查詢訂單與修改訂單狀態</b></a></h1>
</body>
</html>