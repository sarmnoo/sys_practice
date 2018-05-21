<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/1/3
  Time: 下午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <style>
        body{
            margin-left:auto;
            margin-right:auto;
            margin-TOP:100PX;
            width:20em;
            background-color: #fdc;
        <%--background:#fff url(<%=request.getContextPath()%>/images/back.gif);--%>
            /*background-size:100%;*/
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/md5.js"></script>
    <script>
        function check(){
            var password = $("#password").val();
            $("#md5-password").val(md5(password));
            var confirmPassword = $("#confirmPassword").val();
            if(!password.eq(confirmPassword)){
                $("#registerError").val("两次输入密码不一致！");
                return false;
            }
            return $("registerForm").submit();
        }
    </script>
</head>
<body>
<form id="registerForm" action="<%=request.getContextPath()%>/login/registerUser.do" method="post" onsubmit="return check()">
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">@</span>

        <input name="userName" type="text" value="${userName}"class="form-control" placeholder="用户名" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <!--下面是密码输入框-->
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon2">@</span>
        <input id="password"  type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1"/>
        <input id="md5-password" name="password" type="hidden" />
    </div>
    <br>
    <!--下面是确认密码输入框-->
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon3">@</span>
        <input id="confirmPassword"  type="password" class="form-control" placeholder="确认密码" aria-describedby="basic-addon1"/>
        <input id="md5-confirmPassword" name="confirmpassword" type="hidden" />
    </div>
    <br>
    <span id="registerError">${registerError}</span>
    <!--下面是注册按钮,包括颜色控制-->
    <button type="submit" style="width:320px" class="btn btn-login">注 册</button>
</form>
</body>
</html>