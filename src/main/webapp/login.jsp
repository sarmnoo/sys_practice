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
</head>

<style>
    body{
        margin-left:auto;
        margin-right:auto;
        margin-TOP:100PX;
        width:20em;
         background-color: #fdc;
        <%--background:#fff url(<%=request.getContextPath()%>/image/back.gif);--%>
        /*background-size:100%;*/
    }
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script>
    function check() {
//        var userName = document.getElementsByName("userName");
        var password = $("#passWord").val();
        if(password.length <= 3){
            alert("lll");
            return false;
        }

        return $("#loginForm").submit();
    }
</script>
<body>
<form id="loginForm" action="<%=request.getContextPath()%>/login/loginUser.do" method="post" onsubmit="return check()">
<div class="input-group">
    <span class="input-group-addon" id="basic-addon1">@</span>
    <input name="userName" type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
</div>
<br>
<!--下面是密码输入框-->
<div class="input-group">
    <span class="input-group-addon" id="basic-addon2">@</span>
    <input id="passWord" name="passWord" type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1">
</div>
<br>
<!--下面是登陆按钮,包括颜色控制-->
<button type="submit" style="width:320px" class="btn btn-login">注 册</button>
</form>
</body>
</html>