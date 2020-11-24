<%--
  Created by IntelliJ IDEA.
  User: C
  Date: 2020/11/3
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>注册</title>
    <meta name="description" content="" />

    <!--Google font-->
    <link href="https://fonts.googleapis.com/css?family=K2D:300,400,500,700,800" rel="stylesheet">

    <!-- Bootstrap CSS / Color Scheme -->
    <link rel="stylesheet" href="css/bootstrap1.css">
</head>

<body background="images/reg.jpg">

<!--navigation-->
<section class="bh-white py-3">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center" style="margin-top: 100px;">
                <div>
                    <a href="index.html"><img src="images/logo.jpg" alt=" " style="height: 60px; width:167px;" /></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!--
作者：戴哥哥
时间：2020-11-03
描述：注册验证
-->
<script>

    function checkAll(){
        // if(){
        //
        // }
    }



    function checkName(op) {
        alert("1");
        $.get("usercontroller/checkNameIsRegister.do", {key: op}, function(data) {

            if(data == 1) {

                if(op == null || op.equals("")) {
                    $("#checkall").html("<font  style='color: red;margin: 10px;'>×用户名不能为空</font>");
                    return false;
                } else if(op.length < 6) {
                    $("#checkall").html("<font  style='color: red;margin: 10px;'>×用户名长度不能小于6位</font>");
                    return false;
                } else {
                    //可以注册
                    $("#checkall").html("");
                    return true;
                }
            }else {
                //不能注册
                $("#checkall").html("<font color='red'>×用户名已被注册</font>");
                return false;
            }
        });

    }

    //不完善
    function checkTel(op) {

        //				var reg=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
        //				$.get("usercontroller/checkTelIsRegister.do", {key: op}, function(data) {
        //						if(data == 1) {
        //							if(op == null || op.equals("")) {
        //								$("#checkall").html("<font  style='color: red;margin: 10px;'>×手机不能为空</font>");
        //								return false;
        //							} else if(reg.test(op)) {
        //								$("#checkall").html("<font  style='color: red;margin: 10px;'>×手机格式不正确</font>");
        //								return false;
        //							} else {
        //								//手机验证码
        //
        //								//可以注册
        //								$("#checkall").html("");
        //								return true;
        //							} else {
        //								//不能注册
        //								$("#checkall").html("<font color='red'>×用户名已被注册</font>");
        //								return false;
        //							}
        //						}
        //					});
        //
    }

    function checkPwd(op) {

        if(op == null || op.equals("")) {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码不能为空</font>");
            return false;
        } else if(op.length < 6) {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码长度不能小于6位</font>");
            return false;
        } else {
            //可以注册
            if(checkName()){
                $("#checkall").html("");
            }
            return true;
        }
    }

    function checkCheckpwd(op){

        var pwd=document.getElementsByName("user_pwd");
        if(op == null || op.equals("")) {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码不能为空</font>");
            return false;
        }else if(op.equals(pwd)){
            //可以注册
            if(checkName()){
                if(checkPwd()){
                    $("#checkall").html("");
                }
            }
            return true;
        }
    }
</script>

<!--hero header-->
<section class="py-5">
    <div class="container">
        <div class="row">


                <div class="" style="margin-top: 20px;">

                    <div style="width: 300px;height: 500px; background-color: rgba(0,0,0,0.5);float: left;margin-left: 150px;margin-right: 80px; border-radius: 5%;">
                        <div style="width: 280px;height: 280px; background-color: rgba(0,0,0,0.4);border-radius: 10%;margin:4% auto; "></div>
                        <input type="submit" value="上传头像" style="margin: 12% 57%" class="btn btn-success" />
                    </div>

                    <div class="card" style="width: 450px; height: 500px; background-color: rgba(0,0,0,0.4); border: 0px;">

                        <div class="card-body py-md-4">
                            <h2></h2>
                            <h3 style="color: white;">Join us</h3>

                            <div class="form-group">
                                <input type="text" class="form-control" name="user_name" placeholder="用户名" onblur="checkName(this.value)"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="user_tel" placeholder="手机" onblur="checkTel(this.value)" />
                            </div>

                            <div class="form-group">
                                <input type="email" class="form-control" name="user_checktel" placeholder="手机验证码" style="width: 200px; float:left ; margin-right:50px ;" />
                                <input type="button" value="发送验证码" class="btn" style="background-color: #2AABD2;" />
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control" name="user_pwd" placeholder="密码" onblur="checkPwd(this.value)" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="checkpwd" placeholder="确认密码" onblur="checkCheckpwd(this.value)"/>
                            </div>
                            <div class="d-flex flex-row align-items-center justify-content-between">

                                <a href="index.html" style="color:#FFFFFF;">已有账号去登录</a>
                                <div id="checkall">1</div>
                                <input type="submit" value="立即注册" class="btn btn-success" />

                            </div>

        </div>
    </div>
    </div>
    </div>
    </div>
</section>

<!--footer-->
<footer>

</footer>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/feather.min.js"></script>
<script src="js/scripts.js"></script>
</body>

</html>