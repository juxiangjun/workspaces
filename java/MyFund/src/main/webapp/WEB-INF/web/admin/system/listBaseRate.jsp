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
<script type="text/javascript" src="/script/jquery.form.js" > </script>
<script>
$(function(){
	$(":button").button();
	$(".tablesorter").tablesorter();
});
function edit(){
	$("#rateform").ajaxSubmit({
		dataType : "json",
		success : function(data) {
			if(data.success){
				alert('修改利率成功！');
			}
		}
	});
}
</script>
</head>
<body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>系统管理 » 基本利率</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
			<form id="rateform" action="admin/baseRate!update.act">
				<table cellpadding="0" cellspacing="0" width="100%" class="tablesorter">
					<thead>
						<tr>
							<th class="header" style="cursor: pointer; ">编号</th>
							<th class="header" style="cursor: pointer; ">贷款周期起始月</th>
							<th class="header" style="cursor: pointer; ">贷款周期截止月</th>
							<th class="header" style="cursor: pointer; ">利率</th>
							<th class="header" style="cursor: pointer; ">描述</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" status="i">
						<tr <s:if test="#i.even">class="even"</s:if><s:else>class="odd"</s:else>>
							<td>${id}</td>
							<td>${startdt }</td>
							<td>${enddt }</td>
							<td><input type="text" value="${rate }" name="rates"/></td>
							<td>${memo }</td>
						</tr>
						</s:iterator>
						<tr>
							<td colspan="5" align="center"><input id="rb" type="button" value="修改" onclick="edit();"/></td>
						</tr>
					</tbody>
				</table>
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