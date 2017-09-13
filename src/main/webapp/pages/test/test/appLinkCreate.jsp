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
		<title>appLinkCreate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmInsertBtn').click(appLinkInsert);
				dt$.obj("#cancleInsertBtn").click(cancleOpt);
				dt$.obj('#resetInsertBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(0);
				});
			});
			//新增
			function appLinkInsert() {
				if (dt$.validate('#parameters')) {
					var url = "test/AppLinkAction!create.action";
					var parameters = $("#parameters").serialize();
					dt$.ajaxPost(url, parameters, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.appLinkQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.appLinkQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.appLinkQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="AppId"></s:label></th>
								<td><dt:input id="appId" name="appLink.appId" required="true" prompt="AppId"></dt:input></td>
														<th><s:label value="AppType"></s:label></th>
								<td><dt:input id="appType" name="appLink.appType" required="true" prompt="AppType"></dt:input></td>
														<th><s:label value="AppIcon"></s:label></th>
								<td><dt:input id="appIcon" name="appLink.appIcon" required="true" prompt="AppIcon"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="AppEntry"></s:label></th>
								<td><dt:input id="appEntry" name="appLink.appEntry" prompt="AppEntry"></dt:input></td>
														<th><s:label value="AppVersion"></s:label></th>
								<td><dt:input id="appVersion" name="appLink.appVersion" required="true" prompt="AppVersion"></dt:input></td>
														<th><s:label value="DownloadLink"></s:label></th>
								<td><dt:input id="downloadLink" name="appLink.downloadLink" required="true" prompt="DownloadLink"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="appLink.sts" required="true" prompt="Sts"></dt:input></td>
														<th><s:label value="StsTime"></s:label></th>
								<td><dt:dateInput id="stsTime" name="appLink.stsTime" buttonImage="true" required="true" prompt="StsTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="appLink.createTime" buttonImage="true" required="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
										</tr>
												<tr>
								<th><s:label value="AppSize"></s:label></th>
								<td><dt:input id="appSize" name="appLink.appSize" prompt="AppSize"></dt:input></td>
														<th><s:label value="UpgradeDes"></s:label></th>
								<td><dt:input id="upgradeDes" name="appLink.upgradeDes" prompt="UpgradeDes"></dt:input></td>
														<th><s:label value="SystemRequire"></s:label></th>
								<td><dt:input id="systemRequire" name="appLink.systemRequire" prompt="SystemRequire"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="BundleId"></s:label></th>
								<td><dt:input id="bundleId" name="appLink.bundleId" prompt="BundleId"></dt:input></td>
														<th><s:label value="RegisterAddr"></s:label></th>
								<td><dt:input id="registerAddr" name="appLink.registerAddr" prompt="RegisterAddr"></dt:input></td>
									</table>
			</s:form>
			<div align="center">
			    <dt:button id="confirmInsertBtn" label="确定"></dt:button>
				<dt:button id="resetInsertBtn" label="重置"></dt:button>
				<dt:button id="cancleInsertBtn" label="取消"></dt:button>
			</div>
		</div>
	</body>
</html>