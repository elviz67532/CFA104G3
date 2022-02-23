<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@	page import="com.product.model.*"%>
<%@ page import="com.product_report.model.*"%>
    
<% 	

	ProductReportVO productReportVO = (ProductReportVO) request.getAttribute("productReportVO");
	System.out.println("productReportVO: " + productReportVO);
	
%>    
    
<!-- 如果上放兩個VO就可以同時動作?? 不知道為啥 待研究 也許可以一次執行兩個action?    -->
    
    
<!-- Modal 互動視窗 product專用 -->

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
  
    <div class="modal-content">
    
    
      	<div class="modal-header">
      
        	<h5 class="modal-title" id="staticBackdropLabel">問題回報</h5>
               
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
      	</div>
      
      <div class="modal-body">
<!--這裡開始是測試 -->

<!-- Contact-->
        <section class="page-section" id="contact">
          <form METHOD="post" id="contactForm" name="form1" ACTION="${pageContext.request.contextPath}/product/report.do" enctype="multipart/form-data">
            <div class="container">

                    <div class="row align-items-stretch mb-5">
<!--左邊區塊 -->                    
                        <div class="col-md-6">
                        
                            <!-- 商品編號 input 加上class="form-control-plaintext" 變成只能看-->                                
                            <div class="form-group">
                                <input class="form-control" id="productId" type="text" placeholder="商品編號...*" data-sb-validations="required" 
                                value="<%=(productReportVO == null) ? "" : productReportVO.getProductId()%>" />                        
                            </div>
                            
                            <!-- 會員編號 input-->                                
                            <div class="form-group"> 
                                <input class="form-control" id="memberId" type="text" placeholder="會員編號...*" data-sb-validations="required" 
                                value="<%=(productReportVO == null) ? "" : productReportVO.getMemberId()%>"/>                                   
                            </div>
                            
                            <!-- 狀態 input-->                                
                            <div class="form-group"> 
                                <input type="hidden" name="status" value="<%=(productReportVO == null) ? "0" : productReportVO.getContent()%>"/>                                                               
                            </div>
                                                        
                            <!-- 圖片 input-->                                
                            <div class="form-group mb-md-0">                
                                <input class="form-control" type="file" name="photo" accept="image/gif, image/jpeg, image/png" id="photo" 
                                value="<%=(productReportVO == null) ? "" : productReportVO.getPhoto()%>"/>
                            <!--圖片預覽 script 108-118 -->
                                <img style="max-width: 450px; max-height: 200px; overflow:hidden;" id="testphoto"/>                              
                            </div>
                            
                        </div>                        
<!--右邊區塊 -->
                        <div class="col-md-6">
                        
                            <!-- 內文 input-->                                
                            <div class="form-group form-group-textarea mb-md-0">
                                <textarea class="form-control" name="content" placeholder="請從這裡開始敘述..*"
                                value="<%=(productReportVO == null) ? "" : productReportVO.getContent()%>"rows="3"></textarea>                                
                            </div>
                        </div>
                    </div>               
            </div>
           <div>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
        
        <!-- Submit Button-->
        <input type="hidden" name="action" value="insert">
   		<input type="submit" value="回報" class="btn btn-outline-primary btn-xl">
        
      		</div>
            
	</form>            
  </section>
            
            
            
        </div>     

      

        
		
      	
<!--這裡開始是測試-->
      
      
    </div> 
    
<!-- 	圖片預覽 -->
       	<script type="text/javascript"> -->
        		$('#photo').change(function() {
        	  	var file = $('#photo')[0].files[0];
        	  	var reader = new FileReader;
        	  	reader.onload = function(e) {
        	    $('#testphoto').attr('src', e.target.result);
        	  	};
        	  	reader.readAsDataURL(file);
        		});
        	</script> 
   </div> 
  
</div>