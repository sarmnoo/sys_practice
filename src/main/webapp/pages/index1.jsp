<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"/>

<%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/color.css"/>
<script type="text/javascript">
    $(function(){
        /*$("#window").window('close');
        $('#cc').combo({
            required:true,
            multiple:true,
            editable:true
        });

        $('#cc1').combobox({
            required:true,
            multiple:true,
            disabled:true
        });*/

        /*var availableTags = [
            "ActionScript",
            "AppleScript",
            "Asp",
            "BASIC",
            "C",
            "C++",
            "Clojure",
            "COBOL",
            "ColdFusion",
            "Erlang",
            "Fortran",
            "Groovy",
            "Haskell",
            "Java",
            "JavaScript",
            "Lisp",
            "Perl",
            "PHP",
            "Python",
            "Ruby",
            "Scala",
            "Scheme"
        ];
        $( "#tags" ).autocomplete({
            source: availableTags
        });*/


        alert("hh");
        $("#statName").autocomplete({
            source:function(request,response){
                $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath()%>/login/getDeptUser.do",
                    dataType : "json",
                    cache : false,
                    async : false,
                    //data : {
                    //  "statName" : encodeURI($("#statName").val())
                    //},
                    success : function(json) {
                        var data = eval(json);//json数组

                        response($.map(data,function(item){
                            var name = item.userName;
                            var id = item.id;
                            return {
                                label:item.Name,//下拉框显示值
                                value:item.userName,//选中后，填充到下拉框的值
                                id:item.id//选中后，填充到id里面的值
                            }
                        }));
                    }
                });
            },
            delay: 500,//延迟500ms便于输入
            select : function(event, ui) {
                $("#statId").val(ui.item.id);
            }
        });


    });

    function openWindow(){
        $("#window").window("open");
        $("#dept").datagrid({
            url:"<%=request.getContextPath()%>/login/getDept.do",
            columns:[[
                {field:'id',checkbox:true},
                {field:'deptName',title:'部门',width:100}
            ]],
            onSelect:function (index,row) {
                var deptId = row['id'];
                $("#user").datagrid({
                    url:"<%=request.getContextPath()%>/login/getDeptUser.do?deptId="+deptId,
                    columns:[[
                        {field:'id',checkbox:true},
                        {field:'userName',title:'人员列表',width:100}
                    ]]
                })
            }
        })
    }
    function addDutyUser() {
        var deptArray = $("#dept").datagrid('getSelections');
        var deptList = [];

        for(var i = 0; i < deptArray.length; i++){
            deptList[i] = deptArray[i].id;
        }
        var userArray = $("#user").datagrid("getSelections");
        var userList = []
        for(var i = 0; i < userArray.length; i++){
            userList[i] = userArray[i].id;
        }
        $.ajax({
            url:"<%=request.getContextPath()%>/login/getSelectUser.do",
            data:{"deptList":deptList,"userList":userList},
//            dataType:"json",
            type:"POST",
            traditional:true,
            success:function (data) {
                alert("hhh");
                alert(data);

            }

        })
    }
    function onLoadStation() {
        alert("hh");
        $("#statName").autocomplete({
            source:function(request,response){
                $.ajax({
                    type:"POST",
                    url:"<%=request.getContextPath()%>/login/getDeptUser.do?deptId=22",
                    dataType : "json",
                    cache : false,
                    async : false,
                    //data : {
                      //  "statName" : encodeURI($("#statName").val())
                    //},
                    success : function(json) {
                        var data = eval(json);//json数组

                        response($.map(data,function(item){
                            var name = item.userName;
                            var id = item.id;
                            return {
                                label:item.Name,//下拉框显示值
                                value:item.userName,//选中后，填充到下拉框的值
                                id:item.id//选中后，填充到id里面的值
                            }
                        }));
                    }
                });
            },
            delay: 500,//延迟500ms便于输入
            select : function(event, ui) {
                $("#statId").val(ui.item.id);
            }
        });
    }

    function test(){
        $.ajax({
            url : servletUrl,
            type : "post",
            data : params,
            dataType : 'JSON',
            success : function(result) {
                $('#inputText').flushCache();
                $('#inputText').autocomplete(result.data, {
                    minChars: 0,
                    max: 16,
                    matchContains: true,
                    width: 400,
                    scrollHeight: 400,
                    scroll: false,
                    formatItem : function(row, i, max) {
                        return "<span class='autoleft'>" + row.toString() + "</span>";
                    },
                    formatMatch : function(row, i, max) {
                        return row.toString();
                    },
                    formatResult : function(row) {
                        return row.toString();
                    }
                }).result(function(event, row, formatted) {
                    $('#inputText').val(row.toString());
                });
            },
            error : function() {
                alert('加载数据失败');
            }
        });
    }


</script>
</head>
<body>
    <input type="button" id="" value="弹窗" onclick="javascript:openWindow();"/>
    <input id="cc" value="001">
    <select id="cc1" class="easyui-combobox" name="dept" style="width:200px;">
        <option value="aa">aitem1</option>
        <option>bitem2</option>
        <option>bitem3</option>
        <option>ditem4</option>
        <option>eitem5</option>
    </select>
</body>

<div id="window" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'"
     style="width:800px;height:500px;padding:10px;">
    <table id="dept"></table>
    <table id="user"></table>

<input type="button" value="确定" onclick="javascript:addDutyUser();">
</div>

<%--<input type="text" name="query" id="query" />--%>
<input type="hidden" id="statId" value="-1">
<input type="text" class="form-control grayTips" id="statName" placeholder="请输入站点名称/拼音首字母">

<div class="ui-widget">
    <label for="tags">标签：</label>
    <input id="tags">
</div>
</html>
