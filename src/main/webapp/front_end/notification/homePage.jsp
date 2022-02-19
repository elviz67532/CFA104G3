<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.notification.model.*"%>
<%@ page import="com.member.model.*"%>
<%
	NotificationService service = new NotificationServiceImpl();	
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVO");
	if (memberVo != null) {
		Integer memberId = memberVo.getId();
		List<NotificationVO> allNotificationVOs = service.getMemberAllNotification(memberId);
		List<NotificationVO> moveNotifications = new ArrayList<>();
		List<NotificationVO> productNotifications = new ArrayList<>();
		List<NotificationVO> activityNotifications = new ArrayList<>();
		List<NotificationVO> otherNotifications = new ArrayList<>();
		
		Comparator notifyComparator = new Comparator<NotificationVO>() {
			@Override
			public int compare(NotificationVO o1, NotificationVO o2) {
				if (o1.getNotifyTime() == null) {
					return 1;
				}
				if (o2.getNotifyTime() == null) {
					return -1;
				}
				if(o1.getNotifyTime().after(o2.getNotifyTime())) {
					return -1;
				}
				return 1;
			}
		};
		
		for(NotificationVO vo: allNotificationVOs) {
			Integer type = vo.getType();
			if (type == 0) {
				otherNotifications.add(vo);				
			} else if (type == 1) {
				moveNotifications.add(vo);
			} else if (type == 2) {
				productNotifications.add(vo);
			} else if (type == 3) {
				activityNotifications.add(vo);
			}
		}
		
		// 排序
		Collections.sort(otherNotifications, notifyComparator);
		Collections.sort(moveNotifications, notifyComparator);
		Collections.sort(productNotifications, notifyComparator);
		Collections.sort(activityNotifications, notifyComparator);
		Collections.sort(allNotificationVOs, notifyComparator);

		pageContext.setAttribute("otherNotifications", otherNotifications);
		pageContext.setAttribute("moveNotifications", moveNotifications);
		pageContext.setAttribute("productNotifications", productNotifications);
		pageContext.setAttribute("activityNotifications", activityNotifications);
		pageContext.setAttribute("notifications", allNotificationVOs);
	}
	String type = (String)request.getParameter("type");
	pageContext.setAttribute("type", type);
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
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/notification/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <!-- Navigation-->
    <!-- nav -->
	<jsp:include page="/front_end/common/navigation.jsp"></jsp:include>

    <!-- Page Header-->
    <header class="masthead" style="background-image: url('<%=request.getContextPath()%>/asset/img/bgHome01.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="site-heading">
                        <h1>訊息通知</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
   
   	<!-- 主體畫面設計  -->
    <nav>
		<div class="nav nav-tabs outter" id="nav-tab" role="tablist">
		    <button class="nav-link <c:if test='${empty type}'>active</c:if>" id="nav-all-tab" data-bs-toggle="tab" data-bs-target="#nav-all" type="button" role="tab" aria-controls="nav-all" aria-selected="true">全部通知</button>
		    <button class="nav-link <c:if test='${type eq 1}'>active</c:if>" id="nav-move-tab" data-bs-toggle="tab" data-bs-target="#nav-move" type="button" role="tab" aria-controls="nav-move" aria-selected="false">搬家</button>
		    <button class="nav-link <c:if test='${type eq 2}'>active</c:if>" id="nav-product-tab" data-bs-toggle="tab" data-bs-target="#nav-product" type="button" role="tab" aria-controls="nav-product" aria-selected="false">二手買賣</button>
	   	    <button class="nav-link <c:if test='${type eq 3}'>active</c:if>" id="nav-activity-tab" data-bs-toggle="tab" data-bs-target="#nav-activity" type="button" role="tab" aria-controls="nav-activity" aria-selected="false">活動舉辦</button>
			<button class="nav-link <c:if test='${type eq 0}'>active</c:if>" id="nav-other-tab" data-bs-toggle="tab" data-bs-target="#nav-other" type="button" role="tab" aria-controls="nav-other" aria-selected="false">其他</button>
		</div>
	</nav>
	<div class="tab-content outter" id="nav-tabContent">
		<div class="tab-pane fade <c:if test='${empty type}'>show active</c:if>" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
<!-- view觸發 -->
			<div class="accordion" id="accordionPanelsStayOpenExample">
				<c:forEach var="vo" items="${notifications}">
					<div class="accordion-item <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					  <h2 class="accordion-header" id="panelsStayOpen-${vo.id}">
					    <button value="${vo.id}" class="<c:if test='${vo.viewed eq false}'>viewNotify bg-gradient-info text-white </c:if>accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse-${vo.id}" aria-expanded="true" aria-controls="panelsStayOpen-collapse-${vo.id}">
				    		<c:choose>
				    			<c:when test="${vo.viewed eq false}">
				    				<fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
				    			</c:when>
				    			<c:otherwise>
				    				<b><fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/></b>
				    			</c:otherwise>
				    		</c:choose>
					    </button>
					  </h2>
					  <div id="panelsStayOpen-collapse-${vo.id}" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-${vo.id}">
					    <div class="accordion-body <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					    	${vo.content} 	
					    </div>
					  </div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="tab-pane fade <c:if test='${type eq 1}'>show active</c:if>" id="nav-move" role="tabpanel" aria-labelledby="nav-move-tab">
			<c:forEach  var="vo" items="${moveNotifications}">
				<div class="accordion-item <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					<h2 class="accordion-header" id="move-${vo.id}">
				    	<button value="${vo.id}" class="<c:if test='${vo.viewed eq false}'>viewNotify bg-gradient-info text-white </c:if>accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#move-collapse-${vo.id}" aria-expanded="true" aria-controls="move-collapse-${vo.id}">
			    			<c:choose>
			    				<c:when test="${vo.viewed eq false}">
			    					<fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
			    				</c:when>
				    			<c:otherwise>
				    				<b><fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/></b>
				    			</c:otherwise>
			    			</c:choose>
				    	</button>
				  	</h2>	
				  	<div id="move-collapse-${vo.id}" class="accordion-collapse collapse show" aria-labelledby="move-${vo.id}">
					    <div class="accordion-body <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					    	${vo.content} 	
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="tab-pane fade <c:if test='${type eq 2}'>show active</c:if>" id="nav-product" role="tabpanel" aria-labelledby="nav-product-tab">
			<c:forEach  var="vo" items="${productNotifications}">
				<div class="accordion-item <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					<h2 class="accordion-header" id="product-${vo.id}">
				    	<button value="${vo.id}" class="<c:if test='${vo.viewed eq false}'>viewNotify bg-gradient-info text-white </c:if>accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#product-collapse-${vo.id}" aria-expanded="true" aria-controls="product-collapse-${vo.id}">
			    			<c:choose>
			    				<c:when test="${vo.viewed eq false}">
			    					<fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
			    				</c:when>
				    			<c:otherwise>
				    				<b><fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/></b>
				    			</c:otherwise>
			    			</c:choose>
				    	</button>
				  	</h2>	
				  	<div id="product-collapse-${vo.id}" class="accordion-collapse collapse show" aria-labelledby="product-${vo.id}">
					    <div class="accordion-body <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					    	${vo.content} 	
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="tab-pane fade <c:if test='${type eq 3}'>show active</c:if>" id="nav-activity" role="tabpanel" aria-labelledby="nav-activity-tab">
			<c:forEach  var="vo" items="${activityNotifications}">
				<div class="accordion-item <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					<h2 class="accordion-header" id="activity-${vo.id}">
				    	<button value="${vo.id}" class="<c:if test='${vo.viewed eq false}'>viewNotify bg-gradient-info text-white </c:if>accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#activity-collapse-${vo.id}" aria-expanded="true" aria-controls="activity-collapse-${vo.id}">
			    			<c:choose>
			    				<c:when test="${vo.viewed eq false}">
			    					<fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
			    				</c:when>
				    			<c:otherwise>
				    				<b><fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/></b>
				    			</c:otherwise>
			    			</c:choose>
				    	</button>
				  	</h2>	
				  	<div id="activity-collapse-${vo.id}" class="accordion-collapse collapse show" aria-labelledby="activity-${vo.id}">
					    <div class="accordion-body <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					    	${vo.content} 	
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="tab-pane fade <c:if test='${type eq 0}'>show active</c:if>" id="nav-other" role="tabpanel" aria-labelledby="nav-other-tab">
			<c:forEach  var="vo" items="${otherNotifications}">
				<div class="accordion-item <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					<h2 class="accordion-header" id="other-${vo.id}">
				    	<button value="${vo.id}" class="<c:if test='${vo.viewed eq false}'>viewNotify bg-gradient-info text-white </c:if>accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#other-collapse-${vo.id}" aria-expanded="true" aria-controls="other-collapse-${vo.id}">
			    			<c:choose>
			    				<c:when test="${vo.viewed eq false}">
			    					<fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/>
			    				</c:when>
				    			<c:otherwise>
				    				<b><fmt:formatDate value="${vo.notifyTime}" pattern="yyyy-M-dd HH:mm"/></b>
				    			</c:otherwise>
			    			</c:choose>
				    	</button>
				  	</h2>	
				  	<div id="other-collapse-${vo.id}" class="accordion-collapse collapse show" aria-labelledby="other-${vo.id}">
					    <div class="accordion-body <c:if test='${vo.viewed eq false}'>font-weight-bold</c:if>">
					    	${vo.content} 	
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
   
    <!-- Footer-->
   	<jsp:include page="/front_end/common/footer.jsp"></jsp:include>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="<%=request.getContextPath()%>/js/front_end/scripts.js"></script>
</body>

<script>
$(".viewNotify").click(function(){
    let self = this;
    let notifyId = self.value;
		 	
    $.ajax({
        url: "/CFA104G3/notification/notification.do",
        type: "POST",
        data: JSON.stringify({'action':'viewedNotify', 'id':notifyId}),
        success: function(data) {
        	location.reload();
        }
	});
});
</script>
</html>