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
		<title>appAppstoreRelUpdate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmUpdateBtn').click(appAppstoreRelUpdate);
				dt$.obj("#cancleUpdateBtn").click(cancleOpt);
				dt$.obj('#resetUpdateBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByValue("appAppstoreRel.xxx");
				});
			});
			//修改
			function appAppstoreRelUpdate() {
				if (dt$.validate('#parameters')) {
					var url = "terminal/AppAppstoreRelAction!update.action";
					var param = $("#parameters").serialize();
					dt$.ajaxPost(url, param, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.appAppstoreRelQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.appAppstoreRelQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.appAppstoreRelQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
					<s:hidden id="appAppstoreRelId" name="appAppstoreRel.appAppstoreRelId"></s:hidden>
					<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="AppId"></s:label></th>
								<td><dt:input id="appId" name="appAppstoreRel.appId" required="true" prompt="AppId"></dt:input></td>
														<th><s:label value="AppStoreId"></s:label></th>
								<td><dt:input id="appStoreId" name="appAppstoreRel.appStoreId" required="true" prompt="AppStoreId"></dt:input></td>
														<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="appAppstoreRel.sts" required="true" prompt="Sts"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="StsTime"></s:label></th>
								<td><dt:dateInput id="stsTime" name="appAppstoreRel.stsTime" buttonImage="true" required="true" prompt="StsTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="appAppstoreRel.createTime" buttonImage="true" required="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
									</table>
			</s:form>
			<div align="center">
			    <dt:button id="confirmUpdateBtn" label="确定"></dt:button>
				<dt:button id="resetUpdateBtn" label="重置"></dt:button>
				<dt:button id="cancleUpdateBtn" label="取消"></dt:button>
			</div>
		</div>
	</body>
</html>