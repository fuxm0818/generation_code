<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appLinkDetail(\"" + rowObject.linkId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appLinkUpdate(\"" + rowObject.linkId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appLinkDelete(\"" + rowObject.linkId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appLinkDetail(linkId)
	{
		var url = "test/AppLinkAction!showDetail.action" + "?appLink.linkId=" + linkId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appLinkUpdate(linkId)
	{
		var url = "<%=request.getContextPath()%>/test/AppLinkAction!prepareUpdate.action" + "?appLink.linkId=" + linkId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appLinkDelete(linkId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "test/AppLinkAction!delete.action";
				var parameter = "appLink.linkId=" + linkId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appLinkQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appLinkQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="test/AppLinkAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="linkId" label="LinkId"></dt:gridColumn>
		<dt:gridColumn name="appId" label="AppId"></dt:gridColumn>
		<dt:gridColumn name="appType" label="AppType"></dt:gridColumn>
		<dt:gridColumn name="appIcon" label="AppIcon"></dt:gridColumn>
		<dt:gridColumn name="appEntry" label="AppEntry"></dt:gridColumn>
		<dt:gridColumn name="appVersion" label="AppVersion"></dt:gridColumn>
		<dt:gridColumn name="downloadLink" label="DownloadLink"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="appSize" label="AppSize"></dt:gridColumn>
		<dt:gridColumn name="upgradeDes" label="UpgradeDes"></dt:gridColumn>
		<dt:gridColumn name="systemRequire" label="SystemRequire"></dt:gridColumn>
		<dt:gridColumn name="bundleId" label="BundleId"></dt:gridColumn>
		<dt:gridColumn name="registerAddr" label="RegisterAddr"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>