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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
									<h1>Scholarship List</h1>
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
										<li class="active">Scholarship Management</li>
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
										<c:if test="${scholarship.scholarshipid==null }">Add Scholarship</c:if>
										<c:if test="${scholarship.scholarshipid!=null }">Edit Scholarship</c:if>
									</div>
								</div>
								<div class="card-body">
									<form method="post" action="/scholarship/addOrUpdateScholarship">
										<input type="hidden" name="scholarshipid" value="${scholarship.scholarshipid }"/>

										<div class="form-group">
											<label>Scholarship</label>
											<input type="text" class="form-control form-control-pill" name="scholarshipname" value="${scholarship.scholarshipname }">
										</div>
										<div class="form-group">
											<label>Amount</label>
											<input type="text" class="form-control form-control-pill" name="price" value="${scholarship.price }">
										</div>
										<div class="form-group">
											<label>Form</label>
											<select name="ptype" class="form-control form-control-pill">
												<option value="1" <c:if test="${scholarship.ptype=='1' }">selected="selected"</c:if>>Amount</option>
												<option value="2" <c:if test="${scholarship.ptype=='2' }">selected="selected"</c:if>>Rate</option>
											</select>
										</div>
										<div class="form-group">
											<label>Type</label>
											<select name="type" class="form-control form-control-pill">
												<option value="1" <c:if test="${scholarship.type=='1' }">selected="selected"</c:if>>Country</option>
												<option value="2" <c:if test="${scholarship.type=='2' }">selected="selected"</c:if>>Merit</option>
											</select>
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