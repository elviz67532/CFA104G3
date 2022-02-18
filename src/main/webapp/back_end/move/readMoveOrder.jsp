<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.move_order.model.*"%>
<%
MoveOrderServiceImpl moSvc = new MoveOrderServiceImpl();
List<MoveOrderVO> list = moSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!doctype html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="<%=request.getContextPath()%>/css/move/moveTotal.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<title>委域</title>
</head>
<style>
.main {
   margin: 20px auto; 
}
table {
  border: solid #4e73df;
  border-spacing: 0;
  width: 80%;
}
tr {
  text-align: center;
}
th {
  padding: 10px;
}
table tbody tr:nth-child(odd){
  background-color: #eee
}
table thead {
  background-color: #4e73df;
  color: white;
}
table thead th:first-child {
  border-radius: 5px 0 0 0;
}
table thead th:last-child {
  border-radius: 0 5px 0 0;
  border-right: 1px solid blue;
}
table tbody tr:last-child td:first-child {
  border-radius: 0 0 0 5px;
}

table tbody tr:last-child td:last-child {
  border-radius: 0 0 5px 0;
}
</style>
<body id="page-top">
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/back_end/common/sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<jsp:include page="/back_end/common/topbar.jsp"></jsp:include>
				<div class="div1">

					<!-- main -->
					<div class="main">
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					<FORM METHOD="post" ACTION="moveorder.do">
						<b>請輸入訂單編號:</b><br> <input type="text" name="id"> 
						<input type="hidden" name="action" value="getOne_For_Display"> 
						<input type="submit" value="送出" style="background-color: #4e73df; color: white; text-align: center; border: 2px solid #4e73df;">
					</FORM>
					<FORM METHOD="post" ACTION="moveorder.do">
						<b>請輸入會員編號:</b><br> <input type="text" name="memberid">
						<input type="hidden" name="action" value="getMem_For_Display">
						<input type="submit" value="送出" style="background-color: #4e73df; color: white; text-align: center; border: 2px solid #4e73df;">
					</FORM>
					<table>
						<thead>
							<th class="text-nowrap">訂單編號</th>
							<th class="text-nowrap">會員編號</th>
							<th class="text-nowrap">客戶姓名</th>
							<th class="text-nowrap">客戶電話</th>
							<th class="text-nowrap">搬家目前地址</th>
							<th class="text-nowrap">搬家目的地地址</th>
							<th class="text-nowrap">搬家時間</th>
							<th class="text-nowrap">估價金額</th>
							<th class="text-nowrap">訂金</th>
							<th class="text-nowrap">最後付款金額</th>
							<th class="text-nowrap">訂單成立時間</th>
							<th class="text-nowrap">訂單狀態</th>
							<th class="text-nowrap">修改訂單</th>
						</thead>
<div><%  int rowsPerPage = 5;      
    int rowNumber=0;      
    int pageNumber=0;          
    int whichPage=1;      
    int pageIndexArray[]=null;
    int pageIndex=0; 
%>

<%  
    rowNumber=list.size();
    if (rowNumber%rowsPerPage !=0)
         pageNumber=rowNumber/rowsPerPage + 1;
    else pageNumber=rowNumber/rowsPerPage;    

    pageIndexArray=new int[pageNumber]; 
    for (int i=1 ; i<=pageIndexArray.length ; i++)
         pageIndexArray[i-1]=i*rowsPerPage-rowsPerPage;
%>

<%  try {
       whichPage = Integer.parseInt(request.getParameter("whichPage"));
       pageIndex=pageIndexArray[whichPage-1];
    } catch (NumberFormatException e) {
       whichPage=1;
       pageIndex=0;
    } catch (ArrayIndexOutOfBoundsException e) {
         if (pageNumber>0){
              whichPage=pageNumber;
              pageIndex=pageIndexArray[pageNumber-1];
         }
    } 
%>

<%if (pageNumber>0){%>
  <b><font color=red>第<%=whichPage%>/<%=pageNumber%>頁</font></b>
<%}%>

<b>●符 合 查 詢 條 件 如 下 所 示: 共<font color=red><%=rowNumber%></font>筆</b>
</div>
						<tbody>
						<c:forEach var="moveOrderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${moveOrderVO.id}</td>
								<td>${moveOrderVO.memberId}</td>
								<td>${moveOrderVO.customer}</td>
								<td>${moveOrderVO.phone}</td>
								<td>${moveOrderVO.fromAddress}</td>
								<td>${moveOrderVO.toAddress}</td>
								<td>${moveOrderVO.moveDate}</td>
								<td>${moveOrderVO.amountFirst}</td>
								<td>${moveOrderVO.deposit}</td>
								<td>${moveOrderVO.amountTotal}</td>
								<td>${moveOrderVO.orderDate}</td>
								<td>${moveOrderVO.status}</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/back_end/move/moveorder.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="修改"> 
										<input type="hidden" name="id" value="${moveOrderVO.id}"> 
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
						</c:forEach>
						</tbody>
					</table><br>
					<div><%if (rowsPerPage<rowNumber) {%>
    				<%if(pageIndex>=rowsPerPage){%>
        			<A href="<%=request.getRequestURI()%>?whichPage=1">至第一頁</A>&nbsp;
        			<A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage-1%>">上一頁 </A>&nbsp;
   					 <%}%>
  
    				<%if(pageIndex<pageIndexArray[pageNumber-1]){%>
        			<A href="<%=request.getRequestURI()%>?whichPage=<%=whichPage+1%>">下一頁 </A>&nbsp;
        			<A href="<%=request.getRequestURI()%>?whichPage=<%=pageNumber%>">至最後一頁</A>&nbsp;
    				<%}%>
  					<%}%>

					<br><br>

  					<%if (pageNumber>1) {%>
  					
    				<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">   
	      				<select size="1" name="whichPage" style="background-color: #4e73df; color: white; text-align: center;border:1px solid #4e73df; ">
		         			<%for (int i=1; i<=pageNumber; i++){%>
		            		<option value="<%=i%>">跳至第<%=i%>頁
		         			<%}%> 
	      				 </select>
       					<input type="submit" value="確定" style="background-color: #4e73df; color: white; text-align: center; border: 4px solid white;">  
    				</FORM>
    				
 					<%}%></div>
					</div>
					<!-- end of main -->

				</div>
			</div>
			<jsp:include page="/back_end/common/footer.jsp"></jsp:include>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<jsp:include page="/back_end/common/logoutModal.jsp"></jsp:include>

	<!-- custom script -->

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/bootstrap/js2/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/back_end/sb-admin-2.min.js"></script>
</body>

</html>