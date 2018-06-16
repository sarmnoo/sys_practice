<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/4/12
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>learn</title>
    <meta name="keywords" content="ddning's博客" />
    <meta name="description" content="practice" />
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/learn.css" rel="stylesheet">

    <script src="<%=request.getContextPath()%>/js/modernizr.js"></script>

    <script src="<%=request.getContextPath()%>/js/scrollReveal.js"></script>
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
        <h2 class="ctitle"><b>学无止境</b> <span>不要轻易放弃。学习成长的路上，我们长路漫漫，只因学无止境。</span></h2>
        <div class="rnav">
            <ul>
                <li><a href="/jstt/bj/">心得笔记</a></li>
                <li><a href="http://www.ip3q.com/">IP查询</a></li>
                <li><a href="/jstt/css3/">CSS3|Html5</a></li>
                <li><a href="/jstt/web/">网站建设</a></li>
                <li><a href="/news/jsex/">JS经典实例</a></li>
                <li><a href="/jstt/t/">推荐工具</a></li>
            </ul>
        </div>
        <ul class="cbp_tmtimeline">
            <li>
                <time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>
                <div class="cbp_tmicon"></div>
                <div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >
                    <h2>三步实现滚动条触动css动画效果</h2>
                    <p><span class="blogpic"><a href="/"><img src="images/t03.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>
                    <a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>
            </li>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel"data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t02.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t01.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t03.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t02.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t01.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<time class="cbp_tmtime" ><span>08-08</span> <span>2017</span></time>--%>
                <%--<div class="cbp_tmicon"></div>--%>
                <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s" >--%>
                    <%--<h2>三步实现滚动条触动css动画效果</h2>--%>
                    <%--<p><span class="blogpic"><a href="/"><img src="images/t03.jpg"></a></span>现在很多网站都有这种效果，我就整理了一下，分享出来。利用滚动条来实现动画效果，ScrollReveal.js 用于创建和管理元素进入可视区域时的动画效果，帮助你的网站增加吸引力...</p>--%>
                    <%--<a href="/" target="_blank" class="readmore">阅读全文&gt;&gt;</a> </div>--%>
            <%--</li>--%>
        </ul>
        <div class="page"><a title="Total record"><b>107</b> </a><b>1</b><a href="/news/index_2.html">2</a><a href="/news/index_3.html">3</a><a href="/news/index_4.html">4</a><a href="/news/index_5.html">5</a><a href="/news/index_2.html">&gt;</a><a href="/news/index_5.html">&gt;&gt;</a></div>
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

