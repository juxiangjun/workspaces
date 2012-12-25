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
	$(":button,:submit,:reset").button();
	$(".date_picker").datepicker();
});
function profile(id){
	document.location.href="/admin/fund/fund!fundProfile.act?fundId="+id;
}
function details(id){
	document.location.href="/admin/fund/fund!fundDetails.act?fundId="+id;
}
function toPage(pageNo, pageCount) {
	document.getElementById("pageNo").value = pageNo;
	form = document.getElementById("frmfundInfo");
	form.submit();
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
				<h2>产品管理 » 基金产品</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<form id="frmfundInfo" action="/admin/fund/fund!fundList.act" method="post"  >
  				<input type="hidden" id="pageNo" name="pageNo" /> 	
				<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<label>基金类型</label><input value="${ catelogName}" type="text" name="catelogName" class="text" style="width: 150px;"/>
							</td>
							<td>
								<label>基金代码</label><input value="${fundCode }" type="text" name="fundCode" class="text" style="width: 100px;"/>
							</td>
							<td>
								<label>发布状态</label><s:select name="status" list="#{'':'发布状态',0:'未发布',1:'已发布'}" listKey="key" listValue="value" cssClass="cmf-skinned-select"></s:select>
								<!-- <label>成立日期</label><input id="cd1" name="issuedDt" class="text date_picker" value="<s:date name="issuedDt[0]"/>" /> 
								<label>~</label><input id="cd2" name="issuedDt" class="text date_picker" value="<s:date name="issuedDt[1]"/>"/> --> 
							</td>
							<td><input type="button" onclick="window.open('/admin/fund/fund!fundProfile.act','_blank');" value="增加" align="right"/></td>
						</tr>
						<tr>
							<td>
								<label>基金公司</label><input value="${companyName }" type="text" name="companyName" class="text" style="width: 150px;"/>
							</td>
							<td>
								<label>基金全称</label><input value="${fullName }" type="text" name="fullName" class="text" style="width: 200px;"/>
							</td>
							<td>
								<label>推荐状态</label>
								<s:select name="recommendationStatus" list="#{null:'推荐状态',0:'未推荐',1:'已推荐',2:'停用 '}" listKey="key" listValue="value" cssClass="cmf-skinned-select"></s:select>
							</td>
							<td>
								<input type="submit" value="查 询" align="right"/>
							</td>
						</tr>
					</table>
					</form>
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr style="background:#DDDDDD;">
							<th class="header" style="cursor: pointer; ">基金代码</th>
							<th class="header" style="cursor: pointer; ">全称</th>
							<th class="header" style="cursor: pointer; ">简称</th>
							<th class="header" style="cursor: pointer; ">发布状态</th>
							<th class="header" style="cursor: pointer; ">基金类型</th>
							<th class="header" style="cursor: pointer; ">基金经理</th>
							<th class="header" style="cursor: pointer; ">托管人</th>
							<th class="header" style="cursor: pointer; ">投资目标</th>
							<th class="header" style="cursor: pointer; ">基金公司名称</th>
							<s:if test="recommendationStatus != null">
								<th class="header" style="cursor: pointer; ">推荐状态</th>
							</s:if>
							<th width="180px;">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pager.data" var="u" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${u.code}&nbsp;</td>
							<td title="${u.fullName}"><div class="restrict_item_100">${u.fullName}</div></td>
							<td title="${u.shortName}"><div class="restrict_item_100">${u.shortName}</div></td>
							<td><s:if test="#u.status==0">未发布</s:if><s:else>已发布</s:else>&nbsp;</td>
							<td title="${u.catelogName}"><div class="restrict_item_100">${u.catelogName}</div></td>
							<td title="${u.manager}"><div class="restrict_item_60">${u.manager}</div></td>
							<td title="${u.custodian}"><div class="restrict_item_60">${u.custodian}</div></td>
							<td title="${u.investmentGoal}"><div class="restrict_item_100">${u.investmentGoal}</div></td>
							<td title="${u.fundCompanyName}"><div class="restrict_item_100">${u.fundCompanyName}</div></td>
							<s:if test="recommendationStatus != null">
								<td>
									<s:if test="recommendationStatus == 0">
					   					未荐产品
					   				</s:if>
					   				<s:elseif test="recommendationStatus == 1">
					   					已荐产品
					   				</s:elseif>
					   				<s:elseif test="recommendationStatus == 2">
					   					停用产品
					   				</s:elseif>
								&nbsp;</td>
							</s:if>
							<td>
								<a href="/admin/fund/fund!fundProfile.act?fundId=${u.id}">修改</a>&nbsp;&nbsp;
								<a href="/admin/fund/fund!fundDetails.act?fundId=${u.id}">详细信息</a>&nbsp;&nbsp;
								<s:if test="recommendationStatus == 0">
				   					<a href="/admin/fund/fund!editPrdRecommedation.act?typeId=3&fundId=${u.id}">推荐</a>
				   				</s:if>
				   				<s:if test="recommendationStatus == 1">
				   					<a href="/admin/fund/fund!editPrdRecommedation.act?typeId=3&fundId=${u.id}">推荐修改</a>
				   				</s:if>
				   				<s:if test="recommendationStatus == 2">
				   					<a href="/admin/fund/fund!editPrdRecommedation.act?typeId=3&fundId=${u.id}">启用</a>
				   				</s:if>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="pagination right">
					<s:include value="/public/pagination.jsp"></s:include>
				</div>
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