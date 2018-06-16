<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/5/6
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>



    <rapid:override name="title">-文章列表</rapid:override>
    <rapid:override name="content">
        <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/blog">文章列表</a>
        </span>
        </blockquote>

        <table id="blogList" class="layui-table">
            <colgroup>
                <col width="150">
                <col width="400">
            </colgroup>
            <thead>
            <tr>
                <th>文章日期</th>
                <th>文章标题</th>
            </tr>
            </thead>
            <tbody>
            <%--<tr>--%>
                <%--<td>贤心</td>--%>
                <%--<td>2016-11-29</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>许闲心</td>--%>
                <%--<td>2016-11-28</td>--%>
            <%--</tr>--%>
            </tbody>
        </table>
    </rapid:override>
    <rapid:override name="footer-script">
        <script>
            $(function(){
//                alert("jjj");
                initBlogList();
            })
            function initBlogList(){
                var str = "";
                $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath()%>/blog/getBlogsList.do?",
                    success:function(data){
                        for(var i = 0; i < data.length; i++){
                            str += "<tr><td>"+data[i].inputTime+"</td><td>"+data[i].title+"</td></tr>";
                        }
                        $("#blogList").append(str);
                    }
                })
            }
        </script>
    </rapid:override>

    <%@ include file="/Admin/Public/framework.jsp"%>

