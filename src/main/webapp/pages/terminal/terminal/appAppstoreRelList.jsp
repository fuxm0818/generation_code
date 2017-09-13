<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appAppstoreRelDetail(\"" + rowObject.appAppstoreRelId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appAppstoreRelUpdate(\"" + rowObject.appAppstoreRelId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appAppstoreRelDelete(\"" + rowObject.appAppstoreRelId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appAppstoreRelDetail(appAppstoreRelId)
	{
		var url = "terminal/AppAppstoreRelAction!showDetail.action" + "?appAppstoreRel.appAppstoreRelId=" + appAppstoreRelId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appAppstoreRelUpdate(appAppstoreRelId)
	{
		var url = "<%=request.getContextPath()%>/terminal/AppAppstoreRelAction!prepareUpdate.action" + "?appAppstoreRel.appAppstoreRelId=" + appAppstoreRelId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appAppstoreRelDelete(appAppstoreRelId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/AppAppstoreRelAction!delete.action";
				var parameter = "appAppstoreRel.appAppstoreRelId=" + appAppstoreRelId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appAppstoreRelQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appAppstoreRelQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/AppAppstoreRelAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="appAppstoreRelId" label="AppAppstoreRelId"></dt:gridColumn>
		<dt:gridColumn name="appId" label="AppId"></dt:gridColumn>
		<dt:gridColumn name="appStoreId" label="AppStoreId"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>