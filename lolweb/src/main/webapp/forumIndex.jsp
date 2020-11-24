<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort() + request.getContextPath() + "/";
%>
<html lang="en">
<head>
    <title>story</title>
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

    <link rel='stylesheet' id='main-css-css'  href='${applicationScope.basePath}css/main5152.css?ver=1.0' type='text/css' media='all' />



    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,100,100italic,300,300italic,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="${applicationScope.basePath}js/jquery.min.js"></script>
    <script src="${applicationScope.basePath}js/bootstrap.js"></script>



    <script type="text/javascript" src="${applicationScope.basePath}js/jquery.flexisel.js"></script>

<%--    <script>--%>
<%--        $(document).ready(function(){--%>

<%--            $.getJSON("forumcontroller/queryAllForum.do",function(data){--%>
<%--                if(data!=null){--%>
<%--                    var str="";--%>
<%--                    for(var i=0;i<data.length;i++){--%>
<%--                        str=str+"<li class='article-entry standard' style='clear: both;padding-bottom: 20px;'>" +--%>
<%--                            "<div style='font-size:16px;'>"+data[i].forum_title+"</div>" +--%>
<%--                            "<div style='float: right; margin-right: 10%;'><div class='article-meta' >" + data[i].forum_time+"<a href='#'>"+--%>
<%--                            "发帖人:"+data[i].forum_user+"</a></div>"+--%>
<%--                            "<div class='like-count'>" + data[i].forum_browse +"</div>"+--%>
<%--                            "</div></li>";--%>

<%--                    }--%>
<%--                    $("#showForum").html(str);--%>

<%--                }--%>

<%--            });--%>


<%--        });--%>


    <%--  </script> --%>
    </head>


    <body style="background: url(../images/论坛背景.jpg); background-size: 100%;">
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
                    <div ><a  href="index.jsp"><img src="../images/logo.jpg" alt=" " style="height: 60px; width:167px;" /></a></div>
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
                        <li class="hover-effect"><a href="../addforum.jsp" >去 发 帖</a></li>
                        <li style="padding-right: 0px"><img id="head"  src= ../upload/${sessionScope.loginuser.user_img};  style="height:45px; width:45px; border-radius:100%;background-size:100% 100%;" ></li>
                        <li class="hover-effect" style="padding-left: 0px;padding-right: 0px"><a href="../updateuser.jsp"> ${sessionScope.loginuser.user_name}  &nbsp;&nbsp;欢迎您&nbsp;</a></li>
                        <li class="hover-effect" style="padding-left: 0px"><a  href="../usercontroller/logout.do;" >退 出</a></li>
                    </ul>
                </div>
                </c:if>

        </nav>
    </div>

    <!--以下代码为模态框-->
    <form action="http://localhost:8080/lol/usercontroller/login.do">
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

                        <button style="float: left;margin-left: 30px;"class="btn btn-success" onclick="gotoreg()" type="button"><a href="../register.jsp">注册</a></button>
                        <a href="#">忘记密码</a>
                        <button type="submit" class="btn btn-primary " style="margin-left: 40%">登录</button>

                    </div>
                </div>
            </div>
        </div>
    </form>




    <!-- Start of Search Wrapper -->
    <div class="" style="height: 200px; width: 100%; margin-bottom: 20px;" >
        <div class="search-area container">
            <h3 class="search-header">交流论坛</h3>
            <form id="search-form" class="search-form clearfix"  action="queryForumByKey.do?">
                <input class="search-term required" type="text" id="s" name="hkey" placeholder="想搜索的帖子关键字" style="height: 50px; border: 2px solid #927345;" />
                <input type="hidden" name="page" value="1" >
                <div><input class="search-btn" type="submit" value="Search" style="margin-top: 20px;width: 200px;border: 2px solid #927345; background: rgba(0,0,0,.4);"/></div>
                <div id="search-error-container"></div>
            </form>
        </div>
    </div>
    <!-- End of Search Wrapper -->

    <!-- Start of Page Container -->
    <div class="page-container" style="margin-top: 50px">
        <div class="container" style="width: 80%; background-color: rgba(255,255,255,.8); border: 1px solid #927345;border-radius: 1%;">
            <div>

                <!-- start of page content -->
                <div class="">

                    <!-- Basic Home Page Template -->
                    <div class="" >
                        <div class="span4 articles-list" style="width: 84%;margin: auto 8%;" >
                            <h3 align="center" style="margin-bottom: 30px;">精彩帖子</h3>
                            <ul class="articles" id="showForum">
                                <c:if test="${empty requestScope.forumlist}">
                                    <li><div>未找到搜索结果</div></li>
                                </c:if>
                                <c:if test="${not empty requestScope.forumlist}">
                                <c:forEach  items="${requestScope.forumlist}" var="forumlist" >
                              <li class="article-entry standard" style="clear: both;padding-bottom: 20px;">

                                  <div style="font-size:18px;"><a href="queryForumById.do?forumid=${forumlist.forum_id}&userid=${sessionScope.loginuser.user_id}" style="color:black;font-family: 微软雅黑">${forumlist.forum_title}</a></div>
                                <div style="float: right; margin-right: 10%;"><div class="article-meta" >${forumlist.forum_time} <a href="#" title="View all posts in Server &amp; Database">发帖人: ${forumlist.user_name}</a></div>
                                    <div class="like-count" style="">浏览数${forumlist.forum_browse}</div>
                               </div>
                                  </a>
                           </li>
                                </c:forEach>
                                    <div align="center" style="clear: both">
                                        <pt:page url="queryAllForumByPage.do?" pageIndex="${requestScope.page}" pageMax="${requestScope.maxpage}"/>
                                    </div>
                                </c:if>

<%--                            <li class="article-entry standard" style="clear: both;padding-bottom: 20px;">--%>
<%--                                <div style="font-size:16px;">【大话新闻】177期：明凯想做王者教练，May</div>--%>
<%--                                <div style="float: right; margin-right: 10%;"><div class="article-meta" >2020/11/12 <a href="#" title="View all posts in Server &amp; Database">发帖人: Database</a></div>--%>
<%--                                    <div class="like-count" style="">66</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="article-entry standard" style="clear: both;padding-bottom: 20px;">--%>
<%--                                <div style="font-size:16px;">【皮埃斯公馆】AD之间的较量，求求队友别选</div>--%>
<%--                                <div style="float: right; margin-right: 10%;"><div class="article-meta" >2020/11/12 <a href="#" title="View all posts in Server &amp; Database">发帖人: Database</a></div>--%>
<%--                                    <div class="like-count" style="">66</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="article-entry standard" style="clear: both;padding-bottom: 20px;">--%>
<%--                                <div style="font-size:16px;">【每周一辩】你是信号信号党还是语音党呢？</div>--%>
<%--                                <div style="float: right; margin-right: 10%;"><div class="article-meta" >2020/11/12 <a href="#" title="View all posts in Server &amp; Database">发帖人: Database</a></div>--%>
<%--                                    <div class="like-count" style="">66</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="article-entry standard" style="clear: both;padding-bottom: 20px;">--%>
<%--                                <div style="font-size:16px;">【皮埃斯公馆】AD之间的较量，求求队友别选</div>--%>
<%--                                <div style="float: right; margin-right: 10%;"><div class="article-meta" >2020/11/12 <a href="#" title="View all posts in Server &amp; Database">发帖人: Database</a></div>--%>
<%--                                    <div class="like-count" style="">66</div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

                        </ul>
                    </div>



                </div>
            </div>
            <!-- end of page content -->


        </div>
    </div>
</div>
</body>

</html>