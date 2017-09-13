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
		<title>interCallRecordMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(interCallRecordQuery);
				dt$.obj('#insertBtn').click(interCallRecordInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function interCallRecordQuery()
			{
				var url = "inter/InterCallRecordAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function interCallRecordInsert()
			{
				var url = "<%=request.getContextPath()%>/inter/InterCallRecordAction!prepareCreate.action";
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
						<th><s:label value="InterCallRecordId"></s:label></th>
						<td><dt:input id="interCallRecordId" name="interCallRecordQB.interCallRecordId"></dt:input></td>
								<th><s:label value="BusiId"></s:label></th>
						<td><dt:input id="busiId" name="interCallRecordQB.busiId"></dt:input></td>
								<th><s:label value="CallResult"></s:label></th>
						<td><dt:input id="callResult" name="interCallRecordQB.callResult"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="FailReason"></s:label></th>
						<td><dt:input id="failReason" name="interCallRecordQB.failReason"></dt:input></td>
								<th><s:label value="TransactionId"></s:label></th>
						<td><dt:input id="transactionId" name="interCallRecordQB.transactionId"></dt:input></td>
								<th><s:label value="InterType"></s:label></th>
						<td><dt:input id="interType" name="interCallRecordQB.interType"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="InterUrl"></s:label></th>
						<td><dt:input id="interUrl" name="interCallRecordQB.interUrl"></dt:input></td>
								<th><s:label value="InterMethod"></s:label></th>
						<td><dt:input id="interMethod" name="interCallRecordQB.interMethod"></dt:input></td>
								<th><s:label value="DataParameter"></s:label></th>
						<td><dt:input id="dataParameter" name="interCallRecordQB.dataParameter"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Remarks"></s:label></th>
						<td><dt:input id="remarks" name="interCallRecordQB.remarks"></dt:input></td>
								<th><s:label value="Sts"></s:label></th>
						<td><dt:input id="sts" name="interCallRecordQB.sts"></dt:input></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><dt:dateInput id="stsTime" name="interCallRecordQB.stsTime" showTime="true" buttonImage="true"></dt:dateInput></td>
							</tr>
							<tr>
						<th><s:label value="CreateTime"></s:label></th>
						<td><dt:dateInput id="createTime" name="interCallRecordQB.createTime" showTime="true" buttonImage="true"></dt:dateInput></td>
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