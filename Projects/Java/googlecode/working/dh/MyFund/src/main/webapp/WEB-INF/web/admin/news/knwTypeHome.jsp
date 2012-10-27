<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
  </head>
  
  <body>
  <div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>新闻类型维护</h2>
					<ul>
						<li class="nobg"><a href="/admin/knwType!edit.act?typeId=">增加新类别</a></li>
						<li></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th>名称</th>
									<th>显示位置</th>
									<th>状态</th>  
									<th>操作</th>  
								</tr>
							</thead>
							<tbody>
								<s:iterator id="item" value="knwTypeList" status="st">
								<s:if test="#st.even==true">
									<tr id="item_${item.id}" class="odd">
								</s:if>
								<s:else>
									<tr id="item_${item.id}" class="even">
								</s:else>
									<td>${item.name}&nbsp;</td>
									<td>${item.showOnPage}&nbsp;</td>
									<td>
									<s:if test="#item.isCancelled==0">
										可用
									</s:if>
									<s:else>
										停用
									</s:else>
									&nbsp;</td>  
									<td>
										<a href="/admin/knwType!edit.act?typeId=${item.id}">编辑</a> , 
										<a href="/admin/knwTitle!showHome.act?typeId=${item.id}">查看</a>
									</td> 
								</tr>
					   			</s:iterator>
							</tbody>
						</table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						
						<!-- .pagination ends -->
					</form>
				</div>
   	</div>
   	</div>
  </body>
</html>