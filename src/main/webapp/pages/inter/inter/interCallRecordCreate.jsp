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
		<title>interCallRecordCreate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmInsertBtn').click(interCallRecordInsert);
				dt$.obj("#cancleInsertBtn").click(cancleOpt);
				dt$.obj('#resetInsertBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(0);
				});
			});
			//新增
			function interCallRecordInsert() {
				if (dt$.validate('#parameters')) {
					var url = "inter/InterCallRecordAction!create.action";
					var parameters = $("#parameters").serialize();
					dt$.ajaxPost(url, parameters, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.interCallRecordQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.interCallRecordQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.interCallRecordQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="BusiId"></s:label></th>
								<td><dt:input id="busiId" name="interCallRecord.busiId" required="true" prompt="BusiId"></dt:input></td>
														<th><s:label value="CallResult"></s:label></th>
								<td><dt:input id="callResult" name="interCallRecord.callResult" prompt="CallResult"></dt:input></td>
														<th><s:label value="FailReason"></s:label></th>
								<td><dt:input id="failReason" name="interCallRecord.failReason" required="true" prompt="FailReason"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="TransactionId"></s:label></th>
								<td><dt:input id="transactionId" name="interCallRecord.transactionId" prompt="TransactionId"></dt:input></td>
														<th><s:label value="InterType"></s:label></th>
								<td><dt:input id="interType" name="interCallRecord.interType" required="true" prompt="InterType"></dt:input></td>
														<th><s:label value="InterUrl"></s:label></th>
								<td><dt:input id="interUrl" name="interCallRecord.interUrl" prompt="InterUrl"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="InterMethod"></s:label></th>
								<td><dt:input id="interMethod" name="interCallRecord.interMethod" prompt="InterMethod"></dt:input></td>
														<th><s:label value="DataParameter"></s:label></th>
								<td><dt:input id="dataParameter" name="interCallRecord.dataParameter" prompt="DataParameter"></dt:input></td>
														<th><s:label value="Remarks"></s:label></th>
								<td><dt:input id="remarks" name="interCallRecord.remarks" prompt="Remarks"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="Sts"></s:label></th>
								<td><dt:input id="sts" name="interCallRecord.sts" required="true" prompt="Sts"></dt:input></td>
														<th><s:label value="StsTime"></s:label></th>
								<td><dt:dateInput id="stsTime" name="interCallRecord.stsTime" buttonImage="true" required="true" prompt="StsTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="interCallRecord.createTime" buttonImage="true" required="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
										</tr>
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