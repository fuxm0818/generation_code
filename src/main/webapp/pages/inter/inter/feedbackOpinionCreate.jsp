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
		<title>feedbackOpinionCreate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmInsertBtn').click(feedbackOpinionInsert);
				dt$.obj("#cancleInsertBtn").click(cancleOpt);
				dt$.obj('#resetInsertBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(0);
				});
			});
			//新增
			function feedbackOpinionInsert() {
				if (dt$.validate('#parameters')) {
					var url = "inter/FeedbackOpinionAction!create.action";
					var parameters = $("#parameters").serialize();
					dt$.ajaxPost(url, parameters, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.feedbackOpinionQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.feedbackOpinionQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.feedbackOpinionQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="OpinionContent"></s:label></th>
								<td><dt:input id="opinionContent" name="feedbackOpinion.opinionContent" required="true" prompt="OpinionContent"></dt:input></td>
														<th><s:label value="ContactWay"></s:label></th>
								<td><dt:input id="contactWay" name="feedbackOpinion.contactWay" prompt="ContactWay"></dt:input></td>
														<th><s:label value="PlatType"></s:label></th>
								<td><dt:input id="platType" name="feedbackOpinion.platType" required="true" prompt="PlatType"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="OpinionSource"></s:label></th>
								<td><dt:input id="opinionSource" name="feedbackOpinion.opinionSource" required="true" prompt="OpinionSource"></dt:input></td>
														<th><s:label value="OpinionDealInfo"></s:label></th>
								<td><dt:input id="opinionDealInfo" name="feedbackOpinion.opinionDealInfo" prompt="OpinionDealInfo"></dt:input></td>
														<th><s:label value="AppPortal"></s:label></th>
								<td><dt:input id="appPortal" name="feedbackOpinion.appPortal" prompt="AppPortal"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="CreateDate"></s:label></th>
								<td><dt:dateInput id="createDate" name="feedbackOpinion.createDate" buttonImage="true" required="true" prompt="CreateDate" showTime="true"></dt:dateInput></td>
														<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="feedbackOpinion.sts" required="true" prompt="Sts"></dt:input></td>
														<th><s:label value="StsDate"></s:label></th>
								<td><dt:dateInput id="stsDate" name="feedbackOpinion.stsDate" buttonImage="true" required="true" prompt="StsDate" showTime="true"></dt:dateInput></td>
										</tr>
												<tr>
								<th><s:label value="Remark"></s:label></th>
								<td><dt:input id="remark" name="feedbackOpinion.remark" prompt="Remark"></dt:input></td>
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