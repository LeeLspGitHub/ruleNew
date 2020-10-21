<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();
    System.out.println(contextPath);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--声明以IE最高版本浏览器内核或谷歌浏览器内核进行渲染 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--声明以360极速模式进行渲染 -->
    <meta name=”renderer” content=”webkit” />
    <title>DeclaringPoint列表</title>
    <!-- easyui库 -->
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/jquery-easyui-1.7.0/themes/icon.css">

    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery/jquery.form.js"></script>
    <!-- 基础样式表 -->
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/style.css"/>
</head>
<body>
<div id="toolbar">
    <table>
        <tr>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addDeclaringPointRule()">新增规则</a></td>
            <td>普通特征ID:</td>
            <td><input id="idSearch" name="idSearch" style="width:150px;height: 20px;"/></td>
            <td>罪名:</td>
            <td><input id="caseCauseSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>
            <td>省份:</td>
            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachDeclaringPointRule()">查询规则</a></td>
        </tr>
    </table>
</div>
<table id="declaringPointTable" title="DeclaringPoint列表" toolbar="#toolbar" style="width:100%;height:550px" >
    <thead >
    <tr>
        <th data-options="field:'id',sortable:true" style="width:8%;">普通特征ID</th>
        <th data-options="field:'caseCause',sortable:true" style="width:14%;">罪名</th>
        <th data-options="field:'province'" style="width:8%;">省份</th>
        <th data-options="field:'conditions'" style="width:60%;">条件</th>
        <th data-options="field:'cz',formatter:formatOper" style="width:10%;">操作</th>
    </tr>
    </thead>
</table>

<div id="dgDeclaringPointAdd" class="easyui-dialog" style="width:700px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgDeclaringPointAdd-buttons">
    <form id="fmDeclaringPoint" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right">罪名:</td>
                <td style="width:75%" ><input id="caseCauseAdd" name="caseCauseAdd" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">省份:</td>
                <td style="width:75%"><input id="provinceAdd" name="provinceAdd"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">条件:</td>
                <td style="width:75%">
                    <textarea id="conditionsAdd" name="conditionsAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgDeclaringPointAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDeclaringPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgDeclaringPointAdd').dialog('close')">取消</a>
</div>
<div id="dgDeclaringPointEdit" class="easyui-dialog" style="width:700px;height:400px;padding:10px 20px"
     closed="true" buttons="#dgDeclaringPointEdit-buttons">
    <form id="fmDeclaringPointEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right">宣告ID:</td>
                <td style="width:75%" ><input id="idEdit" name="idEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">罪名:</td>
                <td style="width:75%" ><input id="caseCauseEdit" name="caseCauseEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">省份:</td>
                <td style="width:75%"><input id="provinceEdit" name="provinceEdit"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">条件:</td>
                <td style="width:75%">
                    <textarea id="conditionsEdit" name="conditionsEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgDeclaringPointEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateDeclaringPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgDeclaringPointEdit').dialog('close')">取消</a>
</div>
</body>
<script type="text/javascript">

    $(document).ready(function () {
        initDeclaringPointTable();
    });
    //初始化FactFeatures表格数据
    function initDeclaringPointTable(){

        $('#declaringPointTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            url: '${pageContext.request.contextPath}/declaringpoint/declaringPointList',
            success:function (data) {
                console.log(data);
            },
            error:function () {
                $.messager.alert("提示","获取数据失败");
            }
        });
    }

    function formatOper(val,row,index){
        return '<a href="#" onclick="editDeclaringPointRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleDeclaringPointRule('+index+')">删除</a>';
    }


    function addDeclaringPointRule(){

        $('#fmDeclaringPoint').form('clear');
        $.ajax({
            type: 'POST',
            dataType: "json",
            url: "${pageContext.request.contextPath}/declaringpoint/getAddDefaultDeclaringPointRule",
            success: function (data) {

                console.log(data)
                if(data.list.length > 0){
                    $("#provinceAdd").val(data.list[0].province);
                }

                $('#dgDeclaringPointAdd').dialog('open').dialog('setTitle','新建宣告规则');

            },
            error: function () {
                alert("发生错误");
            }
        })



    }
    //查询规则
    function serachDeclaringPointRule(){

        var id = $("#idSearch").val();
        var caseCause = $("#caseCauseSearch").val();
        var province = $("#provinceSearch").val();
        $('#declaringPointTable').datagrid({
            url: '${pageContext.request.contextPath}/declaringpoint/declaringPointList',
            queryParams:{
                id:id,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }

    function deteleDeclaringPointRule(index){

        var declaringPointID = $('#declaringPointTable').datagrid('getData').rows[index].id;

        $.ajax({
            type: 'POST',
            dataType: "json",
            data:{declaringPointID:declaringPointID},
            url: "${pageContext.request.contextPath}/declaringpoint/deteleDeclaringPointRule",
            success: function (data) {
                if (data){
                    console.log(data);
                    alert("删除成功");
                    $('#declaringPointTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','宣告规则保存失败！','error');
                }

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function editDeclaringPointRule(index){

        var declaringPointID = $('#declaringPointTable').datagrid('getData').rows[index].id;

        $.ajax({
            type: 'POST',
            dataType: "json",
            data:{declaringPointID:declaringPointID},
            url: "${pageContext.request.contextPath}/declaringpoint/findOneDeclaringPointRuleById",
            success: function (data) {

                $("#fmDeclaringPointEdit").form('load',data);
                console.log(data);
                $("#idEdit").val(data.list[0].id);
                $("#caseCauseEdit").val(data.list[0].caseCause);
                $("#provinceEdit").val(data.list[0].province);
                $("#conditionsEdit").val(data.list[0].conditions);

                $("#idEdit").attr("readOnly","true");
                $('#dgDeclaringPointEdit').dialog('open').dialog('setTitle','修改宣告规则');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }

    function saveDeclaringPointRule() {

        var caseCause = $("#caseCauseAdd").val().trim();
        var province = $("#provinceAdd").val();

        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }

        $('#fmDeclaringPoint').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/declaringpoint/saveDeclaringPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    $('#dgDeclaringPointAdd').dialog('close');		// close the dialog
                    $('#declaringPointTable').datagrid('reload');	// reload data
                } else {
                    $.messager.alert('提示','宣告规则保存失败！','error');
                }
            }
        });
    }
    function updateDeclaringPointRule(){

        var caseCause = $("#caseCauseEdit").val().trim();
        var province = $("#provinceEdit").val();

        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }

        $('#fmDeclaringPointEdit').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/declaringpoint/updateDeclaringPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    alert("更新成功");
                    $('#dgDeclaringPointEdit').dialog('close');		// close the dialog
                    $('#declaringPointTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','宣告规则更新失败！','error');
                }
            }
        });
    }

</script>
</html>