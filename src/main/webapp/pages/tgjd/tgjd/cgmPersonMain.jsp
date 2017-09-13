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
		<title>cgmPersonMain</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#queryBtn').click(cgmPersonQuery);
				dt$.obj('#insertBtn').click(cgmPersonInsert);
				dt$.obj('#resetBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByIndex(-1);
				});
			});
			//查询
			function cgmPersonQuery()
			{
				var url = "tgjd/CgmPersonAction!showList.action";
				var parameters = $("#parameters").serialize();
				dt$.obj("#resultDiv").load(url,parameters);
			}
			//打开新增页面
			function cgmPersonInsert()
			{
				var url = "<%=request.getContextPath()%>/tgjd/CgmPersonAction!prepareCreate.action";
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
						<th><s:label value="PersonId"></s:label></th>
						<td><dt:input id="personId" name="cgmPersonQB.personId"></dt:input></td>
								<th><s:label value="Name"></s:label></th>
						<td><dt:input id="name" name="cgmPersonQB.name"></dt:input></td>
								<th><s:label value="EverName"></s:label></th>
						<td><dt:input id="everName" name="cgmPersonQB.everName"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="CertificateType"></s:label></th>
						<td><dt:input id="certificateType" name="cgmPersonQB.certificateType"></dt:input></td>
								<th><s:label value="CertificateNumber"></s:label></th>
						<td><dt:input id="certificateNumber" name="cgmPersonQB.certificateNumber"></dt:input></td>
								<th><s:label value="Gender"></s:label></th>
						<td><dt:input id="gender" name="cgmPersonQB.gender"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Birthday"></s:label></th>
						<td><dt:dateInput id="birthday" name="cgmPersonQB.birthday" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="HasPhoto"></s:label></th>
						<td><dt:input id="hasPhoto" name="cgmPersonQB.hasPhoto"></dt:input></td>
								<th><s:label value="Nationality"></s:label></th>
						<td><dt:input id="nationality" name="cgmPersonQB.nationality"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Nation"></s:label></th>
						<td><dt:input id="nation" name="cgmPersonQB.nation"></dt:input></td>
								<th><s:label value="EducationalLevel"></s:label></th>
						<td><dt:input id="educationalLevel" name="cgmPersonQB.educationalLevel"></dt:input></td>
								<th><s:label value="MaritalStatus"></s:label></th>
						<td><dt:input id="maritalStatus" name="cgmPersonQB.maritalStatus"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="PoliticalStatus"></s:label></th>
						<td><dt:input id="politicalStatus" name="cgmPersonQB.politicalStatus"></dt:input></td>
								<th><s:label value="ReligiousFaith"></s:label></th>
						<td><dt:input id="religiousFaith" name="cgmPersonQB.religiousFaith"></dt:input></td>
								<th><s:label value="Birthplace"></s:label></th>
						<td><dt:input id="birthplace" name="cgmPersonQB.birthplace"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="DomicileAddress"></s:label></th>
						<td><dt:input id="domicileAddress" name="cgmPersonQB.domicileAddress"></dt:input></td>
								<th><s:label value="HealthCondition"></s:label></th>
						<td><dt:input id="healthCondition" name="cgmPersonQB.healthCondition"></dt:input></td>
								<th><s:label value="BloodType"></s:label></th>
						<td><dt:input id="bloodType" name="cgmPersonQB.bloodType"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Stature"></s:label></th>
						<td><dt:input id="stature" name="cgmPersonQB.stature"></dt:input></td>
								<th><s:label value="Feature"></s:label></th>
						<td><dt:input id="feature" name="cgmPersonQB.feature"></dt:input></td>
								<th><s:label value="CurrentStutus"></s:label></th>
						<td><dt:input id="currentStutus" name="cgmPersonQB.currentStutus"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="CreateTime"></s:label></th>
						<td><dt:dateInput id="createTime" name="cgmPersonQB.createTime" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="UpdateTime"></s:label></th>
						<td><dt:dateInput id="updateTime" name="cgmPersonQB.updateTime" showTime="true" buttonImage="true"></dt:dateInput></td>
								<th><s:label value="Status"></s:label></th>
						<td><dt:input id="status" name="cgmPersonQB.status"></dt:input></td>
							</tr>
							<tr>
						<th><s:label value="Operator"></s:label></th>
						<td><dt:input id="operator" name="cgmPersonQB.operator"></dt:input></td>
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