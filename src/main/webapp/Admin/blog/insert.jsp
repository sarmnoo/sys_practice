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


<rapid:override name="title">-新建文章</rapid:override>
<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/article">文章列表</a>
              <a><cite>添加文章</cite></a>
        </span>
    </blockquote>
    <form class="layui-form" action="<%=request.getContextPath()%>/admin/blog/addBlog">
        <div class="layui-form-item">
            <label class="layui-form-label">标题<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <textarea name="content" id="content" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">分类<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline" >
                <select name="categoryPid" lay-verify="required" id="categoryPid" lay-filter="categoryPid">
                    <option value="">一级分类</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="categoryId" lay-verify="required" id="categoryChild">
                    <option value="">二级分类</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" name="tagId">标签</label>
            <div class="layui-input-block" id="tags">
                <input type="checkbox" lay-skin="primary" title="java">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">复选框</label>
            <div class="layui-input-block">
                <input type="radio" name="flag" value="" title="发布" checked>
                <input type="radio" name="flag" value="" title="草稿">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <%--<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>--%>
                <button class="layui-btn" id="addButton" type="submit" lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</rapid:override>
<rapid:override name="footer-script">
    <script>
        var form,layedit,layer,laydate;
        layui.use(['form','layedit','layer','laydate'], function(){
            form = layui.form;
            layedit = layui.layedit;
            layer = layui.layer;
            laydate = layui.laydate;

            layedit.set({
                uploadImage: {
                    url: '<%=request.getContextPath()%>/admin/blog/uploadImg.do' //接口url
                    ,type: 'POST' //默认post
                }
            });

            layedit.build('content',{
                height:350,
                tool: [
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线
                    ,'|' //分割线
                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'link' //超链接
                    ,'unlink' //清除链接
                    ,'face' //表情
                    ,'image' //插入图片
                    ,'help' //帮助
                ]
            }); //建立编辑器

            getTags();
            getSuperCategory();
            form.on("select(categoryPid)",function () {
                var pid = $("#categoryPid").val();
                $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath()%>/admin/category/getChildCategoryList.do",
                    //async:false,
                    data:{"pid":pid},
                    success:function(data){
                        var list = document.getElementById("categoryChild");
                        for(var i = 0;  i < data.length; i++){
                            var option = document.createElement('option');
                            list.appendChild(option);
                            option.value = data[i].id;
                            option.text = data[i].name;
                            form.render();
                        }
                    }
                })

            })

            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });


        function getSuperCategory(){
            $.ajax({
                type:"POST",
                url:"<%=request.getContextPath()%>/admin/category/getSuperCategoryList.do",
                //async:false,
                success:function(data){
                    var list = document.getElementById("categoryPid");
                    for(var i = 0;  i < data.length; i++){
                        var option = document.createElement('option');
                        list.appendChild(option);
                        option.value = data[i].id;
                        option.text = data[i].name;
                        form.render();
                    }
                }
            })
        }

        function getTags() {
            var strs = "";
            $.ajax({
                url:"<%=request.getContextPath()%>/admin/tag/getTagList.do",
                type:"POST",
                success:function(data){
                    for(var i = 0; i < data.length; i++){
                        strs +="<input type=\"checkbox\" lay-skin=\"primary\" title=\""+data[i].name+"\">";
                    }
                    $("#tags").html(strs);
                }
            })

        }
    </script>
</rapid:override>

<%@ include file="/Admin/Public/framework.jsp"%>

