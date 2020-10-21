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
    <title>基准刑规则列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBenchmarkPointRule()">新增规则</a></td>
            <td>基准刑ID:</td>
            <td><input id="idSearch" name="idSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td>量刑英文名:</td>
            <td><input id="lxEnNameSearch" name="lxEnNameSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
            <td>量刑中文名:</td>
            <td><input id="lxChiNameSearch" name="lxChiNameSearch" autocomplete="off" style="width:150px;height: 20px;"/></td>
<%--            <td>罪名:</td>
            <td><input id="caseCauseSearch" name="caseCauseSearch" style="width:150px;height: 20px;"/></td>
            <td>省份:</td>
            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachBenchmarkPointRule()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>
<table id="benchMarkPointTable" title="基准刑规则列表" toolbar="#toolbar" style="width:100%;height:500px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:9%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:8%;">基准刑ID</th>
        <th data-options="field:'note',formatter: hoveringShow" style="width:5%;">备注</th>
        <th data-options="field:'lxChiName',formatter: hoveringShow" style="width:10%;">量刑中文名</th>
        <th data-options="field:'lxEnName',formatter: hoveringShow" style="width:10%;">量刑英文名</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'startingPointNumber'" style="width:8%;">量刑起点号</th>
        <th data-options="field:'minValues'" style="width:8%;">最小值</th>
        <th data-options="field:'maxValues'" style="width:8%;">最大值</th>
        <th data-options="field:'conditions'" formatter="formatType" style="width:30%;">条件</th>
        <th data-options="field:'lxRely'" style="width:30%;">量刑依赖</th>
        <th data-options="field:'provinceItem'" style="width:12%;">本省实施细则(行号)</th>
        <th data-options="field:'nationItem'" style="width:15%;">全国量刑指导意见(行号)</th>
        <th data-options="field:'descS'" style="width:20%;">描述</th>

        <th data-options="field:'tip'" style="width:20%;">提示</th>
        <th data-options="field:'caseCause',sortable:true" style="width:15%;">罪名</th>
        <th data-options="field:'province'" style="width:6%;">省份</th>
        <th data-options="field:'number'" style="width:8%;">排序</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'createPerson'" style="width:10%;">创建人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'updatePerson'" style="width:10%;">更新人</th>
        <th data-options="field:'auditStatus'" style="width:10%;">审核状态</th>
    </tr>
    </thead>
</table>

<div id="dgBenchmarkPointAdd" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgBenchmarkPointAdd-buttons">
    <form id="fmBenchmarkPoint" method="post">
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
                <td style="width:75%"><input id="startingPointNumberAdd" name="startingPointNumberAdd" autocomplete="off" class="easyui-validatebox" ondblclick="chooseStartPoint()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑英文名:</td>
                <td style="width:75%"><input id="lxEnNameAdd" name="lxEnNameAdd" class="easyui-validatebox" autocomplete="off"  style="width: 350px;height: 20px;" ondblclick="chooseEnNameFromFact(0)" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑中文名:</td>
                <td style="width:75%"><input id="lxChiNameAdd" name="lxChiNameAdd" class="easyui-validatebox" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">基准刑最小值:</td>
                <td style="width:75%"><input id="minValuesAdd" name="minValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">基准刑最大值:</td>
                <td style="width:75%"><input id="maxValuesAdd" name="maxValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最终最小值:</td>
                <td style="width:75%"><input id="endMinValuesAdd" name="endMinValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最终最大值:</td>
                <td style="width:75%"><input id="endMaxValuesAdd" name="endMaxValuesAdd" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">条件:</td>
                <td style="width:75%">
                    <textarea id="conditionsAdd" name="conditionsAdd"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">条件中文:</td>
                <td style="width:75%">
                    <textarea id="conditionsNameAdd" name="conditionsNameAdd"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSAdd" name="descSAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>

            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="clearYesR(1)" value="clear">
                                <input type="button" onclick="createsql_r(' and ')" value="and">
                                <input type="button" onclick="createsql_r(' or ')" value="or">
                                <input type="button" onclick="createsql_r('&')" value="&">
                                <input type="button" onclick="createsql_r('|')" value="|">
                                <input type="button" onclick="createsql_r('!')" value="!">
                                <input type="button" onclick="createsql_r('@')" value="@">
                                <input type="button" onclick="createsql_r('#')" value="#">
                                <input type="button" onclick="createsql_r('$')" value="$">
                                <input type="button" onclick="createsql_r('%')" value="%">
                                <input type="button" onclick="createsql_r('^')" value="^">
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
                                <input type="button" onclick="createsql_r('+')" value="+">
                                <input type="button" onclick="createsql_r('-')" value="-">
                                <input type="button" onclick="createsql_r('*')" value="*">
                                <input type="button" onclick="createsql_r('/')" value="/">
                                <input type="button" onclick="createsql_r('==')" value="==">
                                <input type="button" onclick="createsql_r('>')" value=">">
                                <input type="button" onclick="createsql_r('>=')" value=">=">
                                <input type="button" onclick="createsql_r('<')" value="<">
                                <input type="button" onclick="createsql_r('<=')" value="<=">
                                <input type="button" onclick="createsql_r('!=')" value="!=">
                                <input type="button" onclick="createsql_r('(')" value="(">
                                <input type="button" onclick="createsql_r(')')" value=")">
                                <input type="button" onclick="createsql_r('[')" value="[">
                                <input type="button" onclick="createsql_r(']')" value="]">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑依赖:</td>
                <td style="width:75%">
                    <textarea id="lxRelyAdd" name="lxRelyAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑依赖中文:</td>
                <td style="width:75%">
                    <textarea id="lxRelyNameAdd" name="lxRelyNameAdd"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

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
                <td style="width:25%" align="right">序号:</td>
                <td style="width:75%"><input id="numberAdd" name="numberAdd" class="easyui-validatebox" style="width: 350px;height: 20px;" ></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgBenchmarkPointAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveBenchmarkPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgBenchmarkPointAdd').dialog('close')">取消</a>
</div>
<div id="dgBenchmarkPointEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgBenchmarkPointEdit-buttons">
    <form id="fmBenchmarkPointEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>基准刑ID:</td>
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
                <td style="width:75%"><input id="startingPointNumberEdit" name="startingPointNumberEdit" autocomplete="off" class="easyui-validatebox" ondblclick="chooseStartPointE()" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑英文名:</td>
                <td style="width:75%"><input id="lxEnNameEdit" name="lxEnNameEdit" class="easyui-validatebox" autocomplete="off" ondblclick="chooseEnNameFromFact(1)"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>量刑中文名:</td>
                <td style="width:75%"><input id="lxChiNameEdit" name="lxChiNameEdit" class="easyui-validatebox" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>

            <tr style="width:100%">
                <td style="width:25%" align="right">基准刑最小值:</td>
                <td style="width:75%"><input id="minValuesEdit" name="minValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">基准刑最大值:</td>
                <td style="width:75%"><input id="maxValuesEdit" name="maxValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最终最小值:</td>
                <td style="width:75%"><input id="endMinValuesEdit" name="endMinValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最终最大值:</td>
                <td style="width:75%"><input id="endMaxValuesEdit" name="endMaxValuesEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">条件:</td>
                <td style="width:75%">
                    <textarea id="conditionsEdit" name="conditionsEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">条件中文:</td>
                <td style="width:75%">
                    <textarea id="conditionsNameEdit" name="conditionsNameEdit"   style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">描述:</td>
                <td style="width:75%">
                    <textarea id="descSEdit" name="descSEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td colspan="2" style="width:100%">
                    <table>
                        <tr>
                            <td>
                                <input type="button" onclick="clearYesR(2)" value="clear">
                                <input type="button" onclick="createsql_re(' and ')" value="and">
                                <input type="button" onclick="createsql_re(' or ')" value="or">
                                <input type="button" onclick="createsql_re('&')" value="&">
                                <input type="button" onclick="createsql_re('|')" value="|">
                                <input type="button" onclick="createsql_re('!')" value="!">
                                <input type="button" onclick="createsql_re('@')" value="@">
                                <input type="button" onclick="createsql_re('#')" value="#">
                                <input type="button" onclick="createsql_re('$')" value="$">
                                <input type="button" onclick="createsql_re('%')" value="%">
                                <input type="button" onclick="createsql_re('^')" value="^">
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
                                <input type="button" onclick="createsql_re('+')" value="+">
                                <input type="button" onclick="createsql_re('-')" value="-">
                                <input type="button" onclick="createsql_re('*')" value="*">
                                <input type="button" onclick="createsql_re('/')" value="/">
                                <input type="button" onclick="createsql_re('==')" value="==">
                                <input type="button" onclick="createsql_re('>')" value=">">
                                <input type="button" onclick="createsql_re('>=')" value=">=">
                                <input type="button" onclick="createsql_re('<')" value="<">
                                <input type="button" onclick="createsql_re('<=')" value="<=">
                                <input type="button" onclick="createsql_re('!=')" value="!=">
                                <input type="button" onclick="createsql_re('(')" value="(">
                                <input type="button" onclick="createsql_re(')')" value=")">
                                <input type="button" onclick="createsql_re('[')" value="[">
                                <input type="button" onclick="createsql_re(']')" value="]">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑依赖:</td>
                <td style="width:75%">
                    <textarea id="lxRelyEdit" name="lxRelyEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">量刑依赖中文:</td>
                <td style="width:75%">
                    <textarea id="lxRelyNameEdit" name="lxRelyNameEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

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
                <td style="width:25%" align="right">序号:</td>
                <td style="width:75%"><input id="numberEdit" name="numberEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" ></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgBenchmarkPointEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateBenchmarkPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgBenchmarkPointEdit').dialog('close')">取消</a>
</div>

<div id="benchMarkPointList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarBenchMarkPointList">
        <table>
            <tr>
               <td>基准刑ID:</td>
                <td><input id="idSearchL" name="idSearchL" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>量刑英文名:</td>
                <td><input id="lxEnNameSearchL" name="lxEnNameSearchL" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>量刑中文名:</td>
                <td><input id="lxChiNameSearchL" name="lxChiNameSearchL" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachBenchmarkPointListRule()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="benchMarkPointListTable" toolbar="#toolbarBenchMarkPointList" style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:8%;">基准刑ID</th>
            <th data-options="field:'lxChiName'" style="width:15%;">量刑中文名</th>
            <th data-options="field:'lxEnName'" style="width:15%;">量刑英文名</th>
        </tr>
        </thead>
        <thead>
        <tr>

            <th data-options="field:'minValues'" style="width:8%;">最小值</th>
            <th data-options="field:'maxValues'" style="width:8%;">最大值</th>
            <th data-options="field:'conditions'" formatter="formatType" style="width:30%;">条件</th>
            <th data-options="field:'lxRely'" style="width:30%;">量刑依赖</th>
            <th data-options="field:'descS'" style="width:20%;">描述</th>
            <th data-options="field:'startingPointNumber'" style="width:12%;">量刑起点号</th>
            <th data-options="field:'note'" style="width:20%;">备注</th>
            <th data-options="field:'tip'" style="width:20%;">提示</th>
            <th data-options="field:'caseCause',sortable:true" style="width:15%;">罪名</th>
            <th data-options="field:'province'" style="width:6%;">省份</th>
            <th data-options="field:'number'" style="width:8%;">排序</th>
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
                <td>描述:</td>
                <td><input id="descSearch" name="descSearch" style="width:150px;height: 20px;"/></td>
                <%--            <td>省份:</td>
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
            <th data-options="field:'descS',formatter: hoveringShow" style="width:20%;">描述</th>
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
            <th data-options="field:'descS',formatter: hoveringShow" style="width:20%;">描述</th>
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
<div id="conditionList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarCondition">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idCondition" name="idCondition" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameCondition" name="enNameCondition" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchC" name="standardFeatureSearchC" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachCondition()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="conditionTable" toolbar="#toolbarCondition"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:25%;">事实特征ID</th>
            <th data-options="field:'caseCause'" style="width:25%;">罪名</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:25%;">标准特征</th>
        </tr>
        </thead>
    </table>
</div>
<div id="conditionListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarConditionE">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idConditionE" name="idCondition" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameConditionE" name="enNameCondition" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureSearchE" name="standardFeatureSearchC" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachConditionE()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="conditionTableE" toolbar="#toolbarConditionE"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:25%;">事实特征ID</th>
            <th data-options="field:'caseCause'" style="width:25%;">罪名</th>
            <th data-options="field:'enName',sortable:true" style="width:25%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:25%;">标准特征</th>
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
                <td><input id="standardFeatureSearchRE" name="standardFeatureSearchRE" autocomplete="off" style="width:150px;height: 20px;"/></td>
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

<div id="enNameFromFactList" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarEnNameFromFact">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idEnNameFromFact" name="idEnNameFromFact" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameFromFact" name="enNameFromFact" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureEnNameFromFact" name="standardFeatureEnNameFromFact" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachEnNameFromFact()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="enNameFromFactTable" toolbar="#toolbarEnNameFromFact"  style="width:100%;height:100%" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:12%;">事实特征ID</th>
            <th data-options="field:'enName',sortable:true" style="width:20%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'type'" formatter="formatType" style="width:20%;">类型</th>
            <th data-options="field:'lxRely'" style="width:50%;">情节依赖条件</th>
            <th data-options="field:'descS'" style="width:20%;">描述</th>
            <th data-options="field:'caseCause'" style="width:20%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
<div id="enNameFromFactListE" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px" closed="true">
    <div id="toolbarEnNameFromFactE">
        <table>
            <tr>
                <td>事实特征ID:</td>
                <td><input id="idEnNameFromFactE" name="idEnNameFromFactE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <td>英文名:</td>
                <td><input id="enNameFromFactE" name="enNameFromFactE" autocomplete="off" style="width:100px;height: 20px;"/></td>
                <%--            <td>省份:</td>
                            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
                <td>标准特征:</td>
                <td><input id="standardFeatureEnNameFromFactE" name="standardFeatureEnNameFromFactE" autocomplete="off" style="width:150px;height: 20px;"/></td>
                <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachEnNameFromFactE()">查询</a></td>
            </tr>
        </table>
    </div>
    <table id="enNameFromFactTableE" toolbar="#toolbarEnNameFromFactE"  style="width:100%;height:300px" >
        <thead frozen="true">
        <tr>
            <th data-options="field:'id',sortable:true" style="width:12%;">事实特征ID</th>
            <th data-options="field:'enName',sortable:true" style="width:20%;">英文名</th>
            <th data-options="field:'standardFeature'" style="width:20%;">标准特征</th>
        </tr>
        </thead>
        <thead>
        <tr>
            <th data-options="field:'type'" formatter="formatType" style="width:20%;">类型</th>
            <th data-options="field:'lxRely'" style="width:50%;">情节依赖条件</th>
            <th data-options="field:'descS'" style="width:20%;">描述</th>
            <th data-options="field:'caseCause'" style="width:20%;">罪名</th>
            <th data-options="field:'province'" style="width:10%;">省份</th>
        </tr>
        </thead>
    </table>
</div>
</body>
<script type="text/javascript">

    $(document).ready(function () {
        initBenchMarkPointTable();
        initBenchMarkPointTableL();
        initStartPointTable();
        initStartPointTableE();
        initConditionTable();
        initConditionTableE();
        initLxRelyConditionTable();
        initLxRelyConditionTableEdit();

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
    //初始化BenchMarkPoint表格数据
    function initBenchMarkPointTable(){

        $('#benchMarkPointTable').datagrid({
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
            url: '${pageContext.request.contextPath}/benchmarkpoint/benchmarkPointList'
        });
    }
    //初始化BenchMarkPointL表格数据
    function initBenchMarkPointTableL(){

        $('#benchMarkPointListTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            singleSelect: true,
            onClickRow:onBenchMarkPointLClickRow,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/benchmarkpoint/benchmarkPointList'
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
    //初始化Condition条件
    function initConditionTable(){

        $('#conditionTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onConditionClickRow,
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
    //初始化ConditionE条件
    function initConditionTableE(){

        $('#conditionTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onConditionClickRowE,
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

    //初始化量刑依赖条件
    function initEnNameFromFactTable(){

        $('#enNameFromFactTable').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onEnNameFromFactTableClickRow,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                type:'2',
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')  //这里需要本省 同罪名
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }
    function initEnNameFromFactTableE(){

        $('#enNameFromFactTableE').datagrid({
            nowrap: true,
            autoRowHeight: true,
            striped: true,
            fitColumns: true,
            fit: true,
            border: false,
            idField: 'id',
            selectOnCheck: true,
            onClickRow:onEnNameFromFactTableClickRowE,
            singleSelect: true,
            width:'100%' ,
            resizable:true,
            pagination: true,
            pageSize: 10,
            rowNumbers: false,
            queryParams:{
                type:'2',
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            url: '${pageContext.request.contextPath}/features/factFeaturesList'

        });
    }

    function formatOper(val,row,index){
        return '<a href="#" onclick="editBenchMarkPointRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleBenchMarkPointRule('+index+')">删除</a>';
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
        if (val == '10'){
            return '0';
        }else if(val == '20'){
            return '1';
        }else if(val == '30'){
            return '2';
        }else{
            return val;
        }
    }

    function addBenchmarkPointRule(){

        $('#fmBenchmarkPoint').form('clear');
        $("#caseCauseAdd").combobox('setValue', $.getUrlParam('caseCause'));
        $("#provinceAdd").combobox('setValue', $.getUrlParam('province'));
        $("#caseCauseNameAdd").val($("#caseCauseAdd option:selected").text());
        $("#provinceNameAdd").val($("#provinceAdd option:selected").text());
        //获取序号
        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{caseCause:$.getUrlParam('caseCause'),province:$.getUrlParam('province')},
            url: "${pageContext.request.contextPath}/benchmarkpoint/getAddMaxLxOrderBenchmarkPointRule",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                if(!data.list[0] || !data.list[0].number){
                    $("#numberAdd").val("1");
                    $("#numberAdd").attr("readOnly","true");
                }else{
                    $("#numberAdd").val(data.list[0].number);
                    $("#numberAdd").attr("readOnly","true");
                }

            },
            error: function () {
                alert("发生错误");
            }
        })
        $('#dgBenchmarkPointAdd').dialog('open').dialog('setTitle','新建基准刑规则');
    }
    //查询规则
    function serachBenchmarkPointRule(){

        var id = $("#idSearch").val();
        var lxEnName = $("#lxEnNameSearch").val();
        var lxChiName = $("#lxChiNameSearch").val();

        $('#benchMarkPointTable').datagrid({
            url: '${pageContext.request.contextPath}/benchmarkpoint/benchmarkPointList',
            queryParams:{
                id:id,
                lxEnName:lxEnName,
                lxChiName:lxChiName,
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
            },
            pageList: [10,20,30,40,50]
        });

    }
    //查询规则L
    function serachBenchmarkPointListRule(){

        var id = $("#idSearchL").val();
        var lxEnName = $("#lxEnNameSearchL").val();
        var lxChiName = $("#lxChiNameSearchL").val();
        var caseCause = $("#caseCauseAdd").val();
        $('#benchMarkPointListTable').datagrid({
            url: '${pageContext.request.contextPath}/benchmarkpoint/benchmarkPointList',
            queryParams:{
                id:id,
                lxEnName:lxEnName,
                lxChiName:lxChiName,
                caseCause:caseCause
            },
            pageList: [10,20,30,40,50]
        });

    }

    //查询量刑依赖
    function serachCondition(){

        var id = $("#idCondition").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameCondition").val();
        var standardFeature = $("#standardFeatureSearchC").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#conditionTable').datagrid({
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
    function serachConditionE(){

        var id = $("#idConditionE").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameConditionE").val();
        var standardFeature = $("#standardFeatureSearchE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#conditionTableE').datagrid({
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

    function deteleBenchMarkPointRule(index){

        var benchMarkPointID = $('#benchMarkPointTable').datagrid('getData').rows[index].id;
        $.messager.confirm('Confirm', '确定要删除吗?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{benchMarkPointID:benchMarkPointID},
                    url: "${pageContext.request.contextPath}/benchmarkpoint/deteleBenchMarkPointRule",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#benchMarkPointTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','基准规则删除失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });

    }
    function editBenchMarkPointRule(index){

        var benchMarkPointID = $('#benchMarkPointTable').datagrid('getData').rows[index].id;

        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{benchMarkPointID:benchMarkPointID},
            url: "${pageContext.request.contextPath}/benchmarkpoint/findOneBenchMarkPointRuleById",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmBenchmarkPointEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                $("#caseCauseEdit").combobox('setValue', data.list[0].caseCauseId);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#startingPointNumberEdit").val(data.list[0].startingPointNumber);
                $("#numberEdit").val(data.list[0].number);
                $("#minValuesEdit").val(data.list[0].minValues);
                $("#maxValuesEdit").val(data.list[0].maxValues);
                $("#endMinValuesEdit").val(data.list[0].endMinValues);
                $("#endMaxValuesEdit").val(data.list[0].endMaxValues);
                $("#conditionsEdit").val(data.list[0].conditions);
                $("#conditionsNameEdit").val(data.list[0].conditionsName);
                $("#lxEnNameEdit").val(data.list[0].lxEnName);
                $("#lxChiNameEdit").val(data.list[0].lxChiName);
                $("#lxRelyEdit").val(data.list[0].lxRely);
                $("#lxRelyNameEdit").val(data.list[0].lxRelyName);
                $("#descSEdit").val(data.list[0].descS);
                $("#noteEdit").val(data.list[0].note);
                $("#tipEdit").val(data.list[0].tip);
                $("#provinceItemEdit").val(data.list[0].provinceItem);
                $("#nationItemEdit").val(data.list[0].nationItem);
                $("#idEdit").attr("readOnly","true");
                $("#numberEdit").attr("readOnly","true");
                $('#dgBenchmarkPointEdit').dialog('open').dialog('setTitle','修改基准规则');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function chooseStartPoint(){
        $('#startPointTable').datagrid('unselectAll');
        $('#startPointList').dialog('open').dialog('setTitle','量刑起点列表');
    }
    function chooseStartPointE(){
        $('#startPointTableE').datagrid('unselectAll');
        $('#startPointListE').dialog('open').dialog('setTitle','量刑起点列表');
    }
    function chooseBenchmarkPointL(){
        $('#benchMarkPointList').dialog('open').dialog('setTitle','标准特征列表');
    }
    function onBenchMarkPointLClickRow(rowNum,record){
        $("#lxEnNameAdd").val(record.lxEnName);
        $("#lxChiNameAdd").val(record.lxChiName);
        $("#conditionsAdd").val(record.conditions);
        $("#minValuesAdd").val(record.minValues);
        $("#maxValuesAdd").val(record.maxValues);
        $("#lxRelyAdd").val(record.lxRely);
        $("#descSAdd").val(record.descS);
        $('#benchMarkPointList').dialog('close');
    }
    function chooseEnNameFromFact(num){
        if(num == '0'){
            initEnNameFromFactTable();
            $('#enNameFromFactList').dialog('open').dialog('setTitle','标准特征列表');
        }else if (num == '1'){
            initEnNameFromFactTableE();
            $('#enNameFromFactListE').dialog('open').dialog('setTitle','标准特征列表');
        }
    }
    function onEnNameFromFactTableClickRow(rowNum,record) {
        $("#lxEnNameAdd").val(record.enName);
        $("#lxChiNameAdd").val(record.standardFeature);
        $("#lxRelyAdd").val(record.lxRely);
        $('#enNameFromFactList').dialog('close');
    }
    function onEnNameFromFactTableClickRowE(rowNum,record) {
        $("#lxEnNameEdit").val(record.enName);
        $("#lxChiNameEdit").val(record.standardFeature);
        $("#lxRelyEdit").val(record.lxRely);
        $('#enNameFromFactListE').dialog('close');
    }

    function createsql_a(text){
        $("#conditionsAdd").insertAtCaret(text);
        $("#conditionsNameAdd").insertAtCaret(text);
    }
    function createsql_e(text){
        $("#conditionsEdit").insertAtCaret(text);
        $("#conditionsNameEdit").insertAtCaret(text);
    }
    function createsql_r(text){
        $("#lxRelyAdd").insertAtCaret(text);
        $("#lxRelyNameAdd").insertAtCaret(text);
    }
    function createsql_re(text){
        $("#lxRelyEdit").insertAtCaret(text);
        $("#lxRelyNameEdit").insertAtCaret(text);
    }

    function onConditionClickRow(rowNum,record){
        $("#conditionsAdd").insertAtCaret(record.enName);
        $("#conditionsNameAdd").insertAtCaret(record.standardFeature);
        $('#conditionList').dialog('close');
    }
    function onConditionClickRowE(rowNum,record){
        $("#conditionsEdit").insertAtCaret(record.enName);
        $("#conditionsNameEdit").insertAtCaret(record.standardFeature);
        $('#conditionListE').dialog('close');
    }
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
    //查询规则
    function serachStartPointRule(){
        var id = $("#idStartPoint").val();
        var descS = $("#descSearch").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#startPointTable').datagrid({
            url: '${pageContext.request.contextPath}/startpoint/startPointList',
            queryParams:{
                id:id,
                descS:descS,
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
    //查询量刑依赖
    function serachLxRely(){

        var id = $("#idLxRely").val();
        //var caseCause = $("#caseCauseSearch").val();
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
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameLxRelyE").val();
        var standardFeature = $("#standardFeatureSearchRE").val();
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
    //查询事实特征英文名
    function serachEnNameFromFact(){

        var id = $("#idEnNameFromFact").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameFromFact").val();
        var standardFeature = $("#standardFeatureEnNameFromFact").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#enNameFromFactTable').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                type:'2',
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,50,100]
        });

    }
    //查询事实特征英文名
    function serachEnNameFromFactE(){

        var id = $("#idEnNameFromFactE").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameFromFactE").val();
        var standardFeature = $("#standardFeatureEnNameFromFactE").val();
        var caseCause = $("#caseCauseEdit").val();
        var province = $("#provinceEdit").val();
        $('#enNameFromFactTableE').datagrid({
            url: '${pageContext.request.contextPath}/features/factFeaturesList',
            queryParams:{
                id:id,
                enName:enName,
                type:'2',
                standardFeature:standardFeature,
                caseCause:caseCause,
                province:province
            },
            pageList: [10,20,50,100]
        });

    }
    //查询标准特征 不用了
    function serachStandardFeature(){

        var id = $("#idStandardFeature").val();
        //var caseCause = $("#caseCauseSearch").val();
        var enName = $("#enNameStandardFeature").val();
        var standardFeature = $("#standardFeatureSearchB").val();
        var caseCause = $("#caseCauseAdd").val();
        var province = $("#provinceAdd").val();
        $('#standardFeatureTable').datagrid({
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
    function saveBenchmarkPointRule() {

        var caseCause = $("#caseCauseAdd").val().trim();
        var province = $("#provinceAdd").val();
        var startingPointNumber = $("#startingPointNumberAdd").val();
        var lxEnName = $("#lxEnNameAdd").val();
        var lxChiName = $("#lxChiNameAdd").val();
        var conditions = $("#conditionsAdd").val();
        var lxRely = $("#lxRelyAdd").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!startingPointNumber){
            $.messager.alert('提示','量刑起点不能为空!','info');
            return;
        }
        if(!lxEnName){
            $.messager.alert('提示','量刑英文名不能为空!','info');
            return;
        }
        if(!lxChiName){
            $.messager.alert('提示','量刑中文名不能为空!','info');
            return;
        }

        if(conditions.indexOf("__") >= 0){
            $.messager.alert('提示','条件中不能连续出现"_"，请仔细检查条件框!','info');
            return;
        }
        if(conditions.indexOf("Lx_") >= 0){
            $.messager.alert('提示','条件中不能连续出现"Lx_"，请仔细检查条件框!','info');
            return;
        }
        if(conditions !='' && conditions.length>1){

            var message ='';
            var featuresArray = new Array();
            var enNameCounts = 0;
            while (conditions.indexOf('_') >= 0){
                var num = find(conditions,'_',1);
                if(num<0){
                    $.messager.alert('提示','您条件中的_不完全匹配，请仔细检查条件框!','info');
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
                    data:{enName:featuresArray[i],province:province,caseCause:caseCause},
                    url: "${pageContext.request.contextPath}/features/isFactLxExit",
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

            if(message!=''){
                $.messager.alert('提示',message+'等事实特征不存在，请仔细检查条件框！','info');
                return;
            }else{

            }

        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的条件不合法，请仔细检查条件框！','info');
            return;
        }else{

        }
        if(lxRely.indexOf("__") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"_"，请仔细检查条件框!','info');
            return;
        }
        if(lxRely.indexOf("Lx_") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"Lx_"，请仔细检查条件框!','info');
            return;
        }
        if(lxRely !='' && lxRely.length>1){
            if(!CheckYou(lxRely)){
                $.messager.alert('提示','您输入的量刑依赖含有中文输入法或特殊字符，请仔细检查条件框！','info');
                return;
            }else{
                var message ='';
                var featuresArray = new Array();
                var enNameCounts = 0;
                while (lxRely.indexOf('_') >= 0){
                    var num = find(lxRely,'_',1);
                    if(num<0){
                        $.messager.alert('提示','您量刑依赖条件中的_不完全匹配，请仔细检查条件框!','info');
                        return;
                    }
                    var cutFeature  = lxRely.substring(lxRely.indexOf('_'),num+1);
                    var remainFeatures = lxRely.substring(num+1,lxRely.length);
                    featuresArray.push(cutFeature);
                    lxRely = remainFeatures;
                }
                for(var i=0;i<featuresArray.length;i++){
                    var enName = featuresArray[i];
                    $.ajax({
                        type: 'POST',
                        dataType: "json",
                        async :false,
                        data:{enName:featuresArray[i],province:province,caseCause:caseCause},
                        url: "${pageContext.request.contextPath}/features/isFactLxExit",
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

                if(message!=''){
                    $.messager.alert('提示',message+'等事实特征不存在，请仔细检查量刑依赖框！','info');
                    return;
                }else{

                }

            }
        }else if(lxRely !=''&& lxRely.length==1){
            $.messager.alert('提示','您输入的量刑依赖不合法，请仔细检查条件框！','info');
            return;
        }else{

        }
        $('#fmBenchmarkPoint').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/benchmarkpoint/saveBenchmarkPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    $('#dgBenchmarkPointAdd').dialog('close');		// close the dialog
                    $('#benchMarkPointTable').datagrid('reload');	// reload data
                } else {
                    $.messager.alert('提示','基准规则保存失败！','error');
                }
            }
        });
    }
    function updateBenchmarkPointRule(){

        var caseCause = $("#caseCauseEdit").val().trim();
        var province = $("#provinceEdit").val();
        var startingPointNumber = $("#startingPointNumberEdit").val();
        var lxEnName = $("#lxEnNameEdit").val();
        var lxChiName = $("#lxChiNameEdit").val();
        var conditions = $("#conditionsEdit").val();
        var lxRely = $("#lxRelyEdit").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!startingPointNumber){
            $.messager.alert('提示','量刑起点不能为空!','info');
            return;
        }
        if(!lxEnName){
            $.messager.alert('提示','量刑英文名不能为空!','info');
            return;
        }
        if(!lxChiName){
            $.messager.alert('提示','量刑中文名不能为空!','info');
            return;
        }

        if(conditions.indexOf("__") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"_"，请仔细检查条件框!','info');
            return;
        }
        if(conditions.indexOf("Lx_") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"Lx_"，请仔细检查条件框!','info');
            return;
        }
        if(conditions !='' && conditions.length>1){

            var message ='';
            var featuresArray = new Array();
            var enNameCounts = 0;
            while (conditions.indexOf('_') >= 0){
                var num = find(conditions,'_',1);
                if(num<0){
                    $.messager.alert('提示','您情节依赖条件中的_不完全匹配，请仔细检查条件框!','info');
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
                    data:{enName:featuresArray[i],province:province,caseCause:caseCause},
                    url: "${pageContext.request.contextPath}/features/isFactLxExit",
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

            if(message!=''){
                $.messager.alert('提示',message+'等事实特征不存在，请仔细检查条件框！','info');
                return;
            }else{

            }

        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的量刑依赖不合法，请仔细检查条件框！','info');
            return;
        }else{

        }
        if(lxRely.indexOf("__") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"_"，请仔细检查条件框!','info');
            return;
        }
        if(lxRely.indexOf("Lx_") >= 0){
            $.messager.alert('提示','量刑依赖条件中不能连续出现"Lx_"，请仔细检查条件框!','info');
            return;
        }
        if(lxRely !='' && lxRely.length>1){
            if(!CheckYou(lxRely)){
                $.messager.alert('提示','您输入的量刑依赖含有中文输入法或特殊字符，请仔细检查条件框！','info');
                return;
            }else{
                var message ='';
                var featuresArray = new Array();
                var enNameCounts = 0;
                while (lxRely.indexOf('_') >= 0){
                    var num = find(lxRely,'_',1);
                    if(num<0){
                        $.messager.alert('提示','您情节依赖条件中的_不完全匹配，请仔细检查条件框!','info');
                        return;
                    }
                    var cutFeature  = lxRely.substring(lxRely.indexOf('_'),num+1);
                    var remainFeatures = lxRely.substring(num+1,lxRely.length);
                    featuresArray.push(cutFeature);
                    lxRely = remainFeatures;
                }
                for(var i=0;i<featuresArray.length;i++){
                    var enName = featuresArray[i];
                    $.ajax({
                        type: 'POST',
                        dataType: "json",
                        async :false,
                        data:{enName:featuresArray[i],province:province,caseCause:caseCause},
                        url: "${pageContext.request.contextPath}/features/isFactLxExit",
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

                if(message!=''){
                    $.messager.alert('提示',message+'等事实特征不存在，请仔细检查量刑依赖框！','info');
                    return;
                }else{

                }

            }
        }else if(lxRely !=''&& lxRely.length==1){
            $.messager.alert('提示','您输入的量刑依赖不合法，请仔细检查条件框！','info');
            return;
        }else{

        }
        $('#fmBenchmarkPointEdit').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/benchmarkpoint/updateBenchmarkPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    alert("更新成功");
                    $('#dgBenchmarkPointEdit').dialog('close');		// close the dialog
                    $('#benchMarkPointTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','基准规则更新失败！','error');
                }
            }
        });
    }

    //conditions右击事件
    $("#conditionsAdd").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#conditionList').dialog('open').dialog('setTitle','标准特征列表');
    });
    //conditions右击事件
    $("#conditionsEdit").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#conditionListE').dialog('open').dialog('setTitle','标准特征列表');
    });
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
            $('#startingPointNumberAdd').val(selected_codes+"");
            $('#startPointList').dialog('close');
        }else if(num=='2'){
            $('#startingPointNumberEdit').val(selected_codes+"");
            $('#startPointListE').dialog('close');
        }

    }
    function clearYes(num){
        if(num=='1'){
            $('#conditionsAdd').val('');
            $('#conditionsNameAdd').val('');
        }else if(num=='2'){
            $('#conditionsEdit').val('');
            $('#conditionsNameEdit').val('');
        }

    }
    function clearYesR(num){
        if(num=='1'){
            $('#lxRelyAdd').val('');
            $('#lxRelyNameAdd').val('');
        }else if(num=='2'){
            $('#lxRelyEdit').val('');
            $('#lxRelyNameEdit').val('');
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