<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script>
$(function(){
	$(":button").button();
	$(".date_picker").datepicker();	
});
function returnList(){
	document.location.href="/admin/pnr/pnrusr.act";
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
				<h2>系统管理 » 合作伙伴管理 » 查看合作伙伴信息</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:</label> ${pnrUsr.userName}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码:</label> ${pnrUsr.password}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司名:</label> ${pnrUsr.companyName}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网址:</label>${pnrUsr.website}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合作类型:</label><common:print valueId="pnrUsr.cooperateType"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算类型:</label><common:print valueId="pnrUsr.balanceType"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;结算类型值:</label> ${pnrUsr.btValue}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算账户:</label> ${pnrUsr.balanceAccount}
					</p>
					<p>
						<label>&nbsp;&nbsp;开户人姓名:</label>${pnrUsr.accountName}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人:</label>${pnrUsr.linkmanName}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;联系人电话:</label>${pnrUsr.telephone}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;联系人手机:</label>${pnrUsr.mobile}
					</p>
					<p>
						<label>合作开始日期:</label> <s:date name="pnrUsr.startDate" />
					</p>
					<p>
						<label>合作结束日期:</label> <s:date name="pnrUsr.endDate" />
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;佣金比率:</label> ${pnrUsr.feeRate}
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:</label> <s:radio name="pnrUsr.status" list="#{0:'正常',1:'禁用'}" cssClass="radio"/> 
					</p>
					<hr/>
					<p>
						<input type="button" value="返 回" onclick="returnList();"/>
					</p>
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