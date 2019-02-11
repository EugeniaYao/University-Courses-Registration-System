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
							<div class="col-md-6">
								<div class="page-breadcrumb">
									<h1>
										<c:if test="${role=='1'}">Teacher</c:if>
										<c:if test="${role=='2'}">Student</c:if>
										<c:if test="${role=='3'}">Finance Manager</c:if>
									</h1>
								</div>
							</div>
							<div class="col-md-6 justify-content-end d-flex">
								<div class="breadcrumb_nav">
									<ol class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a class="parent-item" >Home</a>
											<i class="fa fa-angle-right"></i>
										</li>
										<li class="active">
											<c:if test="${role=='1'}">Teacher</c:if>
											<c:if test="${role=='2'}">Student</c:if>
											<c:if test="${role=='3'}">Finance Manager</c:if>
										</li>
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class=" col-sm-12">
							<div class="card card-shadow mb-4">
								<div class="card-header">
									<a class="btn btn-success btn-sm" href="<%=basePath%>user/beforeAddOrUpdateUser?userId=&role=${role}">
										<c:if test="${role=='1'}">Add Teacher</c:if>
										<c:if test="${role=='2'}">Add Student</c:if>
										<c:if test="${role=='3'}">Add Finance Manager</c:if>
									</a>
								</div>
								<div class="card-body">
									<table id="bs4-table" class="table table-bordered table-striped" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th width="50px">No.</th>
												<th>User</th>
												<th>Password</th>
												<%--<th>Real Name</th>--%>
												<c:if test="${role=='2'}">
													<th>Student ID</th>
													<%--<th>Date of Birth</th>--%>
												</c:if>
												<th>Gender</th>
												<c:if test="${role=='2'}">
													<th>College</th>
													<th>Major</th>
												</c:if>
												<%--<th>Phone</th>
												<th>E-mail</th>--%>
												<c:if test="${role=='2'}">
													<th>Tuition</th>
												</c:if>
												<th width="100px">Operation</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userList }" var="obj" varStatus="_v">
						                    		<td>${_v.count }</td>
							                  		<td>${obj.username }</td>
							                  		<td>${obj.pwd }</td>
													<%--<td>${obj.realname }</td>--%>
													<c:if test="${role=='2'}">
														<td>${obj.code }</td>
														<%--<td>${obj.birthday }</td>--%>
													</c:if>
													<td>${obj.sex }</td>
													<c:if test="${role=='2'}">
														<td>${obj.college }</td>
														<td>${obj.major }</td>
													</c:if>
													<%--<td>${obj.tel }</td>
													<td>${obj.email }</td>--%>
													<c:if test="${role=='2'}">
														<td>
															<c:if test="${obj.tuition==0}">No setting</c:if>
															<c:if test="${obj.tuition!=0}">${obj.tuition}</c:if>
														</td>
													</c:if>
							                  		<td>
														<c:if test="${roler=='0'}">
															<a class="btn btn-warning btn-sm" href="<%=basePath%>user/beforeAddOrUpdateUser?userId=${obj.userid}&role=${role}">Edit</a>
															<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delUser" onclick="javascript:$('#delId').val('${obj.userid}');">Delete</button>
														</c:if>
							                  			<c:if test="${roler=='3'}">
															<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#setTuition" onclick="javascript:$('#setId').val('${obj.userid}');">Set Tuition</button>
														</c:if>
							                  		</td>
						                  		</tr>
						                  	</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	
	<div id="delUser" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form action="<%=basePath%>user/deleteUser" method="post">
					<input type="hidden" name="userId" id="delId" value="">
					<input type="hidden" name="role" value="${role }">
					<div class="modal-header">
						<h5 class="modal-title" id="myLargeModalLabel">Delete</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						Attention! Deletion cannot be restored!
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-danger">Delete</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="setTuition" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form action="<%=basePath%>user/setTuition" method="post">
					<input type="hidden" name="userId" id="setId" value="">
					<input type="hidden" name="role" value="${role }">
					<div class="modal-header">
						<h5 class="modal-title">Tuition</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Tuition</label>
							<input type="text" class="form-control form-control-pill" name="tuition" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-danger">Save</button>
					</div>
				</form>
			</div>
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