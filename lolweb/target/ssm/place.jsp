<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Single</title>
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

    <script>
        $(document).ready(function(){

            $.getJSON("placecontroller/queryAllPlace.do",function(data){
                if(data!=null){
                    var str="";
                    for(var i=0;i<data.length;i++){
                        str=str+"<li style='float: left; margin: 0px 30px;'>" +
                            "<div style='width: 255px;'align='center'>" + data[i].influence_name +
                            "              </div>" +
                            "          </li>";

                    }
                    $("#herolist").html(str);

                }

            });


        });


    </script>


</head>
<body style="background-color: black;">
<div class="header">
    <!-- Navbar -->
    <nav class="navbar navbar-default" style="border-color: #000000; margin-bottom: 10px;margin-top: 10px">
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



    <div style="width: 80%; margin: auto;">
        <a href="#"><h3 style="color:#c4b998;font-size: 40px;margin: 80px;">英 雄</h3></a>
        <ul id="herolist" style="text-align:center;list-style-type:none;">


        </ul>
    </div>






</body>
</html>