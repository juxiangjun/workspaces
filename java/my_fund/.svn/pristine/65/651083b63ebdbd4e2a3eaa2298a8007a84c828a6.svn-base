<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人经营贷款快速申请</title>
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />	
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.slider.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/load-loan.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/upload/base-rate.js" > </script>
<script type="text/javascript" src="/script/loanRegister.js" > </script>
<script language="javascript">
/*
	function changeindustry(industryParent,industry){
		if($("#"+industryParent).val()=='0'){
			$("#"+industry).html("<option value='0'>--请选择--</option>");
			$("#"+industry).hide();
		}else{
			$.post("/DataCommon!findIndustry.act",{industryId:$("#"+industryParent).val()},function(a){
				$("#"+industry).show();
				$("#"+industry).html('<option value="0">--请选择--</option>');
				$("#"+industry).append(a);
			});
		}
	}
*/	
var baserate = baserate_inteArr[0];
$(function(){
	$("#loanForm").validate();
	$( "#slider-range" ).slider({
		range: true,min: 100,max: 500,values: [ 100, 500 ],
		slide: function( event, ui ) {
		    $( "#amount" ).val( Math.round(ui.values[ 0 ]*baserate)/100 + "% -- " +Math.round(ui.values[1]*baserate)/100  + "%");
		}
	});
	$( "#amount" ).val( Math.round($( "#slider-range" ).slider( "values", 0 )*baserate)/100 + "% -- " +Math.round($( "#slider-range" ).slider( "values", 1 )*baserate)/100  + "%");
	$("#birthday").datepicker({changeMonth: true,changeYear: true,maxDate: "-18y"});
	$("#city").val('${usrPerson.cityid}');
	$("#district").val('${usrPerson.districtid}');
	$("#industry").val('${loan.runningTradeChild}');
	//servicedetail();
	if('${loan.loanAmount}' != ''){
		updateLoanMonth('${loan.loanAmount}');
	}
});
/*
function servicedetail(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
}*/
function submitForm(){
    $("#rateLowerLimit").val(Math.round($( "#slider-range" ).slider( "values", 0 )*baserate)/100);
    $("#rateUpperLimit").val(Math.round($( "#slider-range" ).slider( "values", 1 )*baserate)/100);
	$("#loanForm").submit();
	if($("#loanForm").valid()){
		$("#loanSubmit").attr("disabled",true);
	}
}
function valilogin(){
	var user = '${session._user}';
	if(user == ''){
		if(check_fullname()!=0){
			return;
		}else if(check_email() != 0){
			return;
		}else if(check_mobile() != 0){
			return;
		}
		else if(check_username() != 0){
			return;
		}
		else if(check_pass() != 0){
			return;
		}
	}
	var loans = $("input[name=loanObjects]:checked");
	if(loans.size() == 0){
		alert("请选择贷款机构！");
		return ;
	}
	if($("#zjservice").attr("checked")){
		submitForm();
	}else{
		alert("请阅读中国资金网融资服务条款！");
		return ;
	}
	
}

function updateLoanMonth(month){
	if(month == ''){
		baserate = baserate_inteArr[0];
	}else if(month<=6){
		baserate = baserate_inteArr[0];
	}else if(month>6 && month<=12){
		baserate = baserate_inteArr[1];
	}else if(month>12 && month<=36){
		baserate = baserate_inteArr[2];
	}else if(month>36 && month<=60){
		baserate = baserate_inteArr[3];
	}else if(month>60){
		baserate = baserate_inteArr[4];
	}
}
function updateSetStatus(noid,boxName){
	if($("#" +noid).attr("checked")){
		$("input[name='" + boxName + "']").each(function(){
			$(this).attr("checked",'true');
		});
	}else{
		$("input[name='" + boxName + "']").each(function(){
			$(this).removeAttr("checked");
		});
	}
}
function updateCheck(noid,boxName){
	$("input[name='" + boxName + "']").each(function(){
		if($(this).attr("checked")==undefined){
			$("#" +noid).removeAttr("checked");
		}
	});
}

</script>
<style>
.c_right h1{color:#164566;}
.c_right p{margin-top: 10px;}
.c_right{width: 335px; height:auto; float:right; background:#F0F5F8; padding:25px 14px 25px 20px; margin-right:28px;}
.c_right01{width: 335px; height:auto; float:right; background:#FFF79A; padding:15px 14px 15px 20px; margin-right:28px; margin-top:10px;}
.C_table{width:520px; font-size: 14px; margin-left: 28px; float:left;}
.C_table td{height:35px; line-height:35px;}
.C_table .c-left{text-align: right; width:180px;}
</style>	
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
	<p>融资意向单—个人经营性贷款</p>
	<div class="apply_menu" >
        <div class="apply_menu_text01">1、提交融资意向</div>
        <div class="apply_menu_text02">2、资金网制定融资方案</div>
        <div class="apply_menu_text03">3、申请融资产品</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form box_4" style="width:948px;">
<form action="/loan/LoanRequest!perrunSecond.act" id="loanForm" style="margin:0px;" class="box_form" method="post">
<s:hidden name="loan.applyType" value="138"></s:hidden>
<s:hidden name="loan.rateLowerLimit" id="rateLowerLimit"></s:hidden>
<s:hidden name="loan.rateUpperLimit" id="rateUpperLimit"></s:hidden>
<s:if test="msg!=null && msg != ''">
	<div class="notification attention png_bg"><div>${msg }</div></div>
</s:if>
<s:if test="#session._user == null">
	<div class="C_title">联系方式</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="C_form" style="width:100%;">
		<table class="C_table">
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>姓名：</td>
				<td><input id="fullname" name="newUser.realname" onchange="check_fullname()" type=text value="${newUser.realname}" class="input-text int_align"/><span id="fullname_error" class="txt-info"></span></td>
			</tr>
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>性别：</td>
				<td>
					<s:if test="gender==null">
					   	<s:radio name="newUser.gender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value" cssClass="int_align"/>
					</s:if><s:else>
						<s:radio name="newUser.gender" list="#{1:'先生',0:'女士'}" value="0" listKey="key" listValue="value" cssClass="int_align"/>
					</s:else>
				</td>
			</tr>
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>邮箱：</td>
				<td><input id="email" name="newUser.email" onchange="check_email()" type=text value="${newUser.email}" class="input-text" /><span id="email_error" class="txt-info"></span></td>
			</tr>
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>手机号：</td>
				<td><input id="mobile" name="newUser.mobile" onchange="check_mobile()" type=text value="${newUser.mobile}" class="input-text" /><span id="mobile_error" class="txt-info"></span></td>
			</tr>
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>用户名：</td>
				<td><input id="username" name="newUser.username" onchange="check_username()" type=text value="${newUser.username}" class="input-text" /><span id="username_error" class="txt-info"></span></td>
			</tr>
			<tr>
				<td class="c-left"><span class="txt-impt">*</span>密码：</td>
				<td><input id="pass" name="newUser.password" onchange="check_pass()" type=password value="" class="input-text" /><span id="pass_error" class="txt-info"></span></td>
			</tr>	
		</table>
		<div class="c_right">
			<h1>我是会员，请登录</h1>
			<p>中国资金网会员请登录后提交融资意向。</p>
			<p>
				<a href="/Account.act?rtnurl=/loan/LoanRequest.act?loan.applyType=136" class="btnsub bred">登录</a>
			</p>		
		</div>
		<div class="c_right01">
			<p>您若是第一次提交意向单，请填写左面的联系方式，提交后即可用该用户名和密码登录，查看意向单的处理结果</p>
		</div>			      
	</div>
</s:if>	

	<div class="clear"></div>	
	<div class="C_title">融资意向信息</div>
	<div class="hr_10"> &nbsp; </div>
	
	<div class="C_form" style="margin: 0 auto;">
            <dl>
              <dd style="width:850px;">
                <h6><span class="txt-impt">*</span>贷款用途：</h6>
                <common:select name="loan.loanPurpose" valueSetId="23" cssClass="S_width" style="width:158px;"></common:select>
                <h6><span class="txt-impt">*</span>贷款金额：</h6>
                <s:textfield name="loan.loanAmount" cssClass="input-text required digits" id="loan_loanAmount" size="10" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
                <label for="loan_loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6><span class="txt-impt">*</span>贷款期限：</h6>
                <s:textfield name="loan.loanMonth" cssClass="input-text required digits" id="loan_loanMonth" size="10" maxlength="2" onchange="updateLoanMonth(this.value);"></s:textfield>&nbsp;个月
                <label for="loan_loanMonth" class="error" generated="true" style="display:none;"></label>                
              </dd>
              <dd>
                <h6><span class="txt-impt">*</span>是否有抵押物：</h6>
                <s:radio value="1" name="loan.haveMortgage" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required int_align"></s:radio>
				<label for="loan.haveMortgage" class="error" generated="true" style="display:none;"></label>                
              </dd>              
				<dd>
                  <h6><span class="txt-impt">*</span>可接受的贷款机构：</h6>
                  <input type="checkbox" value="0" id="loanObj" onclick="updateSetStatus('loanObj','loanObjects');" class="int_align"/><label for="loanObj">不限</label>
				  <input id="checkbox1" type="checkbox" name="loanObjects" value="6" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox1">银行</label>
				  <input id="checkbox2" type="checkbox" name="loanObjects" value="8" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox2">小额贷款公司</label>
				  <input id="checkbox3" type="checkbox" name="loanObjects" value="9" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox3">典当公司</label>
				  <input id="checkbox4" type="checkbox" name="loanObjects" value="10" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox4">担保公司</label>
				  <input id="checkbox5" type="checkbox" name="loanObjects" value="11" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox5">融资租赁公司</label>
				  <input id="checkbox6" type="checkbox" name="loanObjects" value="7" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox6">信托公司</label>	
				  <input id="checkbox7" type="checkbox" name="loanObjects" value="12" onclick="updateCheck('loanObj','loanObjects');" class="int_align"/><label for="checkbox7">民间机构</label>	  	  			  
				</dd>
				<dd>
                  <h6><span class="txt-impt">*</span>可接受的年利率范围：</h6>
                  	<div>
			           <table >
					    	<tr>
					    		<td style="padding-left:90px;">
							     <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;" />
					    		</td>
					    		<td style="padding-top:10px;">
								    <div class="demo" style="width:300px;">
										<div id="slider-range"></div>
									</div>
					    		</td>
					    	</tr>
					    </table>
					 </div>
				</dd>				
			 </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">个人信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="C_form" style="margin: 0 auto;">
	    <dl>
	    <!-- 
		 <dd>
            <h6><span class="txt-impt">*</span>出生年月：</h6>
            <input id="birthday" type="text" value="<s:date name="usrPerson.birthday" />" class="input-text required dateISO userbirthday" name="usrPerson.birthday"/>
            <span class="ask_text"></span>
         </dd>
          -->
		 <!-- 
		 <dd>
			<h6><span class="txt-impt">*</span>姓名：</h6>
			<s:textfield name="usrCompany.organizationcode" cssClass="input-text required Organization {maxlength:10}"  id="organizationcode"></s:textfield>				
		 </dd>
		  -->          
         <dd>
           <h6><span class="txt-impt">*</span>教育程度：</h6>
           	<s:select name="usrPerson.education" list="dataMap['eduAtion']" cssClass="tb_sele required S_width" style="width:158px;" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select>                    
         </dd>
         <dd>
           <h6><span class="txt-impt">*</span>职业：</h6>
            <s:select name="usrPerson.careerid" id="careerid" list="dataMap['psersoncareer']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" cssClass="tb_sele required S_width" style="width:158px;"/>
            <label for="careerid" class="error" generated="true" style="display:none;"></label>               	
         </dd>
         <dd>
           <h6><span class="txt-impt">*</span>身份证号码：</h6>
           	<s:textfield name="usrPerson.cid" cssClass="input-text required idcardno"></s:textfield>
         </dd>
         <dd>
           <h6><span class="txt-impt">*</span>所在地：</h6>
            <s:select id="province" name="usrPerson.provinceid" cssClass="tb_sele required S_width" style="width:158px;" list="listProvince" headerKey="" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/>省/直辖市&nbsp;
            <select id="city" name="usrPerson.cityid" onchange="changeCity('city','district');" class="tb_sele S_width" style="float:none; width:158px;">
          	 <option value="0">--请选择--</option>
          	 <s:iterator value="cityMap['city']">
				<option value="${id}">${name}</option>
			 </s:iterator>
          	</select>市&nbsp;
            <select id="district" name="usrPerson.districtid" class="tb_sele S_width" style="float:none; width:158px;">
          	 <option value="0">--请选择--</option>
          	 <s:iterator value="districtMap['district']">
				<option value="${id}">${name}</option>
			 </s:iterator>
          	</select>区/县&nbsp;
          	<label for="province" class="error" generated="true" style="display:none;"></label>        
         </dd>
          
       </dl>
	</div>
	<div class="clear"></div>
	<div class="C_title">经营信息</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="C_form" style="margin: 0 auto;">
		<dl>
			<dd>
				<h6><span class="txt-impt">*</span>行业：</h6>
				<s:select id="industryParent" name="loan.runningTrade" list="industryList" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"  onchange="changeindustry('industryParent','industry');" cssClass="S_width required" style="width:158px;"></s:select>
                <select id="industry" name="loan.runningTradeChild" class="S_width" style="width:158px;">
         	      <option value="0">--请选择--</option>
         	      <s:iterator value="industry" >
			        <option value="${id}" >${name}</option>
		          </s:iterator>
               </select>
               <label for="industryParent" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>行业经验：</h6> 
				<s:textfield name="loan.experience" cssClass="input-text required"  maxlength="3" id="loan.experience"></s:textfield>&nbsp;&nbsp;年
				<label for="loan.experience" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>年营业额：</h6>
				<common:select name="loan.allyearVolume" valueSetId="24" cssClass="S_width"  style="width:158px;"></common:select>
				<label for="loan.allyearVolume" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>经营场所：</h6>
				<s:radio value="1" name="loan.runningArea" list="%{#{1:'有',0:'无'}}" cssClass="required int_align"></s:radio>
				<label for="loan.runningArea" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>银行借款经历：</h6>
				<s:radio value="1" name="loan.hostoryLoan" list="%{#{1:'有',0:'无'}}" cssClass="required int_align"></s:radio>
				<label for="loan.hostoryLoan" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>使用信用卡经历：</h6>
				<s:radio value="1" name="loan.userCreditCard" list="%{#{1:'有',0:'无'}}" cssClass="required int_align"></s:radio>
				<label for="loan.userCreditCard" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6><span class="txt-impt">*</span>银行流水：</h6>
				<s:radio value="1" name="loan.bankSalaryList" list="%{#{1:'能提供',0:'无法提供'}}" cssClass="required int_align"></s:radio>
				<label for="loan.bankSalaryList" class="error" generated="true" style="display:none;"></label>
			</dd>
		</dl>
	</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="clear"></div>	
		<div class="center" style="width:260px;">
			<input type="checkbox" name="zjservice" id="zjservice" style="margin-bottom:8px;" />
			<label for="zjservice">我已阅读并同意</label>
			<a href="/news/Info.act?id=134" class="T_Service" target="_blank">中国资金网融资服务条款</a>
		</div>
		<div style="text-align:center;">
		<input type="button" onclick="valilogin();" value="提交申请"  class="btnsub bred" style="width:150px;" id="loanSubmit"/>
		</div>
		<div class="hr_20"> &nbsp; </div>
</form>
	</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<div class="clear"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
