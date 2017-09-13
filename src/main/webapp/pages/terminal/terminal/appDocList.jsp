<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:appDocDetail(\"" + rowObject.appDocId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:appDocUpdate(\"" + rowObject.appDocId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:appDocDelete(\"" + rowObject.appDocId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function appDocDetail(appDocId)
	{
		var url = "terminal/AppDocAction!showDetail.action" + "?appDoc.appDocId=" + appDocId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function appDocUpdate(appDocId)
	{
		var url = "<%=request.getContextPath()%>/terminal/AppDocAction!prepareUpdate.action" + "?appDoc.appDocId=" + appDocId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function appDocDelete(appDocId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/AppDocAction!delete.action";
				var parameter = "appDoc.appDocId=" + appDocId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							appDocQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							appDocQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/AppDocAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="appDocId" label="AppDocId"></dt:gridColumn>
		<dt:gridColumn name="appId" label="AppId"></dt:gridColumn>
		<dt:gridColumn name="appDocName" label="AppDocName"></dt:gridColumn>
		<dt:gridColumn name="appDocDesc" label="AppDocDesc"></dt:gridColumn>
		<dt:gridColumn name="appDocUrl" label="AppDocUrl"></dt:gridColumn>
		<dt:gridColumn name="appDocHtmlUrl" label="AppDocHtmlUrl"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>