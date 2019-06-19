<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>登录页面_平安托儿所</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="css/unicorn.login.css">
    <link rel="stylesheet" href="css/mycss.login.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<div id="logo">
    <img src="img/logo.png" alt="">
</div>
<div id="loginbox">
    <form id="loginform" class="form-vertical" action="loginServlet">
        <p>&nbsp;</p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                        <span class="add-on">
                            <i class="icon-user"></i>
                        </span>
                    <input type="text" name="username" placeholder="用户名">
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                        <span class="add-on">
                            <i class="icon-lock"></i>
                        </span>
                    <input type="password" name="password" placeholder="密码">
                </div>
            </div>
        </div>
        <div class="form-actions">
                <span class="pull-left">
                    <a href="#" class="flip-link" id="to-recover">忘记密码?</a>
                </span>
            <span class="pull-right">
                    <input type="submit" class="btn" value="登录">
                </span>
        </div>
    </form>
    <div id="loginbox1">
    <form id="recoverform" action="#" class="form-vertical">
        <p ><b>密码找回</b></p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                        <span class="add-on">
                            <i class="icon-user"></i>
                        </span>
                    <input type="text" id="loginname" name="username" placeholder="用户名">
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                        <span class="add-on">
                            <i class="icon-envelope"></i>
                        </span>
                    <input type="text" id="E-mail" placeholder="E-mail address">
                </div>
            </div>
        </div>
        <div class="form-actions">
                <span class="pull-left">
                    <a href="#" class="flip-link" id="to-login">&lt; 返回登录</a>
                </span>
            <span class="pull-right">
                    <input type="submit" class="btn" id="E-send" value="发送">
                </span>
        </div>
    </form>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/unicorn.login.js"></script>
<script src="js/hc.login.js"></script>
<script>
    $(function () {
        var mes = "${message}";
        if (/用户名/.test(mes)) {
            alert(mes);
            mes="success";
        }
    })
</script>
</body>
</html>