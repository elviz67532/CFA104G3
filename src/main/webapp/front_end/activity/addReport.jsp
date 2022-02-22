<%@page import="java.nio.ReadOnlyBufferException"%>
<%@page import="com.activity_report.model.ActivityReportVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity_report.model.*"%>

<%
ActivityReportVO actrVO = (ActivityReportVO) request.getAttribute("actrVO");
%>



<html lang="zh-TW">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
</head>
   <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>New Life</h1>
                        <span class="subheading">迎 接 全 新 的 人 生</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

	<h3>檢舉資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data" ACTION="${pageContext.request.contextPath}/activity/actr.do" name="form1" >
		<table>
			<tr>
				<td>檢舉活動編號:</td>
				<td><%=actrVO.getActivityId()%> </td>
			</tr>
			<tr>
				<td>檢舉會員編號:</td>
				<td><%=actrVO.getMemberId()%></td>
			</tr>
			<tr>
				<td>檢舉內容:</td>
				<td><input type="TEXT" name="content" size="45"
					value="<%=(actrVO == null) ? "不好玩" : actrVO.getContent()%>" /></td>
			</tr>
			
			

<!-- 			<tr> -->
<!-- 				<td>審核結果:<font color=red><b>*</b></font></td> -->
<!-- 				<td><select size="1" name="status"> -->
<!-- 					<option value="-1">請選擇審核結果</option> -->
<!-- 					<option value="0" >尚未審核完畢</option> -->
<!--    					<option value="1">活動未違規</option> -->
<!-- 					<option value="2">活動違規</option>	 -->
<!-- 				</select></td> -->
<!-- 			</tr> -->

			
			
			<tr>
		<td>檢舉圖片:</td>
		<td>
		<input type="file" name="photo" size="45" id="flie" onchange="show(this)"/></td>
			</tr>	
			
		</table>
		<br> 
		
		 		<input	type="submit" value="送出新增">		
		 		<input type="hidden" name="action" value="insert">
		 		<input type="hidden" name="memberId"  value="${actrVO.memberId}"> 
  			    <input type="hidden" name="activityId"  value="${actrVO.activityId}"> 
  			    <input type="hidden" name="status"  value="1"> 
  			     
	</FORM>
 
   			</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

  <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>