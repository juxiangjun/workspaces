<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
</script>
</head>
<body>

<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
			<form action="/admin/loan/financePro!financeAdmin.act" method="post" id="financeadmin">
			<input type="hidden" name="pager.currentPage" id="current_page"/>
			<input type="hidden" name="pager.pageCount" id="page_count"/>
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>合作伙伴管理</h2>
					<ul>
					<li class="nobg"></li>
						<li><a href="/admin/pnr/pnrusr!addUI.act">新增合作伙伴</a></li>
					</ul>
				</div>
				<div class="block_content">
					<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<thead>
				     		<tr>
					            <th>用户名</th>
					            <th>公司名</th>
					            <th>合作类型</th>
					            <th>结算类型</th>
					            <th>佣金比率</th>
					            <th>创建时间</th>
					            <th>操作</th>
				          	</tr>
			          	</thead>
			          	<tbody>
						 <s:iterator id ="item" value="list" status="st">
							<tr id="item_${item.id}" class="<s:if test="#st.even">odd</s:if><s:else>even</s:else>">
								<td>${item.userName }</td>
								<td style="width:120px;word-wrap:break-word;word-break:break-all;">${item.companyName}</td>
								<td><common:print valueId="#item.cooperateType"/></td>
								<td><common:print valueId="#item.balanceType"/></td>
								<td>${item.feeRate }</td>
					   			<td><s:date name="#item.createDt"/></td>
					   			<td><a href="/admin/pnr/pnrusr!details.act?pnrUsr.id=${item.id }">详情</a>&nbsp;|&nbsp;<a href="/admin/pnr/pnrusr!editUI.act?pnrUsr.id=${item.id }">修改</a></td>
							</tr>
						</s:iterator>
						</tbody>
				        </table>
					</div>
				</form>
		</div>
				
   	</div>
 </div>


</body>
</html>
