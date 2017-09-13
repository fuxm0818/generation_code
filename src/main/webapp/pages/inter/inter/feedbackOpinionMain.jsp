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
		<title>feedbackOpinionMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(feedbackOpinionQuery);
				dt$.obj('#insertBtn').click(feedbackOpinionInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function feedbackOpinionQuery()
			{
				var url = "inter/FeedbackOpinionAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function feedbackOpinionInsert()
			{
				var url = "<%=request.getContextPath()%>/inter/FeedbackOpinionAction!prepareCreate.action";
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
						<th><s:label value="FeedbackOpinion"></s:label></th>
						<td><dt:input id="feedbackOpinion" name="feedbackOpinionQB.feedbackOpinion"></dt:input></td>
								<th><s:label value="OpinionContent"></s:label></th>
						<td><dt:input id="opinionContent" name="feedbackOpinionQB.opinionContent"></dt:input></td>
								<th><s:label value="ContactWay"></s:label></th>
						<td><dt:input id="contactWay" name="feedbackOpinionQB.contactWay"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="PlatType"></s:label></th>
						<td><dt:input id="platType" name="feedbackOpinionQB.platType"></dt:input></td>
								<th><s:label value="OpinionSource"></s:label></th>
						<td><dt:input id="opinionSource" name="feedbackOpinionQB.opinionSource"></dt:input></td>
								<th><s:label value="OpinionDealInfo"></s:label></th>
						<td><dt:input id="opinionDealInfo" name="feedbackOpinionQB.opinionDealInfo"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="AppPortal"></s:label></th>
						<td><dt:input id="appPortal" name="feedbackOpinionQB.appPortal"></dt:input></td>
								<th><s:label value="CreateDate"></s:label></th>
						<td><dt:dateInput id="createDate" name="feedbackOpinionQB.createDate" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="Sts"></s:label></th>
						<td><dt:input id="sts" name="feedbackOpinionQB.sts"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="StsDate"></s:label></th>
						<td><dt:dateInput id="stsDate" name="feedbackOpinionQB.stsDate" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="Remark"></s:label></th>
						<td><dt:input id="remark" name="feedbackOpinionQB.remark"></dt:input></td>
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