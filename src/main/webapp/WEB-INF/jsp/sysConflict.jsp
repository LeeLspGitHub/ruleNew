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
    <title>冲突列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addConflictRule()">新增规则</a></td>
            <td>冲突ID:</td>
            <td><input id="idSearch" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachConflictRule()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>
<table id="conflictTable" title="冲突规则列表" toolbar="#toolbar" style="width:100%;height:500px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:8%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:7%;">冲突ID</th>
        <th data-options="field:'caseCause'" style="width:8%;">罪名</th>
        <th data-options="field:'province'" style="width:7%;">省份</th>
        <th data-options="field:'enName'" style="width:14%;">英文名</th>
        <th data-options="field:'descS'" style="width:20%;">描述</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'createPerson'" style="width:8%;">创建人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'updatePerson'" style="width:8%;">更新人</th>
    </tr>
    </thead>
</table>

<div id="dgConflictAdd" class="easyui-dialog" style="width:600px;height:350px;padding:10px 20px"
     closed="true" buttons="#dgConflictAdd-buttons">
    <form id="fmConflict" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>罪名:</td>
                <td>
                    <select id="caseCauseAdd" name="caseCauseAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100200">通用情节</option>
                        <option value="100201">盗窃罪</option>
                        <option value="100202">妨害公务罪</option>
                        <option value="100203">非法拘禁罪</option>
                        <option value="100204">故意伤害罪</option>
                        <option value="100205">交通肇事罪</option>
                        <option value="100206">聚众斗殴罪</option>
                        <option value="100207">掩饰、隐瞒犯罪所得、犯罪所得收益罪</option>
                        <option value="100208">抢夺罪</option>
                        <option value="100209">强奸罪</option>
                        <option value="100210">抢劫罪</option>
                        <option value="100211">敲诈勒索罪</option>
                        <option value="100212">寻衅滋事罪</option>
                        <option value="100213">诈骗罪</option>
                        <option value="100214">职务侵占罪</option>
                        <option value="100215">走私、贩卖、运输、制造毒品罪</option>
                        <option value="100216">危险驾驶罪</option>
                        <option value="100217">集资诈骗罪</option>
                        <option value="100218">信用卡诈骗罪</option>
                        <option value="100219">合同诈骗罪</option>
                        <option value="100220">非法持有毒品罪</option>
                        <option value="100221">非法吸收公共存款罪</option>
                        <option value="100222">容留他人吸毒罪</option>
                        <option value="100223">引诱、容留、介绍卖淫罪</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">罪名名称:</td>
                <td style="width:75%"><input id="caseCauseNameAdd" name="caseCauseNameAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true" value=""></td>
            </tr>
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
                        <option value="100108">重庆市</option>
                        <option value="100109">上海市</option>
                        <option value="100110">浙江省</option>
                        <option value="100111">江苏省</option>
                        <option value="100112">吉林省</option>
                        <option value="100113">山西省</option>
                        <option value="100114">陕西省</option>
                        <option value="100115">黑龙江省</option>
                        <option value="100116">河北省</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">省份名称:</td>
                <td style="width:75%"><input id="provinceNameAdd" name="provinceNameAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true" value=""></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%"><input id="enNameAdd" name="enNameAdd" autocomplete="off" class="easyui-validatebox" ondblclick="chooseEnName()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSAdd" name="descSAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgConflictAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveConflictRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgConflictAdd').dialog('close')">取消</a>
</div>
<div id="dgConflictEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgConflictEdit-buttons">
    <form id="fmConflictEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>冲突ID:</td>
                <td style="width:75%" ><input id="idEdit" name="idEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>罪名:</td>
                <td>
                    <select id="caseCauseEdit" name="caseCauseEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100200">通用情节</option>
                        <option value="100201">盗窃罪</option>
                        <option value="100202">妨害公务罪</option>
                        <option value="100203">非法拘禁罪</option>
                        <option value="100204">故意伤害罪</option>
                        <option value="100205">交通肇事罪</option>
                        <option value="100206">聚众斗殴罪</option>
                        <option value="100207">掩饰、隐瞒犯罪所得、犯罪所得收益罪</option>
                        <option value="100208">抢夺罪</option>
                        <option value="100209">强奸罪</option>
                        <option value="100210">抢劫罪</option>
                        <option value="100211">敲诈勒索罪</option>
                        <option value="100212">寻衅滋事罪</option>
                        <option value="100213">诈骗罪</option>
                        <option value="100214">职务侵占罪</option>
                        <option value="100215">走私、贩卖、运输、制造毒品罪</option>
                        <option value="100216">危险驾驶罪</option>
                        <option value="100217">集资诈骗罪</option>
                        <option value="100218">信用卡诈骗罪</option>
                        <option value="100219">合同诈骗罪</option>
                        <option value="100220">非法持有毒品罪</option>
                        <option value="100221">非法吸收公共存款罪</option>
                        <option value="100222">容留他人吸毒罪</option>
                        <option value="100223">引诱、容留、介绍卖淫罪</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">罪名名称:</td>
                <td style="width:75%"><input id="caseCauseNameEdit" name="caseCauseNameEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true" value="" ></td>
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
                        <option value="100108">重庆市</option>
                        <option value="100109">上海市</option>
                        <option value="100110">浙江省</option>
                        <option value="100111">江苏省</option>
                        <option value="100112">吉林省</option>
                        <option value="100113">山西省</option>
                        <option value="100114">陕西省</option>
                        <option value="100115">黑龙江省</option>
                        <option value="100116">河北省</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%" hidden>
                <td style="width:25%" align="right">省份名称:</td>
                <td style="width:75%"><input id="provinceNameEdit" name="provinceNameEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true" value="" ></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%"><input id="enNameEdit" name="enNameEdit" autocomplete="off" class="easyui-validatebox" ondblclick="chooseEnNameE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSEdit" name="descSEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgConflictEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateConflictRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgConflictEdit').dialog('close')">取消</a>
</div>

<div id="factFeatureList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarFactFeature">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idFactFeature" name="idFactFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameFactFeature" name="enNameFactFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
               <td>标准特征:</td>
                <td><input id="standardFactFeature" name="standardFactFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachFactFeature()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectEnName(1)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="factFeatureTable" toolbar="#toolbarFactFeature" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:15%;">事实特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
            <th data-options="field:'caseCause'" style="width:25%;">罪名</th>
        </tr>
        </thead>
    </table>
</div>
<div id="factFeatureListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarFactFeatureE">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idFactFeatureE" name="idFactFeatureE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameFactFeatureE" name="enNameFactFeatureE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>标准特征:</td>
                <td><input id="standardFactFeatureE" name="standardFactFeatureE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachFactFeatureE()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectEnName(2)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="factFeatureTableE" toolbar="#toolbarFactFeatureE" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:15%;">事实特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
            <th data-options="field:'caseCause'" style="width:25%;">罪名</th>
        </tr>
        </thead>
    </table>
</div>

<div id="commonFeatureList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarCommonFeature">
        <table>
            <tr>
                <td>普通特征ID:</td>
                <td><input id="idCommonFeature" name="idCommonFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameCommonFeature" name="enNameCommonFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardCommonFeature" name="standardCommonFeature" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachCommonFeature()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectEnNameC(1)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="commonFeatureTable" toolbar="#toolbarCommonFeature" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:15%;">普通特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
<div id="commonFeatureListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarCommonFeatureE">
        <table>
            <tr>
                <td>普通特征ID:</td>
                <td><input id="idCommonFeatureE" name="idCommonFeatureE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameCommonFeatureE" name="enNameCommonFeatureE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardCommonFeatureE" name="standardCommonFeatureE" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachCommonFeatureE()">查询</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectEnNameC(2)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="commonFeatureTableE" toolbar="#toolbarCommonFeatureE" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:15%;">普通特征ID</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
</body>
<script type="text/javascript">

    $(document).ready(function () {
        initConflictTable();
        $("#caseCauseAdd").combobox({
            onChange: function (record) {
                $("#caseCauseNameAdd").val($("#caseCauseAdd option:selected").text());
            }
        });
        $("#provinceAdd").combobox({
            onChange: function (record) {
                $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
            }
        });
        $("#caseCauseEdit").combobox({
            onChange: function (record) {
                $("#caseCauseNameEdit").val($("#caseCauseEdit option:selected").text());
            }
        });
        $("#provinceEdit").combobox({
            onChange: function (record) {
                $("#provinceNameEdit").val($("#provinceEdit option:selected").text());
            }
        });
    });
    //初始化Conflict表格数据
    function initConflictTable(){

        $('#conflictTable').datagrid({
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
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/conflict/conflictList'
        });
    }
    //初始化标准特征表initFactFeatureTable
    function initFactFeatureTable(){

        $('#factFeatureTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                caseCause:$.getUrlParam('caseCause'), //这里要相同罪名  不区分省
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    //初始化标准特征表initFactFeatureTableE
    function initFactFeatureTableE(){

        $('#factFeatureTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                caseCause:$.getUrlParam('caseCause'), //这里要相同罪名  不区分省
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    //初始化标准特征表initCommonFeatureTable
    function initCommonFeatureTable(){

        $('#commonFeatureTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'

        });
    }
    //初始化标准特征表initCommonFeatureTable
    function initCommonFeatureTableE(){

        $('#commonFeatureTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize:50,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province')
            },
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList'

        });
    }
    function formatOper(val,row,index){
        return '<a href="#" onclick="editConflictRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deleteConflictRule('+index+')">删除</a>';
    }

    function addConflictRule(){

        $('#fmConflict').form('clear');
        $("#caseCauseAdd").combobox('setValue', $.getUrlParam('caseCause'));
        $("#provinceAdd").combobox('setValue', $.getUrlParam('province'));
        $("#caseCauseNameAdd").val($("#caseCauseAdd option:selected").text());
        $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
        if($.getUrlParam('caseCause')=='100200'){
            initCommonFeatureTable();
        }else{
            initFactFeatureTable();
        }

        $('#dgConflictAdd').dialog('open').dialog('setTitle','新建冲突规则');
    }
    //查询规则
    function serachConflictRule(){

        var id = $("#idSearch").val();

        $('#conflictTable').datagrid({
            url: '${pageContext.request.contextPath}/declarationpenalty/declarationPenaltyList',
            queryParams:{
                id:id,
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询标准特征
    function serachFactFeature(){

        var id = $("#idFactFeature").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameFactFeature").val();
        var standardFeature = $("#standardFactFeature").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#factFeatureTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [100,200,500]
        });

    }
    //查询标准特征
    function serachFactFeatureE(){

        var id = $("#idFactFeatureE").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameFactFeatureE").val();
        var standardFeature = $("#standardFactFeatureE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#factFeatureTableE').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [100,200,500]
        });

    }

    //查询规则
    function serachCommonFeature(){
debugger
        var id = $("#idCommonFeature").val();
        var enName = $("#enNameCommonFeature").val();
        var province = $("#provinceAdd").val();
        var standardFeature = $("#standardCommonFeature").val();

        $('#commonFeatureTable').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:province
            },
            pageList: [100,200,500]
        });

    }
    //查询规则
    function serachCommonFeatureE(){

        var id = $("#idCommonFeatureE").val();
        var enName = $("#enNameCommonFeatureE").val();
        var standardFeature = $("#standardCommonFeatureE").val();
        var province = $("#provinceEdit").val();
        $('#commonFeatureTableE').datagrid({
            url: '${pageContext.request.contextPath}/commonfeatures/lxCommonFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:province
            },
            pageList: [100,200,500]
        });

    }

    function deleteConflictRule(index){

        var conflictID = $('#conflictTable').datagrid('getData').rows[index].id;
        $.messager.confirm('Confirm', '确定要删除吗?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{conflictID:conflictID},
                    url: "${pageContext.request.contextPath}/conflict/deleteConflictById",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#conflictTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','冲突规则删除失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });

    }
    function editConflictRule(index){
        if($.getUrlParam('caseCause')=='100200'){
            initCommonFeatureTableE();
        }else{
            initFactFeatureTableE();
        }
        var conflictID = $('#conflictTable').datagrid('getData').rows[index].id;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{conflictID:conflictID},
            url: "${pageContext.request.contextPath}/conflict/findOneConflictById",
            success: function (data) {
                debugger
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmConflictEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                $("#caseCauseEdit").combobox('setValue', data.list[0].caseCauseId);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#enNameEdit").val(data.list[0].enName);
                $("#descSEdit").val(data.list[0].descS);
                $("#idEdit").attr("readOnly","true");
                $('#dgConflictEdit').dialog('open').dialog('setTitle','修改冲突规则');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function chooseEnName(){

        if($("#caseCauseAdd").val() == '100200'){
            $('#commonFeatureTable').datagrid('unselectAll');
            $('#commonFeatureList').dialog('open').dialog('setTitle','普通特征列表');
        }else{
            $('#factFeatureTable').datagrid('unselectAll');
            $('#factFeatureList').dialog('open').dialog('setTitle','事实特征列表');
        }

    }
    function chooseEnNameE(){
        if($("#caseCauseEdit").val() == '100200'){
            $('#commonFeatureTableE').datagrid('unselectAll');
            $('#commonFeatureListE').dialog('open').dialog('setTitle','普通特征列表');
        }else{
            $('#factFeatureTableE').datagrid('unselectAll');
            $('#factFeatureListE').dialog('open').dialog('setTitle','事实特征列表');
        }
    }

    function saveConflictRule() {

        var caseCause = $("#caseCauseAdd").val().trim();
        var province = $("#provinceAdd").val();
        var enName = $("#enNameAdd").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }

        $('#fmConflict').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/conflict/saveConflict",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    $('#dgConflictAdd').dialog('close');		// close the dialog
                    $('#conflictTable').datagrid('reload');	// reload data
                } else {
                    $.messager.alert('提示','冲突规则保存失败！','error');
                }
            }
        });
    }
    function updateConflictRule(){

        var caseCause = $("#caseCauseEdit").val().trim();
        var province = $("#provinceEdit").val();
        var enName = $("#enNameEdit").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!enName){
            $.messager.alert('提示','量刑起点不能为空!','info');
            return;
        }

        $('#fmConflictEdit').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/conflict/updateConflict",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    alert("更新成功");
                    $('#dgConflictEdit').dialog('close');		// close the dialog
                    $('#conflictTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','冲突规则更新失败！','error');
                }
            }
        });
    }


    function selectEnName(num){
        if(num=='1'){
            var selRows = $('#factFeatureTable').datagrid('getSelections');
        }else if(num=='2'){
            var selRows = $('#factFeatureTableE').datagrid('getSelections');
        }
        var selected_codes=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].enName);
        }
        if(num=='1'){
            $('#enNameAdd').val(selected_codes+"");
            $('#factFeatureList').dialog('close');
        }else if(num=='2'){
            $('#enNameEdit').val(selected_codes+"");
            $('#factFeatureListE').dialog('close');
        }

    }
    function selectEnNameC(num){
        if(num=='1'){
            var selRows = $('#commonFeatureTable').datagrid('getSelections');
        }else if(num=='2'){
            var selRows = $('#commonFeatureTableE').datagrid('getSelections');
        }
        var selected_codes=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].enName);
        }
        if(num=='1'){
            $('#enNameAdd').val(selected_codes+"");
            $('#commonFeatureList').dialog('close');
        }else if(num=='2'){
            $('#enNameEdit').val(selected_codes+"");
            $('#commonFeatureListE').dialog('close');
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