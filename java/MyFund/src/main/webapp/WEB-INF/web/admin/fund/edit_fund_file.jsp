<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金详细信息</title>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script language="javascript">
$(function(){
	$(":button").button();
	$(":submit").button();
	$(".date_picker").datepicker();
});
</script>
</head>
  
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
		<div id="umsg" class="message success" style="display: none;"></div>
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>产品管理 » 基金 » 基金文件</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<form action="/admin/fund/fund!updateFile.act" method="post">
			<input type="hidden" name="fundFile.id" value="${fundFile.id }"/>
			<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
				<tbody>
					<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">基金详细信息</td></tr>
				<s:if test="fundFile!=null">
					<tr><td>标题</td><td><input name="fundFile.title" value="${fundFile.title }" class="text"/></td></tr>
					<tr><td>url</td><td> <input name="fundFile.url" value="${fundFile.url}" class="text"/></td></tr>
					<tr><td>发布日期</td><td> <input name="fundFile.issuedDate" value="<s:date name="fundFile.issuedDate"/>" class="text date_picker"/></td></tr>
					<tr><td>基金代码</td><td> <input name="fundFile.fundCode" value="${fundFile.fundCode}" class="text"/></td></tr>
					<tr><td>基金名称</td><td> <input name="fundFile.fundName" value="${fundFile.fundName}" class="text"/></td></tr>
					<tr><td colspan="2" align="center">
					<input type="submit" value="确认提交" />&nbsp;
					<input type="button" value="返 回" onclick="javascript:window.history.back();" />
					&nbsp;</td></tr>
				</s:if><s:else>
						<tr><td>&nbsp;</td><td align="center">
							<input type="button" value="返 回" onclick="javascript:window.history.back();" />
						</td></tr>
					</s:else>
				</tbody>
			</table>
			<input type="hidden" name="fundFile.fundId" value="${fundFile.fundId }"/>
			<input type="hidden" name="fundFile.createdTime" value="${fundFile.createdTime}"/>
			</form>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
	</div>
</div>
</div>
</body>
</html>