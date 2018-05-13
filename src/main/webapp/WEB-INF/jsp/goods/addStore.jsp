
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>GoodsList</title>
<style type="text/css">
.searchbox {
	margin: -3;
}
</style>
<script type="text/javascript">
	$(function() {
		var currRowIndex = undefined;
		$('#dg')
				.datagrid(
						{
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
							toolbar : [
									{
										iconCls : 'icon-add',
										text : '新增',
										handler : function() {
											parent
													.$('#win')
													.window(
															{
																title : '选择商品',
																width : 600,
																height : 400,
																modal : true,
																content : "<iframe src='${proPath}/base/goURL/goods/selectGoods' title='选择商品' height='100%' width='100%' frameborder='0px' ></iframe>"
															});
										}
									},
									'-',
									{
										iconCls : 'icon-remove',
										text : '删除',
										handler : function() {
											alert("删除");
										}
									},
									'-',
									{
										iconCls : 'icon-edit',
										text : '提交入库',
										handler : function() {
											var rows = $("#dg").datagrid(
													"getRows");
											$('#ff')
													.form(
															'submit',
															{
																url : "${proPath}/buyOrder/insert",
																onSubmit : function(
																		param) {
																	param.rows = JSON
																			.stringify(rows);
																}
															});
										}
									} ],
							columns : [ [ {
								checkbox : true
							}, {
								field : 'goodsId',
								title : '商品编号',
								align : 'left',
								width : 100
							}, {
								field : 'goodsName',
								title : '商品名',
								align : 'left',
								width : 100
							}, {
								field : 'goodsColor',
								title : '商品颜色',
								align : 'left',
								width : 100

							}, {
								field : 'bodAmount',
								title : '数量',
								align : 'left',
								width : 100,
								editor : type = 'numberbox'
							}, {
								field : 'bodBuyPrice',
								title : '进价（元）',
								width : 100,
								editor : type = 'numberbox'
							}, {
								field : 'bodTotalPrice',
								title : '总价（元）',
								width : 100
							}, {
								field : 'bodImeiList',
								title : '串号',
								width : 100,
								formatter : function(value, row, index) {
									return "<span title="+value+">"+value+"</span>";
								}

							} ] ],
							onDblClickCell : function(rowIndex, field, value) {
								$(this).datagrid('beginEdit', rowIndex);
								var ed = $(this).datagrid('getEditor', {
									index : rowIndex
								});
								currRowIndex = rowIndex;
							},
							onClickCell : function(rowIndex, field, value) {
								if (currRowIndex != undefined) {
									var edBA = $(this).datagrid('getEditor', {
										index : rowIndex,
										field : 'bodAmount'
									});
									var edBBP = $(this).datagrid('getEditor', {
										index : rowIndex,
										field : 'bodBuyPrice'
									});
									var bodAmountValue = $(edBA.target)
											.numberbox('getValue');
									var bodBuyPriceValue = $(edBBP.target)
											.numberbox('getValue');
									var totalPrice = bodAmountValue
											* bodBuyPriceValue;
									$(this).datagrid('endEdit', currRowIndex);
									$(this).datagrid('updateRow', {
										index : currRowIndex,
										row : {
											bodTotalPrice : totalPrice
										}
									});
									currRowIndex = undefined;
								}
							}
						});
		$('#supName')
				.searchbox(
						{
							searcher : function(value, name) {
								parent
										.$('#win')
										.window(
												{
													title : '选择供应商',
													width : 600,
													height : 400,
													modal : true,
													content : "<iframe src='${proPath}/base/goURL/supplier/selectSupplier' title='选择供应商' height='100%' width='100%' frameborder='0px' ></iframe>"
												});
							},
							prompt : '请选择供应商'
						});
	});
</script>

</head>
<body>
	<form style="padding:15px;margin:0px;background:#eee;" id="ff">
		请填写采购信息：<br> 供应商：
		<input type="hidden" id="supId" name="supId" />
		<input type="text" id="supName" name="supName" />
		<br> 仓库：
		<select id="shId" class="easyui-combobox" name="shId" style="width:200px;">
			<c:forEach items="${applicationScope.sysParam.shId}" var="shId">
				<option value="${shId.key}">${shId.value}</option>
			</c:forEach>
		</select>
		<br> 日期：
		<input type="text" id="boDate" class="easyui-datebox" name="boDate"></input>
		<br> 应付：
		<input type="text" id="boPayable" name="boPayable" />
		<br> 已付：
		<input type="text" id="boPaid" name="boPaid" />
		<br> 欠款：
		<input type="text" id="boArrears" name="boArrears" />
		<br> 原始单号：
		<input type="text" id="boOriginal" name="boOriginal" />
		<br> 经手人：
		<input type="text" id="boAttn" name="boAttn" />
		<br> 操作员：
		<input type="text" id="boOperator" name="boOperator" />
		<br> 备注：
		<input type="text" id="boRemark" name="boRemark" />
		<br>
	</form>
	<table id="dg"></table>
</body>
</html>