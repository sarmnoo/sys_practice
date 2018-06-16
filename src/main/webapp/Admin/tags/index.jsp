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

<rapid:override name="title">
    - 标签列表
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
        }
        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a><cite>标签列表</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form"  method="post" id="myForm" action="<%=request.getContextPath()%>/admin/tag/addTag">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>添加标签</strong>
                    </div>
                    <div class="layui-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input id="tagName" type="text" name="name" placeholder="请输入标签名称" autocomplete="off" class="layui-input" required>
                        <input type="hidden" id="id" name="id">
                        <input name="mode" id="mode" type="hidden" value="add">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        标签描述
                        <input id="tagDescription" type="text" name="description" placeholder="请输入标签描述" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button id="addButton"class="layui-btn" lay-filter="formDemo" type="submit">添加</button>
                        <button id="saveButton" style="display:none" class="layui-btn" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>
            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>1、标签名必选，建议不要太长</li>
                    <li>2、标签名勿重复</li>
                </ul>
            </blockquote>
        </div>
        <div class="layui-col-md8" style="border: 1px solid #FF5722;">

            <table class="layui-table" id="tagList">
                <colgroup>
                    <col width="200">
                    <col width="80">
                    <col width="70">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>文章数</th>
                    <th>状态</th>
                    <th>操作</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>如果该标签包含文章，将不可删除</li>
                </ul>
            </blockquote>
        </div>
    </div>



</rapid:override>
<rapid:override name="footer-script">
    <script>
        var form,layedit,layer,laydate;
        layui.use(['form','layedit','layer','laydate'],function(){
            form = layui.form;
            layedit = layui.layedit;
            layer = layui.layer;
            laydate = layui.laydate;

            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
        $(function(){
            initTagList();
        })
        
        function initTagList() {
            var strs = "";
            var status ="显示";

            $.ajax({
                url:"<%=request.getContextPath()%>/admin/tag/getTagList",
                type:"POST",
                success:function (data) {
                    for(var i = 0; i < data.length; i++){
                        var operation = '<a href="javascript:void(0);" onclick="javascript:editTag(\''+data[i].id+'\')" class="layui-btn layui-btn-mini">编辑</a>';
                        if(data[i].status == '0'){
                            status = "隐藏";
                        }
                        if(data[i].articleNum == 0){
                            operation += '<a href="javascript:void(0)" class="layui-btn layui-btn-danger layui-btn-mini" onclick="deleteTag(\''+data[i].id+'\',this)">删除</a>';
                        }
                        strs = '<tr><td><a href="" target="_blank">'+data[i].name+'</a></td>'
                             + '<td><a href="" target="_blank"  lay-data="">'+data[i].articleNum+'</a></td>'
                             + '<td>'+status+'</td>'
                             + '<td>'+operation+'</td>'
                             + '<td>'+data[i].id+'</td>';
                        $("#tagList").append(strs);
                    }

                }
            })
        }

        function editTag(tagId){
            $.ajax({
                url:'<%=request.getContextPath()%>/admin/tag/getTagById',
                data:{"tagId":tagId},
                type:"POST",
                success:function (data) {
                    if(data){
                        console.log(data[0].name);
                        console.log(data[0].description);
                        $("#tagName").val(data[0].name);
                        $("#tagDescription").val(data[0].description);

                        $(".layui-col-md4").attr("style","border: 1px solid #FF5722;");
                        $(".layui-col-md8").attr("style","");
                        $("#saveButton").attr("style","display:block");
                        $("#addButton").attr("style","display:none");
                        $("#id").val(data[0].id);
                        $("#mode").val("edit");
                    }
                }
            })
        }

        function deleteTag(tagId,obj){
            $.ajax({
                url:"<%=request.getContextPath()%>/admin/tag/deleteTag.do?",
                data:{id:tagId},
                type:"POST",
                success:function (data) {
                    if(data){
                        $(obj).parent().parent().remove();
                    }
                }
            })
        }
    </script>
</rapid:override>

<%@ include file="/Admin/Public/framework.jsp"%>
