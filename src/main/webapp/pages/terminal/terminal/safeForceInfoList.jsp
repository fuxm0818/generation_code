<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:safeForceInfoDetail(\"" + rowObject.safeForceInfoId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:safeForceInfoUpdate(\"" + rowObject.safeForceInfoId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:safeForceInfoDelete(\"" + rowObject.safeForceInfoId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function safeForceInfoDetail(safeForceInfoId)
	{
		var url = "terminal/SafeForceInfoAction!showDetail.action" + "?safeForceInfo.safeForceInfoId=" + safeForceInfoId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function safeForceInfoUpdate(safeForceInfoId)
	{
		var url = "<%=request.getContextPath()%>/terminal/SafeForceInfoAction!prepareUpdate.action" + "?safeForceInfo.safeForceInfoId=" + safeForceInfoId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function safeForceInfoDelete(safeForceInfoId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "terminal/SafeForceInfoAction!delete.action";
				var parameter = "safeForceInfo.safeForceInfoId=" + safeForceInfoId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							safeForceInfoQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							safeForceInfoQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="terminal/SafeForceInfoAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="safeForceInfoId" label="SafeForceInfoId"></dt:gridColumn>
		<dt:gridColumn name="terminalId" label="TerminalId"></dt:gridColumn>
		<dt:gridColumn name="wifiMacInfo" label="WifiMacInfo"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>