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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, achieve-scalable=0">
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
									<h1>Attach Scholarship</h1>
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
										<li class="active">Attach Scholarship</li>
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
								<c:if test="${roler=='3'}">
									<div class="card-header">
										<a class="btn btn-success btn-sm" href="<%=basePath%>achieve/beforeAddOrUpdateAchieve?achieveId=">Attach Scholarship</a>
									</div>
								</c:if>
								<div class="card-body">
									<table id="bs4-table" class="table table-bordered table-striped" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th width="50px">No.</th>
												<th>Student</th>
												<th>Scholarship</th>
												<th>Amount</th>
												<th>Time</th>
												<c:if test="${roler=='3'}">
													<th width="100px">Operation</th>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${achieveList }" var="obj" varStatus="_v">
						                    	<tr>
						                    		<td>${_v.count }</td>
							                  		<td>${obj.realname }</td>
							                  		<td>${obj.scholarshipname }</td>
													<td>${obj.price }</td>
													<td>${obj.addtime }</td>
													<c:if test="${roler=='3'}">
														<td>
															<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="javascript:$('#delId').val('${obj.achieveid}');">Delete</button>
														</td>
													</c:if>
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
	
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form action="<%=basePath%>achieve/deleteAchieve" method="post">
					<input type="hidden" name="achieveId" id="delId" value="">
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