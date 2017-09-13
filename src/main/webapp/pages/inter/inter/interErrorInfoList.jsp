<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:interErrorInfoDetail(\"" + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:interErrorInfoUpdate(\"" + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:interErrorInfoDelete(\"" + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function interErrorInfoDetail()
	{
		var url = "inter/InterErrorInfoAction!showDetail.action";
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function interErrorInfoUpdate()
	{
		var url = "<%=request.getContextPath()%>/inter/InterErrorInfoAction!prepareUpdate.action";
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function interErrorInfoDelete() {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "inter/InterErrorInfoAction!delete.action";
				var parameter = ;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							interErrorInfoQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							interErrorInfoQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="inter/InterErrorInfoAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>