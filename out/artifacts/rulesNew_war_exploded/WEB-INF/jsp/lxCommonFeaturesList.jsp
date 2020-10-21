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
    <title>通用型量刑情节规则列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addLxCommonFeature()">新增规则</a></td>
            <td>普通特征ID:</td>
            <td><input id="idSearch" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td>英文名:</td>
            <td><input id="enNameSearch" name="enNameSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
<%--            <td>省份:</td>
            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
            <td>标准特征:</td>
            <td><input id="standardFeatureSearch" name="standardFeatureSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachLxCommonFeatures()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>
<table id="lxCommonFeaturesTable" title="通用型量刑情节规则列表" toolbar="#toolbar" style="width:100%;height:500px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:9%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:8%;">普通特征ID</th>
        <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
        <th data-options="field:'enName',sortable:true" style="width:20%;">英文名</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
        <th data-options="field:'valueType'" formatter="formatValueType" style="width:8%;">值类型</th>
        <th data-options="field:'lxType'" formatter="formatLxType" style="width:9%;">量刑情节适用</th>
        <th data-options="field:'lxPlotType'" formatter="formatLxPlotType" style="width:9%;">量刑情节类型</th>
        <th data-options="field:'type'" formatter="formatType" style="width:8%;">类型</th>
        <th data-options="field:'legalConstraint'" formatter="formatLegalConstraint" style="width:8%;">法定约束</h>
        <th data-options="field:'lxOrder'" style="width:5%;">排序</th>
        <th data-options="field:'minValues'" style="width:10%;">最小值</th>
        <th data-options="field:'maxValues'" style="width:10%;">最大值</th>
        <th data-options="field:'standardValues'" style="width:20%;">标准值</th>
        <th data-options="field:'provinceItem'" style="width:12%;">本省实施细则(行号)</th>
        <th data-options="field:'nationItem'" style="width:15%;">全国量刑指导意见(行号)</th>
        <th data-options="field:'parentId'" formatter="formatParentId" style="width:10%;">是否为父节点</th>
        <th data-options="field:'isMultiple'" style="width:10%;">是否多选</th>
        <th data-options="field:'groupId'" style="width:10%;">父节点ID</th>
        <th data-options="field:'groupIdName'" style="width:10%;">父节点</th>
        <th data-options="field:'descS'" style="width:20%;">描述</th>
        <th data-options="field:'note'" style="width:15%;">备注</th>
        <th data-options="field:'tip'" style="width:15%;">提示</th>
        <th data-options="field:'province'" style="width:6%;">省份</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'createPerson'" style="width:10%;">创建人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'updatePerson'" style="width:10%;">更新人</th>
        <th data-options="field:'auditStatus'" style="width:10%;">审核状态</th>
    </tr>
    </thead>
</table>

<div id="dgLxCommonAdd" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgLxCommonAdd-buttons">
    <form id="fmLxCommon" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>省份:</td>
                <td>
                    <select id="provinceAdd" name="provinceAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100100">不限</option>
                        <option value="100101">北京市</option>
                        <option value="100102">福建省</option>
                        <option value="100103">山东省</option>
                        <option value="100104">辽宁省</option>
                        <option value="100105">贵州省</option>
                        <option value="100106">河南省</option>
                        <option value="100107">内蒙古自治区</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">省份名称:</td>
                <td style="width:75%"><input id="provinceNameAdd" name="provinceNameAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true" value=""></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>标准特征:</td>
                <td style="width:75%"><input id="standardFeatureAdd" name="standardFeatureAdd" class="easyui-validatebox"  autocomplete="off" ondblclick="chooseStandardFeature()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%" ><input id="enNameAdd" name="enNameAdd" class="easyui-validatebox" autocomplete="off" style="width: 350px;height: 20px;" required="true" missingMessage="英文名要以下划线'_'开头和结尾并且遵循驼峰命名规则，<br/>例如交通肇事罪死亡人数:_deathsDriving_"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>映射特征:</td>
                <td style="width:75%"><input id="mappingFeatureAdd" name="mappingFeatureAdd" editable="true" class="easyui-validatebox" ondblclick="chooseMappingFeature()" autocomplete="off"  style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>

            <tr style="width:100%">
                <td style="width:25%" align="right">值类型:</td>
                <td style="width:75%">
                    <select id="valueTypeAdd" name="valueTypeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">boolean</option>
                        <option value="1">int</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑情节适用:</td>
                <td style="width:75%">
                    <select id="lxTypeAdd" name="lxTypeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">请选择</option>
                        <option value="1">罪中</option>
                        <option value="2">罪前、罪后</option>
                        <option value="3">增加</option>
                        <option value="4">减少</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑情节类型:</td>
                <td style="width:75%"><input id="lxPlotTypeAdd" name="lxPlotTypeAdd" editable="false" class="easyui-validatebox" autocomplete="off"  ondblclick="chooseLxPlotType(1)" style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">类型:</td>
                <td style="width:75%">
                    <select id="typeAdd" name="typeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="4">通用型量刑情节</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">法定约束:</td>
                <td style="width:75%">
                    <select id="legalConstraintAdd" name="legalConstraintAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">无约束</option>
                        <option value="1">应当</option>
                        <option value="2">可以</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">是否为父节点:</td>
                <td style="width:75%">
                    <select id="parentIdAdd" name="parentIdAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="2">请选择</option>
                        <option value="0">无下级</option>
                        <option value="1">有下级</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">是否多选:</td>
                <td style="width:75%">
                    <select id="isMultipleAdd" name="isMultipleAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="2">请选择</option>
                        <option value="0">是</option>
                        <option value="1">否</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" editable="false">
                <td style="width:25%" align="right">父节点ID:</td>
                <td style="width:75%"><input id="groupIdAdd" name="groupIdAdd" autocomplete="off" editable="false"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">父节点名称:</td>
                <td style="width:75%"><input id="groupIdNameAdd" name="groupIdNameAdd"  autocomplete="off" ondblclick="chooseParentId()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="minValuesAdd" name="minValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="maxValuesAdd" name="maxValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">本省实施细则(行号):</td>
                <td style="width:75%"><input id="provinceItemAdd" name="provinceItemAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">全国量刑指导意见(行号):</td>
                <td style="width:75%"><input id="nationItemAdd" name="nationItemAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSAdd" name="descSAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">备注:</td>
                <td style="width:75%">
                    <textarea id="noteAdd" name="noteAdd" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">提示:</td>
                <td style="width:75%">
                    <textarea id="tipAdd" name="tipAdd" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">排序:</td>
                <td style="width:75%"><input id="lxOrderAdd" name="lxOrderAdd"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgLxCommonAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveLxCommonFeatures()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgLxCommonAdd').dialog('close')">取消</a>
</div>
<div id="dgLxCommonEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgLxCommonEdit-buttons">
    <form id="fmLxCommonEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>普通特征ID:</td>
                <td style="width:75%" ><input id="idEdit" name="idEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" ></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>省份:</td>
                <td>
                    <select id="provinceEdit" name="provinceEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100100">不限</option>
                        <option value="100101">北京市</option>
                        <option value="100102">福建省</option>
                        <option value="100103">山东省</option>
                        <option value="100104">辽宁省</option>
                        <option value="100105">贵州省</option>
                        <option value="100106">河南省</option>
                        <option value="100107">内蒙古自治区</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">省份名称:</td>
                <td style="width:75%"><input id="provinceNameEdit" name="provinceNameEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true" value="" ></td>
            </tr>

            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>标准特征:</td>
                <td style="width:75%"><input id="standardFeatureEdit" name="standardFeatureEdit" class="easyui-validatebox"  autocomplete="off" ondblclick="chooseStandardFeature()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%" ><input id="enNameEdit" name="enNameEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true" missingMessage="英文名要以下划线'_'开头和结尾并且遵循驼峰命名规则，<br/>例如交通肇事罪死亡人数:_deathsDriving_"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>映射特征:</td>
                <td style="width:75%"><input id="mappingFeatureEdit" name="mappingFeatureEdit" editable="true" class="easyui-validatebox" ondblclick="chooseMappingFeatureE()" autocomplete="off" style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">值类型:</td>
                <td style="width:75%">
                    <select id="valueTypeEdit" name="valueTypeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">boolean</option>
                        <option value="1">int</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑情节适用:</td>
                <td style="width:75%">
                    <select id="lxTypeEdit" name="lxTypeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">请选择</option>
                        <option value="1">罪中</option>
                        <option value="2">罪前、罪后</option>
                        <option value="3">增加</option>
                        <option value="4">减少</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑情节类型:</td>
                <td style="width:75%"><input id="lxPlotTypeEdit" name="lxPlotTypeEdit" editable="false" class="easyui-validatebox" autocomplete="off"  ondblclick="chooseLxPlotType(2)" style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">类型:</td>
                <td style="width:75%">
                    <select id="typeEdit" name="typeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="4">通用型量刑情节</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">法定约束:</td>
                <td style="width:75%">
                    <select id="legalConstraintEdit" name="legalConstraintEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">无约束</option>
                        <option value="1">应当</option>
                        <option value="2">可以</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">是否为父节点:</td>
                <td style="width:75%">
                    <select id="parentIdEdit" name="parentIdEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="2">请选择</option>
                        <option value="0">无下级</option>
                        <option value="1">有下级</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">是否多选:</td>
                <td style="width:75%">
                    <select id="isMultipleEdit" name="isMultipleEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="2">请选择</option>
                        <option value="0">是</option>
                        <option value="1">否</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" >
                <td style="width:25%" align="right">父节点ID:</td>
                <td style="width:75%"><input id="groupIdEdit" name="groupIdEdit" editable="false"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">父节点名称:</td>
                <td style="width:75%"><input id="groupIdNameEdit" name="groupIdNameEdit" autocomplete="off" ondblclick="chooseParentIdE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="minValuesEdit" name="minValuesEdit"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="maxValuesEdit" name="maxValuesEdit"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">本省实施细则(行号):</td>
                <td style="width:75%"><input id="provinceItemEdit" name="provinceItemEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">全国量刑指导意见(行号):</td>
                <td style="width:75%"><input id="nationItemEdit" name="nationItemEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSEdit" name="descSEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">备注:</td>
                <td style="width:75%">
                    <textarea id="noteEdit" name="noteEdit" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">提示:</td>
                <td style="width:75%">
                    <textarea id="tipEdit" name="tipEdit" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">排序:</td>
                <td style="width:75%"><input id="lxOrderEdit" name="lxOrderEdit"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgLxCommonEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateLxCommonFeature()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgLxCommonEdit').dialog('close')">取消</a>
</div>

<div id="lxCommonFeatureList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarlxCommonFeature">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idSearchL" name="idSearchL" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameSearchL" name="enNameSearchL" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchL" name="standardFeatureSearchL" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachLxCommonFeaturesL()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="lxCommonFeatureTable" toolbar="#toolbarlxCommonFeature" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:15%;">事实特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>

        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
            <th data-options="field:'valueType'" formatter="formatValueType" style="width:12%;">值类型</th>
            <th data-options="field:'type'" formatter="formatType" style="width:18%;">类型</th>
            <th data-options="field:'lxType'" formatter="formatLxType" style="width:15%;">量刑情节类型</th>
            <th data-options="field:'minValues'" style="width:20%;">最小值</th>
            <th data-options="field:'maxValues'" style="width:20%;">最大值</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>

<div id="parentIdList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarparentId">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idGroup" name="idGroup" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameGroup" name="enNameGroup" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachParentId()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="parentIdTable" toolbar="#toolbarparentId" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:15%;">事实特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>

        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
<div id="parentIdListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarparentIdE">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idGroupE" name="idGroup" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameGroupE" name="enNameGroup" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachParentIdE()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="parentIdTableE" toolbar="#toolbarparentIdE" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:15%;">事实特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
<div id="mappingFeatureList" class="easyui-dialog" style="overflow:auto;width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarmappingFeature">
        <table>
            <tr>
                <td>映射特征编码:</td>
                <td><input id="code" name="code" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>映射特征名称:</td>
                <td><input id="name" name="name" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachmappingFeature()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectCodes(1)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="mappingFeatureTable" toolbar="#toolbarmappingFeature"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'code',sortable:true" style="width:50%;">映射特征编码</th>
            <th data-options="field:'name'" style="width:50%;">映射特征</th>
        </tr>
        </thead>
    </table>
</div>
<div id="mappingFeatureListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarmappingFeatureE">
        <table>
            <tr>
                <td>映射特征编码:</td>
                <td><input id="codeE" name="codeE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>映射特征名称:</td>
                <td><input id="nameE" name="nameE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachmappingFeatureE()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectCodes(2)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="mappingFeatureTableE" toolbar="#toolbarmappingFeatureE"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'code',sortable:true" style="width:50%;">映射特征编码</th>
            <th data-options="field:'name'" style="width:50%;">映射特征</th>
        </tr>
        </thead>
    </table>
</div>
<div id="lxPlotTypeList" class="easyui-dialog" style="overflow:auto;width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolLxPlotType">
        <table>
            <tr>
              <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectLxPlotType(1)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="lxPlotTypeTable" toolbar="#toolLxPlotType" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'lxTypeId',sortable:true" style="width:50%;">量刑情节类型id</th>
            <th data-options="field:'lxTypeName'" style="width:50%;">量刑情节类型</th>
        </tr>
        </thead>
    </table>
</div>
<div id="lxPlotTypeListE" class="easyui-dialog" style="overflow:auto;width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolLxPlotTypeE">
        <table>
            <tr>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectLxPlotType(2)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="lxPlotTypeTableE" toolbar="#toolLxPlotTypeE" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'lxTypeId',sortable:true" style="width:50%;">量刑情节类型id</th>
            <th data-options="field:'lxTypeName'" style="width:50%;">量刑情节类型</th>
        </tr>
        </thead>
    </table>
</div>
</body>
<script type="text/javascript">

    $(document).ready(function () {
        initLxCommonFeaturesTable();
        initStandardFeaturesTable();
        initParentIdTable();
        initParentIdTableE();
        initMappingFeaturesTable();
        initMappingFeaturesTableE();
        initLxPlotTypeTable();
        initLxPlotTypeTableE();
        $("#parentIdAdd").combobox({
            onChange: function (record) {
                if(!$("#parentIdAdd").val()||$("#parentIdAdd").val() == '0'||$("#parentIdAdd").val() == '2'){
                    $("#isMultipleAdd").combobox({disabled:true});
                    $("#groupIdNameAdd").attr("disabled", false);
                    $("#groupIdAdd").attr("disabled", false);
                    $("#isMultipleAdd").attr("value","2");
                }else if($("#parentIdAdd").val()||$("#parentIdAdd").val() == '1'){
                    $("#isMultipleAdd").combobox({disabled:false});
                    $("#groupIdNameAdd").attr("disabled", true);
                    $("#groupIdAdd").attr("disabled", true);
                    $("#isMultipleAdd").attr("value","2");
                }
            }
        });
        $("#parentIdEdit").combobox({

            onChange: function (record) {
                if(!$("#parentIdEdit").val()||$("#parentIdEdit").val() == '0'){
                    $("#isMultipleEdit").combobox({disabled:true});
                    $("#groupIdNameEdit").attr("disabled", false);
                    $("#groupIdEdit").attr("disabled", false);
                    $("#isMultipleEdit").attr("value","2");
                }else if($("#parentIdEdit").val()||$("#parentIdEdit").val() == '1'){
                    $("#isMultipleEdit").combobox({disabled:false});
                    $("#groupIdNameEdit").attr("disabled", true);
                    $("#groupIdEdit").attr("disabled", true);
                    $("#isMultipleEdit").attr("value","2");
                }
            }
        });
        $("#provinceAdd").combobox({
            onChange: function (record) {
                $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
            }
        });
        $("#provinceEdit").combobox({
            onChange: function (record) {
                $("#provinceNameEdit").val($("#provinceEdit option:selected").text());
            }
        });
    });
    //初始化FactFeatures表格数据
    function initLxCommonFeaturesTable(){

        $('#lxCommonFeaturesTable').datagrid({
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
            queryParams:{
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'
        });
    }
    //初始化标准特征表
    function initStandardFeaturesTable(){

        $('#lxCommonFeatureTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onStandardClickRow,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,

            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'

        });
    }
    //初始化ParentId
    function initParentIdTable(){

        $('#parentIdTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onParentIdClickRow,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'

        });
    }
    //初始化ParentId
    function initParentIdTableE(){

        $('#parentIdTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onParentIdClickRowE,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'

        });
    }

    //初始化映射特征表
    function initMappingFeaturesTable(){

        $('#mappingFeatureTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onMappingClickRow,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/features/mappingFeatureList'

        });
    }
    //初始化映射特征表
    function initMappingFeaturesTableE(){

        $('#mappingFeatureTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onMappingClickRowE,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/features/mappingFeatureList'

        });
    }

    //初始化映射特征表
    function initLxPlotTypeTable(){

        $('#lxPlotTypeTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onMappingClickRow,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            url: '${pageContext.request.contextPath}/commonfeatures/lxPlotTypeList'

        });
    }
    //初始化映射特征表
    function initLxPlotTypeTableE(){

        $('#lxPlotTypeTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onMappingClickRowE,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            url: '${pageContext.request.contextPath}/commonfeatures/lxPlotTypeList'

        });
    }

    function formatOper(val,row,index){
        return '<a href="#" onclick="editLxCommonFeature('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleLxCommonFeature('+index+')">删除</a>';
    }
    function formatValueType(val,row){
        if (val == '0'){
            return 'boolean';
        }else if(val == '1'){
            return 'int';
        }else{
            return val;
        }
    }
    function formatType(val,row){
        if (val == '4'){
            return '通用型量刑情节';
        }else{
            return val;
        }
    }
    function formatLegalConstraint(val,row){
        if (val == '0'){
            return '无约束';
        }if (val == '1'){
            return '应当';
        }if (val == '2'){
            return '可以';
        }else{
            return val;
        }
    }
    function formatLxType(val,row){
        if (val == '1'){
            return '罪中';
        }else if(val == '2'){
            return '罪前、罪后';
        }else if(val == '3'){
            return '增加';
        }else if(val == '4'){
            return '减少';
        }else{
            return val;
        }
    }
    function formatLxPlotType(val,row){
        if (val == '1'){
            return '法定从重';
        }else if(val == '2'){
            return '酌定从重';
        }else if(val == '3'){
            return '法定从轻';
        }else if(val == '4'){
            return '法定减轻';
        }else if(val == '5'){
            return '法定免除';
        }else if(val == '6'){
            return '酌定从轻';
        }else{
            return val;
        }
    }
    function formatParentId(val,row){
        if (val == '0'){
            return '否';
        }else if(val == '1'){
            return '是';
        }else{
            return val;
        }
    }
    function addLxCommonFeature(){

        $('#fmLxCommon').form('clear');
        $("#provinceAdd").combobox('setValue', $.getUrlParam('province'));
        $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
        $("#typeAdd").combobox('setValue', '4');
        $("#valueTypeAdd").combobox('setValue', '0');
        $("#legalConstraintAdd").combobox('setValue', '0');
        $("#parentIdAdd").combobox('setValue', '2');
        //获取序号
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{province:$.getUrlParam('province')},
            url: "${pageContext.request.contextPath}/commonfeatures/getAddMaxLxOrderCommonFeature",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if(!data.list[0] || !data.list[0].lxOrder){
                    $("#lxOrderAdd").val("1");
                    $("#lxOrderAdd").attr("readOnly","true");
                }else{
                    $("#lxOrderAdd").val(data.list[0].lxOrder);
                    $("#lxOrderAdd").attr("readOnly","true");
                }

            },
            error: function () {
                alert("发生错误");
            }
        })
        $('#dgLxCommonAdd').dialog('open').dialog('setTitle','新建普通特征');

    }
    //查询规则
    function serachLxCommonFeatures(){

        var id = $("#idSearch").val();
        var enName = $("#enNameSearch").val();
        //var province = $("#provinceSearch").val();
        var standardFeature = $("#standardFeatureSearch").val();

        $('#lxCommonFeaturesTable').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:$.getUrlParam('province')
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询规则
    function serachLxCommonFeaturesL(){

        var id = $("#idSearchL").val();
        var enName = $("#enNameSearchL").val();
        var province = $("#provinceSearchL").val();
        var standardFeature = $("#standardFeatureSearchL").val();

        $('#lxCommonFeatureTable').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询ParentIs
    function serachParentId(){

        var id = $("#idGroup").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameGroup").val();
        var standardFeature = $("#standardFeatureGroup").val();
        var province = $("#provinceAdd").val();
        $('#parentIdTable').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询ParentIsEdit
    function serachParentIdE(){

        var id = $("#idGroupE").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameGroupE").val();
        var standardFeature = $("#standardFeatureGroupE");
        var province = $("#provinceEdit").val();
        $('#parentIdTableE').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询映射特征
    function serachmappingFeature(){

        var code = $("#code").val();
        var name = $("#name").val();
        var caseCause = $("#caseCauseAdd").val();
        $('#mappingFeatureTable').datagrid({
            url: '${pageContext.request.contextPath}/features/mappingFeatureList',
            queryParams:{
                code:code,
                name:name,
                caseCause:'100200'
            },
            pageList: [30,50,100]
        });

    }
    //查询映射特征
    function serachmappingFeatureE(){

        var code = $("#codeE").val();
        var name = $("#nameE").val();
        var caseCause = $("#caseCauseEdit").val();
        $('#mappingFeatureTableE').datagrid({
            url: '${pageContext.request.contextPath}/features/mappingFeatureList',
            queryParams:{
                code:code,
                name:name,
                caseCause:'100200'
            },
            pageList: [30,50,100]
        });

    }

    function deteleLxCommonFeature(index){

        var lxCommonFeatureID = $('#lxCommonFeaturesTable').datagrid('getData').rows[index].id;
        $.messager.confirm('Confirm', '确定要删除吗?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{lxCommonFeatureID:lxCommonFeatureID},
                    url: "${pageContext.request.contextPath}/commonfeatures/deteleLxCommonFeature",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#lxCommonFeaturesTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','事实特征保存失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });

    }

    //判断字符串只能是英文和数字
    function done(input, LengthBegin, LengthEnd) {
        var pattern = '^[0-9a-zA-z]{' + LengthBegin+ ',' + LengthEnd+ '}$';
        var regex = new RegExp(pattern);
        if (input.match(regex)) {
            return true;
        } else {
            return false;
        }
    }

    function saveLxCommonFeatures() {

        var enName = $("#enNameAdd").val().trim();
        var standardFeature = $("#standardFeatureAdd").val();
        var province = $("#provinceAdd").val();

        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }
       // 判断英文名首尾只能为_
        if(!(enName.substr(0, 1) == '_') || !(enName.substr(-1) == '_')){
            $.messager.alert('提示','英文名首尾必须是_!','info');
            return;
        }
        var enNameS = enName.substring(1,enName.length-1);
        var flag = done(enNameS,1,enName.length-1);
        if(!flag){
            $.messager.alert('提示','英文名只能是字母数字下划线!','info');
            return;
        }

        if(!standardFeature){
            $.messager.alert('提示','标准特征不能为空!','info');
            return;
        }

        var enNameCount = 0;
        //var chiNameCount = 0;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{enName:enName,province:province},
            url: "${pageContext.request.contextPath}/commonfeatures/isEnNameExist",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if (data){
                    enNameCount = data.list.length;
                    if(enNameCount>0){
                        $.messager.alert('提示','英文名已存在，请重新填写!','info');
                        return;
                    }else{
                        $('#fmLxCommon').form('submit',{
                            dataType:"json",
                            async:false,
                            url: "${pageContext.request.contextPath}/commonfeatures/saveLxCommonFeatures",
                            onSubmit: function(){
                                return $(this).form('validate');
                            },
                            success: function(result){
                                if (result){
                                    debugger
                                    $('#dgLxCommonAdd').dialog('close');		// close the dialog
                                    $('#lxCommonFeaturesTable').datagrid('reload');
                                } else {
                                    $.messager.alert('提示','事实特征保存失败！','error');
                                    return;
                                }
                            }
                        });
                    }
                }
            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function chooseStandardFeature(){
        $('#lxCommonFeatureList').dialog('open').dialog('setTitle','通用特征列表');
    }
    function chooseParentId(){
        $('#parentIdList').dialog('open').dialog('setTitle','标准特征列表');
    }
    function chooseParentIdE(){
        $('#parentIdListE').dialog('open').dialog('setTitle','标准特征列表');
    }
    function chooseMappingFeature(){
        //$('#mappingFeatureTable').datagrid('clearChecked')='none';
        $('#mappingFeatureTable').datagrid('unselectAll');
        $('#mappingFeatureList').dialog('open').dialog('setTitle','映射特征列表');
    }
    function chooseMappingFeatureE(){
        $('#mappingFeatureTableE').datagrid('unselectAll');
        $('#mappingFeatureListE').dialog('open').dialog('setTitle','映射特征列表');
    }

    function chooseLxPlotType(num){
        if(num=='1'){
            //$('#mappingFeatureTable').datagrid('clearChecked')='none';
            $('#lxPlotTypeTable').datagrid('unselectAll');
            $('#lxPlotTypeList').dialog('open').dialog('setTitle','量刑情节类型列表');
        }else if(num=='2'){
            $('#lxPlotTypeTableE').datagrid('unselectAll');
            $('#lxPlotTypeListE').dialog('open').dialog('setTitle','量刑情节类型列表');
        }

    }

    function onStandardClickRow(rowNum,record){
        $("#standardFeatureAdd").val(record.standardFeature);
        $("#enNameAdd").val(record.enName);
        $("#mappingFeatureAdd").val(record.mappingFeature);
        $("#valueTypeAdd").combobox('setValue', record.valueType);
        $("#unitAdd").combobox('setValue', record.unit);
        $("#typeAdd").combobox('setValue', record.type);
        $("#lxTypeAdd").combobox('setValue', record.lxType);
        //$("#valueTypeAdd").val(record.valueType);
        $("#minValuesAdd").val(record.minValues);
        $("#maxValuesAdd").val(record.maxValues);
        $("#lxRelyAdd").val(record.lxRely);
        $("#parentIdAdd").combobox('setValue', record.parentId);
        $("#isMultipleAdd").combobox('setValue', record.isMultiple);
        $("#groupIdAdd").val(record.groupId);
        $("#descSAdd").val(record.descS);


        $('#lxCommonFeatureList').dialog('close');
    }
    function onParentIdClickRow(rowNum,record){
        $("#groupIdAdd").val(record.enName);
        $("#groupIdNameAdd").val(record.standardFeature);
        $('#parentIdList').dialog('close');
    }
    function onParentIdClickRowE(rowNum,record){
        $("#groupIdEdit").val(record.enName);
        $("#groupIdNameEdit").val(record.standardFeature);
        $('#parentIdListE').dialog('close');
    }
    function editLxCommonFeature(index){

        var lxCommonFeatureID = $('#lxCommonFeaturesTable').datagrid('getData').rows[index].id;

        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{lxCommonFeatureID:lxCommonFeatureID},
            url: "${pageContext.request.contextPath}/commonfeatures/findOneLxCommonFeatureById",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmLxCommonEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#enNameEdit").val(data.list[0].enName);
                $("#standardFeatureEdit").val(data.list[0].standardFeature);
                $("#mappingFeatureEdit").val(data.list[0].mappingFeature);
                $("#valueTypeEdit").combobox('setValue', data.list[0].valueType);
                $("#lxPlotTypeEdit").val(data.list[0].lxPlotType);
                $("#typeEdit").combobox('setValue', data.list[0].type);
                $("#legalConstraintEdit").combobox('setValue', data.list[0].legalConstraint);
                $("#parentIdEdit").combobox('setValue', data.list[0].parentId);
                $("#lxTypeEdit").combobox('setValue', data.list[0].lxType);
                //$("#lxPlotTypeEdit").combobox('setValue', data.list[0].lxPlotType);
                $("#isMultipleEdit").combobox('setValue', data.list[0].isMultiple);
                $("#descSEdit").val(data.list[0].descS);
                $("#noteEdit").val(data.list[0].note);
                $("#tipEdit").val(data.list[0].tip);
                $("#groupIdEdit").val(data.list[0].groupId);
                $("#groupIdNameEdit").val(data.list[0].groupIdName);
                $("#minValuesEdit").val(data.list[0].minValues);
                $("#maxValuesEdit").val(data.list[0].maxValues);
                $("#provinceItemEdit").val(data.list[0].provinceItem);
                $("#nationItemEdit").val(data.list[0].nationItem);
                $("#lxOrderEdit").val(data.list[0].lxOrder);
                $("#idEdit").attr("readOnly","true");
                $("#lxOrderEdit").attr("readOnly","true");
                $('#dgLxCommonEdit').dialog('open').dialog('setTitle','修改普通特征');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function updateLxCommonFeature(){

        var enName = $("#enNameEdit").val();
        var standardFeature = $("#standardFeatureEdit").val();
        var province = $("#provinceEdit").val();
        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }
        // 判断英文名首尾只能为_
        if(!(enName.substr(0, 1) == '_') || !(enName.substr(-1) == '_')){
            $.messager.alert('提示','英文名首尾必须是_!','info');
            return;
        }
        var enNameS = enName.substring(1,enName.length-1);
        var flagEdit = done(enNameS,1,enName.length-1);
        if(!flagEdit){
            $.messager.alert('提示','英文名只能是字母数字下划线!','info');
            return;
        }

        if(!standardFeature){
            $.messager.alert('提示','标准特征不能为空!','info');
            return;
        }
        var enNameCountEdit = 0;
        //var chiNameCountEdit = 0;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{enName:enName,province:province},
            url: "${pageContext.request.contextPath}/commonfeatures/isEnNameExist",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if (data){
                    enNameCountEdit = data.list.length;
                    if(enNameCountEdit>1){
                        $.messager.alert('提示','英文名有重复，请重新填写!','info');
                        return;
                    }else{
                        $('#fmLxCommonEdit').form('submit',{
                            dataType:"json",
                            async:false,
                            url: "${pageContext.request.contextPath}/commonfeatures/updateLxCommonFeatureById",
                            onSubmit: function(){
                                return $(this).form('validate');
                            },
                            success: function(result){
                                if (result){
                                    alert("更新普通特征成功");
                                    $('#dgLxCommonEdit').dialog('close');		// close the dialog
                                    $('#lxCommonFeaturesTable').datagrid('reload');
                                } else {
                                    $.messager.alert('提示','事实特征更新失败！','error');
                                    return;
                                }
                            }
                        });

                    }
                }
            },
            error: function () {
                alert("发生错误");
            }
        })
    }

    function selectCodes(num){
        if(num=='1'){
            var selRows = $('#mappingFeatureTable').datagrid('getSelections');
        }else if(num=='2'){
            var selRows = $('#mappingFeatureTableE').datagrid('getSelections');
        }
        var selected_codes=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].code);
        }
        if(num=='1'){
            $('#mappingFeatureAdd').val(selected_codes+"");
            $('#mappingFeatureList').dialog('close');
        }else if(num=='2'){
            $('#mappingFeatureEdit').val(selected_codes+"");
            $('#mappingFeatureListE').dialog('close');
        }

    }

    function selectLxPlotType(num){
        if(num=='1'){
            var selRows = $('#lxPlotTypeTable').datagrid('getSelections');
        }else if(num=='2'){
            var selRows = $('#lxPlotTypeTableE').datagrid('getSelections');
        }
        var selected_codes=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].lxTypeId);
        }
        if(num=='1'){
            $('#lxPlotTypeAdd').val(selected_codes+"");
            $('#lxPlotTypeList').dialog('close');
        }else if(num=='2'){
            $('#lxPlotTypeEdit').val(selected_codes+"");
            $('#lxPlotTypeListE').dialog('close');
        }

    }

    (function($){
        $.getUrlParam = function(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r!=null) return unescape(r[2]); return null;
        }
    })(jQuery);
</script>
</html>