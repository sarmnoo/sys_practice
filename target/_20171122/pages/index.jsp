<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.5/themes/color.css"/>
<script type="text/javascript">
    $(function(){
        $("#window").window('close');
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

</script>
</head>
<body>
    <input type="button" id="" value="弹窗" onclick="javascript:openWindow();"/>

</body>

<div id="window" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'"
     style="width:800px;height:500px;padding:10px;">
    <table id="dept"></table>
    <table id="user"></table>

<input type="button" value="确定" onclick="javascript:addDutyUser();">
</div>


</html>
