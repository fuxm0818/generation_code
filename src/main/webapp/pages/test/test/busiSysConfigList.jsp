<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:busiSysConfigDetail(\"" + rowObject.configId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:busiSysConfigUpdate(\"" + rowObject.configId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:busiSysConfigDelete(\"" + rowObject.configId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function busiSysConfigDetail(configId)
	{
		var url = "test/BusiSysConfigAction!showDetail.action" + "?busiSysConfig.configId=" + configId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function busiSysConfigUpdate(configId)
	{
		var url = "<%=request.getContextPath()%>/test/BusiSysConfigAction!prepareUpdate.action" + "?busiSysConfig.configId=" + configId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function busiSysConfigDelete(configId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "test/BusiSysConfigAction!delete.action";
				var parameter = "busiSysConfig.configId=" + configId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							busiSysConfigQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							busiSysConfigQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="test/BusiSysConfigAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="configId" label="ConfigId"></dt:gridColumn>
		<dt:gridColumn name="paramName" label="ParamName"></dt:gridColumn>
		<dt:gridColumn name="paramValue" label="ParamValue"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="terminalAuthoNum" label="TerminalAuthoNum"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>