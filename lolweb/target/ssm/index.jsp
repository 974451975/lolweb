<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";
    application.setAttribute("basePath",basePath);
%>
<html lang="en">
<head>
    <title>Index</title>
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
    <script type="text/javascript" src="js/ckplayer/ckplayer/ckplayer.js"></script>

    <style>
        .m {
            width: 840px;
            height: 500px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 100px;
        }
    </style>

    <script type="text/javascript" src="${applicationScope.basePath}js/jquery.flexisel.js"></script>
    <script>
    $(document).ready(function(){

        $.getJSON("herocontroller/queryFourHero.do",function(data){
            if(data!=null){
                var str="";
                for(var i=0;i<data.length;i++){
                    str=str+"<li style='float: left; margin: 0px 4%;'>" +
                        "<div style='width: 255px;'align='center'>" +
                        "            <a href='herocontroller/showHero/"+data[i].hero_id+".do '><img src='images/"+data[i].hero_logo+"'style='width:100%;height:auto;'/>" +
                        "            <div style='width: auto;height: 100px;background-color: rgba(0,0,0,0.8);border-top: 1px solid #927345;position: relative;bottom: 100px;'>" +
                        "            <div style='color: #937341;font-size: 14px;margin: 20px;'>"+data[i].hero_name+"</div>" +
                        "            <div style='color: #c4b998;'>"+data[i].hero_title+"</div>" +
                        "              </div>" +
                        "               </a>" +
                        "              </div>" +
                        "          </li>";

                }
                $("#herolist").html(str);

            }

        });


    });


</script>

</head>



<body style="background-color: #000000;" >
<!-- Header -->
<div class="header">
    <!-- Navbar -->
    <nav class="navbar navbar-default" style="border-color: #000000;margin-bottom: 0px">
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



<div class="slider">
    <ul class="rslides" id="slider">
        <li>
            <img src="images/banner1.jpg" alt="" />
        </li>
        <li>
            <img src="images/banner2.jpg" alt="" />
        </li>
        <li>
            <img src="images/banner3.jpg" alt="" />
        </li>
    </ul>
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

<div style="width: 100%; margin: 10px;">
    <a href="#"><h3 style="color:#c4b998;font-size: 40px;margin: 80px;">英 雄</h3></a>
    <ul id="herolist" style="text-align:center;list-style-type:none;">


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

                    <button style="float: left;margin-left: 30px;"class="btn btn-success" onclick="gotoreg()" type="button"><a href="register.jsp">注册</a></button>
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



<!-- new games -->

    <div class="new-w3-agile" style="clear: both;">
        <div class="container">
            <a><h3 style="color:#c4b998;">插 画</h3></a>
            <div class="col-md-3 new-grid-w3l view view-eighth">
                <img src="images/电玩.jpg" alt=" " />
                <div class="mask" style="height: 100%;">
                    <a href="bigimg.jsp?imgkey=电玩瑞文.jpg"><h4>电玩</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>
            <div class="col-md-3 new-grid-w3l view view-eighth">
                <img src="images/泳池派对.jpg" alt=" " />
                <div class="mask" style="height: 100%;">
                    <a href="bigimg.jsp?imgkey=泳池男枪.jpg"><h4>泳池派对</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>
            <div class="col-md-3 new-grid-w3l view view-eighth">
                <img src="images/对决.jpg" alt=" " />
                <div class="mask" style="height: 100%;">
                    <a href="bigimg.jsp?imgkey=黑夜亚索.jpg"><h4>对决</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>
            <div class="col-md-3 new-grid-w3l view view-eighth">
                <img src="images/灵魂莲华.jpg" alt=" " />
                <div class="mask" style="height: 100%;">
                    <a href="bigimg.jsp?imgkey=灵魂莲华永恩.jpg"><h4>灵魂莲华</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>
            <div class="col-md-6 new-grid-w3l view view-eighth">
                <img src="images/jks.jpg" alt=" " />
                <div class="mask" style="height: 100%;width: 100%;">
                    <a href="bigimg.jsp?imgkey=jks.jpg"><h4>金克丝</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>

            <div class="col-md-6 new-grid-w3l view view-eighth">
                <img src="images/mao.jpg" alt=" " />
                <div class="mask" style="height: 100%;width: 100%;">
                    <a href="bigimg.jsp?imgkey=mao.jpg"><h4>猫猫</h4></a>
                    <p>To learn more about this</p>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
    <!-- //new games-->



<div class="">
    <div  >
        <div class="wthree_info">
            <section class="slider" >
                <div class="flexslider" style="height: 300px;">
                    <ul class="slides">
                        <li>
                            <div class="wthree_info_grid" style="background: url(images/lakesi.jpg);background-size:100%;width: 100%;padding-top: 30px;padding-bottom: 30px;">
                                <h3 style="font-size: 62px; color: rgb(147,115,65);">牢笼</h3><h5 style="color: rgb(147,115,65);">SHORT STORY</h5>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt officia.</p>
                                <a href="single.html" class="learn">阅读故事</a>
                            </div>
                        </li >
                        <li>
                            <div class="wthree_info_grid" style="background: url(images/sbg.jpg);background-size:100%;width: 100%;padding-top: 30px;padding-bottom: 30px;">
                                <h3 style="font-size: 62px; color: rgb(147,115,65);">Aliquip commodo consequat</h3><h5 style="color: rgb(147,115,65);">SHORT STORY</h5>
                                <p>Curabitur lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                <a href="single.html" class="learn">Learn More</a>
                            </div>
                        </li>
                        <li >
                            <div class="wthree_info_grid" style="background: url(images/aiouniya.jpg);width: 100%;padding-top: 30px;padding-bottom: 30px;">
                                <h3 style="font-size: 62px; color: rgb(147,115,65);">Quis autem vel eum iure ea</h3><h5 style="color: rgb(147,115,65);">SHORT STORY</h5>
                                <p>Phasellus ornare consectetur erat, eu vehicula orci finibus at.</p>
                                <a href="single.html" class="learn">Learn More</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <!-- flexSlider -->

            <script defer src="js/jquery.flexslider.js"></script>
            <script type="text/javascript">
                $(window).load(function(){
                    $('.flexslider').flexslider({
                        animation: "slide",
                        start: function(slider){
                            $('body').removeClass('loading');
                        }
                    });
                });
            </script>
            <!-- //flexSlider -->
        </div>
    </div>
</div>

<!-- footer -->

<div class="m" align="center">
    <a><h3 style="color:#c4b998;">精彩视频</h3></a>
    <div id="video" style="width: 70%; height: 50%; margin-top: 50px;"></div>
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

<!-- //footer -->
</body>
</html>
