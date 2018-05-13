<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>selectGoods</title>
<script type="text/javascript">
  		$(function(){
  			var win = parent.$("iframe[title='商品入库']").get(0).contentWindow;//返回ifram页面文档（window)
	  		$('#dg').datagrid({    
	  		
			    //url:'${proPath}/supplier/selectPage.action', //支持单个关键字的分页查询  			 
				url:'${proPath}/goods/selectPage', //支持多个条件的分页查询
			    striped:true,
			    fitColumns:true,
			    idField:'goodsId',
			    rownumbers:true,
			    loadMsg:"加载中，请稍等...",
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,15],
			    singleSelect:true,			
			    
			    toolbar: [{
					iconCls: 'icon-ok',
					text:'确定',
					handler: function(){
						var row = $('#dg').datagrid("getSelected");
						if(row==null){
							alert("请选择商品");
							return false;
						}
						win.$('#dg').datagrid('appendRow',{
							goodsId: row.goodsId,
							goodsName:row.goodsName,
							goodsColor: row.goodsColor,
							bodAmount:$('#bodAmount').val(),
							bodBuyPrice:$('#bodBuyPrice').val(),
							bodTotalPrice:$('#bodBuyPrice').val()*$('#bodAmount').val(),
							bodImeiList:$('#bodImeiList').val()
						});
						
						parent.$('#win').window("close");
						
					}				
				},'-',{
					text:"<input type='text' id='goodsName' name='goodsName'/>"
				}],

			    columns:[[    
			    	{checkbox:true},    
			        {field:'goodsId',title:'商品编号',width:100},    
			        {field:'goodsName',title:'商品名称',width:100}  
			    ]]    
			});  
			
			$('#goodsName').searchbox({ 
			searcher:function(value,name){ 
					$('#dg').datagrid('load',{
						keyWord:value
					});					
				}, 				
				prompt:'请输入商品名' 
			}); 
  		
  		});
  	</script>
  
  </head>
<body>

	<table id="dg"></table>
	<form style="padding:5px;margin:0px;background:#eee;" action="">
		采购数量：
		<input type="text" id='bodAmount' name='bodAmount' class="easyui-numberbox" value="1"
			data-options="min:1,max:1000000000"
		>
		价格：
		<input type="text" id='bodBuyPrice' name='bodBuyPrice' class="easyui-numberbox" 
			data-options="min:0,precision:2"
		>
		手机串号：
		<input type="text" id='bodImeiList' name='bodImeiList'>
	</form>
</body>
</html>