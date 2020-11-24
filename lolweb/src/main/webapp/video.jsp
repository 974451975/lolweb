<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>精彩视频</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--// css -->
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckplayer/ckplayer/ckplayer.js"></script>

<style>
    body {
        background-color:black;
    }

    .m {
        width: 840px;
        height: 500px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 100px;
    }
</style>
</head>
<body>
<div class="header">
    <!-- Navbar -->
    <nav class="navbar navbar-default" style="border-color: #000000; margin-bottom: 10px;">
        <div class="container" style="background-color: #000000;width: 100%;">
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div ><a  href="index.html"><img src="images/logo.jpg" alt=" " style="height: 60px; width:167px;" /></a></div>
            </div>
            <c:if test="${empty sessionScope.loginuser}">
            <div id="navbar" class="navbar-collapse collapse" >
                <ul class="nav navbar-nav navbar-right">
                    <li class="hover-effect"><a href="index.html" >首 页</a></li>
                    <li class="hover-effect"><a href="register.jsp" >英 雄</a></li>
                    <li class="hover-effect"><a href="games.html" >地 区</a></li>
                    <li class="hover-effect"><a href="news.html" >论 坛</a></li>
                    <li class="hover-effect"><a href="#mymodal" data-toggle="modal" >登录/注册</a></li>
                </ul>
            </div>
            </c:if>
            <c:if test="${not empty sessionScope.loginuser}">
            <div id="navbar" class="navbar-collapse collapse" style="" >
                <ul class="nav navbar-nav navbar-right">
                    <li class="hover-effect"><a href="index.html" >首 页</a></li>
                    <li class="hover-effect"><a href="about.html" >英 雄</a></li>
                    <li class="hover-effect"><a href="news.html" >论 坛</a></li>
                    <li style="padding-right: 0px"><img id="head"  src= upload/${sessionScope.loginuser.user_img};  style="height:45px; width:45px; border-radius:100%;background-size:100% 100%;" ></li>
                    <li class="hover-effect" style="padding-left: 0px;padding-right: 0px"><a href="userInfo.jsp"> ${sessionScope.loginuser.user_name}  &nbsp;&nbsp;欢迎您&nbsp;</a></li>
                    <li class="hover-effect" style="padding-left: 0px"><a  href="usercontroller/logout.do;" >退 出</a></li>
                </ul>
            </div>
            </c:if>

    </nav>
</div>
<!--以下代码为模态框-->
<form action="usercontroller/login.do">
    <div id="mymodal" class="modal fade" style="margin-top: 250px;"><!--固定布局   上下左右都是0(充满页面) 支持手机端触摸方式-->
        <div class="modal-dialog"><!--默认相对定位的  自适应  当屏幕大于768px  产生宽度600px  居中-->
            <div class="modal-content"><!--决定模态框的边框 背景 边距 阴影效果-->
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Login</h4>
                </div>
                <div class="modal-body" style="padding: 20px 30px;" align="center">
                    <div class="input-group input-group-lg" style="width: 90%;">
                        <span class="input-group-addon">用户名:</span>
                        <input type="text" class="form-control" name="user_name" />
                    </div>
                    <div id="divuser">&nbsp;</div>
                    <br>
                    <div class="input-group input-group-lg" style="width: 90%;">
                        <span class="input-group-addon" >密&nbsp;&nbsp;&nbsp; 码:</span>
                        <input type="password" class="form-control" name="user_pwd"/>
                    </div>
                    <div id="divpwd">&nbsp;</div>

                </div>
                <div class="modal-footer">

                    <button style="float: left;margin-left: 30px;"class="btn btn-success" onclick="gotoreg()" type="button">注册</button>
                    <a href="#">忘记密码</a>
                    <button type="submit" class="btn btn-primary " style="margin-left: 40%">登录</button>

                </div>


            </div>
        </div>
    </div>
</form>
Model:ckPlayer<br>
<br>
<!-- CkPlayer  -->
<div class="m">
    <div id="video" style="width: 50%; height: 50%;"></div>
    <script type="text/javascript">
        var videoObject = {
            container : '#video',//“#”代表容器的ID，“.”或“”代表容器的class
            variable : 'player',//该属性必需设置，值等于下面的new chplayer()的对象
            flashplayer : false,//如果强制使用flashplayer则设置成true
            allowFullScreen : true,//是否支持全屏
            video : {
                file : 'video/129.mp4',//视频地址
                type : 'video/mp4'
            }
        };
        var player = new ckplayer(videoObject);
    </script>
</div>
</body>
</body>
</html>