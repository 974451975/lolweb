<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>story</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="bootstarp/css/bootstrap.min.css"/>
    <script src="js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="bootstarp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <!--// css -->
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>



    <script type="text/javascript" src="js/jquery.flexisel.js"></script>


</head>

<body style="background-color: #000000;" >
<!-- Header -->
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
                <div ><a  href="index.jsp"><img src="images/logo.jpg" alt=" " style="height: 60px; width:167px;" /></a></div>
            </div>
            <c:if test="${empty sessionScope.loginuser}">
            <div id="navbar" class="navbar-collapse collapse" >
                <ul class="nav navbar-nav navbar-right">
                    <li class="hover-effect"><a href="${applicationScope.basePath}index.jsp" >首 页</a></li>
                    <li class="hover-effect"><a href="${applicationScope.basePath}herocontroller/queryAllHero.do" >英 雄</a></li>
                    <li class="hover-effect"><a href="${applicationScope.basePath}storycontroller/queryAllStoryByPage.do?page=1" >故 事</a></li>
                    <li class="hover-effect"><a href="${applicationScope.basePath}heroimgcontroller/queryAllHeroimgByPage.do?page=1" >插 画</a></li>
                    <li class="hover-effect"><a href="${applicationScope.basePath}forumcontroller/queryAllForumByPage.do?page=1" >论 坛</a></li>
                    <li class="hover-effect"><a href="#mymodal" data-toggle="modal" >登录/注册</a></li>
                </ul>
            </div>
            </c:if>
            <c:if test="${not empty sessionScope.loginuser}">
            <div id="navbar" class="navbar-collapse collapse" style="" >
                <ul class="nav navbar-nav navbar-right">
                    <li class="hover-effect"><a href="index.jsp" >首 页</a></li>
                    <li class="hover-effect"><a href="herocontroller/queryAllHero.do" >英 雄</a></li>
                    <li class="hover-effect"><a href="storycontroller/queryAllStoryByPage.do?page=1" >故 事</a></li>
                    <li class="hover-effect"><a href="heroimgcontroller/queryAllHeroimgByPage.do?page=1" >插 画</a></li>
                    <li class="hover-effect"><a href="forumcontroller/queryAllForumByPage.do?page=1" >论 坛</a></li>
                    <li class="hover-effect"><a href="mycollect.jsp">我的收藏</a></li>
                    <li style="padding-right: 0px"><img id="head"  src= upload/${sessionScope.loginuser.user_img};  style="height:45px; width:45px; border-radius:100%;background-size:100% 100%;" ></li>
                    <li class="hover-effect" style="padding-left: 0px;padding-right: 0px"><a href="updateuser.jsp"> ${sessionScope.loginuser.user_name}  &nbsp;&nbsp;欢迎您&nbsp;</a></li>
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

<script>
    // function getLogin(){
    //     var username=document.getElementById("username").value;
    //     var userpwd=document.getElementById("userpwd").value;
    //
    // }

    function gotoreg() {
        window.location.href="register.jsp";
    }

</script>
<!--以上代码为模态框-->


<!-- Banner-Slider-JavaScript -->
<script src="js/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 800,
            namespace: "callbacks",
            pager: true,
        });
    });



</script>
<!-- //Banner-Slider-JavaScript -->
<!-- //Header -->

<div><img src="images/${sessionScope.storys.story_img}"/></div>



<style>
    #showstory {
        list-style-type: none;
    }

    .context{
        color: #f0e6d2;
        font-size:20px;
        padding: 10px;
        line-height: 1.58;
    }
</style>

<div align="center" style="margin-top:50px ;">
    <hr style="width: 20% ; color:#927345;" />
    <p style="color: #f0e6d2;font-size: 24px;margin: 20px;">
        ${sessionScope.storys.story_title}
    </p>
    <p style="color:#c8aa6e;font-size: 12px;">
        作者：${sessionScope.storys.story_author}
    </p>
    <div style="width: 34%;margin-top: 100px;" align="left">
        ${sessionScope.storys.story_context}

    </div>
    <div align=" center " style="width: 100%;height: auto; margin-top: 100px;" >





    </div>

    <div style="clear: both;height: 0px;width: 100%;"></div>
</div>
<!--尾部-->
<div style="clear: both; height: 200px; " align="center">
    <hr style="width: 60% ; color:#927345;" />
    <div><a href="#"><font style="color: #c4b998;">返回顶部</font></a></div>
</div>
</body>

</html>


