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
    <title>${sessionScope.hero.hero_title} &nbsp; ${sessionScope.hero.hero_name}</title>
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
</head>
<body style="background-color: black;">
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
<%--回车按键--%>
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




<div  style="width:100%; height:700px; background: linear-gradient(to bottom, rgba(255,255,255,0), rgba(0,0,0,1)), url(${sessionScope.hero.hero_img});background-size: 100% auto;">
</div>
<div style="position: absolute; top: 500px;">
    <div align="center"><font style="font-size: 80px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(103,13,71),rgb(203,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;">${sessionScope.hero.hero_name}</font></div>
    <div><img src="images/pr1.jpg"></div>
    <div align="center">
        <font style="font-size: 12px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(103,13,71),rgb(203,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;">${sessionScope.hero.hero_title}</font>
    </div>
</div>







<div>
    <div align="center" style="margin-top: 10px; ">
        <div style="border: 1px solid #31271e; width: 1200px;height: 280px;background-color:rgb(15,15,15) ;">
            <!--内容-->
            <div style="margin-top: 50px; height: 1000px;">
                <!--定位-->
                <div align="center" style="margin-bottom: 30px;float: left;position: absolute;left: 20%;padding: 3px;margin-top: 25px;border-right: 2px solid #31271e ">
                    <div style="height: 115px;width: 115px;float: left;">
                        <img src="images/${sessionScope.hero.profession_logo}"/>
                    </div>
                    <div style="height: 115px;width: 100px;float: left;margin-top: 25px;">
                        <p style="font-size: 16px;color: #937341;">角色定位</p>
                        <p style="margin-top: 14%;color:#c4b998 ">${sessionScope.hero.profession_name}</p>
                    </div>
                </div>
                <!--定位-->
                <!--台词-->
                <div id="" style="width:500px;float: left; position: absolute;left: 35%;padding: 3px;margin-top: 30px;">
                    <div align="center">
                        <p><font style=" color: #c4b998; font-size: 30px;">“${sessionScope.hero.hero_info}”</font> </p>
                        <p style=""><font style="font-size: 22px; color:#c4b998; ">~${sessionScope.hero.hero_name}</font></p>
                    </div>+
                </div>
                <!--台词-->

                <!--势力-->
                <div align="center" style="margin-bottom: 30px;float: left;position: absolute;left: 68%;padding: 3px;margin-top: 25px;border-left: 2px solid #31271e ">
                    <div style="height: 115px;width: 115px;float: left;">
                        <img src="images/${sessionScope.hero.influence_logo}" style="width:auto;height: 90%;margin-top: 5%;"/>
                    </div>
                    <div style="height: 115px;width: 100px;float: left;margin-top: 25px;">
                        <p style="font-size: 16px;color: #937341;">相关地区</p>
                        <p style="margin-top: 14%;color:#c4b998 ">${sessionScope.hero.influence_name}</p>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <!--故事-->

    <script>
        $(document).ready(function(){
            $.getJSON("storycontroller/queryStoryById/${sessionScope.hero.hero_id}.do",function(data){
                if(data!=null){
                    var headstr=" <div style='margin-top: 70px; ' align='center'> <p style='font-size: 28px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(103,13,71),rgb(203,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;'>--精彩故事--</p></div>";
                    var str="";

                    for(var i=0;i<data.length;i++){
                        str=str+"<li style='margin-top: 60px;height: 400px;overflow: hidden;'>" +
                            "<div style='width: 100%; height: 400px; background: url(images/"+data[i].story_img+");opacity: .3'></div>" +
                            "            <div style='position: relative; top: -320px;width:100%;'>" +
                            "            <div align='center'><p style='font-size: 16px;color: rgba(211, 199, 170,1);'>短片故事</p></div>" +
                            "            <div align='center' style='margin-top: 10px;'>" +
                            "            <p style='font-size: 42px;color: #937341;'>"+data[i].story_title+"</p></div>" +
                            "            <div align='center' style='margin-top: 60px;'><a href='#' ><div style='border: 3px solid darkkhaki;width: 200px;height:70px; background-color: rgba(0,0,0,0.5);' align='center'>" +
                            "            <p style='font-size: 16px;color: #937341;margin-top: 18px;'><a href='storycontroller/queryStoryIndexById.do?id="+data[i].story_id+"'>阅读故事</a></p>" +
                            "            </div></a></div></div></div>"
                        "          </li>";

                    }
                    $("#showherostory").html(headstr+str);

                }

            });
        });
    </script>

    <!--故事正文-->
    <div style="width: auto;margin-top: 10px; height:auto;">

        <ul id="showherostory">





        </ul>


        <!--故事正文-->

        <!--故事正文-->

    </div>


    <!--故事正文-->



    <!--插画-->
<%--    <div style="width: auto;">--%>
<%--        <div align="center">--%>
<%--            <div style="margin-top: 70px;margin-bottom: 100px; " align="center">--%>
<%--                <p style="font-size: 28px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(100,13,71),rgb(255,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;">--精美插画--</p>--%>
<%--            </div>--%>

<%--            <div style="margin:0 auto ;">--%>
<%--                <div style="width: 1520px;margin: 40px;">--%>
<%--                    <div class="" style="width: 300px;height: 375px; float: left;margin: 40px;">--%>
<%--                        <a href="#"><img src="images/灵魂莲华.jpg" alt=" " /></a>--%>
<%--                    </div>--%>
<%--                    <div class="" style="width: 300px;height: 375px;float: left;margin: 40px;">--%>
<%--                        <a href="#"><img src="images/灵魂莲华.jpg" alt=" " /></a>--%>
<%--                    </div>--%>
<%--                    <div class="" style="width: 300px;height: 375px;float: left;margin: 40px;">--%>
<%--                        <a href="#"><img src="images/灵魂莲华.jpg" alt=" " /></a>--%>
<%--                    </div>--%>
<%--                    <div class="" style="width: 300px;height: 375px;float: left;margin: 40px;">--%>
<%--                        <a href="#"><img src="images/灵魂莲华.jpg" alt=" " /></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--        </div>--%>

<%--    </div>--%>

    <!--插画-->
    <div align="center"  style="height: 300px;">
        <div style="clear: both;">
            <p style="font-size: 28px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(100,13,71),rgb(255,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;">--地区--</p>
        </div>
        <div style="margin-bottom: 30px;"><img src="images/pr1.jpg"></div>
        <!--尾部-->
        <div style="width: auto;height: 300px;clear: both; ">
            <a href="#">
                <div style="width: 100%;height: 300px; background: url(images/demaxiya.jpg);opacity: 0.3;">

                </div>
                <div>
                    <div align="center" style="position: relative;top: -200px;">
                        <font style="font-size: 80px;font-weight:600;background-image:-webkit-linear-gradient(bottom,rgb(103,71,31),rgb(203,172,98));-webkit-background-clip:text; -webkit-text-fill-color:transparent;">
                            德玛西亚
                        </font>
                    </div>
                </div>

            </a>
        </div>
        <!--尾部-->
    </div>
</div>
</body>
</html>