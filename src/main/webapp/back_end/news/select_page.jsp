<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>最新消息查詢</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
	<link href="/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor='gray'>

<table id="table-1">
   <tr><td><h3>最新消息</h3></td></tr>
</table>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
  
<ul>
  <li><a href='listAllEmp.jsp'>List</a> all News.  <br><br></li>

	<li>
    <FORM METHOD="post" ACTION="NewsServlet" >
        <b>輸入消息編號 (如1~10):</b>
        <input type="text" name="id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
    </li>
</ul>


	<h3>員工管理</h3>

	<ul>
  		<li><a href='addEmp.jsp'>Add</a> a new News.</li>
	</ul>
  	
  	<script src="text/javascript" src="js/scripts.js"></script>

</body>
</html>