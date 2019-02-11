<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, stuwork-scalable=0">
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
                                <h1>Submit Assignment</h1>
                            </div>
                        </div>
                        <div class="col-md-3 justify-content-end d-flex">
                            <div class="breadcrumb_nav">
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-home"></i>
                                        <a class="parent-item">Home</a>
                                        <i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Submit Assignment</li>
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
                                <div class="card-title">Submit Assignment</div>
                            </div>
                            <div class="card-body">
                                <form method="post" action="<%=basePath%>stuwork/addOrUpdateStuwork">
                                    <input type="hidden" name="stuworkid" value="${stuwork.stuworkid }"/>
                                    <input type="hidden" name="homeworkid" value="${homeworkId}"/>
                                    <input type="hidden" name="stuid" value="${uid}"/>
                                    <input type="hidden" name="scorce" value="0"/>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Upload</label>
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <%--<c:if test="${stuwork.type=='1'}">--%>
                                                <div class="col-sm-5">
                                                    <input class="form-control" id="filepath" name="filepath"
                                                           type="text" value="${stuwork.filepath }"
                                                           readonly="readonly"/>
                                                </div>
                                                <div class="col-sm-5">
                                                    <input id="doc-form-file1" class="form-control" type="file"
                                                           multiple/>
                                                </div>
                                                <div class="col-sm-2">
                                                    <input class="btn btn-primary" name="file" type="button"
                                                           value="Upload" onclick="imgUrlAdd();"/>
                                                </div>
                                                <%--</c:if>--%>
                                                <%--</c:if>
                                                <c:if test="${stuwork.type=='2}">
                                                    <div class="col-sm-5">
                                                        <input class="form-control" name="filepath" type="text" value="${stuwork.filepath }"/>
                                                    </div>
                                                    <div class="col-sm-5">
                                                        <input class="form-control" type="file" multiple/>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                        &lt;%&ndash;<input class="btn btn-primary" name="file" type="button" value="Submit" onclick="javascript:$('#setId').val('${obj.stuworkid}')"/>&ndash;%&gt;

                                                </c:if>--%>
                                            </div>
                                        </div>
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
    $(document).ready(function () {
        $('#bs4-table').DataTable();
    });
</script>
<script type="text/javascript">
    function checkbookTypeAndSizeimg() {
        var filepath = $("#doc-form-file1").val();
        var extStart = filepath.lastIndexOf(".");
        var ext = filepath.substring(extStart, filepath.length)
            .toUpperCase();
        if (ext != ".DOC" && ext != ".DOCX" && ext != ".PDF") {
            alert("Only doc,docx,pdf");
            return false;
        }
        var file_size = $("#doc-form-file1")[0].files[0].size;
        var size = file_size / 1024 / 1024;
        if (size > 1) {
            alert("Uploading files cannot be larger than 1MB！");
            return false;
        }
        return true;
    }

    function imgUrlAdd() {
        // Determine file type and size
        if (checkbookTypeAndSizeimg()) {
            var formData = new FormData();
            formData.append("file", $("#doc-form-file1")[0].files[0]);
            $.ajax({
                url: '<%=basePath%>uploadFile',
                type: 'POST',
                data: formData,
                // 告诉jQuery不要去处理发送的数据
                processData: false,
                // 告诉jQuery不要去设置Content-Type请求头
                contentType: false,
                dataType: 'text',
                beforeSend: function () {
                    console.log("Uploading...");
                },
                success: function (data) {
                    if (data == 'no') {
                        alert("Failure to upload");
                    } else {
                        $("#filepath").val(data);
                    }
                },
                error: function (responseStr) {
                    console.log(responseStr);
                }
            });
        }
    }
</script>
</body>

</html>