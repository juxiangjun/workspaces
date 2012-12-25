<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script>
$(function(){
	$(".tablesorter").tablesorter();
	$(":button").button();
});
function edit(id){
	document.location.href="/admin/ads/post!edit.act?postId="+id;
}
function remove(id){
	if(confirm("确定删除此广告位吗？")){
		
	}
}
function addPost(){
	document.location.href="/admin/ads/post!bfAdd.act";
}
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
				<h2>广告管理 » 广告发布管理</h2>
				<ul>
					<li class="nobg"><input type="button" value="新增发布" onclick="addPost();"/></li>
				</ul>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">广告位</th>
							<th class="header" style="cursor: pointer; ">广告项</th>
							<th class="header" style="cursor: pointer; ">开始日期</th>
							<th class="header" style="cursor: pointer; ">结束日期</th>
							<th class="header" style="cursor: pointer; ">状态</th>
							<th width="180px;">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="postList" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.placeid}</td>
							<td>${u.itemids}</td>
							<td><s:date name="startdate"/></td>
							<td><s:date name="enddate"/></td>
							<td><s:if test="status==0">正常</s:if><s:else><font color="red">停止</font></s:else></td>
							<td>
							<input type="button" value="编辑" onclick="edit(${u.id});"/> 
							<input type="button" value="删除" onclick="remove(${u.id});"/>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
		<!-- .block ends -->
	</div>
</div>
</body>
</html>