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
		<title>appLinkMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(appLinkQuery);
				dt$.obj('#insertBtn').click(appLinkInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function appLinkQuery()
			{
				var url = "test/AppLinkAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function appLinkInsert()
			{
				var url = "<%=request.getContextPath()%>/test/AppLinkAction!prepareCreate.action";
				window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
						<tr>
						<th><s:label value="LinkId"></s:label></th>
						<td><dt:input id="linkId" name="appLinkQB.linkId"></dt:input></td>
								<th><s:label value="AppId"></s:label></th>
						<td><dt:input id="appId" name="appLinkQB.appId"></dt:input></td>
								<th><s:label value="AppType"></s:label></th>
						<td><dt:input id="appType" name="appLinkQB.appType"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="AppIcon"></s:label></th>
						<td><dt:input id="appIcon" name="appLinkQB.appIcon"></dt:input></td>
								<th><s:label value="AppEntry"></s:label></th>
						<td><dt:input id="appEntry" name="appLinkQB.appEntry"></dt:input></td>
								<th><s:label value="AppVersion"></s:label></th>
						<td><dt:input id="appVersion" name="appLinkQB.appVersion"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="DownloadLink"></s:label></th>
						<td><dt:input id="downloadLink" name="appLinkQB.downloadLink"></dt:input></td>
								<th><s:label value="Sts"></s:label></th>
						<td><dt:input id="sts" name="appLinkQB.sts"></dt:input></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><dt:dateInput id="stsTime" name="appLinkQB.stsTime" showTime="true" buttonImage="true"></dt:dateInput></td>
							</tr>
							<tr>
						<th><s:label value="CreateTime"></s:label></th>
						<td><dt:dateInput id="createTime" name="appLinkQB.createTime" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="AppSize"></s:label></th>
						<td><dt:input id="appSize" name="appLinkQB.appSize"></dt:input></td>
								<th><s:label value="UpgradeDes"></s:label></th>
						<td><dt:input id="upgradeDes" name="appLinkQB.upgradeDes"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="SystemRequire"></s:label></th>
						<td><dt:input id="systemRequire" name="appLinkQB.systemRequire"></dt:input></td>
								<th><s:label value="BundleId"></s:label></th>
						<td><dt:input id="bundleId" name="appLinkQB.bundleId"></dt:input></td>
								<th><s:label value="RegisterAddr"></s:label></th>
						<td><dt:input id="registerAddr" name="appLinkQB.registerAddr"></dt:input></td>
							</tr>
					</table>
			</s:form>
			<br>
			<div align="center">
			    <dt:button id="queryBtn" label="查询"></dt:button>
				<dt:button id="insertBtn" label="新增"></dt:button>
				<dt:button id="resetBtn" label="重置"></dt:button>
			</div>
			<br>
			<!--查询结果-->
			<div id="resultDiv"></div>
		</div>
	</body>
</html>