<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/4/12
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>share</title>
    <meta name="keywords" content="ddning's博客" />
    <meta name="description" content="practice" />
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/share.css" rel="stylesheet">

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
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
        <h2 class="ctitle"><b>模板分享</b> <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span></h2>
        <div class="blog" data-scroll-reveal="enter top" >
            <figure>
                <ul>
                    <a href="/"><img src="<%=request.getContextPath()%>/images/t01.jpg"><span>下载个人博客模板</span></a>
                </ul>
                <p><a href="/">灯具公司复古风格PSD设计稿</a></p>
                <figcaption>此模板为PSD设计稿，复古风格。首页主要突出产品，以及公司简介。手绘灯作为头部背景图片，这个比较特别。html可以做出灯一闪一闪的效果，或者说旁边有个按钮...</figcaption>
            </figure>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t02.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">个人博客模板古典系列之――江南墨..</a></p>--%>
                <%--<figcaption>一共是四个页面，首页，图文列表，图片列表，文字内容。此模板风格为中国古典风格，山水画墨迹成就一幅江南墨卷。页面首页设计较为简单，突出文章重点。图文列表显示...</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t03.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">美丽的茧</a></p>--%>
                <%--<figcaption>让世界拥有它的脚步，让我保有我的茧。当溃烂已极的心灵再不想做一丝一毫的思索时，就让我静静回到我的茧内，以回忆为睡榻，以悲哀为覆被，这是我唯一的美丽。</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t01.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">灯具公司复古风格PSD设计稿</a></p>--%>
                <%--<figcaption>此模板为PSD设计稿，复古风格。首页主要突出产品，以及公司简介。手绘灯作为头部背景图片，这个比较特别。html可以做出灯一闪一闪的效果，或者说旁边有个按钮...</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t02.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">个人博客模板古典系列之――江南墨..</a></p>--%>
                <%--<figcaption>一共是四个页面，首页，图文列表，图片列表，文字内容。此模板风格为中国古典风格，山水画墨迹成就一幅江南墨卷。页面首页设计较为简单，突出文章重点。图文列表显示...</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t03.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">美丽的茧</a></p>--%>
                <%--<figcaption>让世界拥有它的脚步，让我保有我的茧。当溃烂已极的心灵再不想做一丝一毫的思索时，就让我静静回到我的茧内，以回忆为睡榻，以悲哀为覆被，这是我唯一的美丽。</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t01.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">灯具公司复古风格PSD设计稿</a></p>--%>
                <%--<figcaption>此模板为PSD设计稿，复古风格。首页主要突出产品，以及公司简介。手绘灯作为头部背景图片，这个比较特别。html可以做出灯一闪一闪的效果，或者说旁边有个按钮...</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t02.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">个人博客模板古典系列之――江南墨..</a></p>--%>
                <%--<figcaption>一共是四个页面，首页，图文列表，图片列表，文字内容。此模板风格为中国古典风格，山水画墨迹成就一幅江南墨卷。页面首页设计较为简单，突出文章重点。图文列表显示...</figcaption>--%>
            <%--</figure>--%>
            <%--<figure>--%>
                <%--<ul>--%>
                    <%--<a href="/"><img src="images/t03.jpg"><span>下载个人博客模板</span></a>--%>
                <%--</ul>--%>
                <%--<p><a href="/">美丽的茧</a></p>--%>
                <%--<figcaption>让世界拥有它的脚步，让我保有我的茧。当溃烂已极的心灵再不想做一丝一毫的思索时，就让我静静回到我的茧内，以回忆为睡榻，以悲哀为覆被，这是我唯一的美丽。</figcaption>--%>
            <%--</figure>--%>
        </div>
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

