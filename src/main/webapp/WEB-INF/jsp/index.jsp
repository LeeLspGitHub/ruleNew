<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2019/12/16
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();
    System.out.println(contextPath);
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <!--声明以IE最高版本浏览器内核或谷歌浏览器内核进行渲染 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--声明以360极速模式进行渲染 -->
    <meta name=”renderer” content=”webkit” />
    <title>首页</title>
    <!-- easyui库 -->
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/jquery-easyui-1.7.0/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/jquery-easyui-1.7.0/themes/icon.css">

    <script type="text/javascript" src="<%=contextPath%>/resources/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/resources/jquery/jquery.form.js"></script>
    <!-- 基础样式表 -->
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/style.css"/>

    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }
        h7 {
            width: 350px;
            height: 38px;
            margin: 30px auto;
            text-align: center;
            line-height: 38px;
            background: #E0ECFF;
            border-radius: 4px;
        }
        #main
        { font-family:"Trebuchet MS", Arial, Helvetica, sans-serif; width:70%; border-collapse:collapse; }
        #main td, #main th  
        { font-size:1em; border:1px solid #E0ECFF; padding:3px 7px 2px 7px; }
        #main th
        { font-size:1.1em; text-align:left; padding-top:5px; padding-bottom:4px; background-color:#E0ECFF; color:#ffffff; }

        .linkactive
        {
            padding:5px;
            text-decoration:none;
            background-color: #2788DA;
            color:#ffffff;
            border-radius: 5px;
        }
        .linkcondition
        {
            cursor:pointer;
            padding:5px;
            text-decoration:none;
            font-size:10px;
        }
        table tr{ height:35px;}
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        reset();
        SetPara();
    });

    function reset() {
        var left = (window.innerWidth - $('#main').width())/2;
        var top = (window.innerHeight - $('#main').height())/4;
        $('#main').css('margin-left', left + 'px');
        $('#main').css('margin-top', top + 'px');

    }
    $(function () {

        //省份
        var alinkProvince01 = $("#linktypeprovince1").find("span");
        var alinkProvince02 = $("#linktypeprovince2").find("span");
        alinkProvince01.click(function () {
            alinkProvince01.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkProvince02.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            $(this).removeClass("linkcondition").addClass("linkactive");
            $("#Province").val($(this).attr("tag"));
            SetPara();
        })
        alinkProvince02.click(function () {
            alinkProvince01.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkProvince02.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            $(this).removeClass("linkcondition").addClass("linkactive");
            $("#Province").val($(this).attr("tag"));
            SetPara();
        })
        //案由
        var alinkCasecause01 = $("#linktypecasecause1line").find("span");
        var alinkCasecause02 = $("#linktypecasecause2line").find("span");
        var alinkCasecause03 = $("#linktypecasecause3line").find("span");
        alinkCasecause01.click(function () {
            debugger
            alinkCasecause01.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause02.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause03.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            $(this).removeClass("linkcondition").addClass("linkactive");
            $("#CaseCause").val($(this).attr("tag"));
            SetPara();
        })
        //案由

        alinkCasecause02.click(function () {
            debugger
            alinkCasecause01.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause02.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause03.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            $(this).removeClass("linkcondition").addClass("linkactive");
            $("#CaseCause").val($(this).attr("tag"));
            SetPara();
        })
        //案由

        alinkCasecause03.click(function () {
            alinkCasecause01.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause02.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            alinkCasecause03.each(function () {
                $(this).removeClass("linkactive").addClass("linkcondition");
            });
            $(this).removeClass("linkcondition").addClass("linkactive");
            $("#CaseCause").val($(this).attr("tag"));
            SetPara();
        })
    });

    var param;
    function SetPara() {
        debugger
        var province = $("#Province").val();
        var caseCause = $("#CaseCause").val();
        param = "?province=" + province + "&caseCause=" + caseCause;
    }
    function factFeatures() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }
        if(caseCause == '100200'){
            $.messager.alert('提示','请选择罪名!','info');
            return;
        }
        $("#factFeatures").attr('href','${pageContext.request.contextPath}/features/factFeatures'+ param);
    }
    function lxCommonFeatures() {
        var caseCause = $("#CaseCause").val();
        if(caseCause!='100200'){
            $.messager.alert('提示','通用型量刑情节规则列表罪名请选择不限!','info');
            return;
        }
        $("#lxCommonFeatures").attr('href','${pageContext.request.contextPath}/commonfeatures/lxCommonFeatures'+ param);
    }
    function startPointPage() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }
        if(caseCause == '100200'){
            $.messager.alert('提示','请选择罪名!','info');
            return;
        }
        $("#startPointPage").attr('href','${pageContext.request.contextPath}/startpoint/startPointPage'+ param);
    }
    function benchMarkPointPage() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }
        if(caseCause == '100200'){
            $.messager.alert('提示','请选择罪名!','info');
            return;
        }
        $("#benchMarkPointPage").attr('href','${pageContext.request.contextPath}/benchmarkpoint/benchMarkPointPage'+ param);
    }
    function lxFeatureRolePage() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }
        if(caseCause == '100200'){
            $.messager.alert('提示','请选择罪名!','info');
            return;
        }
        $("#lxFeatureRolePage").attr('href','${pageContext.request.contextPath}/lxfeaturesrole/lxFeaturesRolePage'+ param);
    }
    function declarationPenaltyPage() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }
        if(caseCause == '100200'){
            $.messager.alert('提示','请选择罪名!','info');
            return;
        }
        $("#declarationPenaltyPage").attr('href','${pageContext.request.contextPath}/declarationpenalty/declarationPenaltyPage'+ param);
    }

    function conflictPage() {
        var caseCause = $("#CaseCause").val();
        var province = $("#Province").val();
        if(province == '100100'){
            $.messager.alert('提示','请选择省份!','info');
            return;
        }

        $("#conflictPage").attr('href','${pageContext.request.contextPath}/conflict/conflictPage'+ param);
    }
</script>
<body>

    <form id="formCondition" runat="server">
        <div>
            <table>
                <tr id="linktypeprovince1">
                    <td style="width:50px">
                        <b>省份</b>
                    </td>
                    <td>
                        <span class='linkactive' tag="100100">不限</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100101">北京市</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100102">福建省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100103">山东省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100104">辽宁省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100105">贵州省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100106">河南省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100107">内蒙古自治区</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100108">重庆市</span>
                    </td>
                </tr>
                <tr id="linktypeprovince2">
                    <td style="width:50px">

                    </td>
                    <td>
                        <b></b>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100109">上海市</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100110">浙江省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100111">江苏省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100112">吉林省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100113">山西省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100114">陕西省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100115">黑龙江省</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100116">河北省</span>
                    </td>
                </tr>
                <tr id="linktypecasecause1line">
                    <td style="width:50px">
                        <b>罪名</b>
                    </td>
                    <td>
                        <span class='linkactive' tag="100200">不限</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100201">盗窃罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100202">妨害公务罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100203">非法拘禁罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100204">故意伤害罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100205">交通肇事罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100206">聚众斗殴罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100207">掩饰、隐瞒犯罪所得、犯罪所得收益罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100208">抢夺罪</span>
                    </td>
                </tr>
                <tr id="linktypecasecause2line">
                    <td style="width:50px">

                    </td>
                    <td>
                        <b></b>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100209">强奸罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100210">抢劫罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100211">敲诈勒索罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100212">寻衅滋事罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100213">诈骗罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100214">职务侵占罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100215">走私、贩卖、运输、制造毒品罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100216">危险驾驶罪</span>
                    </td>
<%--                    <td>
                        <input type="hidden" id="Province" value="100100" />
                        <input type="hidden" id="CaseCause" value="100200" />
                    </td>--%>
                </tr>
                <tr id="linktypecasecause3line">
                    <td style="width:50px">

                    </td>
                    <td>
                        <b></b>
                    </td>
                    <td >
                        <span class='linkcondition' tag="100217" >集资诈骗罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100218">信用卡诈骗罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100219">合同诈骗罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100220">非法持有毒品罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100221">非法吸收公共存款罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100222">容留他人吸毒罪</span>
                    </td>
                    <td>
                        <span class='linkcondition' tag="100223">引诱、容留、介绍卖淫罪</span>
                    </td>

                    <td>
                        <input type="hidden" id="Province" value="100100" />
                        <input type="hidden" id="CaseCause" value="100200" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <table id="main">
        <tr>
            <th colspan="2" plain="true">点击进入规则列表</th>
        </tr>
        <tr>
            <td><h7><a id="factFeatures" href="javascript:void(0);" onclick="factFeatures()" class="easyui-linkbutton" iconCls="icon-search" plain="true">事实特征规则列表</a></h7></td>
            <td><h7><a id="lxCommonFeatures" href="javascript:void(0);" onclick="lxCommonFeatures()" class="easyui-linkbutton" iconCls="icon-search" plain="true">通用型量刑情节规则列表</a></h7></td>
        </tr>
        <tr>
            <td><h7><a id="startPointPage" href="javascript:void(0);" onclick="startPointPage()" class="easyui-linkbutton" iconCls="icon-search" plain="true">量刑起点规则列表</a></h7></td>
            <td><h7><a id="lxFeatureRolePage" href="javascript:void(0);" onclick="lxFeatureRolePage()" class="easyui-linkbutton" iconCls="icon-search" plain="true">条件限制列表</a></h7></td>
        </tr>
        <tr>
           <td><h7><a id="benchMarkPointPage" href="javascript:void(0);" onclick="benchMarkPointPage()" class="easyui-linkbutton" iconCls="icon-search" plain="true">基准刑规则列表</a></h7></td>
           <td><h7><a id="declarationPenaltyPage" href="javascript:void(0);" onclick="declarationPenaltyPage()" class="easyui-linkbutton" iconCls="icon-search" plain="true">法定刑列表</a></h7></td>
        </tr>
        <tr>
            <td colspan="2"><h7><a id="conflictPage" href="javascript:void(0);" onclick="conflictPage()" class="easyui-linkbutton" iconCls="icon-search" plain="true">规则冲突列表</a></h7></td>
        </tr>
    </table>
</body>

</html>
