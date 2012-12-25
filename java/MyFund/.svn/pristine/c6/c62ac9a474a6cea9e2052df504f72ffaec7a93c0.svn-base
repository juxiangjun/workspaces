<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
function del(id){
	$.ajax({
		url : '/user/loan/financeAttach!delAttach.act',
		dataType : 'json',
		data: {'attachlist.id':id},
		cache : false,
		success : function(r) {
			if (r.success) {
				$('#download_attach').dialog('close');
				$('#upload_file').dialog('close');
				alert("删除成功！");
				
				var countValue = 0;
				var attstr = '#attCount' + '${attach.id}';
				if($(attstr).text() != ''){
					countValue = parseInt($(attstr).text()) -1
				}
				if(countValue == 0){
					window.location="/user/loan/financeAttach!attachMana.act?applyId=" + '${attach.applyId}';
				}
				$(attstr).html($('<span>' + countValue + '</span>'));
			}
		},
		type : "POST",
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.responseText);
		} 
	})
}

</script>
<s:if test="attach.uploadWay == null || attach.uploadWay == 0">
	<s:iterator value="faList">
		<li>
			${oldFileName }(<s:date name="createdt" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach.act?type=0&falistId=${id }">下载</a>
			<s:if test="ext=='.png'||ext=='.jpg'||ext=='.jpeg'||ext=='.bmp'">| <a href="javascript:void(0);" onclick="watchIt('${id}')">预览</a></s:if>
			<!--<s:else><a href="javascript:void(0);" onclick="openIt('${id}')">打开</a></s:else>-->
			<s:if test="(#session._user.userTypeGroup == 1 || #session._user.userTypeGroup== 5) && (attach.uploadStatus==213 || attach.uploadStatus==215)">
				<a href="javascript:void(0);" onclick="del(${id})">删除</a>
			</s:if>
		</li>
	</s:iterator>
</s:if>
<s:elseif test="attach.postid!=null">
		<li>资料提交使用的快递公司名称：${attach.attachMemo }</li>
		<li>快递单号：${attach.postid }</li>
</s:elseif>