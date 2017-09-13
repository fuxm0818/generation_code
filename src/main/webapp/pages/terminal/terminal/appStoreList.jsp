<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appStoreDetail(\"" + rowObject.appStoreId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appStoreUpdate(\"" + rowObject.appStoreId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appStoreDelete(\"" + rowObject.appStoreId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appStoreDetail(appStoreId)
	{
		var url = "terminal/AppStoreAction!showDetail.action" + "?appStore.appStoreId=" + appStoreId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appStoreUpdate(appStoreId)
	{
		var url = "<%=request.getContextPath()%>/terminal/AppStoreAction!prepareUpdate.action" + "?appStore.appStoreId=" + appStoreId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appStoreDelete(appStoreId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/AppStoreAction!delete.action";
				var parameter = "appStore.appStoreId=" + appStoreId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appStoreQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appStoreQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/AppStoreAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="appStoreId" label="AppStoreId"></dt:gridColumn>
		<dt:gridColumn name="appStoreName" label="AppStoreName"></dt:gridColumn>
		<dt:gridColumn name="appStoreDesc" label="AppStoreDesc"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>