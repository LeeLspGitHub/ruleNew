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
    <title>法定刑列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addDeclarationPenaltyRule()">新增规则</a></td>
            <td>法定刑ID:</td>
            <td><input id="idSearch" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachDeclarationPenaltyRule()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>
<table id="declarationPenaltyTable" title="法定刑列表" toolbar="#toolbar" style="width:100%;height:500px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:9%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:8%;">法定刑ID</th>
        <th data-options="field:'caseCause'" style="width:10%;">罪名</th>
        <th data-options="field:'province'" style="width:10%;">省份</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'startNumber'" style="width:8%;">量刑起点号</th>
        <th data-options="field:'lxCondition'" style="width:8%;">跳档条件</th>
        <th data-options="field:'lminValue'" style="width:30%;">最小值</th>
        <th data-options="field:'lmaxValue'" style="width:20%;">最大值</th>
        <th data-options="field:'lstandardValue'" style="width:8%;">标准值</th>
        <th data-options="field:'uminValue'" style="width:12%;">当前法定刑最小值</th>
        <th data-options="field:'umaxValue'" style="width:15%;">当前法定刑最大值</th>
        <th data-options="field:'lxFlckTrue'" style="width:20%;">跳档描述</th>
        <th data-options="field:'lxFlckFalse'" style="width:20%;">不跳档描述</th>
        <th data-options="field:'descS'" style="width:20%;">描述</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'createPerson'" style="width:10%;">创建人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'updatePerson'" style="width:10%;">更新人</th>
    </tr>
    </thead>
</table>

<div id="dgDeclarationPenaltyAdd" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgDeclarationPenaltyAdd-buttons">
    <form id="fmDeclarationPenalty" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>罪名:</td>
                <td>
                    <select id="caseCauseAdd" name="caseCauseAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100200">不限</option>
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
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑起点:</td>
                <td style="width:75%"><input id="startNumberAdd" name="startNumberAdd" autocomplete="off" class="easyui-validatebox" ondblclick="chooseStartNumber()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="lMinValueAdd" name="lMinValueAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="lMaxValueAdd" name="lMaxValueAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">当前法定刑最小值:</td>
                <td style="width:75%"><input id="uMinValueAdd" name="uMinValueAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">当前法定刑最大值:</td>
                <td style="width:75%"><input id="uMaxValueAdd" name="uMaxValueAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">跳档条件:</td>
                <td style="width:75%">
                    <textarea id="lxConditionAdd" name="lxConditionAdd"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">跳档描述:</td>
                <td style="width:75%">
                    <textarea id="lxFlckTrueAdd" name="lxFlckTrueAdd"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">不跳档描述:</td>
                <td style="width:75%">
                    <textarea id="lxFlckFalseAdd" name="lxFlckFalseAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">法定刑描述:</td>
                <td style="width:75%">
                    <textarea id="descSAdd" name="descSAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgDeclarationPenaltyAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveDeclarationPenaltyRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgDeclarationPenaltyAdd').dialog('close')">取消</a>
</div>
<div id="dgDeclarationPenaltyEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgDeclarationPenaltyEdit-buttons">
    <form id="fmDeclarationPenaltyEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>法定刑ID:</td>
                <td style="width:75%" ><input id="idEdit" name="idEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>罪名:</td>
                <td>
                    <select id="caseCauseEdit" name="caseCauseEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="100200">不限</option>
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
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑起点:</td>
                <td style="width:75%"><input id="startNumberEdit" name="startNumberEdit" autocomplete="off" class="easyui-validatebox" ondblclick="chooseStartNumberE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="lMinValueEdit" name="lMinValueEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="lMaxValueEdit" name="lMaxValueEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">当前法定刑最小值:</td>
                <td style="width:75%"><input id="uMinValueEdit" name="uMinValueEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">当前法定刑最大值:</td>
                <td style="width:75%"><input id="uMaxValueEdit" name="uMaxValueEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">跳档条件:</td>
                <td style="width:75%">
                    <textarea id="lxConditionEdit" name="lxConditionEdit"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">跳档描述:</td>
                <td style="width:75%">
                    <textarea id="lxFlckTrueEdit" name="lxFlckTrueEdit"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">不跳档描述:</td>
                <td style="width:75%">
                    <textarea id="lxFlckFalseEdit" name="lxFlckFalseEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">法定刑描述:</td>
                <td style="width:75%">
                    <textarea id="descSEdit" name="descSEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dgDeclarationPenaltyEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateDeclarationPenaltyRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgDeclarationPenaltyEdit').dialog('close')">取消</a>
</div>

<div id="startPointList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarStartPoint">
        <table>
            <tr>
               <td>起点ID:</td>
                <td><input id="idStartPoint" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <%--            <td>罪名:</td>
                            <td><input id="caseCauseSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>
                            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachStartPointRule()">查询规则</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectCodes(1)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="startPointTable" toolbar="#toolbarStartPoint" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:8%;">起点ID</th>
            <th data-options="field:'descS'" style="width:20%;">描述</th>
            <th data-options="field:'number'" style="width:10%;">量刑起点号</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'conditions'" style="width:20%;">条件</th>
            <th data-options="field:'minValues'" style="width:10%;">最小值</th>
            <th data-options="field:'maxValues'" style="width:10%;">最大值</th>
            <th data-options="field:'standardValues'" style="width:10%;">标准值</th>
            <th data-options="field:'provinceItem'" style="width:20%;">本省实施细则(行号)</th>
            <th data-options="field:'nationItem'" style="width:23%;">全国量刑指导意见(行号)</th>

            <th data-options="field:'caseCause',sortable:true" style="width:10%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>


        </tr>
        </thead>
    </table>
</div>
<div id="startPointListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarStartPointE">
        <table>
            <tr>
                <td>起点ID:</td>
                <td><input id="idStartPointE" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <%--            <td>罪名:</td>
                            <td><input id="caseCauseSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>
                            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachStartPointRuleE()">查询规则</a></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectCodes(2)">确定</a></td>
            </tr>
        </table>
    </div>
    <table id="startPointTableE" toolbar="#toolbarStartPointE" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th field="ck" checkbox="true"></th>
            <th data-options="field:'id',sortable:true" style="width:8%;">起点ID</th>
            <th data-options="field:'descS'" style="width:20%;">描述</th>
            <th data-options="field:'number'" style="width:10%;">量刑起点号</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'conditions'" style="width:20%;">条件</th>
            <th data-options="field:'minValues'" style="width:10%;">最小值</th>
            <th data-options="field:'maxValues'" style="width:10%;">最大值</th>
            <th data-options="field:'standardValues'" style="width:10%;">标准值</th>
            <th data-options="field:'provinceItem'" style="width:20%;">本省实施细则(行号)</th>
            <th data-options="field:'nationItem'" style="width:23%;">全国量刑指导意见(行号)</th>
            <th data-options="field:'caseCause',sortable:true" style="width:10%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>

</body>
<script type="text/javascript">

    $(document).ready(function () {
        initDeclarationPenaltyTable();
        initStartPointTable();
        initStartPointTableE();

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
    //初始化DeclarationPenalty表格数据
    function initDeclarationPenaltyTable(){

        $('#declarationPenaltyTable').datagrid({
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
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/declarationpenalty/declarationPenaltyList'
        });
    }

    //初始化StartPoint表格数据
    function initStartPointTable(){

        $('#startPointTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onStartPointClickRow,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/startpoint/startPointList'
        });
    }
    //初始化StartPoint表格数据E
    function initStartPointTableE(){

        $('#startPointTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            //onClickRow:onStartPointClickRowE,
            singleSelect: false,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 50,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/startpoint/startPointList'
        });
    }

    function formatOper(val,row,index){
        return '<a href="#" onclick="editDeclarationPenaltyRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deleteDeclarationPenaltyRule('+index+')">删除</a>';
    }

    function addDeclarationPenaltyRule(){

        $('#fmDeclarationPenalty').form('clear');
        $("#caseCauseAdd").combobox('setValue', $.getUrlParam('caseCause'));
        $("#provinceAdd").combobox('setValue', $.getUrlParam('province'));
        $("#caseCauseNameAdd").val($("#caseCauseAdd option:selected").text());
        $("#provinceNameAdd").val($("#provinceAdd option:selected").text());

        $('#dgDeclarationPenaltyAdd').dialog('open').dialog('setTitle','新建法定刑规则');
    }
    //查询规则
    function serachDeclarationPenaltyRule(){

        var id = $("#idSearch").val();

        $('#declarationPenaltyTable').datagrid({
            url: '${pageContext.request.contextPath}/declarationpenalty/declarationPenaltyList',
            queryParams:{
                id:id,
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            pageList: [10,20,30,40,50]
        });

    }

    function deleteDeclarationPenaltyRule(index){

        var declarationPenaltyID = $('#declarationPenaltyTable').datagrid('getData').rows[index].id;
        $.messager.confirm('Confirm', '确定要删除吗?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{declarationPenaltyID:declarationPenaltyID},
                    url: "${pageContext.request.contextPath}/declarationpenalty/deleteDeclarationPenaltyById",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#declarationPenaltyTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','法定刑删除失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });

    }
    function editDeclarationPenaltyRule(index){
debugger
        var declarationPenaltyID = $('#declarationPenaltyTable').datagrid('getData').rows[index].id;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{declarationPenaltyID:declarationPenaltyID},
            url: "${pageContext.request.contextPath}/declarationpenalty/findOneBenchMarkPointRuleById",
            success: function (data) {
                debugger
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmDeclarationPenaltyEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                debugger
                $("#caseCauseEdit").combobox('setValue', data.list[0].caseCauseId);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#startNumberEdit").val(data.list[0].startNumber);
                $("#lMinValueEdit").val(data.list[0].lminValue);
                $("#lMaxValueEdit").val(data.list[0].lmaxValue);
                $("#uMinValueEdit").val(data.list[0].uminValue);
                $("#uMaxValueEdit").val(data.list[0].umaxValue);
                $("#lxConditionEdit").val(data.list[0].lxCondition);
                $("#lxFlckTrueEdit").val(data.list[0].lxFlckTrue);
                $("#lxFlckFalseEdit").val(data.list[0].lxFlckFalse);
                $("#descSEdit").val(data.list[0].descS);
                $("#idEdit").attr("readOnly","true");
                $('#dgDeclarationPenaltyEdit').dialog('open').dialog('setTitle','修改法定刑规则');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function chooseStartNumber(){
        $('#startPointTable').datagrid('unselectAll');
        $('#startPointList').dialog('open').dialog('setTitle','量刑起点列表');
    }
    function chooseStartNumberE(){
        $('#startPointTableE').datagrid('unselectAll');
        $('#startPointListE').dialog('open').dialog('setTitle','量刑起点列表');
    }
    //查询规则
    function serachStartPointRule(){
        var id = $("#idStartPoint").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#startPointTable').datagrid({
            url: '${pageContext.request.contextPath}/startpoint/startPointList',
            queryParams:{
                id:id,
                caseCause:caseCause,
                province:province
            },
            pageList: [50]
        });

    }
    //查询规则
    function serachStartPointRuleE(){

        var id = $("#idStartPointE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#startPointTableE').datagrid({
            url: '${pageContext.request.contextPath}/startpoint/startPointList',
            queryParams:{
                id:id,
                caseCause:caseCause,
                province:province
            },
            pageList: [50]
        });

    }

    function saveDeclarationPenaltyRule() {

        var caseCause = $("#caseCauseAdd").val().trim();
        var province = $("#provinceAdd").val();
        var startNumber = $("#startNumberAdd").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!startNumber){
            $.messager.alert('提示','量刑起点不能为空!','info');
            return;
        }

        $('#fmDeclarationPenalty').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/declarationpenalty/saveDeclarationPenalty",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    $('#dgDeclarationPenaltyAdd').dialog('close');		// close the dialog
                    $('#declarationPenaltyTable').datagrid('reload');	// reload data
                } else {
                    $.messager.alert('提示','法定刑保存失败！','error');
                }
            }
        });
    }
    function updateDeclarationPenaltyRule(){

        var caseCause = $("#caseCauseEdit").val().trim();
        var province = $("#provinceEdit").val();
        var startNumber = $("#startNumberEdit").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!startNumber){
            $.messager.alert('提示','量刑起点不能为空!','info');
            return;
        }

        $('#fmDeclarationPenaltyEdit').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/declarationpenalty/updateDeclarationPenalty",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    alert("更新成功");
                    $('#dgDeclarationPenaltyEdit').dialog('close');		// close the dialog
                    $('#declarationPenaltyTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','法定刑更新失败！','error');
                }
            }
        });
    }

    function selectCodes(num){
        if(num=='1'){
            var selRows = $('#startPointTable').datagrid('getSelections');
        }else if(num=='2'){
            var selRows = $('#startPointTableE').datagrid('getSelections');
        }
        var selected_codes=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].number);
        }
        if(num=='1'){
            $('#startNumberAdd').val(selected_codes+"");
            $('#startPointList').dialog('close');
        }else if(num=='2'){
            $('#startNumberEdit').val(selected_codes+"");
            $('#startPointListE').dialog('close');
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