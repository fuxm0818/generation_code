<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appRelDetail(\"" + rowObject.appRelId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appRelUpdate(\"" + rowObject.appRelId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appRelDelete(\"" + rowObject.appRelId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appRelDetail(appRelId)
	{
		var url = "terminal/AppRelAction!showDetail.action" + "?appRel.appRelId=" + appRelId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appRelUpdate(appRelId)
	{
		var url = "<%=request.getContextPath()%>/terminal/AppRelAction!prepareUpdate.action" + "?appRel.appRelId=" + appRelId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appRelDelete(appRelId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/AppRelAction!delete.action";
				var parameter = "appRel.appRelId=" + appRelId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appRelQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appRelQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/AppRelAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="appRelId" label="AppRelId"></dt:gridColumn>
		<dt:gridColumn name="appId" label="AppId"></dt:gridColumn>
		<dt:gridColumn name="relAppId" label="RelAppId"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>