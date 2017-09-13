<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="dt" uri="/dttag"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" language="JavaScript">
	//操作
	function handle(cellvalue, options, rowObject) {
		var str = "";
		str += "<a href='javascript:feedbackOpinionDetail(\"" + rowObject.feedbackOpinion + "\");'>查看</a>&nbsp;";
		str += "<a href='javascript:feedbackOpinionUpdate(\"" + rowObject.feedbackOpinion + "\");'>修改</a>&nbsp;";
		str += "<a href='javascript:feedbackOpinionDelete(\"" + rowObject.feedbackOpinion + "\");'>删除</a>&nbsp;";
		return str;
	}
	//查看
	function feedbackOpinionDetail(feedbackOpinion)
	{
		var url = "inter/FeedbackOpinionAction!showDetail.action" + "?feedbackOpinion.feedbackOpinion=" + feedbackOpinion;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}
	//打开修改页面
	function feedbackOpinionUpdate(feedbackOpinion)
	{
		var url = "<%=request.getContextPath()%>/inter/FeedbackOpinionAction!prepareUpdate.action" + "?feedbackOpinion.feedbackOpinion=" + feedbackOpinion;
		window.showModalDialog(url,window,'dialogWidth=800px;dialogHeight=600px;');
	}	
	//删除
	function feedbackOpinionDelete(feedbackOpinion) {
		dt$.confirm("确认删除吗？", "询问", function(msgBtn) {
			if (msgBtn == dt$.DR_OK) {
				var url = "inter/FeedbackOpinionAction!delete.action";
				var parameter = "feedbackOpinion.feedbackOpinion=" + feedbackOpinion;
				dt$.ajaxPost(url, parameter, function(result) {
					if (result == 1) {
						dt$.success("操作成功", null, function() {
							feedbackOpinionQuery();
						});
					} else {
						dt$.error("操作失败", null, function() {
							feedbackOpinionQuery();
						});
					}
				});
			}
		});
	}
</script>
<dt:grid id="listGrid" url="inter/FeedbackOpinionAction!retrieve.action?'+$('#parameters').serialize()+'" showPage="true" width="100%" height="100%" shrinkToFit="true" caption="标题">
		<dt:gridColumn name="feedbackOpinion" label="FeedbackOpinion"></dt:gridColumn>
		<dt:gridColumn name="opinionContent" label="OpinionContent"></dt:gridColumn>
		<dt:gridColumn name="contactWay" label="ContactWay"></dt:gridColumn>
		<dt:gridColumn name="platType" label="PlatType"></dt:gridColumn>
		<dt:gridColumn name="opinionSource" label="OpinionSource"></dt:gridColumn>
		<dt:gridColumn name="opinionDealInfo" label="OpinionDealInfo"></dt:gridColumn>
		<dt:gridColumn name="appPortal" label="AppPortal"></dt:gridColumn>
		<dt:gridColumn name="createDate" label="CreateDate"></dt:gridColumn>
		<dt:gridColumn name="sts" label="Sts"></dt:gridColumn>
		<dt:gridColumn name="stsDate" label="StsDate"></dt:gridColumn>
		<dt:gridColumn name="remark" label="Remark"></dt:gridColumn>
		<dt:gridColumn name="" label="操作" formatter="handle"></dt:gridColumn>
</dt:grid>