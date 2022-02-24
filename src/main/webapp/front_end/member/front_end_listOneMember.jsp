<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>


<%
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>委域</title>
<link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css"
	rel="stylesheet" />
	
<style>
  table {
	width: 1300px;
	
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left:450px;
  }
  table, th, td {
    border: 1px solid black;
  }
  #div1 {
   margin-left:1670px;
}
#div11{
 margin-left:600px;
 }
 .submitBtn{
	width: 100%; 
	border: none;
	height: 34px;
	background-image: linear-gradient(to right, #003E3E, #005757,#003E3E);
    box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
	color: white;
}
  
</style>
    </head>
   <body>
<!-- Navigation-->
	<!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('<%=request.getContextPath()%>/asset/img/move01.jpg')">
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
        <div class="preloader">
            <div class="loader">
                <div class="sbl-half-circle-spin">
                    <div></div>
                </div>
            </div>
        </div>
        
        <div class="page-title-area">
            <div class="container">
                
            </div>
        </div>

            <div class="container">
                <div class="register-form">
                    <div class="contact-form">
                         <div style="text-align: center;"><h2>個人資料</h2></div>
                            <p>郵件：</p>
                            <div class="form-group">
                                <input type="text" class="form-control"  name="email" value="${memberVO.email}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                          
                            <p>密碼：</p>
                            <div class="form-group">
                                <input type="text" class="form-control"  name="password" value="${memberVO.password}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                                                               
                            <p>暱稱：</p>
                            <div class="form-group">
                                <input type="text" class="form-control" name="nickname"  value="${memberVO.nickname}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                            
                            <p>姓名：</p>
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" value="${memberVO.name}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                            <p>電話：</p>
                            <div class="form-group">
                                <input type="text" name="phone" class="form-control" value="${memberVO.phone}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                            <p>居住城市：</p>
                            <div class="form-group">
                                <input type="text" class="form-control" name="city" value="${memberVO.city}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                            <p>居住鄉鎮：</p>
                            <div class="form-group">
                                <input type="text" class="form-control" name="cityArea" value="${memberVO.cityArea}" readonly="readonly"/> 
                                <div class="help-block with-errors"></div>
                            </div>
                            <p>地址：</p>
                            <div class="form-group">
                                <input type="text" class="form-control" name="address" value="${memberVO.address}" readonly="readonly" /> 
                                <div class="help-block with-errors"></div>
                            </div>
                             <p>頭像：</p>
                            <div class="form-group">
                                  <tr>
									 <td><img src="<%=request.getContextPath()%>/front_end/member/MemberServlet.do?action=getImage&MEM_ID=${memberVO.id}" ></td>
								  </tr>
                               <div class="help-block with-errors"></div>
                            </div>
                          <td style="width: 100px;" >
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member/front_end_update.jsp" style="margin-bottom: 0px;" >
							    <input class="submitBtn" type="submit" value="修改會員資料" >
								<input type="hidden"name="id" value="${memberVO.id}">
								<input type="hidden"name="action" value="getOne_For_Member_Update">		
                			</FORM>
						</td>         
                    </div>
                </div>
            </div>
        </section>
         <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
    </body>
    </html>
