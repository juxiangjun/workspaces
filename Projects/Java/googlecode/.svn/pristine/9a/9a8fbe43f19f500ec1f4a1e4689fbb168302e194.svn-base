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
		function showPageByType(typeId) {
			var url = "/admin/knwTitle!showHome.act?typeId="+typeId;
			window.location.href = url;
		}
		
		function editKnwTitle(id){
			var url = "/admin/knwTitle!edit.act?id="+id+"&typeId=";
			url = url + $("#typeId").attr("value");
			window.location.href = url;
		}
		
		function doPagination(pageNo) {
			var url = "/admin/knwTitle!showHome.act?pageNo="+pageNo+"&typeId="+$("#typeId").attr("value");
			window.location.href = url;
		}
		
	</script>
  </head>
  
  <body>
  <div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
	 			<input type="hidden" id="typeId" value="${typeId}"/>
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>新闻标题</h2>
					<ul>
						<li class="nobg">
							<a href="javascript:showPageByType(0)">全部</a>&nbsp;&nbsp;&nbsp;
							<s:iterator id="item" value="knwTypeList">
								<a href="javascript:showPageByType(${item.id })">${item.name} </a>&nbsp;&nbsp;&nbsp;
							</s:iterator>
						</li>
						<li><a href="javascript:editKnwTitle(0)">新建标题</a></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th>类型</th>
									<th>主题</th>
									<th>作者</th>
									<th>来源</th>
									<th>发布日期</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator id ="item" value="knwTitleList" status="st">
					   				<tr>
					   				<td><label>
					   					${item.typeName}
					   					</label>
					   				</td>
									<td>
										<label title="${item.title}">
											<s:if test="#item.title.length()>25">
						   						<a href="/admin/knwContent!showHome.act?titleId=${item.id}">
						   							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						   					</s:if><s:else>
						   						<a href="/admin/knwContent!showHome.act?titleId=${item.id}">${item.title}</a>
						   					</s:else>
					   					</label>
									</td>
									<td><label>${item.author}&nbsp;</label> </td>
									<td><label>${item.source}&nbsp;</label></td>
									<td><label><s:date name="#item.issuedDate"></s:date>&nbsp;</label></td>
									<td><label>
										<s:if test="item.isAuthenticated==0">
											未审核
										</s:if><s:else>
											已审核
										</s:else>
										</label>
									</td>
									<td><label><a href="javascript:editKnwTitle(${item.id })">编辑</a>,<a href="/admin/knwTitle!delete.act?id=${item.id}">停用</a></label></td>
					   				</tr>
					   			</s:iterator>
							</tbody>
						</table>
						<div class="tableactions">
						</div>
						<!-- .tableactions ends -->
						<div class="pagination right">
							<div class="pages01">
								<s:if test="knwTitleList.size()>0">
							    <label title="共${pagination.recordCount}条">
							    第
							    <span>${pagination.current}</span>
							    页/共
							    <strong>${pagination.pages}</strong>
							    页
							    </label>
							    </s:if>
						         &nbsp;
						        <a href="javascript:doPagination(${pagination.first})">&nbsp;首页&nbsp;</a>
							    <a href="javascript:doPagination(${pagination.previous})">&nbsp;上一页&nbsp;</a>
							    <a href="javascript:doPagination(${pagination.next})">&nbsp;下一页&nbsp;</a>
							    <a href="javascript:doPagination(${pagination.last})">&nbsp;末页&nbsp;</a>
						</div>
						<!-- .pagination ends -->
					</form>
				</div>
		</div>	
   	</div>
   	</div>
  </body>
</html>
