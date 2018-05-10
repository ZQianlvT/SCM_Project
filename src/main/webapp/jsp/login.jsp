<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录界面</title>
<script type="text/javascript">
	$(function() {
		$('#dd').dialog({
			title : '管理员登录',
			width : 400,
			height : 200,
			closed : false,
			cache : false,
			modal : true,
			buttons : [ {
				text : '登录',
				handler : function() {
					$('#ff').form('enableValidation');
					if ($('#ff').form('validate')) {//验证通过
						$('#ff').submit();
					}
				}
			}, {
				text : '清空',
				handler : function() {
					$('#ff').form('clear');
				}
			} ]
		});

		$('#ff').form('disableValidation');

	});
</script>

</head>
<body>
	<div id="dd" style="padding:20px;text-align: center">
		<form id="ff" action="${proPath }/account/login" method="post">
			<div>
				<label for="accLogin">账户：</label> <input class="easyui-validatebox"
					type="text" name="accLogin" data-options="required:true"
					value="${requestScope.account.accLogin }" />
			</div>
			<div>
				<label for="accPass">密码：</label> <input class="easyui-validatebox"
					type="text" name="accPass" data-options="required:true"
					value="${requestScope.account.accPass }" />
			</div>
			<div style="color:red">${requestScope.errMsg }</div>
		</form>
	</div>
</body>
</html>