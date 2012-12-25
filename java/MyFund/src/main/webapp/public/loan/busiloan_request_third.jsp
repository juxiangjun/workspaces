<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
$(document).ready(function(){
	$("#birthday").datepicker({changeMonth: true,changeYear: true,maxDate: "-18y"});
	$("#city").val('${usrPerson.cityid}');
	$("#district").val('${usrPerson.districtid}');
	$("#personForm").validate({
		meta:"validate"
	});
	$("#auditForm").validate({
		meta:"validate"
	});
	$("#bizCity").val('${usrCompany.bizcityid}');
	$("#bizDistrict").val('${usrCompany.bizdistrictid}');
	$("#industry").val('${usrCompany.industryid}');
});
</script>
</head>

<body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分开始-->
<div class="hr_10"> &nbsp; </div>
<div class="apply_title" >
	<p>
	<s:if test="loan.applyType == 136">
		企业经营贷款快速申请
	</s:if>
	<s:elseif test="loan.applyType == 137">
		个人综合消费快速申请
	</s:elseif>
	<s:elseif test="loan.applyType == 138">
		个人经营快速申请
	</s:elseif>
	<s:elseif test="loan.applyType == 139">
		个人购房快速申请
	</s:elseif>
	</p>
	<div class="apply_menu">
        <div class="apply_menu_text0001">1、填写申请信息</div>
        <div class="apply_menu_text0002">2、完善需求</div>
        <div class="apply_menu_text0003">3、
        <s:if test="applyNum==null or applyNum==''">申请失败</s:if>
        <s:else>申请成功</s:else>
        </div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
	<div class="S_table_icon">
		<s:if test="applyNum==null or applyNum==''">
			<img src="/images/wrong_ico.png" />
		</s:if>
		<s:else>
			<img src="/images/S_icon.png" />
		</s:else>
	</div>
	<div class="S_table_connect">
		<s:if test="applyNum==null or applyNum==''">
			<span class="Prompt_01">			
				<s:if test="msg == 1">
					对不起！您尚未登录，请登录后再提交申请。
				</s:if>
				<s:elseif test="msg == 2">
					只有个人用户与企业用户可以申请融资！
				</s:elseif>
				<s:elseif test="msg == 3">
					个人用户不允许申请企业融资！
				</s:elseif>
				<s:elseif test="msg == 4">
					企业用户不允许申请个人融资！
				</s:elseif>
			</span>
		</s:if>
		<s:else>		
			<span class="Prompt_01">恭喜您,您的贷款需求成功提交！</span><br/>
			<span class="Prompt_02">您的贷款需求编号为<span style="color:#97181D;"><a href="/user/loan/LoanRequest!loanManageDetail.act?loan.id=${loan.id }"><s:property value="applyNum"/></a></span> ，您可以在您的用户中心在贷款需求管理中查看。</span><br/>
			<span class="Prompt_02">我们的工作人员将在1-3个工作日内与您进行联系。</span>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
		</s:else>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:150px;">
		<s:if test="applyNum==null or applyNum==''">
			<s:if test="msg == 1">
				<s:if test="loan.applyType==136">
				<input type="button" onclick="window.location='/loan/LoanRequest!busiFirst.act?loan.loanAmount=${loan.loanAmount}&loan.loanMonth=${loan.loanMonth }'" class="btnsub bred" style="width:150px;" value="登陆" />
				</s:if>
				<s:if test="loan.applyType==138">
				<input type="button" onclick="window.location='/loan/LoanRequest!perrunFirst.act?loan.loanAmount=${loan.loanAmount}&loan.loanMonth=${loan.loanMonth }'" class="btnsub bred" style="width:150px;" value="登陆" />
				</s:if>
			</s:if>
			<s:else>
				<input type="button" onclick="window.location='/Index.act'" class="btnsub bred" style="width:150px;" value="返回首页" />
			</s:else>
		</s:if>
		<s:else>
		  <s:if test="#session._user.auditstatus==2">
		  	<input type="button" onclick="window.location='/user/UserAction.act'" class="btnsub bred" style="width:150px;" value="确定" />
		  </s:if>
		</s:else>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
