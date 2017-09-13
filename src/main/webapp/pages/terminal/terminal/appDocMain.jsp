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
		<title>appDocMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(appDocQuery);
				dt$.obj('#insertBtn').click(appDocInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function appDocQuery()
			{
				var url = "terminal/AppDocAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function appDocInsert()
			{
				var url = "<%=request.getContextPath()%>/terminal/AppDocAction!prepareCreate.action";
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
						<th><s:label value="AppDocId"></s:label></th>
						<td><dt:input id="appDocId" name="appDocQB.appDocId"></dt:input></td>
								<th><s:label value="AppId"></s:label></th>
						<td><dt:input id="appId" name="appDocQB.appId"></dt:input></td>
								<th><s:label value="AppDocName"></s:label></th>
						<td><dt:input id="appDocName" name="appDocQB.appDocName"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="AppDocDesc"></s:label></th>
						<td><dt:input id="appDocDesc" name="appDocQB.appDocDesc"></dt:input></td>
								<th><s:label value="AppDocUrl"></s:label></th>
						<td><dt:input id="appDocUrl" name="appDocQB.appDocUrl"></dt:input></td>
								<th><s:label value="AppDocHtmlUrl"></s:label></th>
						<td><dt:input id="appDocHtmlUrl" name="appDocQB.appDocHtmlUrl"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Sts"></s:label></th>
						<td><dt:input id="sts" name="appDocQB.sts"></dt:input></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><dt:dateInput id="stsTime" name="appDocQB.stsTime" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="CreateTime"></s:label></th>
						<td><dt:dateInput id="createTime" name="appDocQB.createTime" showTime="true" buttonImage="true"></dt:dateInput></td>
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