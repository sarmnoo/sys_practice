<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/4/11
  Time: 9:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>留言板</title>
    <meta name="keywords" content="ddning's博客" />
    <meta name="description" content="practice" />
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/book.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>

    <script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
    <script src="<%=request.getContextPath()%>/js/scrollReveal.js"></script>
    <script>

    </script>
</head>
<body>
<header>
    <div class="logo" data-scroll-reveal="enter right over 1s"><a href=""><img src="<%=request.getContextPath()%>/images/logo.png"></a></div>
    <nav class="topnav" data-scroll-reveal="enter bottom over 1s after 1s">
        <a href="<%=request.getContextPath()%>/blog/getBlogs.do"><span>首页</span><span class="en">Home</span></a>
        <a href="<%=request.getContextPath()%>/blog/resume.do"><span>关于我</span><span class="en">About</span></a>
        <a href="<%=request.getContextPath()%>/blog/life.do"><span>慢生活</span><span class="en">Life</span></a>
        <a href="<%=request.getContextPath()%>/blog/talk.do"><span>碎言碎语</span><span class="en">Doing</span></a>
        <a href="<%=request.getContextPath()%>/blog/modelShare.do"><span>模板分享</span><span class="en">Share</span></a>
        <a href="<%=request.getContextPath()%>/blog/learn.do"><span>学无止境</span><span class="en">Learn</span></a>
        <a href="<%=request.getContextPath()%>/blog/message.do"><span>留言</span><span class="en">Saying</span></a></nav>
</header>
<article>
    <div class="container">
        <h2 class="ctitle"><b>留言板</b> <span>你，生命中最重要的过客，之所以是过客，因为你未曾为我停留。</span></h2>
        <div class="gbook">
            <div class="about">
                <div id="fountainG">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </div>
                <div class="about_girl"><span><a href="/"><img src="images/girl.jpg"></a></span>
                    <p>当您驻足停留过，从此便注定我们的缘分。站在时间的尽头，我们已是朋友，前端的路上我再也不用一个人独自行走。</p>
                </div>
            </div>
        </div>
    </div>
    </aside>
</article>
<footer> Design by DanceSmile <a href="/">蜀ICP备11002373号-1</a> </footer>
<script>
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
        (function(){
            window.scrollReveal = new scrollReveal({reset: true});
        })();
    };
</script>
</body>
</html>
