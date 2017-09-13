<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>busiSysConfigUpdate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmUpdateBtn').click(busiSysConfigUpdate);
				dt$.obj("#cancleUpdateBtn").click(cancleOpt);
				dt$.obj('#resetUpdateBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByValue("busiSysConfig.xxx");
				});
			});
			//修改
			function busiSysConfigUpdate() {
				if (dt$.validate('#parameters')) {
					var url = "test/BusiSysConfigAction!update.action";
					var param = $("#parameters").serialize();
					dt$.ajaxPost(url, param, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.busiSysConfigQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.busiSysConfigQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.busiSysConfigQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
					<s:hidden id="configId" name="busiSysConfig.configId"></s:hidden>
					<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="ParamName"></s:label></th>
								<td><dt:input id="paramName" name="busiSysConfig.paramName" required="true" prompt="ParamName"></dt:input></td>
														<th><s:label value="ParamValue"></s:label></th>
								<td><dt:input id="paramValue" name="busiSysConfig.paramValue" required="true" prompt="ParamValue"></dt:input></td>
														<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="busiSysConfig.sts" prompt="Sts"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="StsTime"></s:label></th>
								<td><dt:dateInput id="stsTime" name="busiSysConfig.stsTime" buttonImage="true" prompt="StsTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="busiSysConfig.createTime" buttonImage="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="TerminalAuthoNum"></s:label></th>
								<td><dt:input id="terminalAuthoNum" name="busiSysConfig.terminalAuthoNum" required="true" prompt="TerminalAuthoNum"></dt:input></td>
										</tr>
							</table>
			</s:form>
			<div align="center">
			    <dt:button id="confirmUpdateBtn" label="确定"></dt:button>
				<dt:button id="resetUpdateBtn" label="重置"></dt:button>
				<dt:button id="cancleUpdateBtn" label="取消"></dt:button>
			</div>
		</div>
	</body>
</html>