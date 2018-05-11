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
		$('#dg').datagrid({
			url : '${proPath}/supplier/selectPage',
			fitColumns : true,
			//设定是否换行显示数据， true为不换行
			nowrap : true,
			//分布工具栏，设定为true时显示
			pagination : true,
			pageList : [ 2, 3, 5 ],
			pageSize : 2,
			//设定为true，显示行号
			rownumbers : true,
			striped : true,
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					parent.$('#win').window({ 
							title:'添加供应商',      
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/addSupplier' title='添加供应商' height='100%' width='100%' frameborder='0px' ></iframe>"
						}); 
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除',
				handler : function() {
					/*
					1.获取id数组
					2.判空，提示是否确定
					3.异步删除
					4.刷新页面
					 */
					var rows = $("#dg").datagrid("getSelections");
					if (rows.length == 0) {
						alert("请选择要删除的记录!");
						return false;
					}
					var idArr = new Array();
					for ( var i = 0; i < rows.length; ++i) {
						idArr[i] = rows[i].supId;
					}

					parent.$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
						if (r) {
							$.ajax({
								url : '${proPath}/supplier/deleteArr',
								type : 'POST',
								traditional : true,
								dataType:'json',
								data : {
									ids : idArr
								},
								success : function(msg) {
									if(msg==0){
										$.messager.alert('警告','删除错误，请联系管理员！','error'); 
									}
									$('#dg').datagrid('load');
									$('#dg').datagrid('clearSelections');
								},
								error:function(){
									$.messager.alert('警告','删除错误，请联系管理员！','error');
								}
							});
						}
					});
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
				
					var rows = $("#dg").datagrid("getSelections");
					if (rows.length != 1) {
						alert("必须选择一条记录!");
						return false;
					}	
					parent.$('#win').window({ 
							title:'修改供应商',      
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/updateSupplier' title='修改供应商' height='100%' width='100%' frameborder='0px' ></iframe>"
						}); 
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