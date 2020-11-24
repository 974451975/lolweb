<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<html lang="en">

<head>
    <!-- META TAGS -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>发表帖子</title>

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

    <link rel='stylesheet' id='main-css-css'  href='${applicationScope.basePath}css/main5152.css?ver=1.0' type='text/css' media='all' />



    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>



    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
    <!-- 富文本编辑器配置文件 -->
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <!-- 读取富文本编辑器配置的函数脚本 -->
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js">
    </script>
    <!-- 支持中文编码 -->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>

</head>

<body>
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
                    <li class="hover-effect"><a href="addforum.jsp" >去 发 帖</a></li>
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
    function gotoreg() {
        window.location.href="register.jsp";
    }

</script>
<!--以上代码为模态框-->
<%--分割--%>



<div style="height:30px;"></div>

<div align="center">
    <div style="width: 80%;">
        <!--楼主发帖层-->
        <hr style="clear: both;" />
        </li>

        </ul>

        <!--回帖区-->
        <div style="">

            <div class="rj_content" align="center">
                <form action="forumcontroller/addForum.do?userid=${sessionScope.loginuser.user_id}" method="post" enctype="multipart/form-data">
                    <div style="margin: 20px">
                        <span>贴子标题:</span><input type="text" name="forum_title">
                    </div>
                    <script id="editor" name="forum_text" type="text/plain" style="width:90%;height:300px;"></script>
                    <script type="text/javascript">
                        var ue = UE.getEditor('editor', {
                            toolbars: [
                                [
                                    'undo', //撤销
                                    'bold', //加粗
                                    'fontfamily',
                                    'fontsize'
                                ]
                            ]
                        });
                    </script>
                    <br>
                    <input type="submit" value="发表"> <br>
                </form>

            </div>
        </div>

    </div>
</div>

</body>

</html>