<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap11.min.css">
    <link rel="stylesheet" type="text/css" href="css/style1.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
    <link rel="shortcut icon" href="images/icon/favicon.ico">
    <script src="js/jquery-2.1.4.min.js"></script>
    <!--[if gte IE 9]>
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/html5shiv.min.js" type="text/javascript"></script>
    <script src="js/respond.min.js" type="text/javascript"></script>
    <script src="js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
</head>
<%--回车键登录--%>
<script>
    function KeyDown() {
        if (event.keyCode==13){
            event.returnValue=false;
            event.cancel=true;
            Form1.btnsubmit.click();
        }
    }
</script>

<body class="user-select">
<div class="container">
    <div class="siteIcon"><img src="images/男孩.jpg" alt="" data-toggle="tooltip" data-placement="top" title="欢迎使用管理系统" draggable="false" /></div>
    <form action="admincontroller/adminLogin.do" method="post" autocomplete="off" class="form-signin" name="Form1">
        <h2 class="form-signin-heading">管理员登录</h2>
        <label for="userName" class="sr-only">用户名</label>
        <input type="text" id="userName" name="admin_name" onkeydown="KeyDown()" class="form-control" placeholder="请输入用户名" required autofocus autocomplete="off" maxlength="10">
        <label for="userPwd" class="sr-only">密码</label>
        <input type="password" id="userPwd" name="admin_pwd" onkeydown="KeyDown()" class="form-control" placeholder="请输入密码" required autocomplete="off" maxlength="18">
        <a href=""><button class="btn btn-lg btn-primary btn-block" name="btnsubmit" type="submit" id="signinSubmit" onkeydown="KeyDown()">登录</button></a>
    </form>
<%--    <div class="footer">--%>
<%--        <p><a href="index.html" data-toggle="tooltip" data-placement="left" title="不知道自己在哪?">回到后台 →</a></p>--%>
<%--    </div>--%>
</div>
<script src="js/bootstrap.min.js"></script>

</body>
</html>