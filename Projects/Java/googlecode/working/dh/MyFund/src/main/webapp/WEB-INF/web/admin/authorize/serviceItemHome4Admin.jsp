<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
	<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.filestyle.mini.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.wysiwyg.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.date_input.pack.js"></script>
	<script type="text/javascript" src="/script/admin/facebox.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
	<script type="text/javascript" src="/script/admin/ajaxupload.js"></script>
	<script type="text/javascript" src="/script/admin/jquery.pngfix.js"></script>
	<script type="text/javascript" src="/script/admin/custom.js"></script>
	<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
	<link href="/css/admin/jquery.wysiwyg.css" rel="stylesheet" type="text/css" />
	<link href="/css/admin/facebox.css" rel="stylesheet" type="text/css" />
	<link href="/css/admin/visualize.css" rel="stylesheet" type="text/css" />
	<link href="/css/admin/date_input.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 8]><style type="text/css" media="all">@import url("/css/admin/ie.css");</style><![endif]-->
	<script language="javascript">
		function changeSinItemStatus(itemId, authenticated) {
			var url = '/admin/serviceInfoAuthorize!authorizeServiceInfo.act?itemId='+itemId+'&isAuthenticated='+authenticated;
			$.ajax({
				url: url
			}).done(
				function(data, status, response) {
					var text = jQuery.parseJSON(response['responseText']);
					if (text.status =='success') {
						var applyTag = '#authorizing_'+itemId;
						$(applyTag).html("已审核");
					} else {
						alert('操作失败');
					}
				}		
			);	

		}
	</script>
  </head>
  
  <body>
  <div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>服务信息审核页面</h2>
					<ul>
						<li class="nobg"></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th width="10">&nbsp;</th>
									<th>标题</th>
						   			<th>公司名称</th>
						   			<th>服务类型</th>
						   			<th>费用范围</th>
						   			<th>服务地区</th>
						   			<th>发布日期</th>
						   			<th>截止日期</th>
						   			<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator id="item" value="sinItemList" status="st">
								<s:if test="#st.even==true">
									<tr id="item_${item.id}" class="odd">
								</s:if>
								<s:else>
									<tr id="item_${item.id}" class="even">
								</s:else>
					   				<th>&nbsp;</th>
					   				<td><a href="/admin/serviceInfoAuthorize!showDetail.act?itemId=${item.id}">${item.title }</a></td>
					   				<td>${item.companyName }&nbsp;</td>
					   				<td>${item.typeName }&nbsp;</td>
					   				<td>${item.chargeRange }&nbsp;</td>
					   				<td>${item.regionName }&nbsp;</td>
					   				<td>${item.issuedDate }&nbsp;</td>
					   				<td>${item.expiredDate }&nbsp;</td>
					   				<td id="authorizing_${item.id}"><a href="javascript:changeSinItemStatus(${item.id},'1')" >通过</a>,　<a href="javascript:changeSinItemStatus(${item.id},'2')" >驳回</a></td>
					   			</tr>
					   			</s:iterator>
							</tbody>
						</table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<label title="共0条">
						         第
						         <span>${pagination.current}</span>
						         页/共
						         <strong>${pagination.pages}</strong>
						         页
						         </label>
						         &nbsp;
						         <a href="/admin/Admin!showUnauthorizedServiceInfo.act?pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
						         <a href="/admin/Admin!showUnauthorizedServiceInfo.act?pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
						         <a href="/admin/Admin!showUnauthorizedServiceInfo.act?pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
						         <a href="/admin/Admin!showUnauthorizedServiceInfo.act?pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
						</div>
						<!-- .pagination ends -->
					</form>
				</div>
   	</div>
   	</div>
  </body>
</html>
