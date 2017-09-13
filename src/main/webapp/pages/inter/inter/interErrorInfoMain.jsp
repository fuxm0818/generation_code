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
		<title>interErrorInfoMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(interErrorInfoQuery);
				dt$.obj('#insertBtn').click(interErrorInfoInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function interErrorInfoQuery()
			{
				var url = "inter/InterErrorInfoAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function interErrorInfoInsert()
			{
				var url = "<%=request.getContextPath()%>/inter/InterErrorInfoAction!prepareCreate.action";
				window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
				<table class="condition" width="100%" align="center">
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