<%--
  Created by IntelliJ IDEA.
  User: ddning
  Date: 2018/5/21
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>



<rapid:override name="title">-分类列表</rapid:override>
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
              <a href="<%=request.getContextPath()%>/admin/category">分类列表</a>
              <a><cite>添加分类</cite></a>
        </span>
    </blockquote>

    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form" method="post" id="addCategory" action="<%=request.getContextPath()%>/admin/category/addCategory">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>添加分类</strong>
                    </div>
                    <div class="layui-input-block">
                        名称<span style="color: #FF5722; ">*</span>
                        <input type="text" id="name" name="name" placeholder="请输入分类名称" autocomplete="off" class="layui-input" required>
                        <input type="hidden" id="id" name="id">
                        <input name="mode" id="mode" type="hidden" value="add">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        父节点<span style="color: #FF5722; ">*</span>
                        <select name="pid" class="layui-input" required id="categoryPid">
                            <option value="0">无</option>

                        </select>

                    </div>
                    <div class="layui-input-block">
                        分类描述
                        <input type="text" name="description" id="description" placeholder="请输入分类描述" autocomplete="off" class="layui-input">

                    </div>
                    <div class="layui-input-block">
                        图标样式
                        <input type="text" name="icon" id="icon" placeholder="请输入图标样式，如 fa fa-coffee" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-block">
                        <button class="layui-btn" id="addButton" type="submit" lay-filter="formDemo">添加</button>
                        <button class="layui-btn" id="saveButton" style="display:none" type="submit" lay-filter="formDemo">保存</button>
                    </div>
                </div>
            </form>
            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>如果该分类为一级分类，父节点选"无"</li>
                    <li>如果该分类为二级分类，父节点选择其对应的一级目录</li>
                    <li>图标样式可以参考<a href="http://fontawesome.io/icons/" target="_blank"> fontawesome </a>,建议给一级分类添加 </li>
                </ul>
            </blockquote>
        </div>
        <div class="layui-col-md8" style="border: 1px solid #FF5722;">
            <table class="layui-table" id="categoryList">
                <colgroup>
                    <col width="50">
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                </colgroup>
                <thread>
                    <tr>
                        <th>ID</th>
                        <th>PID</th>
                        <th>名称</th>
                        <th>文章数</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tbody>

                    </tbody>
                </thread>
            </table>

            <blockquote class="layui-elem-quote layui-quote-nm">
                温馨提示：
                <ul>
                    <li>分类最多只有两级，一级分类pid=0，二级分类pid=其父节点id</li>
                    <li>如果该分类包含文章，将不可删除</li>
                </ul>
            </blockquote>
        </div>
    </div>
</rapid:override>
<rapid:override name="footer-script">
    <script>
        var form,layedit,layer,laydate,mode;
        mode = "list";
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
            initCategoryList();
            getSuperCategory();
        })

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

        function initCategoryList() {
            var strs = "";
            var status = "显示";

            $.ajax({
                type:"POST",
                url:"<%=request.getContextPath()%>/admin/category/getCategoryList.do",
                success:function(data){
                    for(var i = 0; i < data.length; i++){
                        var classStr = "";
                        if(data[i].status == '0'){
                            status = '<span style="color:#FF5722"></span>';
                        }
                        if(data[i].pid == '0'){
                            classStr = "layui-bg-cyan";
                        }
                        strs += '<tr><td class="'+classStr+'">'+data[i].id+'</td>'
                            +'<td>'+data[i].pid+'</td>'
                            +'<td><a href="" target="_blank">'+data[i].name+'</a></td>'
                            +'<td><a href="" target="_blank">'+data[i].articleNum+'</a></td>'
                            +'<td>'+status+'</td>'
                            +'<td><a href="javascript:void(0)" onclick="javascript:edit(\''+data[i].id+'\');" class="layui-btn layui-btn-mini">编辑</a>';
                        if(data[i].articleNum == 0){
                            strs += '<a href="javascript:void(0);" class="layui-btn layui-btn-danger layui-btn-mini" onclick="deleteCategory(this,\''+data[i].id+'\')">删除</a>';
                        }
                        strs += '</td></tr>';
                    }
                    $("#categoryList").append(strs);
                }
            })
        }

        function deleteCategory(obj,categoryId){
            if(confirm("确定要删除吗？")){
                $.ajax({
                    url:"<%=request.getContextPath()%>/admin/category/deleteCategory.do",
                    data:{"id":categoryId},
                    type:"POST",
                    success:function(data){
                        if(data == 'success'){
                            $(obj).parent().parent().remove();
                        }else if(data == "error"){
                            alert("该分类存在子类别，请先删除子类别");
                        }

                    }
                })
            }

        }
        
        function edit(categoryId) {
            $.ajax({
                url:"<%=request.getContextPath()%>/admin/category/editCategory.do",
                data:{"id":categoryId},
                type:"POST",
                success:function(data){
                    if(data){
                        $("#id").val(data[0].id);
                        $("#name").val(data[0].name);

                        $("#categoryPid").attr("value",data[0].pid);
                        $("#categoryPid").children("option").each(function(){
                            if ($(this).val() == data[0].pid) {
                                $(this).attr("selected","selected");
                            }else{
                                if ($(this).attr("selected") == "selected") {
                                    $(this).removeAttr("selected");
                                }
                            }
                        });

                        $("#categoryPid").siblings("div[class='layui-unselect layui-form-select']").children("div[class='layui-select-title']").children("input").val(data[0].pid);
                        //$("#categoryPid").siblings("div[class='layui-unselect layui-form-select']").children("div[class='layui-select-title']").children("input").text("hhh");

                        //2、其次，设置dl下的dd
                        $("#categoryPid").siblings("div[class='layui-unselect layui-form-select']").children("dl").children("dd").each(function(){
                            if ($(this).attr("lay-value") == data[0].pid){
                                if (!$(this).hasClass("layui-this")) {
                                    $(this).addClass("layui-this");
                                    $(this).click();
                                }
                                return true;
                            }else{
                                if ($(this).hasClass("layui-this")) {
                                    $(this).removeClass("layui-this");
                                }
                            }
                        });

                        $("#description").val(data[0].description);
                        $("#icon").val(data[0].icon);
                        $(".layui-col-md4").attr("style","border: 1px solid #FF5722;");
                        $(".layui-col-md8").attr("style","");
                        $("#saveButton").attr("style","display:block");
                        $("#addButton").attr("style","display:none");
                        $("#mode").val("edit");



                    }
                }
            })
        }


    </script>
</rapid:override>

<%@ include file="/Admin/Public/framework.jsp"%>

