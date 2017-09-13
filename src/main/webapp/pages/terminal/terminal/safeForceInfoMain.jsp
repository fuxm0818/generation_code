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
		<title>safeForceInfoMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(safeForceInfoQuery);
				dt$.obj('#insertBtn').click(safeForceInfoInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function safeForceInfoQuery()
			{
				var url = "terminal/SafeForceInfoAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function safeForceInfoInsert()
			{
				var url = "<%=request.getContextPath()%>/terminal/SafeForceInfoAction!prepareCreate.action";
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
						<th><s:label value="SafeForceInfoId"></s:label></th>
						<td><dt:input id="safeForceInfoId" name="safeForceInfoQB.safeForceInfoId"></dt:input></td>
								<th><s:label value="TerminalId"></s:label></th>
						<td><dt:input id="terminalId" name="safeForceInfoQB.terminalId"></dt:input></td>
								<th><s:label value="WifiMacInfo"></s:label></th>
						<td><dt:input id="wifiMacInfo" name="safeForceInfoQB.wifiMacInfo"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Sts"></s:label></th>
						<td><dt:input id="sts" name="safeForceInfoQB.sts"></dt:input></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><dt:dateInput id="stsTime" name="safeForceInfoQB.stsTime" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="CreateTime"></s:label></th>
						<td><dt:dateInput id="createTime" name="safeForceInfoQB.createTime" showTime="true" buttonImage="true"></dt:dateInput></td>
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