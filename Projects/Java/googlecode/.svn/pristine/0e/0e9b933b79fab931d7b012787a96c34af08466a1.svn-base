<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>企业经营贷款快速申请</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />	
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script type="text/javascript" src="/script/register.js" > </script>
<script type="text/javascript" src="/script/index.js" > </script>
<script language="javascript">
//用户名、证书登录切换
var baserate = parseFloat('${baseRate}');
$(function() {
    $(".user_login01_menu li").click(function() {
        $(this).addClass("selected").siblings().removeClass("selected");
		var num = $(this).index();
        $(".user_login01_content>div").eq(num).attr("class", "on").siblings().attr("class", "off");
    });
});

function submitForm(){
    $("#rateLowerLimit").val(Math.round($( "#slider-range" ).slider( "values", 0 )*baserate)/100);
    $("#rateUpperLimit").val(Math.round($( "#slider-range" ).slider( "values", 1 )*baserate)/100);
	$("#loanForm").submit();
}

function valilogin(){
	if('${session._user}'==''){
		$("#pop_login").dialog({width:340,modal: true});
	}else{
		submitForm();
	}
}
function registertab(){
	$("#pop_login").dialog('close');
	$("#pop_register").dialog({width:500,modal:true});
}
function logintab(){
	$("#pop_register").dialog('close');
	$("#pop_login").dialog({width:340,modal:true});
}
function quickRegist(){
	checkAll();
	if(checkformresult==1){
		alert("请输入全部注册需要的信息。");
		checkformresult=0;
		return;
	}
	var userType = '${loan.busiRunningType}';
	if(userType == ''){
		userType = '1';
	}
	var gendervalue = $("input[name='gender']:checked").val();
	var param = {
		username:$('#username').val(),
		password:$('#pass').val(),
		email:$('#email').val(),
		mobile:$('#mobile').val(),
		realname:$('#fullname').val(),
		gender:gendervalue,
		type:userType
	};
	$.post("/Register!rapidRegister.act",param,function(a){
		if(a=='success'){
			//submitForm();
		}else{
			alert(a);
		}
	});
}
$(function(){
	$("#zjservice").click(function(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
	});
});
$(function() {
	$( "#slider-range" ).slider({
		range: true,min: 70,max: 130,values: [ 70, 130 ],
		slide: function( event, ui ) {
		    $( "#amount" ).val( Math.round(ui.values[ 0 ]*baserate)/100 + "% -- " +Math.round(ui.values[1]*baserate)/100  + "%");
		}
	});
	$( "#amount" ).val( Math.round($( "#slider-range" ).slider( "values", 0 )*baserate)/100 + "% -- " +Math.round($( "#slider-range" ).slider( "values", 1 )*baserate)/100  + "%");
});
function userLogin(type){
	if(!$('#login_username').val() || !$('#login_password').val() || !$('#Verification_code').val()){
		alert("请输入全部的用户名、密码和验证码。");
		return false;
	}
	$.post("/Account!RapidLogin.act",{username:$('#login_username').val(),password:$('#login_password').val(),verifycode:$('#Verification_code').val(),loginType:type},function(a){
		if(a=='success'){
			submitForm();
		}else{
			alert(a);
		}
	});
}
</script>

<style>
	#demo-frame > div.demo { padding: 10px !important; };
	#pop_register .input-text { float:left; width:192px; height:20px; line-height:20px; font-size:16px; background:url(/images/input_bg.png) 0 0 no-repeat; border:1px solid #d3d3d3; padding-left:5px;  font-family:"微软雅黑", "宋体", Helvetica Neue, Helvetica, Arial, sans-serif;  font-size:12px;}
	#pop_register .input-focus { background:#FFFFCC; border:1px solid #97181d; }
	#pop_register .txt-info { color:#aaa; padding-left:15px; font-size:12px; }
	#pop_register select {float: left; margin:5px 5px 0 0; height: 22px; line-height: 14px }
	#pop_register input { margin:5px; line-height: 14px}
	#pop_register label{margin-top:12px;}
	#pop_register .txt-err { color:#97181d;padding-left:15px;}
</style>

  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<s:form action="/loan/LoanRequest!loanThird.act" id="loanForm" cssClass="box_form" >
<s:hidden name="loan.loanPurpose"></s:hidden>
<s:hidden name="loan.loanAmount"></s:hidden>
<s:hidden name="loan.loanMonth"></s:hidden>
<s:hidden name="loan.haveMortgage"></s:hidden>
<s:hidden name="loan.lastyearVolume"></s:hidden>
<s:hidden name="loan.lastyearDebt"></s:hidden>
<s:hidden name="loan.lastyearCost"></s:hidden>
<s:hidden name="loan.lastyearProfit"></s:hidden>
<s:hidden name="loan.applyType" ></s:hidden>
<s:hidden name="loan.busiRunningType" ></s:hidden>
<s:hidden name="loan.companyType"></s:hidden>
<s:hidden name="loan.workTime"></s:hidden>
<s:hidden name="loan.salaryLevel"></s:hidden>
<s:hidden name="loan.putSalaryType"></s:hidden>
<s:hidden name="loan.haveHouse"></s:hidden>
<s:hidden name="loan.hostoryLoan"></s:hidden>
<s:hidden name="loan.userCreditCard"></s:hidden>
<s:hidden name="loan.bankSalaryList"></s:hidden>
<s:hidden name="loan.houseNature"></s:hidden>
<s:hidden name="loan.repaymentType"></s:hidden>
<s:hidden name="loan.birthday"></s:hidden>
<s:hidden name="loan.teachLevel"></s:hidden>
<s:hidden name="loan.runningTrade"></s:hidden>
<s:hidden name="loan.runningTradeChild"></s:hidden>
<s:hidden name="loan.experience"></s:hidden>
<s:hidden name="loan.allyearVolume"></s:hidden>
<s:hidden name="loan.runningArea"></s:hidden>
<s:hidden name="loan.rateLowerLimit" id="rateLowerLimit"></s:hidden>
<s:hidden name="loan.rateUpperLimit" id="rateUpperLimit"></s:hidden>

<s:hidden name="minBound" id="minBound" ></s:hidden>
<s:hidden name="maxBound" id="maxBound" ></s:hidden>

<!--主体部分开始-->
<div class="apply_title">
	<p>企业经营贷款快速申请</p>
	<div class="apply_menu">
        <div class="apply_menu_text001">1、填写申请信息</div>
        <div class="apply_menu_text002">2、完善需求</div>
        <div class="apply_menu_text003">3、申请成功</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
	<div class="apply_form_title">第二步&nbsp;完善需求</div>
    <div class="apply_form_title01">请选择可接受的贷款机构 </div>
        <table border="0" cellspacing="0" cellpadding="0" class="apply_table" >
          <tr class="apply_tr">
            <td width="20%">选择机构</td>
            <td width="20%">适合的机构</td>
            <td width="20%">利率低</td>
            <td width="20%">放款快</td>
            <td width="20%">担保要求低</td>
          </tr>
          <tr>
            <td style="padding-left:55px;">
            <s:checkbox name="loanObjects" value="false" fieldValue="6" cssClass="required"></s:checkbox>银行</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.bankNum" /></td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="8"></s:checkbox>小额贷款公司</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.littleLoan" /></td>
            <td>&nbsp;</td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="9"></s:checkbox>典当公司</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.pawnOrg" /></td>
            <td>&nbsp;</td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="10"></s:checkbox>担保公司</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.warrantOrg" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="11"></s:checkbox>融资租赁公司</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.financeOrg" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="7"></s:checkbox>保险公司</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.insuranceOrg" /></td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
            <td>&nbsp;</td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
          </tr>
          <tr>
			<td style="padding-left:55px;"><s:checkbox name="loanObjects" value="false" fieldValue="12"></s:checkbox>民间机构</td>
            <td style="padding-left:80px;"><s:property value="loanOrgCountModel.popularOrg" /></td>
            <td>&nbsp;</td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
            <td style="padding-left:75px;"><img src="/images/right_icon.png"/></td>
          </tr>
        </table>

    <div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_bottom">
	<div style="font-weight:bolder;">您能接受的年利率范围<input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;" /></div>
	<div class="hr_10"> &nbsp;</div>
	<div >
		<div class="demo" style="width:200px;">
		<div id="slider-range"></div>
		</div>
		
	</div>
	<div class="hr_10"> &nbsp;</div>
	<div class="hr_10"> &nbsp;</div>
	<div class="center" style="width:260px;"><input type="checkbox" name="zjservice" id="zjservice"  />我已阅读并同意<a href="" class="T_Service">中国资金网融资服务条款</a></div>
	<div class="hr_10"> &nbsp;</div>
	<div class="center" style="width:200px;">
<input type="button" onclick="valilogin();" class="but_gray" style="width:200px;" value="提交申请"  disabled="disabled" id="loanSubmit"/>
	</div>
</div>
<!--主体部分结束-->
<!--弹出框内容-->
<div id="pop_register" style="display:none;" title="快速注册">
	<dl>
		<dd>
			<h6><font color="#97181d">*</font>用户名</h6>
			<input type="text" name="username" onblur="check_username()" id="username" size="30" /><span id="username_error" class="txt-info">6-18个字符，可使用字母、数字、下划线。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>密码</h6>
			<input id="pass" onblur="check_pass()" type="password" size="30" /><span id="pass_error" class="txt-info">6~16个字符，区分大小写。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>确认密码</h6>
			<input id="rpass" onblur="check_rpass()" type="password" size="30" /><span id="rpass_error" class="txt-info">请再次输入密码。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>姓名</h6>
			<input type="text" onblur="check_fullname()" id="fullname" size="30" /><span id="fullname_error" class="txt-info">请输入真实姓名。</span>
			<input type="radio" name="gender" value="1" checked="checked" /><label for="radio1">先生</label>
			<input type="radio" name="gender" value="0" /><label for="radio2">女士</label>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>邮箱</h6>
			<input type="text" onblur="check_email()" id="email" size="30"/><span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span>
		</dd>
		<dd>
			<h6><font color="#97181d">*</font>手机号</h6>
			<input type="text" onblur="check_mobile()" id="mobile" size="30"/><span id="mobile_error" class="txt-info">常用的手机号码，用于接受通知和验证等。</span>
		</dd>
	</dl>
	<div class="hr_10"> &nbsp; </div>
	<div class="center">
	  <input type="button" onclick="quickRegist()" class="but_gray" style="width:100px;" value="注册" />
	</div>
	<div class="center">
	  如果您已有帐号，<span class="red" style="cursor:pointer;" onclick="logintab();">点此登录</span>。
	</div>
	<div class="hr_10"> &nbsp; </div>
</div>

<!--弹出框内容登录页面-->
<div id="pop_login" style="display:none;" title="用户登录">
    <div class="user_login01">
      <div class="clear"> &nbsp; </div>
      <div class="user_login01_content">
        <div class="on">
            <dl>
              <dd><h6>用户名：</h6><input type="text" name="login_username" id="login_username" class="input-text" size="40" /></dd>
              <dd><h6>密码：</h6><input id="login_password" name="login_password" type="password" class="input-text" size="40"/></dd>
              <dd><h6>验证码：</h6><input id="Verification_code" name="verifycode" type="text" class="input-text" style="float: left;"/><img src="/Captcha.act" title="点击更换" onclick="this.src='/Captcha.act?d='+Math.random();" /></dd>
              <dd><h6>&nbsp;</h6><input type="button" onclick="userLogin(1)" class="but_gray" style="width:90px;" value="登录" /><span class="txt_info red"><a href="/Recovery.act" target="_blank"> 忘记密码？</a></span></dd>
			  <dd><h6>&nbsp;</h6>如果您尚未注册过，<span class="red" style="cursor:pointer;" onclick="registertab();">点此快速注册</span>。</dd>
            </dl>
        </div>
	  </div>
	</div>
</div>


<!--尾部-->
<div class="clear"> &nbsp; </div>
</s:form>
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>

