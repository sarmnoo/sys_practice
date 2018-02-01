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
        <%--background:#fff url(<%=request.getContextPath()%>/image/back.gif);--%>
        /*background-size:100%;*/
    }
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/md5.js"></script>
<script>
    function check() {

//        var userName = $("#userName").val();
        var password = $("#password").val();
        $("#md5-password").val(md5(password));
//        var verifyCode = $("#verifyCode").val();

        <%--$.ajax({--%>
            <%--url:"<%=request.getContextPath()%>/login/checkUser.do",--%>
            <%--dataType:"json",--%>
            <%--data:{"userName":userName,"password":md5(password),"verifyCode":verifyCode},--%>
            <%--traditional:true,--%>
            <%--type:"POST",--%>
            <%--success:function (data) {--%>
                <%--alert(data);--%>
            <%--}--%>
        <%--});--%>

//        $("#md5-password").val(md5(password));
        return $("#loginForm").submit();
    }

    function changeVerify(){
        var img = $("#verifyCodeImg");
        //alert(img.attr("src"));
        img.attr("src","<%=request.getContextPath()%>/login/genVerify.do?date="+new Date());
    }

    function register(){
        var userName = $("#userName").val();
        <%--alert(userName);--%>
        <%--$.ajax({--%>
            <%--url:"<%=request.getContextPath()%>/login/goRegister.do?userName="+userName,--%>
            <%--type:"POST",--%>
            <%--success:function (data) {--%>
                <%----%>
            <%--}--%>
        <%--});--%>
        window.location.href="<%=request.getContextPath()%>/login/goRegister.do?userName="+userName;
    }
</script>
</head>
<body>
<form id="loginForm" action="<%=request.getContextPath()%>/login/checkUser.do" method="post" onsubmit="return check()">
<div class="input-group">
    <span class="input-group-addon" id="basic-addon1">@</span>
    <input id="userName" name="userName" value="${userName}" type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1"/>
</div>
<br>
<!--下面是密码输入框-->
<div class="input-group">
    <span class="input-group-addon" id="basic-addon2">@</span>
    <input id="password"  type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1"/>
    <input id="md5-password" name="password" type="hidden" />
</div>
<br>

<!--下面是验证码输入框-->
<div class="input-group">
    <span class="input-group-addon" id="basic-addon3">@</span>
    <input name="verifyCode"  type="text" class="form-control" placeholder="验证码"/>
    <img id="verifyCodeImg" src="<%=request.getContextPath()%>/login/genVerify.do"/>
    <a href="javascript:void(0);" onclick="javascript:changeVerify()" style="color:white;">看不清？</a>
</div>
<br>

<span>${loginError}</span>
<!--下面是登陆按钮,包括颜色控制-->
<button type="submit" style="width:320px" class="btn btn-login">登 陆</button>
<a href="javascript:void(0);" onclick="javascript:register()" style="color:white;">去注册</a>

</form>
</body>
</html>