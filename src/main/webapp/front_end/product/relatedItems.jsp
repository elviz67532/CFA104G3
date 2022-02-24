<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product.model.ProductVO"%>

<% 
	ProductVO productVO = (ProductVO)request.getAttribute("productVO");
	
%>

<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">熱銷商品</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

<!--卡片1 -->
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img style="max-width: 450px; max-height: 200px; overflow:hidden;" src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=12"/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h6 class="fw-bolder">你上癮的好貨</h6>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            $999.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet" ">
			     		<input type="submit" class="btn btn-outline-dark mt-auto" value="前往">
			     		<input type="hidden" name="prodId"  value="12">
			     		<input type="hidden" name="action"	value="getOne_For_Display"></FORM>
                        </div>
                    </div>
                </div>
            </div>
<!--卡片2 -->
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
                    </div>
                    <!-- Product image-->
                    <img style="max-width: 450px; max-height: 200px; overflow:hidden;" src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=7"/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">怡理經典語錄</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">$2000.00</span>
                            $1980.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet" ">
			     		<input type="submit" class="btn btn-outline-dark mt-auto" value="前往">
			     		<input type="hidden" name="prodId"  value="7">
			     		<input type="hidden" name="action"	value="getOne_For_Display"></FORM>
                        </div>
                    </div>
                </div>
            </div>
<!--卡片3 -->         
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
                    </div>
                    <!-- Product image-->
                    <img style="max-width: 450px; max-height: 200px; overflow:hidden;" src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=10"/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">台灣遊記</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>                                
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">$50000.00</span>
                            $12345.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet" ">
			     		<input type="submit" class="btn btn-outline-dark mt-auto" value="前往">
			     		<input type="hidden" name="prodId"  value="10">
			     		<input type="hidden" name="action"	value="getOne_For_Display"></FORM>
                        </div>
                    </div>
                </div>
            </div>
<!--卡片4 -->
            <div class="col mb-5">
                <div class="card h-100">                	
                    <!-- Product image--> 
                    <img style="max-width: 450px; max-height: 200px; overflow:hidden;" src="<%=request.getContextPath()%>/product_photo/DBGifReader2?prodId=5"/>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">ps5</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            $12999.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/ProductServlet" ">
			     		<input type="submit" class="btn btn-outline-dark mt-auto" value="前往">
			     		<input type="hidden" name="prodId"  value="5">
			     		<input type="hidden" name="action"	value="getOne_For_Display"></FORM>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>