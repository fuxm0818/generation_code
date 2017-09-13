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
		<title>appStoreCreate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmInsertBtn').click(appStoreInsert);
				dt$.obj("#cancleInsertBtn").click(cancleOpt);
				dt$.obj('#resetInsertBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(0);
				});
			});
			//新增
			function appStoreInsert() {
				if (dt$.validate('#parameters')) {
					var url = "terminal/AppStoreAction!create.action";
					var parameters = $("#parameters").serialize();
					dt$.ajaxPost(url, parameters, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.appStoreQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.appStoreQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.appStoreQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="AppStoreName"></s:label></th>
								<td><dt:input id="appStoreName" name="appStore.appStoreName" required="true" prompt="AppStoreName"></dt:input></td>
														<th><s:label value="AppStoreDesc"></s:label></th>
								<td><dt:input id="appStoreDesc" name="appStore.appStoreDesc" prompt="AppStoreDesc"></dt:input></td>
														<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="appStore.sts" required="true" prompt="Sts"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="StsTime"></s:label></th>
								<td><dt:dateInput id="stsTime" name="appStore.stsTime" buttonImage="true" required="true" prompt="StsTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="appStore.createTime" buttonImage="true" required="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
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