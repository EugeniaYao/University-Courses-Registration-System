<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="side_bar scroll_auto">
	<div class="user-panel">
		<div class="user_image">
			<img src="<%=basePath%>assets/images/about-1.jpg" class="img-circle mCS_img_loaded" alt="User Image">
		</div>
		<div class="info">
			<p>
				<c:if test="${roler=='0'}">Admin</c:if>
				<c:if test="${roler=='1'}">Teacher</c:if>
				<c:if test="${roler=='2'}">Student</c:if>
                <c:if test="${roler=='3'}">Fiance Manager</c:if>
				${uname }</p>
			<%--<a href="#"><i class="fa fa-circle text-success"></i> Online</a>--%>
		</div>
	</div>
	<ul id="dc_accordion" class="sidebar-menu tree">
		<c:if test="${roler=='0' }">
            <li class="menu_sub"><a href="#">Data Management<span class="arrow"></span></a>
                <ul class="down_menu">
                    <li><a href="<%=basePath%>course/findCourseAll">Course</a></li>
                </ul>
            </li>

            <%--<li class="menu_sub">--%>
                <%--<ul class="down_menu">--%>
                    <li class="menu_sub"><a href="#">User Management<span class="arrow"></span></a>
                        <ul class="down_menu">
                            <li><a href="<%=basePath%>user/findUserAll?role=1">Teacher</a></li>
                            <li><a href="<%=basePath%>user/findUserAll?role=2">Student</a></li>
                            <li><a href="<%=basePath%>user/findUserAll?role=3">Finance Manager</a></li>
                        </ul>
                    </li>
                <%--</ul>--%>
            <%--</li>--%>
		</c:if>
		<c:if test="${roler=='1'}">
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>My Course</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">
					<li><a href="<%=basePath%>course/findCourseAll">Course</a></li>
					<li><a href="<%=basePath%>homework/findHomeworkAll">Assignment</a></li>
				</ul>
			</li>
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>Grading</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">

					<li><a href="<%=basePath%>choose/findChooseAll">My student</a></li>
					<li><a href="<%=basePath%>stuwork/findStuworkAll">Grade Assignment</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${roler=='2' }">
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>Registration</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">
					<li><a href="<%=basePath%>course/findCourseAll">Course</a></li>
					<li><a href="<%=basePath%>homework/findHomeworkAll">Assignment</a></li>
				</ul>
			</li>
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>My Course</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">
					<li><a href="<%=basePath%>choose/findChooseAll">My Course</a></li>
					<li><a href="<%=basePath%>stuwork/findStuworkAll">My Assignment</a></li>
					<li><a href="<%=basePath%>achieve/findAchieveAll">My Scholarship</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${roler=='3' }">
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>Finance Management</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">
					<li><a href="<%=basePath%>scholarship/findScholarshipAll">Scholarship</a></li>
					<li><a href="<%=basePath%>course/findCourseAll">Credit Price</a></li>
				</ul>
			</li>
			<li class="menu_sub">
				<a href="#">
					<i class="fa fa-circle-o"></i>
					<span>Student Tuition</span>
					<span class="arrow"></span>
				</a>
				<ul class="down_menu">
                    <li><a href="<%=basePath%>user/findUserAll?role=2">Tuition</a></li>
					<li><a href="<%=basePath%>achieve/findAchieveAll">Student Scholarship</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
</div>
