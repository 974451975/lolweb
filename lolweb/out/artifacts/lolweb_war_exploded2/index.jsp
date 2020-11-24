<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Index</title>
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

</head>
<body style="background-color: #000000;">
<!-- Header -->
<div class="header">
    <!-- Navbar -->
    <nav class="navbar navbar-default" style="border-color: #000000;">
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
                <div id="navbar" class="navbar-collapse collapse" >
                    <ul class="nav navbar-nav navbar-right">

                        <li class="hover-effect"><a href="index.html" >首 页</a></li>
                        <li class="hover-effect"><a href="about.html" >英 雄</a></li>
                        <li class="hover-effect"><a href="games.html" >地 区</a></li>
                        <li class="hover-effect"><a href="news.html" >论 坛</a></li>
                            <%--                        <li class="hover-effect"><a href="#mymodal" data-toggle="modal"></a></li>--%>
                        <li style="padding-right: 0px"><div id="head" style="height:45px; width:45px;background:url(${sessionScope.loginuser.user_img});border-radius:100%" ></div></li>
                        <li class="hover-effect" style="padding-left: 0px"><a href="index.html" style=>${sessionScope.loginuser.user_name}&nbsp;&nbsp;欢迎您&nbsp;&nbsp;&nbsp;</a></li>
                        <li class="hover-effect"><a  href="usercontroller/logout.do;" >退 出</a></li>
                    </ul>
                </div>
            </c:if>

        </div>
    </nav>


    <!-- Slider -->

    <!-- //Slider -->

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

<!-- trend -->
<div class="trend-w3layouts">
    <div class="container">
        <a href="#"><h2 style="color:#c4b998;">英 雄</h2></a>
        <ul id="flexiselDemo1">
            <li>
                <div class="trend-grid" >
                    <a href="#"><img src="images/yasuo.jpg" alt=" " class="img-responsive" />
                        <div style="width:255px ; height: 53px; background-color: rgba(10,10,12,.8); position: absolute; bottom: 0px;">
                            <h1 style="color: #937341; font-size: 14px;letter-spacing: 2px;margin-top: 10px; ">亚&nbsp;索</h1>
                            <h2 style="color: #c4b998;font-size: 12px;margin-top: 10px;">艾欧尼亚</h2>
                        </div>

                    </a>
                </div>
            </li>
            <li>
                <div class="trend-grid" >
                    <a href="#"><img src="images/ali.jpg" alt=" " class="img-responsive" />
                        <div style="width:255px ; height: 53px; background-color: rgba(10,10,12,.8); position: absolute; bottom: 0px;">
                            <h1 style="color: #937341; font-size: 14px;letter-spacing: 2px;margin-top: 10px; ">阿&nbsp;狸</h1>
                            <h2 style="color: #c4b998;font-size: 12px;margin-top: 10px;">艾欧尼亚</h2>
                        </div>
                    </a>
                </div>
            </li>
            <li>
                <div class="trend-grid" >
                    <a href="#"><img src="images/kapai.jpg" alt=" " class="img-responsive" />
                        <div style="width:255px ; height: 53px; background-color: rgba(10,10,12,.8); position: absolute; bottom: 0px;">
                            <h1 style="color: #937341; font-size: 14px;letter-spacing: 2px;margin-top: 10px; ">卡&nbsp;牌</h1>
                            <h2 style="color: #c4b998;font-size: 12px;margin-top: 10px;">比尔吉沃特</h2>
                        </div>
                    </a>
                </div>
            </li>
            <li>
                <div class="trend-grid" >
                    <a href="#"><img src="images/aixi.jpg" alt=" " class="img-responsive" />
                        <div style="width:255px ; height: 53px; background-color: rgba(10,10,12,.8); position: absolute; bottom: 0px;">
                            <h1 style="color: #937341; font-size: 14px;letter-spacing: 2px;margin-top: 10px; ">艾&nbsp;希</h1>
                            <h2 style="color: #c4b998;font-size: 12px;margin-top: 10px;">弗雷尔卓德</h2>
                        </div>
                    </a>
                </div>
            </li>

        </ul>
        <script type="text/javascript">
            $(window).load(function() {
                $("#flexiselDemo1").flexisel({
                    visibleItems: 4,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint:480,
                            visibleItems: 2
                        },
                        landscape: {
                            changePoint:640,
                            visibleItems:3
                        },
                        tablet: {
                            changePoint:768,
                            visibleItems: 4
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
    </div>
</div>
<!-- //trend -->

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
                </div>
                <button style="float: left;margin-left: 20px;"class="btn btn-success">注册</button>
                <a href="#">忘记密码</a>
                <button type="submit" class="btn btn-primary" >登录</button>
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
</script>

<!-- services-->
<div class="services-agileits-w3layouts" style="background-color: #000000;">
    <div class="container" style="background-color: #000000;">
        <h3>Services</h3>
        <div class="col-md-3 service-grid-agileits service-grid-agileits-top">
            <span class="glyphicon glyphicon-sort-by-attributes" aria-hidden="true"></span>
            <h4>Quis tortor</h4>
            <p>Curabitur suscipit porttitor aliquam. Etiam id placerat purus. Integer sodales elit eget arcu placerat.</p>
            <a href="single.html">Read More</a>
        </div>
        <div class="col-md-3 service-grid-agileits">
            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>
            <h4>Eget arcu</h4>
            <p>Curabitur suscipit porttitor aliquam. Etiam id placerat purus. Integer sodales elit eget arcu placerat.</p>
            <a href="single.html">Read More</a>
        </div>
        <div class="col-md-3 service-grid-agileits service-grid-agileits-bottom">
            <span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
            <h4>Risus porta</h4>
            <p>Curabitur suscipit porttitor aliquam. Etiam id placerat purus. Integer sodales elit eget arcu placerat.</p>
            <a href="single.html">Read More</a>
        </div>
        <div class="col-md-3 service-grid-agileits service-grid-agileits-bottom">
            <span class="glyphicon glyphicon-object-align-right" aria-hidden="true"></span>
            <h4>Proin sapien</h4>
            <p>Curabitur suscipit porttitor aliquam. Etiam id placerat purus. Integer sodales elit eget arcu placerat.</p>
            <a href="single.html">Read More</a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //services-->

<!-- new games -->
<div class="new-w3-agile">
    <div class="container">
        <h3>New Games</h3>
        <div class="col-md-3 new-grid-w3l view view-eighth">
            <img src="images/ng1.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-w3l view view-eighth">
            <img src="images/ng2.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-w3l view view-eighth">
            <img src="images/ng3.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-w3l view view-eighth">
            <img src="images/ng4.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-agile view view-eighth">
            <img src="images/ng5.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-agile view view-eighth">
            <img src="images/ng6.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-agile view view-eighth">
            <img src="images/ng7.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="col-md-3 new-grid-agile view view-eighth">
            <img src="images/ng8.jpg" alt=" " />
            <div class="mask">
                <a href="single.html"><h4>Click here</h4></a>
                <p>To learn more about this</p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //new games-->



<div class="services-bottom-w3-agileits">
    <div class="container">
        <div class="wthree_info">
            <section class="slider">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <div class="wthree_info_grid">
                                <h3>Duis aute dolor reprehenderit</h3>
                                <p>Excepteur sint occaecat cupidatat non proident, sunt officia.</p>
                                <a href="single.html" class="learn">Learn More</a>
                            </div>
                        </li>
                        <li>
                            <div class="wthree_info_grid">
                                <h3>Aliquip commodo consequat</h3>
                                <p>Curabitur lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                <a href="single.html" class="learn">Learn More</a>
                            </div>
                        </li>
                        <li>
                            <div class="wthree_info_grid">
                                <h3>Quis autem vel eum iure ea</h3>
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
<div class="footer">
    <div class="container">
        <div class="col-md-3 footer-left-w3">
            <h4>Contact</h4>
            <ul>
                <li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></li>
                <li><a href="mailto:example@mail.com"><h6>ex@mail.com</h6></a></li>
            </ul>
            <ul>
                <li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></li>
                <li><h6>+18045678834</h6></li>
            </ul>
            <ul>
                <li><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></li>
                <li><h6>4th Avenue,London</h6></li>
            </ul>
            <ul>
                <li><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></li>
                <li><h6>(0033)6544 5453 644</h6></li>
            </ul>
        </div>
        <div class="col-md-5 footer-middle-w3">
            <h4>Latest Games</h4>
            <div class="col-md-3 img-w3-agile">
                <a href="single.html"><img src="images/ng1.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile">
                <a href="single.html"><img src="images/ng2.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile">
                <a href="single.html"><img src="images/ng3.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile">
                <a href="single.html"><img src="images/ng4.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile footer-middle-wthree">
                <a href="single.html"><img src="images/ng5.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile footer-middle-wthree">
                <a href="single.html"><img src="images/ng6.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile footer-middle-wthree">
                <a href="single.html"><img src="images/ng7.jpg" alt=" " /></a>
            </div>
            <div class="col-md-3 img-w3-agile footer-middle-wthree">
                <a href="single.html"><img src="images/ng8.jpg" alt=" " /></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-4 footer-right-w3">
            <a href="index.html"><h4>Games <img src="images/f1.png" alt=" " /> Zone</h4></a>
            <p>Donec lobortis diam eu auctor porta. Phasellus in elementum tortor, sit amet imperdiet urna pellentesque non risus porta.</p>
            <p class="agileinfo">Suspendisse convallis malesuada libero, non rutrum arcu pellentesque lacinia.</p>
        </div>
        <div class="clearfix"></div>
        <div class="copyright">
            <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
        </div>
    </div>
</div>

<!-- //footer -->
</body>
</html>
