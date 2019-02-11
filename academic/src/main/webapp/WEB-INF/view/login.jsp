<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>

    <title>urp</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>Vertical/favicon.ico">
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>assets/css/ionicons.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>assets/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>assets/css/jquery.mCustomScrollbar.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet">
</head>

<body class="bg_darck">
<div class="sufee-login d-flex align-content-center flex-wrap">
    <div class="container">
        <div class="login-content">
            <div class="logo">
                    <h1 style="color: white;">Welcome to Course Management System!</h1>
            </div>
            <div class="login-form">
                <form method="post" action="/user/login">
                    <div class="form-group">
                        <label>User</label>
                        <input type="text" class="form-control" name="uname" placeholder="Please enter in your username">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="pwd" placeholder="Please enter in your password">
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <select name="role" class="form-control">
                            <option value="0">Admin</option>
                            <option value="1">Teacher</option>
                            <option value="2">Student</option>
                            <option value="3">Finance Manager</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Log in</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/popper.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=basePath%>assets/js/custom.js" type="text/javascript"></script>
</body>

</html>
