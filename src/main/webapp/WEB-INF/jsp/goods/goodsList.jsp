<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>GoodsList</title>
<style type="text/css">
.searchbox {
	margin:-3;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '${proPath}/datagrid_data1.json',
			fitColumns : true,
			//设定是否换行显示数据， true为不换行
			nowrap : true,
			//分布工具栏，设定为true时显示
			pagination : true,
			pageList : [ 3, 5, 10 ],
			pageSize : 10,
			//设定为true，显示行号
			rownumbers : true,
			striped : true,
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					alert('添加按钮');
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除',
				handler : function() {
					alert('删除按钮');
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
					alert('编辑按钮');
				}
			}, '-', {
				text : "<input type='text' id='ss' name='keyword'/>",
			} ],
			columns : [ [ {
				checkbox : true
			}, {
				field : 'productid',
				title : '编号',
				align : 'left',
				width : 100
			}, {
				field : 'unitcost',
				title : '单价',
				align : 'left',
				width : 100
			}, {
				field : 'productname',
				title : '商品名',
				align : 'left',
				width : 100
			}, {
				field : 'listprice',
				title : 'Price',
				align : 'left',
				width : 100
			}, {
				field : 'itemid',
				title : 'itemid',
				align : 'left',
				width : 100

			}, {
				field : 'attr1',
				title : 'attr1',
				align : 'left',
				width : 100
			} ] ]

		});
		
		$('#ss').searchbox({
			searcher : function(value, name) {
				alert(value + "," + name);
			},
			prompt : '请输入商品名称'
		});
		
	});
</script>

</head>
<body>
	<table id="dg"></table>
</body>
</html>