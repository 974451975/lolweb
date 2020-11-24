<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/16
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";
%>
<html lang="en">
<head>
    <title>精美插画</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- css -->
    <link href="${applicationScope.basePath}css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="${applicationScope.basePath}css/flexslider.css" type="text/css" media="screen" property="" />
    <link href="${applicationScope.basePath}css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="${applicationScope.basePath}bootstarp/css/bootstrap.min.css"/>
    <script src="${applicationScope.basePath}js/jquery-3.3.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="${applicationScope.basePath}bootstarp/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <!--// css -->
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="${applicationScope.basePath}js/jquery.min.js"></script>
    <script src="${applicationScope.basePath}js/bootstrap.js"></script>



    <script type="text/javascript" src="${applicationScope.basePath}js/jquery.flexisel.js"></script>


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
                <div ><a  href="index.html"><img src="../images/logo.jpg" alt=" " style="height: 60px; width:167px;" /></a></div>
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
                    <li class="hover-effect"><a href="../index.jsp" >首 页</a></li>
                    <li class="hover-effect"><a href="../herocontroller/queryAllHero.do" >英 雄</a></li>
                    <li class="hover-effect"><a href="../storycontroller/queryAllStoryByPage.do?page=1" >故 事</a></li>
                    <li class="hover-effect"><a href="../heroimgcontroller/queryAllHeroimgByPage.do?page=1" >插 画</a></li>
                    <li class="hover-effect"><a href="../forumcontroller/queryAllForumByPage.do?page=1" >论 坛</a></li>
                    <li class="hover-effect"><a href="../mycollect.jsp">我的收藏</a></li>
                    <li style="padding-right: 0px"><img id="head"  src= ../upload/${sessionScope.loginuser.user_img};  style="height:45px; width:45px; border-radius:100%;background-size:100% 100%;" ></li>
                    <li class="hover-effect" style="padding-left: 0px;padding-right: 0px"><a href="../updateuser.jsp"> ${sessionScope.loginuser.user_name}  &nbsp;&nbsp;欢迎您&nbsp;</a></li>
                    <li class="hover-effect" style="padding-left: 0px"><a  href="usercontroller/logout.do;" >退 出</a></li>
                </ul>
            </div>
            </c:if>

    </nav>
</div>




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

<form action="queryHeroimgByKey.do">
    <div>
        <div style="padding-top: 18px;background-color: #121212;width: 100%;height: 70px;">
            <div style="padding-left: 10%;"><img src="${applicationScope.basePath}/images/yx.png" style="width: 16px;">
                <font style="padding: 20px;color: #c4b998;">请输入名称</font><input type="text" name="imgkey" style=" width: 20%;height: 36px;color: #c4b998 ; background-color: rgba(52,43,32,.5);border: 0px;font-size: 22px;" />
                <button type="submit" style="height: 36px;background-color:white;">搜索</button>
            </div>
        </div>
    </div>
</form>

<style>
    #showsheroimg {
        list-style-type: none;
    }

</style>

<div align="center" style="margin-top:50px ;">
    <hr style="width: 40% ; color:#927345;" />
    <div style="font-size: 28px; color:#c4b998 ; ">插画</div>
    <hr style="width: 60% ; color:#927345;" />
    <div align=" center " style="width: 100%;height: auto; margin-top: 100px;" >


        <ul id="showheroimg">
            <c:forEach items="${requestScope.heroimglist}" var="heroimglist">
                <li style='float: left; margin:20px 1%; border:1px Solid #927345;height: 280px;width:30%;overflow: hidden'>
                    <a href="../bigimg.jsp?imgkey=${heroimglist.heroimg_img}"><img src="../images/${heroimglist.heroimg_img}" style='width:100%;height:100%;'></a>
                </li>
            </c:forEach>
        </ul>

    </div>

    <script>
        function KeyDown() {
            if (event.keyCode==13){
                event.returnValue=false;
                event.cancel=true;
                Form1.btnsubmit.click();
            }
        }
    </script>

    <!--以下代码为模态框-->
    <form action="usercontroller/login.do" name="Form1">
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
                            <input type="text" class="form-control" name="user_name" onkeydown="KeyDown()"/>
                        </div>
                        <div id="divuser">&nbsp;</div>
                        <br>
                        <div class="input-group input-group-lg" style="width: 90%;">
                            <span class="input-group-addon" >密&nbsp;&nbsp;&nbsp; 码:</span>
                            <input type="password" class="form-control" name="user_pwd" onkeydown="KeyDown()"/>
                        </div>
                        <div id="divpwd">&nbsp;</div>

                    </div>
                    <div class="modal-footer">

                        <button style="float: left;margin-left: 30px;"class="btn btn-success" onclick="gotoreg()" type="button"><a href="../register.jsp">注册</a></button>
                        <a href="#">忘记密码</a>
                        <button type="submit" class="btn btn-primary " name="btnsubmit" style="margin-left: 40%">登录</button>

                    </div>
                </div>
            </div>
        </div>
    </form>

    <div align="center" style="clear: both">
        <pt:page url="queryAllHeroimgByPage.do?" pageIndex="${requestScope.page}" pageMax="${requestScope.maxpage}"/>
    </div>
    <div style="clear: both;height: 100px;width: 100%;"></div>
</div>
<!--尾部-->
<div style="clear: both; height: 200px; " align="center">
    <hr style="width: 60% ; color:#927345;" />
    <div><a href="#"><font style="color: #c4b998;">返回顶部</font></a></div>
</div>
</body>

</html>
