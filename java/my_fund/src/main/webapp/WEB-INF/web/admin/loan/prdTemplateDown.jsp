<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript">
function del(id){
	var tempSize = '${prdTemplateList.size()}';
	$.ajax({
		url : '/admin/loan/prdAttach!delTemp.act',
		dataType : 'json',
		data: {'dataId':id},
		cache : false,
		success : function(r) {
			if (r.success) {
				$('#download_attach').dialog('close');
				$('#upload_file').dialog('close');
				alert("删除成功！");
				
				var attstr = '#attCount' + '${dataId}';
				if((tempSize-1) <=0){
					$(attstr).html($('<span>未上传</span>'));
				}
			}
		},
		type : "POST",
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert(XMLHttpRequest.responseText);
		} 
	})
}

</script>
<s:iterator value="prdTemplateList">
	<li>
		${oldName }&nbsp;&nbsp;<a href="/admin/loan/prdAttachDown!downTemp.act?tempId=${id }">下载</a>
			<a href="javascript:void(0);" onclick="del(${id})">删除</a>
	</li>
</s:iterator>
