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
    <title>事实特征列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addFactFeature()">新增规则</a></td>
            <td>事实特征ID:</td>
            <td><input id="idSearch" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <%--            <td>罪名:</td>
                        <td><input id="caseCauseSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>--%>
            <td>英文名:</td>
            <td><input id="enNameSearch" name="enNameSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td>标准特征:</td>
            <td><input id="standardFeatureSearch" name="standardFeatureSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachFactFeatures()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>

<table id="factFeaturesTable" title="事实特征列表"  toolbar="#toolbar" style="width:100%;height:100%" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:11%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:8%;">事实特征ID</th>
        <th data-options="field:'note',formatter: hoveringShow" style="width:5%;">备注</th>
        <th data-options="field:'standardFeature',formatter: hoveringShow" style="width:15%;">标准特征</th>
        <th data-options="field:'enName',formatter: hoveringShow,sortable:true" style="width:15%;">英文名</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'mappingFeature'" style="width:20%;">映射特征</th>
        <th data-options="field:'valueType'" formatter="formatValueType" style="width:8%;">值类型</th>
        <th data-options="field:'type'" formatter="formatType" style="width:8%;">类型</th>
        <th data-options="field:'unit'" formatter="formatUnit" style="width:5%;">单位</th>
        <th data-options="field:'lxType'" formatter="formatLxType" style="width:9%;">量刑情节适用</th>
        <th data-options="field:'lxPlotType'" formatter="formatLxPlotType" style="width:9%;">量刑情节类型</th>
        <th data-options="field:'minValues'" style="width:10%;">最小值</th>
        <th data-options="field:'maxValues'" style="width:10%;">最大值</th>
        <th data-options="field:'adjustedMaxvalue'" style="width:10%;">调整后最大值</th>
        <th data-options="field:'standardValues'" style="width:10%;">标准值</th>
        <th data-options="field:'startingPointNumber'" style="width:10%;">个罪关联起点号</th>
        <th data-options="field:'parentId'" formatter="formatParentId" style="width:10%;">是否为父节点</th>
        <th data-options="field:'isMultiple'" formatter="formatIsMultiple" style="width:10%;">是否多选</th>
        <%--<th data-options="field:'groupId'" style="width:10%;">父节点ID</th>--%>
        <th data-options="field:'groupIdName'" style="width:10%;">父节点</th>
        <th data-options="field:'lxRely'" style="width:50%;">情节依赖条件</th>
        <th data-options="field:'provinceItem'" style="width:12%;">本省实施细则(行号)</th>
        <th data-options="field:'nationItem'" style="width:15%;">全国量刑指导意见(行号)</th>
        <th data-options="field:'provinceCaseCauseItem'" style="width:15%;">本省本罪名(行号)</th>
        <th data-options="field:'descS'" style="width:20%;">描述</th>

        <th data-options="field:'tip'" style="width:15%;">提示</th>
        <th data-options="field:'caseCause'" style="width:8%;">罪名</th>
        <th data-options="field:'province'" style="width:6%;">省份</th>
        <th data-options="field:'lxOrder'" style="width:5%;">排序</th>
        <th data-options="field:'auditStatus'" formatter="formatAuditStatus" style="width:10%;">审核状态</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'createPerson'" style="width:10%;">创建人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'updatePerson'" style="width:10%;">更新人</th>

    </tr>
    </thead>
</table>

<div id="dgFactAdd" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgFactAdd-buttons">
    <form id="fmFact" method="post">
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
                <td style="width:75%"><input id="caseCauseNameAdd" name="caseCauseNameAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true" value="" ></td>
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
                <td style="width:75%"><input id="provinceNameAdd" name="provinceNameAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true" value="" ></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>标准特征:</td>
                <td style="width:75%"><input id="standardFeatureAdd" name="standardFeatureAdd" class="easyui-validatebox"  autocomplete="off" ondblclick="chooseStandardFeature()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%" ><input id="enNameAdd" name="enNameAdd" class="easyui-validatebox" style="width: 350px;height: 20px;" autocomplete="off" required="true" missingMessage="英文名要以下划线'_'开头和结尾并且遵循驼峰命名规则，<br/>例如交通肇事罪死亡人数:_deathsDriving_"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">映射特征:</td>
                <td style="width:75%"><input id="mappingFeatureAdd" name="mappingFeatureAdd" editable="true" class="easyui-validatebox" autocomplete="off"  ondblclick="chooseMappingFeature()" style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>
<%--            <tr style="width:100%">
                <td style="width:25%" align="right">映射特征中文:</td>
                <td style="width:75%"><input id="mappingFeatureNameAdd" name="mappingFeatureNameAdd" editable="false" class="easyui-validatebox" autocomplete="off" style="width: 350px;height: 20px;" ></td>
            </tr>--%>
            <tr style="width:100%">
                <td style="width:25%" align="right">值类型:</td>
                <td style="width:75%">
                    <select id="valueTypeAdd" name="valueTypeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="boolean">boolean</option>
                        <option value="int">int</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">单位:</td>
                <td style="width:75%">
                    <select id="unitAdd" name="unitAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="z">请选择</option>
                        <option value="元">元</option>
                        <option value="级">级</option>
                        <option value="克">克</option>
                        <option value="辆">辆</option>
                        <option value="处">处</option>
                        <option value="只">只</option>
                        <option value="人">人</option>
                        <option value="时">时</option>
                        <option value="次">次</option>
                        <option value="个月">个月</option>
                        <option value="个">个</option>
                        <option value="件">件</option>
                    </select>

                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">类型:</td>
                <td style="width:75%">
                    <select id="typeAdd" name="typeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">不显示</option>
                        <option value="1">基本犯罪构成事实</option>
                        <option value="2">其他影响犯罪构成事实</option>
                        <option value="4">个罪量刑情节</option>
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
                <td style="width:75%">
                    <select id="lxPlotTypeAdd" name="lxPlotTypeAdd" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">请选择</option>
                        <option value="1">法定从重</option>
                        <option value="2">酌定从重</option>
                        <option value="3">法定从轻</option>
                        <option value="4">法定减轻</option>
                        <option value="5">法定免除</option>
                        <option value="6">酌定从轻</option>
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
                <td style="width:75%"><input id="groupIdAdd" name="groupIdAdd" editable="false" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">父节点名称:</td>
                <td style="width:75%"><input id="groupIdNameAdd" name="groupIdNameAdd" autocomplete="off" ondblclick="chooseParentId()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>

            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="minValuesAdd" name="minValuesAdd" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="maxValuesAdd" name="maxValuesAdd" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">调整后最大值:</td>
                <td style="width:75%"><input id="adjustedMaxvalueAdd" name="adjustedMaxvalueAdd" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">本省本罪名(行号):</td>
                <td style="width:75%"><input id="provinceCaseCauseItemAdd" name="provinceCaseCauseItemAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>个罪关联量刑起点:</td>
                <td style="width:75%"><input id="startingPointNumberAdd" name="startingPointNumberAdd" autocomplete="off" ondblclick="chooseStartPoint()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="clearYes(1)" value="clear">
                                <input type="button" onclick="createsql_a(' and ')" value="and">
                                <input type="button" onclick="createsql_a(' or ')" value="or">
                                <input type="button" onclick="createsql_a('&')" value="&">
                                <input type="button" onclick="createsql_a('|')" value="|">
                                <input type="button" onclick="createsql_a('!')" value="!">
                                <input type="button" onclick="createsql_a('@')" value="@">
                                <input type="button" onclick="createsql_a('#')" value="#">
                                <input type="button" onclick="createsql_a('$')" value="$">
                                <input type="button" onclick="createsql_a('%')" value="%">
                                <input type="button" onclick="createsql_a('^')" value="^">

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="createsql_a('+')" value="+">
                                <input type="button" onclick="createsql_a('-')" value="-">
                                <input type="button" onclick="createsql_a('*')" value="*">
                                <input type="button" onclick="createsql_a('/')" value="/">
                                <input type="button" onclick="createsql_a('==')" value="==">
                                <input type="button" onclick="createsql_a('>')" value=">">
                                <input type="button" onclick="createsql_a('>=')" value=">=">
                                <input type="button" onclick="createsql_a('<')" value="<">
                                <input type="button" onclick="createsql_a('<=')" value="<=">
                                <input type="button" onclick="createsql_a('!=')" value="!=">
                                <input type="button" onclick="createsql_a('(')" value="(">
                                <input type="button" onclick="createsql_a(')')" value=")">
                                <input type="button" onclick="createsql_a('[')" value="[">
                                <input type="button" onclick="createsql_a(']')" value="]">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">情节依赖条件:</td>
                <td style="width:75%">
                    <textarea id="lxRelyAdd" name="lxRelyAdd" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">情节依赖条件中文:</td>
                <td style="width:75%">
                    <textarea id="lxRelyNameAdd" name="lxRelyNameAdd" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSAdd" name="descSAdd" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

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
<div id="dgFactAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveFactFeatures()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgFactAdd').dialog('close')">取消</a>
</div>
<div id="dgFactEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgFactEdit-buttons">
    <form id="fmFactEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>事实特征id:</td>
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
                <td style="width:25%" align="right"><span style="color:red;">*</span>标准特征:</td>
                <td style="width:75%"><input id="standardFeatureEdit" name="standardFeatureEdit" class="easyui-validatebox"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>英文名:</td>
                <td style="width:75%" ><input id="enNameEdit" name="enNameEdit" class="easyui-validatebox" autocomplete="off" style="width: 350px;height: 20px;" required="true" missingMessage="英文名要以下划线'_'开头和结尾并且遵循驼峰命名规则，<br/>例如交通肇事罪死亡人数:_deathsDriving_"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">映射特征:</td>
                <td style="width:75%"><input id="mappingFeatureEdit" name="mappingFeatureEdit" editable="true" autocomplete="off" class="easyui-validatebox" ondblclick="chooseMappingFeatureE()"  style="width: 350px;height: 20px;" missingMessage="请选择和标准特征最相近特征"></td>
            </tr>
<%--            <tr style="width:100%">
                <td style="width:25%" align="right">映射特征中文:</td>
                <td style="width:75%"><input id="mappingFeatureNameEdit" name="mappingFeatureNameEdit" editable="false" autocomplete="off" class="easyui-validatebox"  style="width: 350px;height: 20px;"></td>
            </tr>--%>
            <tr style="width:100%">
                <td style="width:25%" align="right">值类型:</td>
                <td style="width:75%">
                    <select id="valueTypeEdit" name="valueTypeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="boolean">boolean</option>
                        <option value="int">int</option>
                    </select>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">单位:</td>
                <td style="width:75%">
                    <select id="unitEdit" name="unitEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="z">请选择</option>
                        <option value="元">元</option>
                        <option value="级">级</option>
                        <option value="克">克</option>
                        <option value="辆">辆</option>
                        <option value="处">处</option>
                        <option value="只">只</option>
                        <option value="人">人</option>
                        <option value="时">时</option>
                        <option value="次">次</option>
                        <option value="个月">个月</option>
                        <option value="个">个</option>
                        <option value="件">件</option>
                    </select>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">类型:</td>
                <td style="width:75%">
                    <select id="typeEdit" name="typeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">不显示</option>
                        <option value="1">基本犯罪构成事实</option>
                        <option value="2">其他影响犯罪构成事实</option>
                        <option value="4">个罪量刑情节</option>
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
                <td style="width:75%">
                    <select id="lxPlotTypeEdit" name="lxPlotTypeEdit" class="easyui-combobox" style="width: 350px;height: 20px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;">
                        <option value="0">请选择</option>
                        <option value="1">法定从重</option>
                        <option value="2">酌定从重</option>
                        <option value="3">法定从轻</option>
                        <option value="4">法定减轻</option>
                        <option value="5">法定免除</option>
                        <option value="6">酌定从轻</option>
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
            <tr style="width:100%" editable="false">
                <td style="width:25%" align="right">父节点ID:</td>
                <td style="width:75%"><input id="groupIdEdit" name="groupIdEdit" editable="false" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">父节点名称:</td>
                <td style="width:75%"><input id="groupIdNameEdit" name="groupIdNameEdit" autocomplete="off" ondblclick="chooseParentIdE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="minValuesEdit" name="minValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="maxValuesEdit" name="maxValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">调整后最大值:</td>
                <td style="width:75%"><input id="adjustedMaxvalueEdit" name="adjustedMaxvalueEdit" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">本省本罪名(行号):</td>
                <td style="width:75%"><input id="provinceCaseCauseItemEdit" name="provinceCaseCauseItemEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>个罪关联量刑起点:</td>
                <td style="width:75%"><input id="startingPointNumberEdit" name="startingPointNumberEdit" autocomplete="off" ondblclick="chooseStartPointE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="clearYes(2)" value="clear">
                                <input type="button" onclick="createsql_e(' and ')" value="and">
                                <input type="button" onclick="createsql_e(' or ')" value="or">
                                <input type="button" onclick="createsql_e('&')" value="&">
                                <input type="button" onclick="createsql_e('|')" value="|">
                                <input type="button" onclick="createsql_e('!')" value="!">
                                <input type="button" onclick="createsql_e('@')" value="@">
                                <input type="button" onclick="createsql_e('#')" value="#">
                                <input type="button" onclick="createsql_e('$')" value="$">
                                <input type="button" onclick="createsql_e('%')" value="%">
                                <input type="button" onclick="createsql_e('^')" value="^">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="createsql_e('+')" value="+">
                                <input type="button" onclick="createsql_e('-')" value="-">
                                <input type="button" onclick="createsql_e('*')" value="*">
                                <input type="button" onclick="createsql_e('/')" value="/">
                                <input type="button" onclick="createsql_e('==')" value="==">
                                <input type="button" onclick="createsql_e('>')" value=">">
                                <input type="button" onclick="createsql_e('>=')" value=">=">
                                <input type="button" onclick="createsql_e('<')" value="<">
                                <input type="button" onclick="createsql_e('<=')" value="<=">
                                <input type="button" onclick="createsql_e('!=')" value="!=">
                                <input type="button" onclick="createsql_e('(')" value="(">
                                <input type="button" onclick="createsql_e(')')" value=")">
                                <input type="button" onclick="createsql_e('[')" value="[">
                                <input type="button" onclick="createsql_e(']')" value="]">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">情节依赖条件:</td>
                <td style="width:75%">
                    <textarea id="lxRelyEdit" name="lxRelyEdit" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">情节依赖条件中文:</td>
                <td style="width:75%">
                    <textarea id="lxRelyNameEdit" name="lxRelyNameEdit" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSEdit" name="descSEdit" style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

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
<div id="dgFactEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateFactFeature()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgFactEdit').dialog('close')">取消</a>
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
<div id="standardFeatureList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarStandardFeature">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idStandardFeature" name="idStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameStandardFeature" name="enNameStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchS" name="standardFeatureSearchS" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachStandardFeature()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="standardFeatureTable" toolbar="#toolbarStandardFeature" style="width:100%;height:100%" >
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
            <th data-options="field:'unit'" formatter="formatUnit" style="width:8%;">单位</th>
            <th data-options="field:'lxType'" formatter="formatLxType" style="width:15%;">量刑类型</th>
            <th data-options="field:'minValues'" style="width:20%;">最小值</th>
            <th data-options="field:'maxValues'" style="width:20%;">最大值</th>
            <th data-options="field:'lxRely'" style="width:50%;">情节依赖条件</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
            <th data-options="field:'caseCause'" style="width:25%;">罪名</th>
        </tr>
        </thead>
    </table>
</div>

<div id="lxRelyConditionList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarLxRely">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idLxRely" name="idLxRely" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameLxRely" name="enNameLxRely" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchL" name="standardFeatureSearchL" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachLxRely()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="lxRelyConditionTable" toolbar="#toolbarLxRely"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:20%;">事实特征ID</th>
            <th data-options="field:'enName',sortable:true" style="width:30%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:30%;">标准特征</th>
            <th data-options="field:'caseCause'" style="width:10%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
<div id="lxRelyConditionListEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarLxRelyE">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idLxRelyE" name="idLxRely" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameLxRelyE" name="enNameLxRely" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchE" name="standardFeatureSearchL" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachLxRelyE()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="lxRelyConditionTableEdit" toolbar="#toolbarLxRelyE"  style="width:100%;height:300px" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:20%;">事实特征ID</th>
            <th data-options="field:'enName',sortable:true" style="width:30%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:30%;">标准特征</th>
            <th data-options="field:'caseCause'" style="width:10%;">罪名</th>
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
                <td><input id="idGroup" name="idStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameGroup" name="enNameStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureGroup" name="standardFeatureGroup" autocomplete="off" style="width:150px;height: 20px;"/></td>
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
            <th data-options="field:'caseCause'" style="width:10%;">罪名</th>
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
                <td><input id="idGroupE" name="idStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameGroupE" name="enNameStandardFeature" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureGroupE" name="standardFeatureGroupE" autocomplete="off" style="width:150px;height: 20px;"/></td>
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
            <th data-options="field:'caseCause'" style="width:10%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>

        </tr>
        </thead>
    </table>
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
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectStartNumber(1)">确定</a></td>
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
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="selectStartNumber(2)">确定</a></td>
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

        initFactFeaturesTable();
        initStandardFeaturesTable();
        initMappingFeaturesTable();
        initMappingFeaturesTableE();
        initLxRelyConditionTable();
        initLxRelyConditionTableEdit();
        initParentIdTable();
        initParentIdTableE();
        initStartPointTable();
        initStartPointTableE();
        $("#valueTypeAdd").combobox({
            onChange: function (record) {
                debugger
                if(!$("#valueTypeAdd").val()||$("#valueTypeAdd").val() == '0'){
                    $("#unitAdd").combobox({disabled:true});
                    $("#unitAdd").attr("value","z");
                }else if($("#valueTypeAdd").val()||$("#valueTypeAdd").val() == 'int'){
                    $("#unitAdd").combobox({disabled:false});
                    $("#unitAdd").attr("value","z");
                }
            }
        });
        $("#valueTypeEdit").combobox({

            onChange: function (record) {
                if(!$("#valueTypeEdit").val()||$("#valueTypeEdit").val() == '0'){
                    $("#unitEdit").combobox({disabled:true});
                    $("#unitEdit").attr("value","z");
                }else if($("#valueTypeEdit").val()||$("#valueTypeEdit").val() == 'int'){
                    $("#unitEdit").combobox({disabled:false});
                    $("#unitEdit").attr("value","z");
                }
            }
        });
        $("#parentIdAdd").combobox({
            onChange: function (record) {
                if(!$("#parentIdAdd").val()||$("#parentIdAdd").val() == '0'){
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
        $("#typeAdd").combobox({
            onChange: function (record) {
                if(!$("#typeAdd").val()||$("#typeAdd").val() == '4'){
                    $("#startingPointNumberAdd").attr("disabled", false);
                }else{
                    $("#startingPointNumberAdd").attr("disabled", true);
                }
            }
        });
        $("#typeEdit").combobox({
            onChange: function (record) {
                if(!$("#typeEdit").val()||$("#typeEdit").val() == '4'){
                    $("#startingPointNumberEdit").attr("disabled", false);
                }else{
                    $("#startingPointNumberEdit").attr("disabled", true);
                }
            }
        });
    });
    //初始化FactFeatures表格数据
    function initFactFeaturesTable(){

        $('#factFeaturesTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
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
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            onLoadSuccess: function(data){
                $("#factFeaturesTable").datagrid("resize",{
                    height: ($(window).height())
                });
            }

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
    //初始化标准特征表
    function initStandardFeaturesTable(){

        $('#standardFeatureTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
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
            queryParams:{
                caseCause:$.getUrlParam('caseCause') //这里要相同罪名  不区分省
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    //初始化量刑依赖条件
    function initLxRelyConditionTable(){

        $('#lxRelyConditionTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onLxRelyConditionClickRow,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    function initLxRelyConditionTableEdit(){

        $('#lxRelyConditionTableEdit').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onLxRelyConditionClickRowEdit,
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
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    //初始化ParentId
    function initParentIdTable(){

        $('#parentIdTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
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
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    function initParentIdTableE(){

        $('#parentIdTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
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
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

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
        return '<a href="#" onclick="editFactFeature('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleFactFeature('+index+')">删除</a>'+'&nbsp;&nbsp;&nbsp;'+'<a href="#" onclick="audit('+index+')">审核</a>';
    }
    function formatValueType(val,row){
        if (val == 'boolean'){
            return 'boolean';
        }else if(val == 'int'){
            return 'int';
        }else{
            return val;
        }
    }
    function formatType(val,row){
        if (val == '0'){
            return '不显示';
        }else if(val == '1'){
            return '基本犯罪构成事实';
        }else if(val == '2'){
            return '其他影响犯罪构成事实';
        }else if(val == '4'){
            return '个罪量刑情节';
        }else{
            return val;
        }
    }

    function formatUnit(val,row){
        if (val == 'z'){
            return '请选择';
        }else if(val == '元'){
            return '元';
        }else if(val == '级'){
            return '级';
        }else if(val == '克'){
            return '克';
        }else if(val == '辆'){
            return '辆';
        }else if(val == '处'){
            return '处';
        }else if(val == '只'){
            return '只';
        }else if(val == '人'){
            return '人';
        }else if(val == '时'){
            return '时';
        }else if(val == '次'){
            return '次';
        }else if(val == '个月'){
            return '个月';
        }else if(val == '个'){
            return '个';
        }else if(val == '件'){
            return '件';
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
            return '无下级';
        }else if(val == '1'){
            return '有下级';
        }else if(val == '2'){
            return '请选择';
        }else{
            return val;
        }
    }
    function formatIsMultiple(val,row){
        if (val == '0'){
            return '是';
        }else if(val == '1'){
            return '否';
        }else if(val == '2'){
            return '请选择';
        }else{
            return val;
        }
    }
    function formatAuditStatus(val,row){
        if (val == '0'){
            return '<font style="color:red;">未审核</font>';
        }else if(val == '1'){
            return '<font style="color:greenyellow;">已审核</font>';
        }else{
            return val;
        }
    }

    function addFactFeature(){
        debugger
        $('#fmFact').form('clear');

        $("#caseCauseAdd").combobox('setValue', $.getUrlParam('caseCause'));
        $("#provinceAdd").combobox('setValue', $.getUrlParam('province'));
        //alert($("#caseCauseAdd option:selected").text());
        $("#caseCauseNameAdd").val($("#caseCauseAdd option:selected").text());
        $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
        $("#parentIdAdd").combobox('setValue', '2');
        $("#unitAdd").combobox('setValue', 'z');
        //获取序号
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{caseCause:$.getUrlParam('caseCause'),province:$.getUrlParam('province')},
            url: "${pageContext.request.contextPath}/features/getAddMaxLxOrderFactFeature",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if(!data.list[0] || !data.list[0].lxOrder){
                    $("#lxOrderAdd").val("1");
                }else{
                    $("#lxOrderAdd").val(data.list[0].lxOrder);
                }

            },
            error: function () {
                alert("发生错误");
            }
        })


        $('#dgFactAdd').dialog('open').dialog('setTitle','新建事实特征');

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
                caseCause:caseCause
            },
            pageList: [50]
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
                caseCause:caseCause
            },
            pageList: [50]
        });

    }
    //查询标准特征
    function serachStandardFeature(){

        var id = $("#idStandardFeature").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameStandardFeature").val();
        var standardFeature = $("#standardFeatureSearchS").val();
        $('#standardFeatureTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:$.getUrlParam('caseCause')
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询标准特征
    function serachFactFeatures(){

        var id = $("#idSearch").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameSearch").val();
        var standardFeature = $("#standardFeatureSearch").val();
        $('#factFeaturesTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            pageList: [10,20,30,40,50]
        });

    }

    //查询量刑依赖
    function serachLxRely(){

        var id = $("#idLxRely").val();
        var enName = $("#enNameLxRely").val();
        var standardFeature = $("#standardFeatureSearchL").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#lxRelyConditionTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询量刑依赖
    function serachLxRelyE(){

        var id = $("#idLxRelyE").val();
        var enName = $("#enNameLxRelyE").val();
        var standardFeature = $("#standardFeatureSearchE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#lxRelyConditionTableEdit').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

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
    //查询ParentIs
    function serachParentId(){

        var id = $("#idGroup").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameGroup").val();
        var standardFeature = $("#standardFeatureGroup").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#parentIdTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
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
        var standardFeature = $("#standardFeatureGroupE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#parentIdTableE').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,30,40,50]
        });

    }

    function audit(){
        alert("审核");
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
    function createsql_a(text){
        $("#lxRelyAdd").insertAtCaret(text);
        $("#lxRelyNameAdd").insertAtCaret(text);
    }
    function createsql_e(text){
        $("#lxRelyEdit").insertAtCaret(text);
        $("#lxRelyNameEdit").insertAtCaret(text);
    }
    function clearYes(num){
        if(num=='1'){
            $('#lxRelyAdd').val('');
            $('#lxRelyNameAdd').val('');
        }else if(num=='2'){
            $('#lxRelyEdit').val('');
            $('#lxRelyNameEdit').val('');
        }

    }
    function find(str,cha,num){
        var x=str.indexOf(cha);
        for(var i=0;i<num;i++){
            x=str.indexOf(cha,x+1);
        }
        return x;
    }
    function CheckYou(cs){
        //var regu = "^([u4e00-u9fa5]|[0-9a-zA-Z|[\x21-\x7e]])+$";
        var regu = "^[?=\x21-\x7eA-Za-z0-9]+[?=\x21-\x7eA-Za-z0-9\\s]*[?=\x21-\x7eA-Za-z0-9]+$";
        var re = new RegExp(regu);
        if (cs.search(re) != -1)
        {
            return true;
        } else {
            return false;
        }
    }
    function saveFactFeatures() {
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        var enName = $("#enNameAdd").val().trim();
        var standardFeature = $("#standardFeatureAdd").val();
        var valueType = $("#valueTypeAdd").val();
        var unit = $("#unitAdd").val();
        var type = $("#typeAdd").val();
        var conditions = $("#lxRelyAdd").val();
        if(!type){
            $.messager.alert('提示','类型不能为空!','info');
            return;
        }
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }
        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }
        // 判断英文名首尾只能为_
        if(type=='4'){
            if(!(enName.substr(0, 1) == '_') || !(enName.substr(-3) == 'Lx_')){
                $.messager.alert('提示','英文名必须以_开头以Lx_结尾!','info');
                return;
            }
        }else{
            if(!(enName.substr(0, 1) == '_') || !(enName.substr(-5) == 'Fact_')){
                $.messager.alert('提示','英文名必须以_开头以Fact_结尾!','info');
                return;
            }
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
        if(!valueType){
            $.messager.alert('提示','值类型不能为空!','info');
            return;
        }
        if(valueType=='1' && unit=='z'){
            $.messager.alert('提示','请选择对应的单位!','info');
            return;
        }
        if(conditions.indexOf("__") >= 0){
            $.messager.alert('提示','量刑依赖条件中_不能连续出现!','info');
            return;
        }
        if(conditions !='' && conditions.length>1){
            if(!CheckYou(conditions)){
                $.messager.alert('提示','您输入的量刑依赖含有中文输入法或特殊字符，请仔细检查！','info');
                return;
            }else{
                var message ='';
                var featuresArray = new Array();
                var enNameCounts = 0;
                while (conditions.indexOf('_') >= 0){
                    var num = find(conditions,'_',1);
                    if(num<0){
                        $.messager.alert('提示','您情节依赖条件中的_不完全匹配!','info');
                        return;
                    }
                    var cutFeature  = conditions.substring(conditions.indexOf('_'),num+1);
                    var remainFeatures = conditions.substring(num+1,conditions.length);
                    featuresArray.push(cutFeature);
                    conditions = remainFeatures;
                }
                for(var i=0;i<featuresArray.length;i++){
                    var enName = featuresArray[i];
                    $.ajax({
                        type: 'POST',
                        dataType: "json",
                        async :false,
                        data:{enName:featuresArray[i],type:type},
                        url: "${pageContext.request.contextPath}/features/isEnNameExist",
                        success: function (data) {
                            if(data && data.type!='' && data.type=='sessiontimeout'){
                                alert("Session超时，请重新登陆");
                                window.location.href = '<%=contextPath%>/system/login';
                                return;
                            }
                            if (data){
                                enNameCounts = data.list.length;
                                if(enNameCounts<1){
                                    message += enName + ',';
                                }
                            }
                        },
                        error: function () {
                            alert("发生错误");
                        }
                    })
                }

                if(type=='4' && message!=''){
                    $.messager.alert('提示',message+'等个罪情节不存在！','info');
                    return;
                }else if((type=='0'||type=='1'||type=='2') && message!=''){
                    $.messager.alert('提示',message+'等事实情节不存在！','info');
                    return;
                }else{

                }

            }
        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的量刑依赖不合法，请仔细检查！','info');
            return;
        }else{

        }
        var enNameCount = 0;
        var chiNameCount = 0;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{enName:enName,type:type,province:province,caseCause:caseCause},
            url: "${pageContext.request.contextPath}/features/isEnNameExist",
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
                        $.ajax({
                            type: 'POST',
                            dataType: "json",
                            async :false,
                            data:{standardFeature:standardFeature,type:type,province:province,caseCause:caseCause},
                            url: "${pageContext.request.contextPath}/features/isChiNameExist",
                            success: function (data) {
                                if(data && data.type!='' && data.type=='sessiontimeout'){
                                    alert("Session超时，请重新登陆");
                                    window.location.href = '<%=contextPath%>/system/login';
                                    return;
                                }
                                if (data){
                                    chiNameCount = data.list.length;
                                    if(chiNameCount>0){
                                        $.messager.alert('提示','标准特征已存在，请重新填写!','info');
                                        return;
                                    }else{
                                        $('#fmFact').form('submit',{
                                            dataType:"json",
                                            async:false,
                                            url: "${pageContext.request.contextPath}/features/saveFactFeatures",
                                            onSubmit: function(){
                                                return $(this).form('validate');
                                            },
                                            success: function(result){
                                                debugger
                                                if (result){
                                                    $('#dgFactAdd').dialog('close');		// close the dialog
                                                    $('#factFeaturesTable').datagrid('reload');	// reload data
                                                } else {
                                                    $.messager.alert('提示','事实特征保存失败！','error');
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
                }
            },
            error: function () {
                alert("发生错误");
            }
        })

    }

    function chooseMappingFeature(){
        //$('#mappingFeatureTable').datagrid('clearChecked')='none';
        $('#mappingFeatureTable').datagrid('unselectAll');
        $('#mappingFeatureList').dialog('open').dialog('setTitle','映射特征列表');
    }
    function chooseMappingFeatureE(){
        debugger
        $('#mappingFeatureTableE').datagrid('unselectAll');
        var mappingFeature = $('#mappingFeatureEdit').val();
        $('#mappingFeatureTableE').combobox('setValues',mappingFeature.split(","));
        $('#mappingFeatureListE').dialog('open').dialog('setTitle','映射特征列表');
    }
    function chooseStandardFeature(){
        $('#standardFeatureList').dialog('open').dialog('setTitle','标准特征列表');
    }
    function chooseStartPoint(){
        $('#startPointTable').datagrid('unselectAll');
        $('#startPointList').dialog('open').dialog('setTitle','量刑起点列表');
    }
    function chooseStartPointE(){
        $('#startPointTableE').datagrid('unselectAll');
        $('#startPointListE').dialog('open').dialog('setTitle','量刑起点列表');
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
        //$("#unitAdd").val(record.unit);
        //$("#typeAdd").val(record.type);
        //$("#lxTypeAdd").val(record.lxType);
        $("#minValuesAdd").val(record.minValues);
        $("#maxValuesAdd").val(record.maxValues);
        $("#lxRelyAdd").val(record.lxRely);
        $("#parentIdAdd").combobox('setValue', record.parentId);
        $("#isMultipleAdd").combobox('setValue', record.isMultiple);
        $("#groupIdAdd").val(record.groupId);
        $("#descSAdd").val(record.descS);


        $('#standardFeatureList').dialog('close');
    }
    /*    function chooseStandardFeatureCondition(){
            $('#lxRelyConditionList').dialog('open').dialog('setTitle','标准特征列表');
        }
        function chooseStandardFeatureConditionEdit(){
            $('#lxRelyConditionListEdit').dialog('open').dialog('setTitle','标准特征列表');
        }*/
    function chooseParentId(){
        $('#parentIdList').dialog('open').dialog('setTitle','标准特征列表');
    }
    function chooseParentIdE(){
        $('#parentIdListE').dialog('open').dialog('setTitle','标准特征列表');
    }
    /*    function onMappingClickRow(rowNum,record){
            $("#mappingFeatureAdd").val(record.name);
            $('#mappingFeatureList').dialog('close');
        }*/
    /*    function onMappingClickRowE(rowNum,record){
            $("#mappingFeatureEdit").val(record.name);
            $('#mappingFeatureListE').dialog('close');
        }*/

    function onLxRelyConditionClickRow(rowNum,record){
        $("#lxRelyAdd").insertAtCaret(record.enName);
        $("#lxRelyNameAdd").insertAtCaret(record.standardFeature);
        $('#lxRelyConditionList').dialog('close');
    }
    function onLxRelyConditionClickRowEdit(rowNum,record){
        $("#lxRelyEdit").insertAtCaret(record.enName);
        $("#lxRelyNameEdit").insertAtCaret(record.standardFeature);
        $('#lxRelyConditionListEdit').dialog('close');
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
    //删除
    function deteleFactFeature(index){
        var factFeatureID = $('#factFeaturesTable').datagrid('getData').rows[index].id;
        var type = $('#factFeaturesTable').datagrid('getData').rows[index].type;
        $.messager.confirm('Confirm', '确定要删除么?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{factFeatureID:factFeatureID,type:type},
                    url: "${pageContext.request.contextPath}/features/deteleFactFeature",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#factFeaturesTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','事实特征删除失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });


    }
    //编辑
    function editFactFeature(index){
        var factFeatureID = $('#factFeaturesTable').datagrid('getData').rows[index].id;
        var type = $('#factFeaturesTable').datagrid('getData').rows[index].type;

        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{factFeatureID:factFeatureID,type:type},
            url: "${pageContext.request.contextPath}/features/findOneFeatureById",
            success: function (data) {
                console.log(data);
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmFactEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                $("#caseCauseEdit").combobox('setValue', data.list[0].caseCauseId);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#enNameEdit").val(data.list[0].enName);
                $("#standardFeatureEdit").val(data.list[0].standardFeature);
                $("#mappingFeatureEdit").val(data.list[0].mappingFeature);
                $("#mappingFeatureNameEdit").val(data.list[0].mappingFeatureName);
                $("#valueTypeEdit").combobox('setValue', data.list[0].valueType);
                $("#typeEdit").combobox('setValue', data.list[0].type);
                $("#unitEdit").combobox('setValue', data.list[0].unit);
                $("#lxOrderEdit").val(data.list[0].lxOrder);
                $("#lxRelyEdit").val(data.list[0].lxRely);
                $("#lxRelyNameEdit").val(data.list[0].lxRelyName);
                $("#parentIdEdit").combobox('setValue', data.list[0].parentId);
                $("#lxTypeEdit").combobox('setValue', data.list[0].lxType);
                $("#lxPlotTypeEdit").combobox('setValue', data.list[0].lxPlotType);
                $("#isMultipleEdit").combobox('setValue', data.list[0].isMultiple);
                $("#groupIdEdit").val(data.list[0].groupId);
                $("#groupIdNameEdit").val(data.list[0].groupIdName);
                $("#descSEdit").val(data.list[0].descS);
                $("#startingPointNumberEdit").val(data.list[0].startPointNumber);
                $("#minValuesEdit").val(data.list[0].minValues);
                $("#maxValuesEdit").val(data.list[0].maxValues);
                $("#adjustedMaxvalueEdit").val(data.list[0].adjustedMaxvalue);
                $("#provinceItemEdit").val(data.list[0].provinceItem);
                $("#nationItemEdit").val(data.list[0].nationItem);
                $("#provinceCaseCauseItemEdit").val(data.list[0].provinceCaseCauseItem);
                $("#noteEdit").val(data.list[0].note);
                $("#tipEdit").val(data.list[0].tip);
                $("#idEdit").attr("readOnly","true");
                $('#dgFactEdit').dialog('open').dialog('setTitle','修改事实特征');

            },
            error: function () {
                alert("发生错误");
            }
        })


    }
    function updateFactFeature(){
        debugger
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        var enName = $("#enNameEdit").val();
        var standardFeature = $("#standardFeatureEdit").val();
        //var mappingFeature = $("#mappingFeatureEdit").val();
        var valueType = $("#valueTypeEdit").val();
        var unit = $("#unitEdit").val();
        var type = $("#typeEdit").val();
        var conditions = $("#lxRelyEdit").val();
        if(!type){
            $.messager.alert('提示','类型不能为空!','info');
            return;
        }
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!enName){
            $.messager.alert('提示','英文名不能为空!','info');
            return;
        }
        // 判断英文名首尾只能为_
        if(type=='4'){
            if(!(enName.substr(0, 1) == '_') || !(enName.substr(-3) == 'Lx_')){
                $.messager.alert('提示','英文名必须以_开头以Lx_结尾!','info');
                return;
            }
        }else{
            if(!(enName.substr(0, 1) == '_') || !(enName.substr(-5) == 'Fact_')){
                $.messager.alert('提示','英文名必须以_开头以Fact_结尾!','info');
                return;
            }
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

        if(!valueType){
            $.messager.alert('提示','值类型不能为空!','info');
            return;
        }
        if(valueType=='1' && unit=='z'){
            $.messager.alert('提示','请选择对应的单位!','info');
            return;
        }
        if(conditions.indexOf("__") >= 0){
            $.messager.alert('提示','量刑依赖条件中_不能连续出现!','info');
            return;
        }

        if(conditions !='' && conditions.length>1){
            if(!CheckYou(conditions)){
                $.messager.alert('提示','您输入的量刑依赖含有中文输入法或特殊字符，请仔细检查！','info');
                return;
            }else{
                debugger
                var message ='';
                var featuresArray = new Array();
                var enNameCounts = 0;
                while (conditions.indexOf('_') >= 0){
                    var num = find(conditions,'_',1);
                    if(num<0){
                        $.messager.alert('提示','您条件中的_不完全匹配!','info');
                        return;
                    }
                    var cutFeature  = conditions.substring(conditions.indexOf('_'),num+1);
                    var remainFeatures = conditions.substring(num+1,conditions.length);
                    featuresArray.push(cutFeature);
                    conditions = remainFeatures;
                }
                for(var i=0;i<featuresArray.length;i++){
                    var enName = featuresArray[i];
                    $.ajax({
                        type: 'POST',
                        dataType: "json",
                        async :false,
                        data:{enName:featuresArray[i],type:type},
                        url: "${pageContext.request.contextPath}/features/isEnNameExist",
                        success: function (data) {
                            if(data && data.type!='' && data.type=='sessiontimeout'){
                                alert("Session超时，请重新登陆");
                                window.location.href = '<%=contextPath%>/system/login';
                                return;
                            }
                            if (data){
                                enNameCounts = data.list.length;
                                if(enNameCounts<1){
                                    message += enName + ',';
                                }
                            }
                        },
                        error: function () {
                            alert("发生错误");
                        }
                    })
                }

                if(type=='4' && message!=''){
                    $.messager.alert('提示',message+'等个罪情节不存在！','info');
                    return;
                }else if((type=='0'||type=='1'||type=='2') && message!=''){
                    $.messager.alert('提示',message+'等事实情节不存在！','info');
                    return;
                }else{

                }

            }
        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的量刑依赖不合法，请仔细检查！','info');
            return;
        }else{

        }

        var enNameCountEdit = 0;
        var chiNameCountEdit = 0;
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{enName:enName,type:type,province:province,caseCause:caseCause},
            url: "${pageContext.request.contextPath}/features/isEnNameExist",
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
                        $.ajax({
                            type: 'POST',
                            dataType: "json",
                            async :false,
                            data:{standardFeature:standardFeature,type:type,province:province,caseCause:caseCause},
                            url: "${pageContext.request.contextPath}/features/isChiNameExist",
                            success: function (data) {
                                if(data && data.type!='' && data.type=='sessiontimeout'){
                                    alert("Session超时，请重新登陆");
                                    window.location.href = '<%=contextPath%>/system/login';
                                    return;
                                }
                                if (data){
                                    chiNameCountEdit = data.list.length;
                                    if(chiNameCountEdit>1){
                                        $.messager.alert('提示','标准特征已存在，请重新填写!','info');
                                        return;
                                    }else{

                                        $('#fmFactEdit').form('submit',{
                                            dataType:"json",
                                            async:false,
                                            url: "${pageContext.request.contextPath}/features/updateFactFeatureById",
                                            onSubmit: function(){
                                                return $(this).form('validate');
                                            },
                                            success: function(result){
                                                if (result){
                                                    alert("事实特征更新成功");
                                                    $('#dgFactEdit').dialog('close');		// close the dialog
                                                    $('#factFeaturesTable').datagrid('reload');
                                                } else {
                                                    $.messager.alert('提示','事实特征更新失败！','error');
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
        var selected_codesname=[];
        for(var k=0;k<selRows.length;k++){
            selected_codes.push(selRows[k].code);
            selected_codesname.push(selRows[k].name);
        }
        if(num=='1'){
            $('#mappingFeatureAdd').val(selected_codes+"");
            $('#mappingFeatureNameAdd').val(selected_codesname+"");
            $('#mappingFeatureList').dialog('close');
        }else if(num=='2'){
            $('#mappingFeatureEdit').val(selected_codes+"");
            $('#mappingFeatureNameEdit').val(selected_codesname+"");
            $('#mappingFeatureListE').dialog('close');
        }

    }

    function selectStartNumber(num){
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
            $('#startingPointNumberAdd').val(selected_codes+"");
            $('#startPointList').dialog('close');
        }else if(num=='2'){
            $('#startingPointNumberEdit').val(selected_codes+"");
            $('#startPointListE').dialog('close');
        }

    }

    //lxRelyAdd右击事件
    $("#lxRelyAdd").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#lxRelyConditionList').dialog('open').dialog('setTitle','标准特征列表');
    });
    //lxRelyEdit右击事件
    $("#lxRelyEdit").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#lxRelyConditionListEdit').dialog('open').dialog('setTitle','标准特征列表');
    });
    function hoveringShow(value) {
        return "<span title='" + value + "'>" + value + "</span>";
    }

    (function($){
        $.getUrlParam = function(name)
        {
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r!=null) return unescape(r[2]); return null;
        }
    })(jQuery);

    (function($){
        $.fn.extend({
            insertAtCaret: function(myValue){
                var $t=$(this)[0];
                if (document.selection) {
                    this.focus();
                    sel = document.selection.createRange();
                    sel.text = myValue;
                    this.focus();
                }
                else
                if ($t.selectionStart || $t.selectionStart == '0') {
                    var startPos = $t.selectionStart;
                    var endPos = $t.selectionEnd;
                    var scrollTop = $t.scrollTop;
                    $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
                    this.focus();
                    $t.selectionStart = startPos + myValue.length;
                    $t.selectionEnd = startPos + myValue.length;
                    $t.scrollTop = scrollTop;
                }
                else {
                    this.value += myValue;
                    if(myValue!=" '' ")
                        this.focus();
                }
            }
        })
    })(jQuery);

</script>
</html>