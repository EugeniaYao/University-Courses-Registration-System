<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>urp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, course-scalable=0">
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>Vertical/favicon.ico">
<link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/ionicons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/jquery.mCustomScrollbar.css" rel="stylesheet">

<!--bs4 data table-->
<link href="<%=basePath%>assets/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<jsp:include page="head.jsp"></jsp:include>
		<div class="container_full">
			<jsp:include page="left.jsp"></jsp:include>
			<main class="content_wrapper">
				<div class="page-heading">
					<div class="container-fluid">
						<div class="row d-flex align-items-center">
							<div class="col-md-3">
								<div class="page-breadcrumb">
									<h1>Courses</h1>
								</div>
							</div>
							<div class="col-md-3 justify-content-end d-flex">
								<div class="breadcrumb_nav">
									<ol class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a class="parent-item" >Home</a>
											<i class="fa fa-angle-right"></i>
										</li>
										<li class="active">Courses</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class=" col-md-6">
							<div class="card card-shadow mb-4">
								<div class="card-header">
									<div class="card-title">
										<c:if test="${course.courseid==null }">
											Add Courses
										</c:if>
										<c:if test="${course.courseid!=null }">
											Edit Courses
										</c:if>
									</div>
								</div>
								<div class="card-body">
									<form method="post" action="<%=basePath%>course/addOrUpdateCourse">
										<input type="hidden" name="courseid" value="${course.courseid }"/>
		                            	<input type="hidden" name="userid" value="${uid}"/>

										<c:if test="${course.courseid==null }">
											<input type="hidden" name="price" value="0"/>
											<input type="hidden" name="choosenum" value="0"/>
										</c:if>
										<c:if test="${course.courseid!=null }">
											<input type="hidden" name="price" value="${course.price}"/>
											<input type="hidden" name="choosenum" value="${course.choosenum}"/>
										</c:if>

										<div class="form-group">
											<label>Course</label>
											<input type="text" class="form-control form-control-pill" name="coursename" value="${course.coursename }">
										</div>
                                        <div class="form-group">
                                            <label>Teacher</label>
                                            <input type="text" class="form-control form-control-pill" name="userid" value="${course.userid }">
                                        </div>
										<div class="form-group">
											<label>Credit</label>
											<input type="text" class="form-control form-control-pill" name="scorce" value="${course.scorce }">
										</div>
										<div class="form-group">
											<label>Type</label>
											<select name="type" class="form-control form-control-pill">
												<option value="1" <c:if test="${course.type=='1' }">selected="selected"</c:if>>Online</option>
												<option value="2" <c:if test="${course.type=='2' }">selected="selected"</c:if>>Offline</option>
											</select>
										</div>
										<div class="form-group">
											<label>Location/URL</label>
											<input type="text" class="form-control form-control-pill" name="address" value="${course.address }">
										</div>
										<div class="form-group">
											<label>Evaluation</label>
											<select name="algorithm" class="form-control form-control-pill">
												<option value="1" <c:if test="${course.algorithm=='1' }">selected="selected"</c:if>>Points</option>
												<option value="2" <c:if test="${course.algorithm=='2' }">selected="selected"</c:if>>Rank</option>
											</select>
										</div>
										<div class="form-group">
											<label>Capacity</label>
											<input type="text" class="form-control form-control-pill" name="num" value="${course.num }">
										</div>
										<button type="submit" class="btn btn-primary">Save</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	
	<script type="text/javascript" src="<%=basePath%>assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/popper.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="<%=basePath%>assets/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>assets/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="<%=basePath%>assets/js/custom.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('#bs4-table').DataTable();
		});
	</script>
</body>

</html>