 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <section  id="service">
        <div class="specialcontainer px-5 my-5">
            <div class="row">
            	<div class="col-md-4 col-sm-6 ">
	                  <div class="specialcard">
	                      <img src="<%=request.getContextPath()%>/asset/img/default.jpeg" style="background-color:red" alt="活動瀏覽">
	                      <div class="specialcard-text">
	                          <h3>我參與的活動</h3>
	                      </div>
	                  </div>
                </div>
                <div class="col-md-4 col-sm-6 ">
                    <a href="<%=request.getContextPath()%>/front_end/activity/memPublishActivityOwnPage.jsp?action=selectActivityByMemId">
                        <div class="specialcard">
                            <img src="<%=request.getContextPath()%>/asset/img/default.jpeg" style="background-color:red" alt="活動管理">
                            <div class="specialcard-text">
                                <h3>我舉辦的活動</h3>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>