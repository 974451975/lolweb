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
    <meta name="description" content=""/>

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
                    <a href="index.html"><img src="images/logo.jpg" alt=" " style="height: 60px; width:167px;"/></a>
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

    var canName=false;
    var canPwd=false;
    var canEmail=false;
    var canPwd2=false;

    var random;

    function checkAll() {
        // if(canName==true&&canPwd2==true&&canPwd==true&&canEmail==true){
        //     alert("注册成功")
        // }
    }


    function checkName(op) {

        if (op == null || op == "") {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×用户名不能为空</font>");
            return false;
        } else if (op.length < 6) {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×用户名长度不能小于6位</font>");
            return false;
        } else {
            $.get("usercontroller/checkNameIsRegister.do", {user_name: op}, function (data) {
                if (data == 1) {
                    //可以注册
                    canName=true;
                        $("#checkall").html("");
                        canName=true;
                        return true;
                } else {
                    //不能注册
                    $("#checkall").html("<font color='red'>×用户名已被注册</font>");
                    return false;
                }
            });
        }
    }


    // function checkTel(op) {
    //
    //     var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    //     if (op == null || op.op == "") {
    //         $("#checkall").html("<font  style='color: red;margin: 10px;'>×手机不能为空</font>");
    //     } else if (reg.test(op)) {
    //         $.get("usercontroller/checkTelIsRegister.do", {key: op}, function (data) {
    //             if (data == 1) {
    //                 //手机验证码
    //
    //                 canTel=true;
    //                 if(canName||canPwd||canPwd2){
    //                     $("#checkall").html("");
    //                     return true;
    //                 }
    //
    //
    //             } else {
    //                 $("#checkall").html("<font color='red'>×手机已被注册</font>");
    //                 return false;
    //             }
    //         });
    //
    //     } else {
    //         //不能注册
    //         $("#checkall").html("<font color='red'>×手机格式错误注册</font>");
    //         return false;
    //     }
    //
    //
    // }

    function checkPwd(op) {
        var op2=document.getElementById("checkpwd").value;
        if (op == null || op == "") {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码不能为空</font>");
            return false;
        } else if (op.length < 6) {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码长度不能小于6位</font>");
            return false;
        } else {
            //可以注册
            if (op == op2) {

                if (canName) {
                    $("#checkall").html("");
                    canPwd = true;
                    return true;
                }
            } else {
                $("#checkall").html("<font  style='color: red;margin: 10px;'>×确认密码错误</font>");
                return false;
            }
        }
    }

    function checkCheckpwd(op) {

        var pwd = document.getElementById("pwd").value;
        var op = document.getElementById("checkpwd").value;
        if (op == pwd) {
            //可以注册
            $("#checkall").html("");
            canPwd2=true;
            return true;
        } else {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×密码错误</font>");
            return false;
        }
    }


    function previewFile(){
        var preview = document.getElementById("logo");
        var file  = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();
        reader.onloadend = function () {
            preview.src = reader.result;
        }
        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }


    function sendEmail(){
        var email=document.getElementById("user_email").value;
        random=Math.ceil(Math.random()*1000000)
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if (email == null || email == "") {
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×邮箱不能为空</font>");
        } else if (reg.test(email)) {
            $.get("mailcontroller/send.do", {email: email,random:random}, function (data) {
                alert("验证码发送成功");
            });

        } else {
            //不能注册
            $("#checkall").html("<font color='red'>×邮箱格式错误注册</font>");
            return false;
        }
    }


    function checkEmailRandom(op){
        if (op==null||op==""){
            $("#checkall").html("<font  style='color: red;margin: 10px;'>×邮箱验证码不能为空</font>");
        }else{
            if(op==random){
                $("#checkall").html("");
                canEmail=true;
                return true;
            }else{
                $("#checkall").html("<font  style='color: red;margin: 10px;'>×邮箱验证码错误</font>");
            }
        }
    }
</script>



<!--hero header-->
<section class="py-5">
    <div class="container">
        <div class="row">

            <form action="usercontroller/register.do" method="post" enctype="multipart/form-data">

                <div style="margin-top: 20px;">

                    <div style="width: 300px;height: 500px; background-color: rgba(0,0,0,0.5);float: left;margin-left: 150px;margin-right: 80px; border-radius: 5%;">
                        <img id="logo"  style="width: 280px;height: 280px; background-color: rgba(0,0,0,0.4);border-radius: 10%;margin:4% 10px; border: 1px black solid">
                        <input type="file" name="mylogo"  value="上传头像" style="margin: 12% 10% ;width: 80%;" class="btn btn-success" onchange="previewFile()"/>

                        <div>
                            <input type="radio" style="width: 20px; height: 20px;margin-left: 65px" name="sex" value="男" checked><img src="images/男孩.jpg" style="width: 40px; height: 40px;">
                            <input type="radio" style="width: 20px; height: 20px;margin-left: 50px" name="sex" value="女"><img src="images/女孩.jpg" style="width: 40px; height: 40px">
                        </div>

                    </div>




                    <div class="card"
                         style="width: 450px; height: 500px; background-color: rgba(0,0,0,0.4); border: 0px;">

                        <div class="card-body py-md-4">
                            <h2></h2>
                            <h3 style="color: white;">Join us</h3>

                            <div class="form-group">
                                <input type="text" class="form-control" name="user_name" placeholder="用户名"
                                       onblur="checkName(this.value)"/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="user_email" class="form-control" name="user_email" placeholder="邮箱"/>
                            </div>

                            <div class="form-group">
                                <input type="text"  class="form-control" name="user_checktel" placeholder="邮箱验证码"
                                       style="width: 200px; float:left ; margin-right:50px ;" onblur="checkEmailRandom(this.value)">
                                <input type="button" value="发送验证码" class="btn" style="background-color: #2AABD2;" onclick="sendEmail()"/>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control" name="user_pwd" id="pwd" placeholder="密码"
                                       onblur="checkPwd(this.value)"/>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="checkpwd" id="checkpwd" placeholder="确认密码"
                                       onblur="checkCheckpwd(this.value)"/>
                            </div>
                            <div class="d-flex flex-row align-items-center justify-content-between">

                                <a href="index.jsp" style="color:#FFFFFF;">已有账号去登录</a>
                                <div id="checkall"></div>
                                <input type="submit" value="立即注册" class="btn btn-success"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!--footer-->
<footer>

</footer>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.js"></script>
<%--<script src="js/jquery-3.3.1.min.js"></script>--%>
<script src="js/feather.min.js"></script>
<script src="js/scripts.js"></script>
</body>

</html>