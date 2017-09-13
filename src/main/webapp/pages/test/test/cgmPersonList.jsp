<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:cgmPersonDetail(\"" + rowObject.personId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:cgmPersonUpdate(\"" + rowObject.personId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:cgmPersonDelete(\"" + rowObject.personId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function cgmPersonDetail(personId)
	{
		var url = "test/CgmPersonAction!showDetail.action" + "?cgmPerson.personId=" + personId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function cgmPersonUpdate(personId)
	{
		var url = "<%=request.getContextPath()%>/test/CgmPersonAction!prepareUpdate.action" + "?cgmPerson.personId=" + personId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function cgmPersonDelete(personId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "test/CgmPersonAction!delete.action";
				var parameter = "cgmPerson.personId=" + personId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							cgmPersonQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							cgmPersonQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="test/CgmPersonAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="personId" label="PersonId"></dt:gridColumn>
		<dt:gridColumn name="name" label="Name"></dt:gridColumn>
		<dt:gridColumn name="everName" label="EverName"></dt:gridColumn>
		<dt:gridColumn name="certificateType" label="CertificateType"></dt:gridColumn>
		<dt:gridColumn name="certificateNumber" label="CertificateNumber"></dt:gridColumn>
		<dt:gridColumn name="gender" label="Gender"></dt:gridColumn>
		<dt:gridColumn name="birthday" label="Birthday"></dt:gridColumn>
		<dt:gridColumn name="hasPhoto" label="HasPhoto"></dt:gridColumn>
		<dt:gridColumn name="nationality" label="Nationality"></dt:gridColumn>
		<dt:gridColumn name="nation" label="Nation"></dt:gridColumn>
		<dt:gridColumn name="educationalLevel" label="EducationalLevel"></dt:gridColumn>
		<dt:gridColumn name="maritalStatus" label="MaritalStatus"></dt:gridColumn>
		<dt:gridColumn name="politicalStatus" label="PoliticalStatus"></dt:gridColumn>
		<dt:gridColumn name="religiousFaith" label="ReligiousFaith"></dt:gridColumn>
		<dt:gridColumn name="birthplace" label="Birthplace"></dt:gridColumn>
		<dt:gridColumn name="domicileAddress" label="DomicileAddress"></dt:gridColumn>
		<dt:gridColumn name="healthCondition" label="HealthCondition"></dt:gridColumn>
		<dt:gridColumn name="bloodType" label="BloodType"></dt:gridColumn>
		<dt:gridColumn name="stature" label="Stature"></dt:gridColumn>
		<dt:gridColumn name="feature" label="Feature"></dt:gridColumn>
		<dt:gridColumn name="currentStutus" label="CurrentStutus"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="updateTime" label="UpdateTime"></dt:gridColumn>
		<dt:gridColumn name="status" label="Status"></dt:gridColumn>
		<dt:gridColumn name="operator" label="Operator"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>