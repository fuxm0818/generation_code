<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appVideoDetail(\"" + rowObject.appVideoId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appVideoUpdate(\"" + rowObject.appVideoId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appVideoDelete(\"" + rowObject.appVideoId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appVideoDetail(appVideoId)
	{
		var url = "terminal/AppVideoAction!showDetail.action" + "?appVideo.appVideoId=" + appVideoId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appVideoUpdate(appVideoId)
	{
		var url = "<%=request.getContextPath()%>/terminal/AppVideoAction!prepareUpdate.action" + "?appVideo.appVideoId=" + appVideoId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appVideoDelete(appVideoId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/AppVideoAction!delete.action";
				var parameter = "appVideo.appVideoId=" + appVideoId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appVideoQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appVideoQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/AppVideoAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="appVideoId" label="AppVideoId"></dt:gridColumn>
		<dt:gridColumn name="appId" label="AppId"></dt:gridColumn>
		<dt:gridColumn name="appVideoName" label="AppVideoName"></dt:gridColumn>
		<dt:gridColumn name="appVideoUrl" label="AppVideoUrl"></dt:gridColumn>
		<dt:gridColumn name="appVideoHtmlUrl" label="AppVideoHtmlUrl"></dt:gridColumn>
		<dt:gridColumn name="appVideoDesc" label="AppVideoDesc"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>