<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="apply.agreeUploadWay == null"></s:if>
<s:elseif test="apply.agreeUploadWay == 0">
	<li>
		中国资金网融资咨询服务协议(<s:date name="apply.agreeUploadTime" format="yyyy-MM-dd HH:mm"/>) &nbsp;&nbsp;<a href="/user/loan/downloadAttach!downAgree.act?applyId=${apply.id}">下载</a>
		<s:if test="apply.agreeFileUpload.indexOf('.png')>=0||apply.agreeFileUpload.indexOf('.jpg')>=0||apply.agreeFileUpload.indexOf('.jpeg')>=0||apply.agreeFileUpload.indexOf('.bmp')>=0">| <a href="javascript:void(0);" onclick="agreeWatchIt('${apply.id}')">预览</a></s:if>
	</li>
</s:elseif>
<s:else>
	<li>资料提交使用的快递公司名称：${apply.agreeMemo }</li>
	<li>快递单号：${apply.agreeFileUpload }</li>
</s:else>