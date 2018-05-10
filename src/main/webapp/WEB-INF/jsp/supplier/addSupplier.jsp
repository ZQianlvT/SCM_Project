<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>addSupplier</title>
</head>
<body>

	<form id="ff" method="post">
		<div>
			<label for="supId">供应商编号:</label> <input class="easyui-validatebox"
				type="text" name="supId" />
		</div>
		<div>
			<label for="supName">供应商类型:</label> <input class="easyui-validatebox"
				type="text" name="supName" />
		</div>
		<div>
			<label for="supLinkman">供应商联系人:</label> <input
				class="easyui-validatebox" type="text" name="supLinkman" />
		</div>
		<div>
			<label for="supAddress">供应商类型地址:</label> <input class="easyui-validatebox"
				type="text" name="supAddress" />
		</div>
		<div>
			<label for="supPhone">联系电话:</label> <input class="easyui-validatebox"
				type="text" name="supPhone" />
		</div>

		<div>
			<label for="supType">供应商等级：</label> <select id="cc"
				class="easyui-combobox" name="supType" style="width:200px;">
				<c:forEach items="${applicationScope.sysParam.supType}"
					var="supType">
					<option value="${supType.key}">${supType.value}</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<input id="btn" class="easyui-linkbutton" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='供应商管理']").get(0).contentWindow;//返回ifram页面文档（window)

			$("[name='supName']").validatebox({
				required : true,
				missingMessage : '请填写供应商！'
			});

			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$("#ff").form("submit", {
						url : '${proPath}/supplier/addSupplier',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if (count == 0) {
								alert("添加失败！");
							}
							parent.$("#win").window("close");
							win.$("#dg").datagrid("reload");
						}
					});

				}

			});

		});
	</script>
</body>
</html>