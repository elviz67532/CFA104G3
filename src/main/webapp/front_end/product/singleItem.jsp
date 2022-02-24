<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@	page import="com.product.model.*"%>


<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	System.out.println("productVO: " + productVO);
	String prodId = (String)request.getParameter("prodId");
	pageContext.setAttribute("prodId", prodId);
	
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>委域</title>
    <link rel="icon" type="image/x-icon" href="asset/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
    
    <style>
        .btn1Buy {
            border-radius: 8px;
            border: none;
            background-color: #FF4D00;
            color: white;
            width: 200px;
            margin-bottom: 5px;
            font-size: 14px;
            transition: transform .3s;
        }

        .btn1Buy:hover {
            border: 1px gray solid;
            border-radius: 8px;
            background-color: white;
            color: black;
            opacity: 0.8;
            transform: scale(1.04);
        }

        .btn2Collect {
            border-radius: 8px;
            border: none;
            background-color: #FFD700;
            width: 200px;
            margin-bottom: 5px;
            font-size: 14px;
            transition: transform .3s;
        }

        .btn2Collect:hover {
            border: 1px gray solid;
            border-radius: 8px;
            opacity: 0.8;
            background-color: white;
            transform: scale(1.02);
        }

        .btn3Return {
            border-radius: 8px;
            border: none;
            background-color: #00FF80;
            width: 200px;
            margin-bottom: 5px;
            font-size: 14px;
            transition: transform .3s;
        }

        .btn3Return:hover {
            border: 1px gray solid;
            border-radius: 8px;
            opacity: 0.8;
            background-color: white;
            transform: scale(1.02);
        }

        .spanLocation {
            font-size: 14px;
            color: black;
        }

        .aboutProductWord {
            padding: 3px 8px;
            font-weight: bold;
            font-size: 116%;
            line-height: 1.231;
            letter-spacing: 0.01em;
            color: #5A5A5A;
        }
    </style>
	
</head>

<body>
    <!-- Navigation-->
    <jsp:include page="/front_end/common/navigation.jsp"></jsp:include>
    <!-- nav -->

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/product01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>二手商城</h1>
                        <span class="subheading">愛地球，資源再利用</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 主體畫面設計  -->

    <!-- Product section-->
    <section class="py-5">
        <div class="container px-5 px-lg-6 my-6">
            <div class="row gx-4 gx-lg-5 align-items-start">
                <div class="col-md-6">
                    <img class="img-fluid rounded mb-5 mb-lg-0 img-thumbnail"
                        src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}"
                        alt="" />
                    <div class="mb-1">商品編號: ${productVO.id}
                    </div>
                </div>
                <div class="col-md-6 align-items-start">
                    <div class="mb-1">
                        <h3 class="fw-bolder" style="color:black; font-size: 24px;">
                            ${productVO.name}
                        </h3>
                        <hr>
                    </div>
                    <div class="fs-4 mb-4">
                        <span style="font-size:14px;">定價: </span><span class="text-decoration-line-through"
                            style="font-size:18px;">$99999.00</span><br>
                        <span style="font-size:18px;">優惠價: </span><span style="font-size: 20px;color:#E60000;"><strong>
                                ${productVO.price}.00
                            </strong></span>
                    </div>
                    <div>
                        <em style="color: white; font-size:14px; background-color: #8ab70f;border-radius: 4px;">滿額優惠
                        </em>
                        &nbsp&nbsp<span style="font-size:12px; color: black; border-radius: 16px;">買越多送越多
                            ${productVO.name}!!
                        </span>
                    </div>
                    <!--<div class="small mb-1">商品地點: 這個好像不用特別寫</div> -->

                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 下方-->
                    <!--檢查邊界的 style="border: 2px purple solid;" -->
                    <div style="padding:10px;">
                    
                    	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/front_end/product/productorder.do">
                    	<input type="hidden" name="action" value="insert">
                    	<input type="hidden" name="id" value="${productVO.id}">                    
                        	<button class="btn1Buy" type="submit">
                            	<i class="bi-cart-fill me-1"></i>
                            	直接購買
                        	</button>
                    	</FORM>
                        	
                      
                        <FORM METHOD="post" ACTION="productcollection.do?prodId=${productVO.id}">
                        <input type="hidden" name="action" value="insert">
                        <input type="hidden" name="id" value="${productVO.id}">
<%--                         <input type="hidden" name="id" value="${productVO.id}">                         --%>
                        <button class="btn2Collect" type="submit">                       
                         <i class="bi bi-bookmarks-fill"></i>
                            加入收藏
                        </button>
                        </FORM>                        
                        
                        <a href="<%=request.getContextPath()%>/front_end/product/productReport.jsp?prodId=${productVO.id}">
                        <button class="btn3Return" type="button">                       
                        <i class="bi bi-people-fill"></i>
                            問題回報                       
                        </button></a>
                        
                        <!-- modal 互動視窗-->
                    </div>
                    
                    <!--按鈕 "me-間隔" "<i>按鈕" "readonly 只看不可改" 上方-->
                    
                    <div>
                        <span class="spanLocation">付款方式 : 信用卡( 限台灣發行 )</span><br>
                        <span class="spanLocation">運送方式 : 臺灣與離島</span><br>
                        <span class="spanLocation">可配送地點 : 台灣、蘭嶼、綠島、澎湖、金門、馬祖</span><br>
                        <span class="spanLocation">可取貨地點 : 台灣、蘭嶼、綠島、澎湖、金門、馬祖</span><br>
                        <span class="spanLocation">商品所在地 : ${productVO.location}</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
        	
	<!--second section -->
    <section class="py-5 bg-light">
<!--      <div class="container px-4 px-lg-5 mt-5"> -->
        <div style="margin: 0 230px;">
            <div>
                <div class="aboutProductWord"
                    style="font-size:16px;width:100%;padding: 3px 0 3px 10px;background-color: lightgray;">
                    商品詳圖
                </div>
                <br>
                <img class="img-fluid rounded mb-2 mb-lg-0 img-thumbnail" src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=${productVO.id}"
                    alt="${productVO.name}" />
            </div>
            <div class="aboutProductWord"
                style="font-size:16px;width:100%;padding: 3px 0 3px 10px;background-color: lightgray;">
                產品說明
            </div>
            <div>
                <p class="lead">
                    ${productVO.description}
                </p>
            </div>
            <div class="small mb-1" style="text-align:center;margin-top:20px;">
                上架時間: ${productVO.launchedDate}
            </div>
<!--         </div> -->
       </div>
    </section>
    
    

    <!-- Related items section-->
    <jsp:include page="/front_end/product/relatedItems.jsp"></jsp:include>
    <!-- Footer-->
    <jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

</html>