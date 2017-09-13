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
						<th><s:label value="AppAppstoreRelId"></s:label></th>
						<td><s:property value="appAppstoreRel.appAppstoreRelId"/></td>
								<th><s:label value="AppId"></s:label></th>
						<td><s:property value="appAppstoreRel.appId"/></td>
								<th><s:label value="AppStoreId"></s:label></th>
						<td><s:property value="appAppstoreRel.appStoreId"/></td>
							</tr>
							<tr>
						<th><s:label value="Sts"></s:label></th>
						<td><s:property value="appAppstoreRel.sts"/></td>
								<th><s:label value="StsTime"></s:label></th>
						<td><s:date name="appAppstoreRel.stsTime" /></td>
								<th><s:label value="CreateTime"></s:label></th>
						<td><s:date name="appAppstoreRel.createTime" /></td>
							</tr>
				</table>
		</div>
	</body>
</html>