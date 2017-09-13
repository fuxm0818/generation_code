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
						<th><s:label value="PersonId"></s:label></th>
						<td><s:property value="cgmPerson.personId"/></td>
								<th><s:label value="Name"></s:label></th>
						<td><s:property value="cgmPerson.name"/></td>
								<th><s:label value="EverName"></s:label></th>
						<td><s:property value="cgmPerson.everName"/></td>
							</tr>
							<tr>
						<th><s:label value="CertificateType"></s:label></th>
						<td><s:property value="cgmPerson.certificateType"/></td>
								<th><s:label value="CertificateNumber"></s:label></th>
						<td><s:property value="cgmPerson.certificateNumber"/></td>
								<th><s:label value="Gender"></s:label></th>
						<td><s:property value="cgmPerson.gender"/></td>
							</tr>
							<tr>
						<th><s:label value="Birthday"></s:label></th>
						<td><s:date name="cgmPerson.birthday" /></td>
								<th><s:label value="HasPhoto"></s:label></th>
						<td><s:property value="cgmPerson.hasPhoto"/></td>
								<th><s:label value="Nationality"></s:label></th>
						<td><s:property value="cgmPerson.nationality"/></td>
							</tr>
							<tr>
						<th><s:label value="Nation"></s:label></th>
						<td><s:property value="cgmPerson.nation"/></td>
								<th><s:label value="EducationalLevel"></s:label></th>
						<td><s:property value="cgmPerson.educationalLevel"/></td>
								<th><s:label value="MaritalStatus"></s:label></th>
						<td><s:property value="cgmPerson.maritalStatus"/></td>
							</tr>
							<tr>
						<th><s:label value="PoliticalStatus"></s:label></th>
						<td><s:property value="cgmPerson.politicalStatus"/></td>
								<th><s:label value="ReligiousFaith"></s:label></th>
						<td><s:property value="cgmPerson.religiousFaith"/></td>
								<th><s:label value="Birthplace"></s:label></th>
						<td><s:property value="cgmPerson.birthplace"/></td>
							</tr>
							<tr>
						<th><s:label value="DomicileAddress"></s:label></th>
						<td><s:property value="cgmPerson.domicileAddress"/></td>
								<th><s:label value="HealthCondition"></s:label></th>
						<td><s:property value="cgmPerson.healthCondition"/></td>
								<th><s:label value="BloodType"></s:label></th>
						<td><s:property value="cgmPerson.bloodType"/></td>
							</tr>
							<tr>
						<th><s:label value="Stature"></s:label></th>
						<td><s:property value="cgmPerson.stature"/></td>
								<th><s:label value="Feature"></s:label></th>
						<td><s:property value="cgmPerson.feature"/></td>
								<th><s:label value="CurrentStutus"></s:label></th>
						<td><s:property value="cgmPerson.currentStutus"/></td>
							</tr>
							<tr>
						<th><s:label value="CreateTime"></s:label></th>
						<td><s:date name="cgmPerson.createTime" /></td>
								<th><s:label value="UpdateTime"></s:label></th>
						<td><s:date name="cgmPerson.updateTime" /></td>
								<th><s:label value="Status"></s:label></th>
						<td><s:property value="cgmPerson.status"/></td>
							</tr>
							<tr>
						<th><s:label value="Operator"></s:label></th>
						<td><s:property value="cgmPerson.operator"/></td>
					</table>
		</div>
	</body>
</html>