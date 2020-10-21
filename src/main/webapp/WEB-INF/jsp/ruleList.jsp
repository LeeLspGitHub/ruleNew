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
    <title>规则列表</title>
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
			<td><a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRule()">新增规则</a></td>
			<td>规则编号:</td>
			<td><input id="ruleIDSearch" name="name" style="width:100px;height: 20px;"/></td>
			<td><a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="serachRule()">查询规则</a></td>

		</tr>
	</table>
</div>
<table id="ruleTable" title="规则列表" toolbar="#toolbar" style="width:100%;height:550px" >
	<thead frozen="true">
	<tr>
		<th data-options="field:'ruleID',sortable:true" style="width:10%;">规则ID</th>
		<th data-options="field:'ruleName'" style="width:10%;">规则Name</th>
	</tr>
	</thead>
	<thead>
	<tr>
		<th data-options="field:'ruleID',sortable:true" style="width:10%;">规则ID</th>
		<th data-options="field:'ruleName'" style="width:10%;">规则Name</th>
		<th data-options="field:'ruleCounts'" style="width:50%;">规则Counts</th>
		<th data-options="field:'detail'" style="width:50%;">描述</th>
		<th data-options="field:'cz',formatter:formatOper" style="width:50%;">操作</th>
	</tr>
	</thead>
</table>

<div id="dgAdd" class="easyui-dialog" style="width:700px;height:400px;padding:10px 20px"
	 closed="true" buttons="#dgAdd-buttons">
	<form id="fm" method="post">
		<div class="fitem">
			<label>规则编号:</label>
			<input id="ruleID" name="ruleID" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>规则名称:</label>
			<input id="ruleName" name="ruleName" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>规则数量:</label>
			<input id="ruleCounts" name="ruleCounts">
		</div>
		<div class="fitem">
			<label>规则描述:</label>
			<input id="detail" name="detail" class="easyui-validatebox">
		</div>
	</form>
</div>
<div id="dgAdd-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRule()">确定</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgAdd').dialog('close')">取消</a>
</div>
<div id="dgEdit" class="easyui-dialog" style="width:700px;height:400px;padding:10px 20px"
	 closed="true" buttons="#dgEdit-buttons">
	<form id="fmEdit" method="post">
		<div class="fitem">
			<label>规则编号:</label>
			<input id="ruleIDEdit" name="ruleID"  required="true">
		</div>
		<div class="fitem">
			<label>规则名称:</label>
			<input id="ruleNameEdit" name="ruleName" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>规则数量:</label>
			<input id="ruleCountsEdit" name="ruleCounts">
		</div>
		<div class="fitem">
			<label>规则描述:</label>
			<input id="detailEdit" name="detail" class="easyui-validatebox">
		</div>
	</form>
</div>
<div id="dgEdit-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateRule()">确定</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgEdit').dialog('close')">取消</a>
</div>
</body>
<script type="text/javascript">

$(document).ready(function () {
	initRuleTable();
});
//初始化表格数据
function initRuleTable(){

	$('#ruleTable').datagrid({
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
		//collapsible: true,
		url: '${pageContext.request.contextPath}/rule/ruleList',
		border: false,
		idField: 'id',
		selectOnCheck: true,
		singleSelect: true,
		width:'100%' ,
		resizable:true,
		pagination: true,
		pageSize: 10,
		rowNumbers: false,
		success:function (res) {
			var rows=[];
			for(var i=0; i< res.row.length; i++){
				rows.push({
					ruleID:data.row[i].ruleID,
					ruleName:data.row[i].ruleName,
					ruleCounts:data.row[i].ruleCounts,
					detail:data.row[i].detail
				});
			}
			$("#ruleTable").datagrid({data:rows});
		},
		error:function () {
			$.messager.alert("提示","获取数据失败");
		}
	});
}

function formatOper(val,row,index){
	return '<a href="#" onclick="editRule('+index+')">修改</a>'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +'<a href="#" onclick="deteleRule('+index+')">删除</a>';
}
function addRule(){
	$('#dgAdd').dialog('open').dialog('setTitle','新建规则');
	$('#fm').form('clear');

}
//查询规则
function serachRule(){

	var ruleID = $("#ruleIDSearch").val();

	$('#ruleTable').datagrid({
		url: '${pageContext.request.contextPath}/rule/ruleList',
		queryParams:{
			ruleID:ruleID
		},
		pageList: [10,20,30,40,50]
	});

}

function deteleRule(index){

	var ruleID = $('#ruleTable').datagrid('getData').rows[index].ruleID;

	$.ajax({
		type: 'POST',
		dataType: "json",
		data:{ruleID:ruleID},
		url: "${pageContext.request.contextPath}/rule/deleteRule",
		success: function (data) {
			console.log(data);

			$('#ruleTable').datagrid('reload');

		},
		error: function () {
			alert("发生错误");
		}
	})
}
function editRule(index){

	var ruleID = $('#ruleTable').datagrid('getData').rows[index].ruleID;

	$.ajax({
		type: 'POST',
		dataType: "json",
		data:{ruleID:ruleID},
		url: "${pageContext.request.contextPath}/rule/findOneRuleById",
		success: function (data) {
			console.log(data);
			console.log(data.list[0].ruleID);
			$("#ruleIDEdit").val(data.list[0].ruleID);
			$("#ruleNameEdit").val(data.list[0].ruleName);
			$("#ruleCountsEdit").val(data.list[0].ruleCounts);
			$("#detailEdit").val(data.list[0].detail);
			$("#ruleIDEdit").attr("readOnly","true");
			$('#dgEdit').dialog('open').dialog('setTitle','修改规则');

		},
		error: function () {
			alert("发生错误");
		}
	})
}

function saveRule() {

	$('#fm').form('submit',{
		dataType:"json",
		async:false,
		url: "${pageContext.request.contextPath}/rule/saveRule",
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			console.log(result);
            debugger
			if (result.msg){
				alert("新增成功");
			} else {
				$('#dgAdd').dialog('close');		// close the dialog
				$('#ruleTable').datagrid('reload');	// reload data
			}
		}
	});

}
function updateRule(){

	$('#fmEdit').form('submit',{
		dataType:"json",
		async:false,
		url: "${pageContext.request.contextPath}/rule/updateRule",
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			console.log(result);
			debugger
			if (result.msg){
				alert("更新成功");
			} else {
				$('#dgEdit').dialog('close');		// close the dialog
				$('#ruleTable').datagrid('reload');	// reload data
			}
		}
	});
	$('#dgEdit').dialog('close');
}

</script>
</html>