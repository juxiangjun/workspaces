<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户产品管理_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
$(document).ready(function(){
	$(".date_picker").datepicker();
	setCompanyName($("#companyList"));
});
function setCompanyName(com){
	$("#fundCompanyId").val($(com).find('option:selected').val());
	$("#fundCompanyName").val($(com).find('option:selected').text());
}
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;详细信息&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;编辑信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
		<h6><img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
		&nbsp;&nbsp;&nbsp;&nbsp;
		您的账户类型：银行</h6>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!-- tab -->
<div class="box_4 center" style="width:950px;">
      <div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>基金概况</h6></dd>
          <dd></dd>
        </dl>
      </div>
    <form action="/user/userFundManage!saveUsrFund.act" method="post">
		<input type="hidden" name="fund.id" value="${fund.id }"/>
		<input type="hidden" name="fund.isSource" value="${fund.isSource }"/>
		<input type="hidden" name="fund.imitateId" value="${fund.imitateId }"/>
		<table cellpadding="0" cellspacing="0" width="100%" class="psfs_tb">
			<tbody>
				<tr class="even" style="color:#97181d;font-weight: bold;"><td colspan="2">基金详细信息</td></tr>
			<s:if test="fund!=null">
				<tr><td class="a_right">代码</td><td><input name="fund.code" value="${fund.code }" class="text"/></td></tr>
				<tr><td class="a_right">全称</td><td> <input name="fund.fullName" value="${fund.fullName }" class="text"/></td></tr>
				<tr><td class="a_right">简称</td><td> <input name="fund.shortName" value="${fund.shortName }" class="text"/></td></tr>
				<tr><td class="a_right">发行日期</td><td> <input name="fund.issuedDate" value="${fund.issuedDate }" class="text date_picker"/></td></tr>
				<tr><td class="a_right">基金类型</td><td> <input name="fund.catelogName" value="${fund.catelogName }" class="text"/></td></tr>
				<tr><td class="a_right">基金经理</td><td> <input name="fund.manager" value="${fund.manager }" class="text"/></td></tr>
				<tr><td class="a_right">管理人</td><td> <input name="fund.administrator" value="${fund.administrator }" class="text"/></td></tr>
				<tr><td class="a_right">托管人</td><td> <input name="fund.custodian" value="${fund.custodian }" class="text"/></td></tr>
				<tr><td class="a_right">投资目标</td><td> <input name="fund.investmentGoal" value="${fund.investmentGoal }" class="text"/></td></tr>
				<tr><td class="a_right">投资愿景</td><td> <input name="fund.investmentVision" value="${fund.investmentVision }" class="text"/></td></tr>
				<tr><td class="a_right">投资范围</td><td><textarea name="fund.investmentScale" class="required xheditor" style="width: 600px; height: 200px;">${fund.investmentScale}</textarea></td></tr>
				<tr><td class="a_right">投资策略</td><td> <input name="fund.investmentStrategy" value="${fund.investmentStrategy }" class="text"/></td></tr>
				<tr><td class="a_right">风险收益特征</td><td><textarea name="fund.characteristics" class="required xheditor" style="width: 600px; height: 200px;">${fund.characteristics}</textarea></td></tr>
				<tr><td class="a_right">比较基准</td><td> <input name="fund.benchmark" value="${fund.benchmark }" class="text"/></td></tr>
				<tr><td class="a_right">运作模式</td><td> <input name="fund.operationMode" value="${fund.operationMode }" class="text"/></td></tr>
				<tr><td class="a_right">基金公司名称</td><td> 
					<input id="fundCompanyId" type="hidden" name="fund.fundCompanyId" value="5"/> 
					<input id="fundCompanyName" type="hidden" name="fund.fundCompanyName" value="${fund.fundCompanyName }" class="text"/>
					<s:select id="companyList" list="fundCompanyList" listKey="id" listValue="fullName"
							 cssClass="cmf-skinned-select" headerKey="5" 
							 onchange="setCompanyName(this);"
							 ></s:select> 
				</td></tr>
				<tr><td class="a_right">类目id</td><td> <input name="fund.catelogId" value="${fund.catelogId }" class="text"/></td></tr>
				<tr><td class="a_right">状态</td><td><s:select name="fund.status" list="#{0:'未发布',1:'已发布'}" listKey="key" listValue="value"></s:select></td></tr>
				<tr><td class="a_right">创建时间</td><td><input name="fund.createdTime" value="<s:date name="fund.createdTime"/>" class="text date_picker" readonly="readonly"/></td></tr>
				<tr><td class="a_right">更新时间</td><td><input name="fund.lastUpdatedTime" value="<s:date name="fund.lastUpdatedTime"/>" class="text date_picker" readonly="readonly"/></td></tr>
				<tr><td colspan="2" align="center">
				<input type="submit" value="确认提交" />&nbsp;
				<input type="button" value="返 回" onclick="javascript:window.history.back();" />
				&nbsp;</td></tr>
			</s:if><s:else>
					<tr><td>&nbsp;</td><td align="center">
						<input type="button" value="返 回" onclick="javascript:window.history.back();" />
					</td></tr>
				</s:else>
			</tbody>
		</table>
		</form>
    <div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>