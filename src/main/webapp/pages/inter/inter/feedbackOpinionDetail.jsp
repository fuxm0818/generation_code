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
						<th><s:label value="FeedbackOpinion"></s:label></th>
						<td><s:property value="feedbackOpinion.feedbackOpinion"/></td>
								<th><s:label value="OpinionContent"></s:label></th>
						<td><s:property value="feedbackOpinion.opinionContent"/></td>
								<th><s:label value="ContactWay"></s:label></th>
						<td><s:property value="feedbackOpinion.contactWay"/></td>
							</tr>
							<tr>
						<th><s:label value="PlatType"></s:label></th>
						<td><s:property value="feedbackOpinion.platType"/></td>
								<th><s:label value="OpinionSource"></s:label></th>
						<td><s:property value="feedbackOpinion.opinionSource"/></td>
								<th><s:label value="OpinionDealInfo"></s:label></th>
						<td><s:property value="feedbackOpinion.opinionDealInfo"/></td>
							</tr>
							<tr>
						<th><s:label value="AppPortal"></s:label></th>
						<td><s:property value="feedbackOpinion.appPortal"/></td>
								<th><s:label value="CreateDate"></s:label></th>
						<td><s:date name="feedbackOpinion.createDate" /></td>
								<th><s:label value="Sts"></s:label></th>
						<td><s:property value="feedbackOpinion.sts"/></td>
							</tr>
							<tr>
						<th><s:label value="StsDate"></s:label></th>
						<td><s:date name="feedbackOpinion.stsDate" /></td>
								<th><s:label value="Remark"></s:label></th>
						<td><s:property value="feedbackOpinion.remark"/></td>
					</table>
		</div>
	</body>
</html>