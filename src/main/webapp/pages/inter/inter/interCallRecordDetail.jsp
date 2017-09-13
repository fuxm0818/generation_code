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
		<title>busiSysConfigDetail</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
		
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<table class="condition" width="100%" align="center">
						<tr>
						<th><s:label value="InterCallRecordId"></s:label></th>
						<td><s:property value="interCallRecord.interCallRecordId"/></td>
								<th><s:label value="BusiId"></s:label></th>
						<td><s:property value="interCallRecord.busiId"/></td>
								<th><s:label value="CallResult"></s:label></th>
						<td><s:property value="interCallRecord.callResult"/></td>
							</tr>
							<tr>
						<th><s:label value="FailReason"></s:label></th>
						<td><s:property value="interCallRecord.failReason"/></td>
								<th><s:label value="TransactionId"></s:label></th>
						<td><s:property value="interCallRecord.transactionId"/></td>
								<th><s:label value="InterType"></s:label></th>
						<td><s:property value="interCallRecord.interType"/></td>
							</tr>
							<tr>
						<th><s:label value="InterUrl"></s:label></th>
						<td><s:property value="interCallRecord.interUrl"/></td>
								<th><s:label value="InterMethod"></s:label></th>
						<td><s:property value="interCallRecord.interMethod"/></td>
								<th><s:label value="DataParameter"></s:label></th>
						<td><s:property value="interCallRecord.dataParameter"/></td>
							</tr>
							<tr>
						<th><s:label value="Remarks"></s:label></th>
						<td><s:property value="interCallRecord.remarks"/></td>
								<th><s:label value="Sts"></s:label></th>
						<td><s:property value="interCallRecord.sts"/></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><s:date name="interCallRecord.stsTime" /></td>
							</tr>
							<tr>
						<th><s:label value="CreateTime"></s:label></th>
						<td><s:date name="interCallRecord.createTime" /></td>
					</table>
		</div>
	</body>
</html>