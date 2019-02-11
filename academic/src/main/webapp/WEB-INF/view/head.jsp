<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<header class="main-header">
	<div class="container_header">
		<div class="logo d-flex align-items-center">
			<a style="text-align: center;">
				<strong class="logo_icon"> <img src="<%=basePath%>assets/images/small-logo.png" alt=""> </strong>
				<span class="logo-default">
					<h1 style="text-align: center;">Course System</h1>
				</span>
			</a>
			<div class="icon_menu full_menu">
				<a class="menu-toggler sidebar-toggler"></a>
			</div>
		</div>
		<div class="right_detail">
			<div class="row d-flex align-items-center min-h pos-md-r">
				<div class="col-xl-5 col-3 search_col ">
					<div class="top_function">
						<div class="search">
							<a id="toggle_res_search" data-toggle="collapse" data-target="#search_form" class="res-only-view collapsed" href="<%=basePath%>javascript:void(0);" aria-expanded="false">
								<i class=" icon-magnifier"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-xl-7 col-9 d-flex justify-content-end">
					<div class="right_bar_top d-flex align-items-center">
						<div class="dropdown dropdown-user">
							<a href="<%=basePath%>javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" aria-expanded="true">
								<img class="img-circle pro_pic" src="<%=basePath%>assets/images/about-1.jpg" alt="">
							</a>
							<ul class="dropdown-menu dropdown-menu-default">
								<li><a href="<%=basePath%>user/logout"><i class="icon-logout"></i> Log out </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</header>