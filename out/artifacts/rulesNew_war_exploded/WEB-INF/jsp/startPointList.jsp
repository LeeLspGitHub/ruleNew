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
    <title>起点刑规则列表</title>
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
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addStartPointRule()">新增规则</a></td>
            <td>起点ID:</td>
            <td><input id="idSearch" name="idSearch" style="width:150px;height: 20px;"/></td>
            <td>描述:</td>
            <td><input id="descSearch" name="descSearch" style="width:150px;height: 20px;"/></td>
            <%--<td>省份:</td>
            <td><input id="provinceSearch" name="provinceSearch" style="width:150px;height: 20px;"/></td>--%>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachStartPointRule()">查询规则</a></td>
            <td><a href="#" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="location.href='<%=contextPath%>/liangxing/index';">返回量刑首页</a></td>
        </tr>
    </table>
</div>
<table id="startPointTable" title="量刑起点规则列表" toolbar="#toolbar" style="width:100%;height:500px" >
    <thead frozen="true">
    <tr>
        <th data-options="field:'cz',formatter:formatOper" style="width:9%;">操作</th>
        <th data-options="field:'id',sortable:true" style="width:8%;">起点ID</th>
        <th data-options="field:'note',formatter: hoveringShow" style="width:5%;">备注</th>
        <th data-options="field:'descS',formatter: hoveringShow" style="width:20%;" >描述</th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th data-options="field:'conditions'" style="width:40%;">条件</th>
        <th data-options="field:'minValues'" style="width:10%;">最小值</th>
        <th data-options="field:'maxValues'" style="width:10%;">最大值</th>
        <th data-options="field:'standardValues'" style="width:10%;">标准值</th>
        <th data-options="field:'provinceItem'" style="width:12%;">本省实施细则(行号)</th>
        <th data-options="field:'nationItem'" style="width:15%;">全国量刑指导意见(行号)</th>
        <th data-options="field:'caseCause',sortable:true" style="width:10%;">罪名</th>
        <th data-options="field:'province'" style="width:6%;">省份</th>

        <th data-options="field:'tip'" style="width:15%;">提示</th>
        <th data-options="field:'number'" style="width:10%;">量刑起点号</th>
        <th data-options="field:'createPerson'" style="width:10%;">创建人</th>
        <th data-options="field:'createTime'" style="width:10%;">创建时间</th>
        <th data-options="field:'updatePerson'" style="width:10%;">更新人</th>
        <th data-options="field:'updateTime'" style="width:10%;">更新时间</th>
        <th data-options="field:'auditStatus'" style="width:10%;">审核状态</th>
    </tr>
    </thead>
</table>

<div id="dgStartPointAdd" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgStartPointAdd-buttons">
    <form id="fmStartPoint" method="post">
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
                    <textarea id="conditionsAdd" name="conditionsAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">条件中文:</td>
                <td style="width:75%">
                    <textarea id="conditionsNameAdd" name="conditionsNameAdd"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
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
                <td style="width:25%" align="right">本省实施细则(行号):</td>
                <td style="width:75%"><input id="provinceItemAdd" name="provinceItemAdd" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">全国量刑指导意见(行号):</td>
                <td style="width:75%"><input id="nationItemAdd" name="nationItemAdd" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">量刑起点号:</td>
                <td style="width:75%"><input id="numberAdd" name="numberAdd" class="easyui-validatebox" style="width: 350px;height: 20px;" ></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgStartPointAdd-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveStartPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgStartPointAdd').dialog('close')">取消</a>
</div>
<div id="dgStartPointEdit" class="easyui-dialog" style="width:750px;height:480px;padding:10px 20px"
     closed="true" buttons="#dgStartPointEdit-buttons">
    <form id="fmStartPointEdit" method="post">
        <table>
            <tr style="width:100%">
                <td style="width:25%" align="right"><span style="color:red;">*</span>起点ID:</td>
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
                    <textarea id="conditionsNameEdit" name="conditionsNameEdit"  style="width: 350px;height: 80px;outline-style: none ;border: 1px solid #ccc;border-radius: 3px;padding: 14px 14px;" required="true">

                    </textarea>
                </td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最小值:</td>
                <td style="width:75%"><input id="minValuesEdit" name="minValuesEdit" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">最大值:</td>
                <td style="width:75%"><input id="maxValuesEdit" name="maxValuesEdit" autocomplete="off"  style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">本省实施细则(行号):</td>
                <td style="width:75%"><input id="provinceItemEdit" name="provinceItemEdit"  autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
            </tr>
            <tr style="width:100%">
                <td style="width:25%" align="right">全国量刑指导意见(行号):</td>
                <td style="width:75%"><input id="nationItemEdit" name="nationItemEdit" autocomplete="off" style="width: 350px;height: 20px;" required="true"></td>
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
                <td style="width:25%" align="right">量刑起点号:</td>
                <td style="width:75%"><input id="numberEdit" name="numberEdit" class="easyui-validatebox" style="width: 350px;height: 20px;" ></td>
            </tr>
        </table>
    </form>
</div>
<div id="dgStartPointEdit-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateStartPointRule()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgStartPointEdit').dialog('close')">取消</a>
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

</body>
<script type="text/javascript">

    $(document).ready(function () {
        initStartPointTable();
        initLxRelyConditionTable();
        initLxRelyConditionTableE();
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
            url: '${pageContext.request.contextPath}/startpoint/startPointList'
        });
    }
    //初始化量刑依赖条件
    function initLxRelyConditionTable(){

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
    //初始化量刑依赖条件
    function initLxRelyConditionTableE(){

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

    function formatOper(val,row,index){
        return '<a href="#" onclick="editStartPointRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleStartPointRule('+index+')">删除</a>';
    }

    function addStartPointRule(){

        $('#fmStartPoint').form('clear');
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
            url: "${pageContext.request.contextPath}/startpoint/getAddMaxLxOrderStartPointRule",
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
        $('#dgStartPointAdd').dialog('open').dialog('setTitle','新建起点规则');
    }
    //查询规则
    function serachStartPointRule(){

        var id = $("#idSearch").val();
        var descS = $("#descSearch").val();
        $('#startPointTable').datagrid({
            url: '${pageContext.request.contextPath}/startpoint/startPointList',
            queryParams:{
                id:id,
                descS:descS,
                province:$.getUrlParam('province'),
                caseCause:$.getUrlParam('caseCause')
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

    function deteleStartPointRule(index){

        var startPointID = $('#startPointTable').datagrid('getData').rows[index].id;

        $.messager.confirm('Confirm', '确定要删除吗?', function(r){
            if (r){
                $.ajax({
                    type: 'POST',
                    dataType: "json",
                    async :false,
                    data:{startPointID:startPointID},
                    url: "${pageContext.request.contextPath}/startpoint/deteleStartPointRule",
                    success: function (data) {
                        if(data && data.type!='' && data.type=='sessiontimeout'){
                            alert("Session超时，请重新登陆");
                            window.location.href = '<%=contextPath%>/system/login';
                            return;
                        }
                        if (data){
                            alert("删除成功");
                            $('#startPointTable').datagrid('reload');
                        } else {
                            $.messager.alert('提示','起点规则保存失败！','error');
                        }

                    },
                    error: function () {
                        alert("发生错误");
                    }
                })
            }
        });

    }
    function editStartPointRule(index){

        var startPointID = $('#startPointTable').datagrid('getData').rows[index].id;

        $.ajax({
            type: 'POST',
            dataType: "json",
            async :false,
            data:{startPointID:startPointID},
            url: "${pageContext.request.contextPath}/startpoint/findOneStartPointRuleById",
            success: function (data) {
                if(data && data.type!='' && data.type=='sessiontimeout'){
                    alert("Session超时，请重新登陆");
                    window.location.href = '<%=contextPath%>/system/login';
                    return;
                }
                $("#fmStartPointEdit").form('load',data);
                $("#idEdit").val(data.list[0].id);
                $("#caseCauseEdit").combobox('setValue', data.list[0].caseCauseId);
                $("#provinceEdit").combobox('setValue', data.list[0].provinceId);
                $("#numberEdit").val(data.list[0].number);
                $("#descSEdit").val(data.list[0].descS);
                $("#minValuesEdit").val(data.list[0].minValues);
                $("#maxValuesEdit").val(data.list[0].maxValues);
                $("#conditionsEdit").val(data.list[0].conditions);
                $("#conditionsNameEdit").val(data.list[0].conditionsName);
                $("#provinceItemEdit").val(data.list[0].provinceItem);
                $("#nationItemEdit").val(data.list[0].nationItem);
                $("#noteEdit").val(data.list[0].note);
                $("#tipEdit").val(data.list[0].tip);
                $("#idEdit").attr("readOnly","true");
                $("#numberEdit").attr("readOnly","true");
                $('#dgStartPointEdit').dialog('open').dialog('setTitle','修改起点规则');

            },
            error: function () {
                alert("发生错误");
            }
        })
    }
    function createsql_a(text){
        $("#conditionsAdd").insertAtCaret(text);
        $("#conditionsNameAdd").insertAtCaret(text);
    }
    function createsql_e(text){
        $("#conditionsEdit").insertAtCaret(text);
        $("#conditionsNameEdit").insertAtCaret(text);
    }
/*    function chooseStandardFeatureCondition(){
        $('#conditionList').dialog('open').dialog('setTitle','标准特征列表');
    }*/
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
    function saveStartPointRule() {
        var caseCause = $("#caseCauseAdd").val().trim();
        var province = $("#provinceAdd").val();
        var descS = $("#descSAdd").val();
        var conditions = $("#conditionsAdd").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!descS){
            $.messager.alert('提示','描述不能为空!','info');
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
            if(!CheckYou(conditions)){
                $.messager.alert('提示','您输入的条件含有中文输入法或特殊字符，请仔细检查条件框！','info');
                return;
            }else{
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

            }
        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的条件不合法，请仔细检查条件框！','info');
            return;
        }else{

        }

        $('#fmStartPoint').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/startpoint/saveStartPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    $('#dgStartPointAdd').dialog('close');		// close the dialog
                    $('#startPointTable').datagrid('reload');	// reload data
                } else {
                    $.messager.alert('提示','起点规则保存失败！','error');
                }
            }
        });
    }
    function updateStartPointRule(){

        var caseCause = $("#caseCauseEdit").val().trim();
        var province = $("#provinceEdit").val();
        var descS = $("#descSEdit").val();
        var conditions = $("#conditionsEdit").val();
        if(!caseCause){
            $.messager.alert('提示','罪名不能为空!','info');
            return;
        }
        if(!province){
            $.messager.alert('提示','省份不能为空!','info');
            return;
        }
        if(!descS){
            $.messager.alert('提示','描述不能为空!','info');
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
            if(!CheckYou(conditions)){
                $.messager.alert('提示','您输入的条件含有中文输入法或特殊字符，请仔细检查条件框！','info');
                return;
            }else{
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

            }
        }else if(conditions !=''&& conditions.length==1){
            $.messager.alert('提示','您输入的条件不合法，请仔细检查条件框！','info');
            return;
        }else{

        }
        $('#fmStartPointEdit').form('submit',{
            dataType:"json",
            async:false,
            url: "${pageContext.request.contextPath}/startpoint/updateStartPointRule",
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                if (result){
                    alert("更新成功");
                    $('#dgStartPointEdit').dialog('close');		// close the dialog
                    $('#startPointTable').datagrid('reload');
                } else {
                    $.messager.alert('提示','起点规则更新失败！','error');
                }
            }
        });
    }

    //lxRelyAdd右击事件
    $("#conditionsAdd").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#conditionList').dialog('open').dialog('setTitle','标准特征列表');
    });
    //lxRelyEdit右击事件
    $("#conditionsEdit").bind("contextmenu", function (e) {
        e.preventDefault();
        $('#conditionListE').dialog('open').dialog('setTitle','标准特征列表');
    });

    function clearYes(num){
        if(num=='1'){
            $('#conditionsAdd').val('');
            $('#conditionsNameAdd').val('');
        }else if(num=='2'){
            $('#conditionsEdit').val('');
            $('#conditionsNameEdit').val('');
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