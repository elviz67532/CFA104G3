<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			委域
		</div>
	</a>
	
	<!-- 幫助中心管理	 -->
	<hr class="sidebar-divider">
	<li class="nav-item">
		<a class="nav-link" 
		   href="/CFA104G3/back_end/server_manager/FAQ.jsp"
		   onclick="this.parentNode.submit()">
			<i class="fas fa-fw fa-table"></i> 
			<span>FAQ</span>
		</a>
	</li>
    
	<!-- 活動管理 -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">活動管理</div>
		<li class="nav-item">
		<a class="nav-link collapsed" 
		   href="#" 
		   data-toggle="collapse" data-target="#collapseActivity" aria-expanded="true" aria-controls="collapseActivity"> 
			<i class="fas fa-fw fa-cog"></i> 
			<span>活動</span>
		</a>
		<div id="collapseActivity" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/activity.jsp">活動管理</a>
			</div>
		</div>
	</li>
	
		
	<!-- 二手買賣管理 -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">二手買賣管理</div>
		<li class="nav-item">
		<a class="nav-link collapsed" 
		   href="#" 
		   data-toggle="collapse" data-target="#collapseProduct" aria-expanded="true" aria-controls="collapseProduct"> 
			<i class="fas fa-fw fa-cog"></i> 
			<span>二手買賣</span>
		</a>
		<div id="collapseProduct" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/product.jsp">檢舉管理</a>
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/product.jsp">商品管理</a>
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/product.jsp">訂單管理</a>
			</div>
		</div>
	</li>

	<!-- 搬家 -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">搬家管理</div>
		<li class="nav-item">
		<a class="nav-link collapsed" 
		   href="#" 
		   data-toggle="collapse" data-target="#collapseMove" aria-expanded="true" aria-controls="collapseMove"> 
			<i class="fas fa-fw fa-cog"></i> 
			<span>搬家</span>
		</a>
		<div id="collapseMove" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="<%=request.getContextPath()%>/back_end/move/moveRequestManage.jsp">申請單管理</a>
				<a class="collapse-item" href="<%=request.getContextPath()%>/back_end/move/readMoveOrder.jsp">訂單管理</a>
			</div>
		</div>
	</li>
	
	<!-- 會員管理 -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">會員管理</div>
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember" aria-expanded="true" aria-controls="collapseMember"> 
			<i class="fas fa-fw fa-cog"></i> 
			<span>會員</span>
		</a>
		<div id="collapseMember" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/manager.jsp">會員資料</a>
			</div>
		</div>
	</li>
	
	<!-- 權限管理 -->
	<hr class="sidebar-divider">
	<div class="sidebar-heading">管理員權限</div>
	<li class="nav-item">
		<a class="nav-link collapsed" 
		   href="/CFA104G3/back_end/server_manager/server.jsp" 
		   data-toggle="collapse" data-target="#collapseManager" aria-expanded="true" aria-controls="collapseManager"> 
			<i class="fas fa-fw fa-cog"></i> 
			<span>管理員</span>
		</a>
		<div id="collapseManager" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/admin.jsp">權限管理</a>
				<a class="collapse-item" href="/CFA104G3/back_end/server_manager/addManager.jsp">新增管理員</a>				
			</div>
		</div>
	</li>

	<!-- 摺疊 -->
	<hr class="sidebar-divider d-none d-md-block">
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>