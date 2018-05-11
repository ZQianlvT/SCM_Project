<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>SupplierList</title>
<style type="text/css">
.searchbox {
	margin: -3;
}
</style>
<script type="text/javascript">
	$(function() {
		var win = parent.$("iframe[title='商品入库']").get(0).contentWindow;
		$('#dg').datagrid({
			url : '${proPath}/supplier/selectPage',
			fitColumns : true,
			//设定是否换行显示数据， true为不换行
			nowrap : true,
			//分布工具栏，设定为true时显示
			pagination : true,
			singleSelect : true,
			pageList : [ 2, 3, 5 ],
			pageSize : 2,
			//设定为true，显示行号 
			rownumbers : true,
			striped : true,
			toolbar : [ {
				iconCls : 'icon-ok',
				text : '确认',
				handler : function() {
					var row = $("#dg").datagrid("getSelected");
					if (row == null) {
						alert("必须选择一个供应商！");
						return false;
					}
					win.$('#ff').form("load", {
						supId : row.supId,
						supName : row.supName
					});
					parent.$('#win').window("close");
				}
			}, '-', {
				text : "<input type='text' id='ss' name='keyWord'/>",
			} ],
			columns : [ [ {
				checkbox : true
			}, {
				field : 'supId',
				title : '供应商编号',
				align : 'left',
				width : 100
			}, {
				field : 'supName',
				title : '供应商类型',
				align : 'left',
				width : 100
			}, {
				field : 'supLinkman',
				title : '供应商名称',
				align : 'left',
				width : 100

			}, {
				field : 'supAddress',
				title : '供应商地址',
				align : 'left',
				width : 100
			}, {
				field : 'supPhone',
				title : '供应商电话',
				align : 'left',
				width : 100
			} ] ]

		});

		$('#ss').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					keyWord : value
				});
			},
			prompt : '请输入供应商名称'
		});

	});
</script>

</head>
<body>
	<table id="dg"></table>
</body>
</html>