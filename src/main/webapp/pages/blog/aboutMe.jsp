<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/2/27
  Time: 下午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ddning's resume</title>
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/about.css" rel="stylesheet">
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
        <div class="banner">
            <p data-scroll-reveal="enter top over 2s">我们不停的翻弄着回忆，却再也找不回那时的自己</p>
            <p data-scroll-reveal="enter left over 2s after 1s">人生，是一场盛大的遇见。若你懂得，就请珍惜。</p>
            <p data-scroll-reveal="enter bottom over 2s after 2s">无论下多久的雨，最后都会有彩虹；无论你多么悲伤，要相信幸福在前方等候.</p>
        </div>
        <div class="memorial_day">
            <div class="time_axis"></div>
            <ul>
                <li class="n1"><a href="/">高中-运城中学</a>
                    <div class="dateview">2008</div>
                </li>
                <li class="n2"><a href="/">哈工大-本科</a>
                    <div class="dateview">2011-09-01</div>
                </li>
                <li class="n3"><a href="/">哈工大SCIR-作文生成</a>
                    <div class="dateview">2014-09-01</div>
                </li>
                <li class="n4"><a href="/">研究生入学</a>
                    <div class="dateview">2015-09-01</div>
                </li>
                <li class="n5"><a href="/">中电十五所-开发岗</a>
                    <div class="dateview">2017-07-08</div>
                </li>
            </ul>
        </div>
        <div class="about left">
            <h2>Just about me</h2>
            <ul>
                <p>宁丹丹，女</p>
                <%--<p>--%>
                    <%--人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多。生活的压力迫使我放弃了轻松的前台接待，放弃了体面的编辑，换来虽有些蓬头垢面的工作，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用Photoshop、Flash、Dreamweaver、ASP、PHP、JSP...中激发了兴趣，然后越走越远....</p>--%>
                <%--<p>在这条路上，我要感谢三个人，第一个是我从事编辑的老板，是他给了我充分学习研究div的时间，第二个人是我的老师，如果不是街上的一次偶遇，如果不是因为我正缺钱，我不会去强迫自己做不会的事情，但是金钱的诱惑实在是抵挡不了，于是我选择了“接招”，东拼西凑的把一个网站做好了，当时还堪称佳作的网站至今已尘归尘土归土了。第三个人，我总说他是我的伯乐，因为我当初应聘技术员的时候，我说我什么都不会，但是他却给了我机会，而我就牢牢的把握了那次机会，直到现在如果不是我主动把域名和空间转出来，我会一直霸占着公司资源，免费下去（可我就偏偏不是喜欢爱占便宜的人，总感觉欠了就得还）...</p>--%>
                <%--<p>--%>
                    <%--还要特别感谢一个人，是我的老公。他是我的百科，我不会的，他会，最后我还是不会。博客能做到今天这样，一半都有他的功劳。他不仅仅支持我的事业作为我有力的经济后盾，还毫无怨言的包容我所有工作、生活当中有理无理的坏脾气，曾经我是多么有自己原则的一个人，但是遇到他，打破了我自己毕生坚持的原则，喜欢一句话“冥冥中该来则来，无处可逃”。--%>
                <%--</p>--%>
            </ul>
            <h2>About my blog</h2>
            <p>域  名 创建于2017年09月01日 </p>
            <p>服务器:</p>
            <p>程  序：java</p>


        </div>
    </div>
    </aside>
</article>
<footer> Design by ddning <a href="/">蜀ICP备11002373号-1</a> </footer>
<script>
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
        (function(){
            window.scrollReveal = new scrollReveal({reset: true});
        })();
    };
</script>

</body>
</html>
