<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
$(function(){$(":button").button();});

function returnList(){
	document.location.href="/admin/baseRate.act";
}
function checkform(){
	$("#sav").attr("disabled","disabled");
	$("#editform").submit();
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
				<h2>系统管理 » 基本利率 » 修改利率</h2>
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
				<form action="/admin/baseRate!update.act" method="post" id="editform">
					<s:hidden name="baseRate.id"/>
					<p>
						<label>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label> <input type="text" disabled="disabled" class="text" name="baseRate.id" value="${baseRate.id}"/><span class="note">不可修改</span>
					</p>
					<p>
						<label>贷款周期起始月:</label> <input type="text" name="baseRate.startdt" class="text" disabled="disabled" value="${baseRate.startdt}"/><span class="note">不可修改</span>
					</p>
					<p>
						<label>贷款周期截止月:</label> <input type="text" name="baseRate.enddt" class="text" disabled="disabled" value="${baseRate.enddt }"/><span class="note">不可修改</span>
					</p>
					<p>
						<label>利&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;率:</label> <input type="text" name="baseRate.rate" class="text" value="${baseRate.rate}"/> <span class="note">可以修改</span>
					</p>
					<p>
						<label>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述:</label> <input type="text" name="baseRate.memo" class="text" value="${baseRate.memo}"/> <span class="note">可以修改</span>
					</p>
					<hr/>
					<p>
						<input type="button" value="返 回" onclick="returnList();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input id="sav" type="button" value="保 存 " onclick="checkform();"/>
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