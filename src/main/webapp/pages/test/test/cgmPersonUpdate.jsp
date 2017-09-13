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
		<title>cgmPersonUpdate</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<dt:comppath></dt:comppath>
		<script type="text/javascript" language="JavaScript" src="<%=request.getContextPath()%>/js/common.ref.js"></script>
		<script type="text/javascript" language="JavaScript">
			dt$.ready(function(){
				dt$.obj('#confirmUpdateBtn').click(cgmPersonUpdate);
				dt$.obj("#cancleUpdateBtn").click(cancleOpt);
				dt$.obj('#resetUpdateBtn').click(function(){
					document.forms['parameters'].reset();
					//xxx.selectedByValue("cgmPerson.xxx");
				});
			});
			//修改
			function cgmPersonUpdate() {
				if (dt$.validate('#parameters')) {
					var url = "test/CgmPersonAction!update.action";
					var param = $("#parameters").serialize();
					dt$.ajaxPost(url, param, function(result) {
						if (result == 1) {
							dt$.success("操作成功", null, function() {
								window.close();
								window.dialogArguments.cgmPersonQuery();
							});
						} else {
							dt$.error("操作失败", null, function() {
								window.close();
								window.dialogArguments.cgmPersonQuery();
							});
						}
					});
				}
			}
			//关闭
			function cancleOpt() {
				window.close();
				window.dialogArguments.cgmPersonQuery();
			}
		</script>
	</head>
	<body>
		<div class="ui-widget-content func-panel">
			<div class="ui-widget-header func-header">标题</div>
			<s:form id="parameters">
					<s:hidden id="personId" name="cgmPerson.personId"></s:hidden>
					<table class="condition" width="100%" align="center">
										<tr>
								<th><s:label value="Name"></s:label></th>
								<td><dt:input id="name" name="cgmPerson.name" prompt="Name"></dt:input></td>
														<th><s:label value="EverName"></s:label></th>
								<td><dt:input id="everName" name="cgmPerson.everName" prompt="EverName"></dt:input></td>
														<th><s:label value="CertificateType"></s:label></th>
								<td><dt:input id="certificateType" name="cgmPerson.certificateType" prompt="CertificateType"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="CertificateNumber"></s:label></th>
								<td><dt:input id="certificateNumber" name="cgmPerson.certificateNumber" prompt="CertificateNumber"></dt:input></td>
														<th><s:label value="Gender"></s:label></th>
								<td><dt:input id="gender" name="cgmPerson.gender" prompt="Gender"></dt:input></td>
														<th><s:label value="Birthday"></s:label></th>
								<td><dt:dateInput id="birthday" name="cgmPerson.birthday" buttonImage="true" prompt="Birthday" showTime="true"></dt:dateInput></td>
										</tr>
												<tr>
								<th><s:label value="HasPhoto"></s:label></th>
								<td><dt:input id="hasPhoto" name="cgmPerson.hasPhoto" prompt="HasPhoto"></dt:input></td>
														<th><s:label value="Nationality"></s:label></th>
								<td><dt:input id="nationality" name="cgmPerson.nationality" prompt="Nationality"></dt:input></td>
														<th><s:label value="Nation"></s:label></th>
								<td><dt:input id="nation" name="cgmPerson.nation" prompt="Nation"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="EducationalLevel"></s:label></th>
								<td><dt:input id="educationalLevel" name="cgmPerson.educationalLevel" prompt="EducationalLevel"></dt:input></td>
														<th><s:label value="MaritalStatus"></s:label></th>
								<td><dt:input id="maritalStatus" name="cgmPerson.maritalStatus" prompt="MaritalStatus"></dt:input></td>
														<th><s:label value="PoliticalStatus"></s:label></th>
								<td><dt:input id="politicalStatus" name="cgmPerson.politicalStatus" prompt="PoliticalStatus"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="ReligiousFaith"></s:label></th>
								<td><dt:input id="religiousFaith" name="cgmPerson.religiousFaith" prompt="ReligiousFaith"></dt:input></td>
														<th><s:label value="Birthplace"></s:label></th>
								<td><dt:input id="birthplace" name="cgmPerson.birthplace" prompt="Birthplace"></dt:input></td>
														<th><s:label value="DomicileAddress"></s:label></th>
								<td><dt:input id="domicileAddress" name="cgmPerson.domicileAddress" prompt="DomicileAddress"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="HealthCondition"></s:label></th>
								<td><dt:input id="healthCondition" name="cgmPerson.healthCondition" prompt="HealthCondition"></dt:input></td>
														<th><s:label value="BloodType"></s:label></th>
								<td><dt:input id="bloodType" name="cgmPerson.bloodType" prompt="BloodType"></dt:input></td>
														<th><s:label value="Stature"></s:label></th>
								<td><dt:input id="stature" name="cgmPerson.stature" prompt="Stature"></dt:input></td>
										</tr>
												<tr>
								<th><s:label value="Feature"></s:label></th>
								<td><dt:input id="feature" name="cgmPerson.feature" prompt="Feature"></dt:input></td>
														<th><s:label value="CurrentStutus"></s:label></th>
								<td><dt:input id="currentStutus" name="cgmPerson.currentStutus" prompt="CurrentStutus"></dt:input></td>
														<th><s:label value="CreateTime"></s:label></th>
								<td><dt:dateInput id="createTime" name="cgmPerson.createTime" buttonImage="true" required="true" prompt="CreateTime" showTime="true"></dt:dateInput></td>
										</tr>
												<tr>
								<th><s:label value="UpdateTime"></s:label></th>
								<td><dt:dateInput id="updateTime" name="cgmPerson.updateTime" buttonImage="true" prompt="UpdateTime" showTime="true"></dt:dateInput></td>
														<th><s:label value="Status"></s:label></th>
								<td><dt:input id="status" name="cgmPerson.status" required="true" prompt="Status"></dt:input></td>
														<th><s:label value="Operator"></s:label></th>
								<td><dt:input id="operator" name="cgmPerson.operator" required="true" prompt="Operator"></dt:input></td>
										</tr>
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