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
    <title>factFeatureReference列表</title>
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

            <td>事实特征ID:</td>
            <td><input id="idReferenceSearch" name="idSearch" style="width:150px;height: 20px;"/></td>
            <td>罪名:</td>
            <td><input id="caseCauseReferenceSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>
            <td>英文名:</td>
            <td><input id="enNameReferenceSearch" name="enNameSearch" style="width:150px;height: 20px;"/></td>
            <td>省份:</td>
            <td><input id="provinceReferenceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachFactReferenceFeatures()">查询规则</a></td>

        </tr>
    </table>
</div>
<table id="factFeaturesReferenceTable" title="factFeatureReference列表" toolbar="#toolbar" style="width:100%;height:550px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'id',sortable:true" style="width:8%;">事实特征ID</th>
        <th data-options="field:'caseCause'" style="width:8%;">罪名</th>
        <th data-options="field:'enName',sortable:true" style="width:20%;">英文名</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'province'" style="width:20%;">省份</th>
        <th data-options="field:'minValues'" style="width:20%;">最小值</th>
        <th data-options="field:'maxValues'" style="width:8%;">最大值</th>
        <th data-options="field:'standardValues'" style="width:5%;">标准值</th>
        <th data-options="field:'before'" style="width:5%;">前</th>
        <th data-options="field:'after'" style="width:5%;">后</th>
        <th data-options="field:'startPointNumber'" style="width:50%;">量刑起点号</th>
    </tr>
    </thead>
</table>



</body>
<script type="text/javascript">

    $(document).ready(function () {
        initFactFeaturesReferenceTable();
    });
    //初始化FactFeatures表格数据
    function initFactFeaturesReferenceTable(){

        $('#factFeaturesReferenceTable').datagrid({

            url: '${pageContext.request.contextPath}/features/factFeatureReferenceList',
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
            rowNumbers: false
        });
    }
    //查询规则
    function serachFactReferenceFeatures(){

        var id = $("#idReferenceSearch").val();
        var caseCause = $("#caseCauseReferenceSearch").val();
        var enName = $("#enNameReferenceSearch").val();
        var province = $("#provinceReferenceSearch").val();

        $('#factFeaturesReferenceTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeatureReferenceList',
            queryParams:{
                id:id,
                caseCause:caseCause,
                enName:enName,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }







</script>
</html>