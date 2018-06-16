<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/2/26
  Time: 下午8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="keywords" content="ddning's博客" />
    <meta name="description" content="practice" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>

    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/modernizr.js"></script>
    <script src="<%=request.getContextPath()%>/js/scrollReveal.js"></script>

    <script>
        $(function(){

        });

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
        <div class="blog" data-scroll-reveal="enter top" >
            <c:forEach items="${excellentBlog}" var="excellent" varStatus="eIndex">
                <figure>
                    <ul>
                        <a href="/"><img src="<%=request.getContextPath()%>/images/t01.jpg"><span>查看详情</span></a>
                    </ul>
                    <p><a href="/"><c:out value="${excellent.title}"/> </a></p>
                    <figcaption><c:out value="${excellent.content}"/></figcaption>
                </figure>
            </c:forEach>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="<%=request.getContextPath()%>/images/t01.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">灯具公司复古风格PSD设计稿</a></p>--%>
                <%--<figcaption>此模板为PSD设计稿，复古风格。首页主要突出产品，以及公司简介。手绘灯作为头部背景图片，这个比较特别。html可以做出灯一闪一闪的效果，或者说旁边有个按钮...</figcaption>--%>
            <%--</figure>--%>

        </div>
        <ul class="cbp_tmtimeline" id="blogList">

            <c:forEach items="${blogList}" var="blog" varStatus="blogIndex" >
                <li>
                    <time class="cbp_tmtime"><span><c:out value="${blog.inputTime}"/> </span></time>
                    <div class="cbp_tmicon"></div>
                    <div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >
                        <h2><c:out value="${blog.title}"/></h2>
                        <p><span class="blogpic"><a href="/"><img src="<%=request.getContextPath()%>/images/t03.jpg"></a></span><c:out value="${blog.content}"/> </p>
                        <a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a>
                    </div>
                </li>
            </c:forEach>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel"data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="<%=request.getContextPath()%>/images/t02.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a>--%>
                <%--</div>--%>
            <%--</li>--%>



        </ul>
    </div>
</article>
<footer>
    Design by DanceSmile <a href="/">蜀ICP备11002373号-1</a>
</footer>
<script>
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
        (function(){
            window.scrollReveal = new scrollReveal({reset: true});
        })();
    };
</script>
</body>
</html>
