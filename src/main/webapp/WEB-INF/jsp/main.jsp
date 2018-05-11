<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>主界面</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style-type: none;
}

a.l-btn span.l-btn-left {
	width: 160px;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$.messager.show({
			title : '消息',
			msg : '欢迎您,${currAccount.accName}!',
			timeout : 2000,
			showType : 'slide'
		});

		$(".easyui-linkbutton").click(function() {
			var title = $(this).text();
			var text = this.href;

			//如果选项卡存在就选中,不存在就添加
			if ($('#tt').tabs('exists', title)) {
				$('#tt').tabs('select', title);
			} else {
				$('#tt').tabs('add', {
					title : title,
					closable:true,
					//可以加载内容填充到选项卡，页面有Js时，也可加载
					content:"<iframe src='"+text+"' title='"+title+"' height='100%' width='100%' frameborder='0px' ></iframe>"
				});
			}
			return false;
		});
	});
</script>

</head>
<body class="easyui-layout">

	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:230px;">
		<div id="aa" class="easyui-accordion" style="height:200px;">
			<div title="基本数据录入" style="overflow:auto;padding:10px;"
				data-options="selected:true">
				<ul>
					<li><a id="btn" href="${proPath }/base/goURL/supplier/supplierList" class="easyui-linkbutton">供应商管理</a>
					</li>
					<li><a id="btn" href="${proPath }/base/goURL/goods/goodsList" class="easyui-linkbutton">商品管理</a>
					</li>
				</ul>
			</div>
			<div title="进货管理" style="overflow:auto;padding:10px;"
				data-options="selected:true">
				<ul>
					<li><a id="btn" href="${proPath }/base/goURL/goods/addStore" class="easyui-linkbutton">商品入库</a>
					</li>
					<li><a id="btn" href="#" class="easyui-linkbutton">商品管理</a>
					</li>
				</ul>
			</div>
			<div title="仓库管理" style="overflow:auto;padding:10px;"
				data-options="selected:true">
				<ul>
					<li><a id="btn" href="#" class="easyui-linkbutton">供应商管理</a>
					</li>
					<li><a id="btn" href="#" class="easyui-linkbutton">商品管理</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div data-options="region:'center',title:'主界面'"
		style="padding:5px;background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="欢迎页面" style="padding:20px;">这是欢迎页面</div>
		</div>

	</div>
	<div id="win"></div>
</body>
</html>