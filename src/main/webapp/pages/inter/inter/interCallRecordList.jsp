<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:interCallRecordDetail(\"" + rowObject.interCallRecordId + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:interCallRecordUpdate(\"" + rowObject.interCallRecordId + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:interCallRecordDelete(\"" + rowObject.interCallRecordId + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function interCallRecordDetail(interCallRecordId)
	{
		var url = "inter/InterCallRecordAction!showDetail.action" + "?interCallRecord.interCallRecordId=" + interCallRecordId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function interCallRecordUpdate(interCallRecordId)
	{
		var url = "<%=request.getContextPath()%>/inter/InterCallRecordAction!prepareUpdate.action" + "?interCallRecord.interCallRecordId=" + interCallRecordId;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function interCallRecordDelete(interCallRecordId) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "inter/InterCallRecordAction!delete.action";
				var parameter = "interCallRecord.interCallRecordId=" + interCallRecordId;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							interCallRecordQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							interCallRecordQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="inter/InterCallRecordAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="interCallRecordId" label="InterCallRecordId"></dt:gridColumn>
		<dt:gridColumn name="busiId" label="BusiId"></dt:gridColumn>
		<dt:gridColumn name="callResult" label="CallResult"></dt:gridColumn>
		<dt:gridColumn name="failReason" label="FailReason"></dt:gridColumn>
		<dt:gridColumn name="transactionId" label="TransactionId"></dt:gridColumn>
		<dt:gridColumn name="interType" label="InterType"></dt:gridColumn>
		<dt:gridColumn name="interUrl" label="InterUrl"></dt:gridColumn>
		<dt:gridColumn name="interMethod" label="InterMethod"></dt:gridColumn>
		<dt:gridColumn name="dataParameter" label="DataParameter"></dt:gridColumn>
		<dt:gridColumn name="remarks" label="Remarks"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsTime" label="StsTime"></dt:gridColumn>
		<dt:gridColumn name="createTime" label="CreateTime"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>