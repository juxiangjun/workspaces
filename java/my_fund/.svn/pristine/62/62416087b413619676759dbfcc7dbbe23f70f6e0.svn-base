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
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script>
$(function(){
	$(":button").button();
	$(".date_picker").datepicker();	
	$("#editform").validate();
});
function checkform(){
	$("#editform").submit();
}
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
				<h2>系统管理 » 合作伙伴管理 » 修改合作伙伴信息</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p><s:if test="msg!=null"><div class="message success">
					<p>${msg}</p>
				</div></s:if>
				<s:if test="errorMsg!=null"><div class="message errormsg">
					<p>${errorMsg}</p>
				</div></s:if>
				</p>
				<form action="/admin/pnr/pnrusr!edit.act" method="post" id="editform">
					<s:hidden name="pnrUsr.id"/>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:</label> <input type="text" readonly="readonly" class="text" name="pnrUsr.userName" value="${pnrUsr.userName}"/> <span class="note">不允许修改</span>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码:</label> <input type="password" readonly="readonly" class="text" name="pnrUsr.password" value="${pnrUsr.password}"/> <span class="note">不允许修改</span>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司名:</label> <input type="text" name="pnrUsr.companyName" class="text required {maxlength:150}"  value="${pnrUsr.companyName}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网址:</label> <input type="text" name="pnrUsr.website" class="text required {maxlength:20}"  value="${pnrUsr.website}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合作类型:</label><common:select valueSetId="92" name="pnrUsr.cooperateType"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算类型:</label><common:select valueSetId="90" name="pnrUsr.balanceType"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;结算类型值:</label> <input type="text" name="pnrUsr.btValue" class="text required {maxlength:20}" value="${pnrUsr.btValue}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算账户:</label> <input type="text" name="pnrUsr.balanceAccount" class="text" value="${pnrUsr.balanceAccount}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;开户人姓名:</label> <input type="text" name="pnrUsr.accountName" class="text" value="${pnrUsr.accountName}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人:</label> <input type="text" name="pnrUsr.linkmanName" class="text" value="${pnrUsr.linkmanName}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;联系人电话:</label> <input type="text" name="pnrUsr.telephone" class="text" value="${pnrUsr.telephone}"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;联系人手机:</label> <input type="text" name="pnrUsr.mobile" class="text" value="${pnrUsr.mobile}"/>
					</p>
					<p>
						<label>合作开始日期:</label> <input type="text" name="pnrUsr.startDate" readonly="readonly" class="text date_picker required {maxlength:20}" value="<s:date name='pnrUsr.startDate'/>"/>
					</p>
					<p>
						<label>合作结束日期:</label> <input type="text" name="pnrUsr.endDate" readonly="readonly" class="text date_picker required {maxlength:20}" value="<s:date name='pnrUsr.endDate'/>"/>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;佣金比率:</label> <input type="text" name="pnrUsr.feeRate" size="7" class="required number {maxlength:20}" value="${pnrUsr.feeRate}" id="rate"/>%<label for="rate" class="error" generated="true" style="display:none;"></label>
					</p>
					<p>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:</label><input type="radio" name="pnrUsr.status" value="1" checked="checked">禁用</input><input type="radio" name="pnrUsr.status" value="0">正常</input>
					</p>
					<hr/>
					<p>
						<input type="button" value="返 回" onclick="returnList();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保 存 " onclick="checkform();"/>
					</p>
				</form>
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