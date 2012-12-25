<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
//通用选项卡2
   

	if('${left}' == 2 && '${right}' == 2){
	    $('.xxkbox3').hide(); //让从大于0开始的div都隐藏 
	    $('.first3').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
	    var sb = $('.tab_menu3 li');
	    sb.click(function() {
	        $(this).addClass('hover').siblings().removeClass();
	        var nb = sb.index(this);
	        $('.xxkbox3').eq(nb).show().siblings().hide();
	        $('#submitApply').addClass('btnsub blue1');
	    });  
	}
	var j = new Date();
	var y = j.getFullYear() - 1;
	$('.year').html(y);
	var jm = j.getFullYear() + "年" + j.getMonth() + "月";
	$('.yearmoth').html(jm);
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });

    $("#bizCity").val('${ordCompany.bizcityid}');
	$("#bizDistrict").val('${ordCompany.bizdistrictid}');
	$("#industry").val('${ordCompany.industryid}');
	//$('textarea').xheditor({tools:'simple',skin:'nostyle'});
	$( "#regDate" ).datepicker({changeMonth: true,changeYear: true,maxDate: "0d"});
	$("#regCity").val('${ordCompany.regcityid}');
	$("#regDistrict").val('${ordCompany.regdistrictid}');
	$("#lpliveCity").val('${ordCompany.lplivecityid}');
	$("#lpliveDistrict").val('${ordCompany.lplivedistrictid}');
	$("#lphkCity").val('${ordCompany.lphkcityid}');
	$("#lphkDistrict").val('${ordCompany.lphkdistrictid}');

	$("#loanForm").validate();
	$("#comForm").validate();
});
function otherPurpose(){
	var j = $('#other').val();
	if(j==68){
		$('#otherPurpose').html("<input type='text' name='apply.loanPurposeOther' class='required'/>");
	}else{
		$('#otherPurpose').html('');
	}
}

jQuery.validator.addMethod("loanAmount", function(value, element, param) {
return this.optional(element) || (value >= param[0] && value <= param[1]);
}, $.validator.format("必须大于{0}小于{1}"));

jQuery.validator.addMethod("assetSumcls", function(value, element, param) {
var s1 = $('#' + param[0]).val();
var s2 = $('#' + param[1]).val();
return this.optional(element) || (value - s1 >= 0 && value - s2 >= 0);
}, $.validator.format("总资产必须大于融资金额与总负债"));
</script>

  </head>
  
  <body>
<!--头部2-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
		<a href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
		<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${apply.id }">融资申请查看</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;修改融资申请
</div>
<div class="hr_10">&nbsp;</div>
<div class="container_950 box_4">
	<div class="P_title">修改融资申请</div>
	<div class="line">
		您的融资申请单填写不符合要求，请在完成修改后点击确认修改完成并提交给中国资金网重新审核！
		<span style="padding-left:50px">
			<input type="button" value="修改完成提交审核" class="btnsub blue1" id="submitApply" onclick="$('#upstatus').submit();"/>
		</span>
	</div>
</div>
	<div class="hr_10"> &nbsp; </div>
<div class="container_950">
<div class="box_4">
	<form id="upstatus" action="/user/loan/userApplyManag!updateApplyStatus.act" method="post">
	<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
	<input type="hidden"  name="apply.id" value="${apply.id }">
	<input type="hidden"  name="left" value="${left }">
	<input type="hidden"  name="right" value="${right }">
	<div class="gray news_menu01 tab_menu3" >
		<s:if test="left==2">
			<s:if test="updateType == null || updateType == 'updateOrdCom'">
		    	<li class="hover" style="width:200px;">企业信息</li>
			</s:if>
			<s:else>
				<li style="width:200px;">企业信息</li>
			</s:else>
	    </s:if>
	    <s:if test="right==2">
	    	<s:if test="updateType == 'updateApply' || left != 2">
		    	<li class="hover" style="width:200px;">申请信息</li>
			</s:if>
			<s:else>
				<li style="width:200px;">申请信息</li>
			</s:else>
	    </s:if>
	</div>
	</form>
	<!-- class="bgray hid" -->
	<div class="hr_10">&nbsp; </div>
	<div >
	
		<div class='xxkbox3 <s:if test="left==2 && (updateType == null || updateType == 'updateOrdCom')">first3</s:if>' >
		<!-- update company start -->
		<s:if test="left==2">
      <form id="comForm" class="box_form" action="/user/loan/userApplyManag!updateOrdCom.act" method="post" >
       	<input type="hidden" value="${applyId }" name="applyId"/>
        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
	     
	     <tr>
             <td class="a_right">企业名称：</td>
             <td colspan="3" class="v-align"><input id="companyname" type="text" value="${ordCompany.companyname }" class="input-text required chne {maxlength:15}"  name="ordCompany.companyname"/>
       	    </td>
           </tr>
           <tr>
             <td class="a_right">营业执照号码：</td>
             <td colspan="3" class="v-align"><input type="text" value="${ordCompany.licensecode }" class="input-text required alnum {validate:{maxlength:15}}" name="ordCompany.licensecode"/></td>
           </tr>
           <tr>
             <td class="a_right">所属行业：</td>
             <td colspan="3" class="v-align">
             	<s:select id="industryParent" name="ordCompany.industryparentid" list="industryList" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"  onchange="changeindustry('industryParent','industry');"></s:select>
                <select id="industry" name="ordCompany.industryid">
         	      <option value="0">--请选择--</option>
         	      <s:iterator value="industry">
			        <option value="${id}">${name}</option>
		          </s:iterator>
               </select>
             </td>
          </tr>
          <tr>
            <td class="a_right">组织机构代码证号码：</td>
            <td colspan="3" class="v-align"><input id="organizationcode" type="text" value="${ordCompany.organizationcode }" class="input-text required Organization {validate:{maxlength:10}}" name="ordCompany.organizationcode" /></td>
          </tr>
          <tr>
             <td class="a_right">企业经营地址：</td>
             <td colspan="3" class="v-align">
              <s:select id="bizProvince" name="ordCompany.bizprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('bizProvince','bizCity','bizDistrict');"/>
              <select id="bizCity" name="ordCompany.bizcityid" onchange="changeCity('bizCity','bizDistrict');" class="tb_sele">
                <option value="0">--请选择--</option>
          	    <s:iterator value="cityMap['bizCity']">
				  <option value="${id}">${name}</option>
			    </s:iterator>
	          </select>
	         <select id="bizDistrict" name="ordCompany.bizdistrictid" class="tb_sele">
	          <option value="0">--请选择--</option>
	         	<s:iterator value="districtMap['bizDistrict']">
				 <option value="${id}">${name}</option>
			    </s:iterator>
		     </select>         
           </td>
        </tr>
        <tr>
           <td class="a_right">详细地址：</td>
           <td colspan="3" class="v-align"><input type="text" value="${ordCompany.bizaddress }" class="input-text required chne {validate:{maxlength:32}}" style="width:534px;" name="ordCompany.bizaddress"/></td>
       </tr>              
       <tr>
         <td class="a_right">联系人姓名：</td>
         <td colspan="3" class="v-align">
           <input type=text value="${ordCompany.linkname }" class="input-text required {validate:{maxlength:6}} chcharacter" name="ordCompany.linkname"/>
           <s:if test="ordCompany == null || ordCompany.linkgender == null">
          <s:radio id="gender1" name="ordCompany.linkgender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio id="gender2" name="ordCompany.linkgender" list="#{1:'先生',0:'女士'}" value="ordCompany.linkgender" listKey="key" listValue="value"/>
          </s:else>
         </td>
       </tr>
       <tr>
         <td class="a_right">联系人邮箱：</td>
       	 <td colspan="3" class="v-align">
          <input id="linkemail" type=text value="${ordCompany.linkemail }" class="input-text required iemail {validate:{maxlength:30}}" name="ordCompany.linkemail"/>
         </td>
      </tr>
       <tr>
         <td class="a_right">联系人电话：</td>
         <td colspan="3" class="v-align">
         	<input type=text value="${ordCompany.linktelephone }" class="input-text required mobile {validate:{maxlength:20}}" name="ordCompany.linktelephone"/>
         </td>
      </tr> 
	     
	     <!-- ------------------------------ -->
        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>税务登记证号码：</td>
	          <td colspan="3" class="v-align"><input type="text" value="${ordCompany.faxcode }" class="input-text required alnum {maxlength:15}" name="ordCompany.faxcode"/>
	          </td>
	        </tr>
	        <tr>
	          <td class="a_right">开户许可证号码：</td>
	          <td width="300px" class="v-align"><input id="bankpermitcode" type="text" value="${ordCompany.bankpermitcode }" class="input-text" name="ordCompany.bankpermitcode"/></td>
	          <td class="a_right">贷款卡号：</td>
	          <td width="300px" class="v-align"><input type="text" value="${ordCompany.loancard }" class="input-text" name="ordCompany.loancard"/></td>
	        </tr>
	        
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>注册日期：</td>
	          <td class="v-align"><input id="regDate" type="text" value="<s:date name="ordCompany.registerdate" />" class="input-text required dateISO" name="ordCompany.registerdate" /></td>
	          <td class="a_right"><span class="txt-impt">*</span>注册资本：</td>
	          <td class="v-align"><input type="text" value="<s:if test="ordCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="ordCompany.registeredcapital"></s:param></s:text></s:if>" class="input-text required number {maxlength:12}" name="ordCompany.registeredcapital" id="registeredcapital"/>
	          &nbsp;万元 <label for="registeredcapital" class="error" generated="true" style="display:none;"></label>
	          </td>
	        </tr>
	        <tr>
	          <td class="a_right">企业类型：</td>
	          <td class="v-align"><s:select name="ordCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
	          <td class="a_right">员工人数：</td>
	          <td class="v-align"><s:select name="ordCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"></s:select></td>
	        </tr>
	        <!-- 
	        <tr>
	          <td class="a_right">所属部门：</td>
	          <td class="v-align"><input id="department" type=text value="${ordCompany.department }" class="input-text chne {maxlength:8}" name="ordCompany.department"/></td>
	          <td class="a_right">职位：</td>
	          <td class="v-align"><input type=text value="${ordCompany.position }" class="input-text chne {maxlength:8}" name="ordCompany.position"/></td>
	        </tr>
	         -->
	        <tr style="height:160px;line-height:160px;">
	          <td class="a_right">经营范围：</td>
	          <td colspan="3"><textarea name="ordCompany.bizscope" style="width: 550px;height: 150px;">${ordCompany.bizscope }</textarea></td>
	        </tr>
	        </table>
	        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>法定代表姓名：</td>
	          <td class="v-align"><input type="text" value="${ordCompany.legalperson }" class="input-text required chcharacter {maxlength:8}" name="ordCompany.legalperson"/></td>
	          <td class="a_right"><span class="txt-impt">*</span>学历：</td>
	          <td class="v-align"><s:select headerKey="" headerValue="--请选择--" cssClass="required" name="ordCompany.lpeducation" list="dataMap['eduAtion']" value="ordCompany.lpeducation" listKey="id" listValue="name" ></s:select></td>
	        </tr>
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>从事所属行业年限：</td>
	          <td width="300px" class="v-align"><s:select name="ordCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" cssClass="required"></s:select></td>
	          <td class="a_right"><span class="txt-impt">*</span>婚姻状况：</td>
	          <td width="300px" class="v-align"><s:select name="ordCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" cssClass="required"></s:select></td>
	        </tr>
	        <tr>
	          <td class="a_right">身份证号码：</td>
	          <td class="v-align"><input type="text" value="${ordCompany.lpcid }" class="input-text" name="ordCompany.lpcid"/></td>
	          <td class="a_right">手机：</td>
	          <td class="v-align"><input id="lpmobile" type="text" value="${ordCompany.lpmobile}" class="input-text" name="ordCompany.lpmobile"/></td>
	        </tr>
	        <tr>
	          <td class="a_right">常住地址：</td>
	          <td colspan="3" class="v-align"><s:select id="lpliveProvince" name="ordCompany.lpliveprovinceid" list="listProvince" headerKey="" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lpliveProvince','lpliveCity','lpliveDistrict');" cssClass="required"/>
	          <select id="lpliveCity" name="ordCompany.lplivecityid" onchange="changeCity('lpliveCity','lpliveDistrict');">
	          	<option value="0">--请选择--</option>
	          	<s:iterator value="cityMap['lpliveCity']">
					<option value="${id}">${name}</option>
				</s:iterator>
	          </select>
	          <select id="lpliveDistrict" name="ordCompany.lplivedistrictid">
	          	<option value="0">--请选择--</option>
	          	<s:iterator value="districtMap['lpliveDistrict']">
					<option value="${id}">${name}</option>
				</s:iterator>
			  </select>
			  <label for="lpliveProvince" class="error" generated="true" style="display:none;"></label>
			  </td>
	        </tr>
	        <tr>
	          <td class="a_right">详细地址：</td>
	          <td colspan="3" class="v-align"><input type="text" value="${ordCompany.lpliveaddress }" class="input-text" style="width:534px;" name="ordCompany.lpliveaddress"/></td>
	        </tr>
	        <tr>
	          <td class="a_right">邮编：</td>
	          <td class="v-align"><input type="text" value="${ordCompany.lplivepostcode }" class="input-text zipCode" name="ordCompany.lplivepostcode"/></td>
	          <td class="a_right">家庭电话：</td>
	          <td class="v-align"><input type="text" value="${ordCompany.lphometel }" class="input-text phone {maxlength:20}" name="ordCompany.lphometel"/></td>
	        </tr>
        <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="submit" class="but_gray" style="width:200px;" value="保存企业信息" />&nbsp;&nbsp;
           </td>
         </tr>
         </table>
        </form>
        </s:if>
	     <!-- update company end -->
	     
	     
	     
	     </div>
	     <div class='xxkbox3 <s:if test="right==2 && (updateType == 'updateApply' || left != 2)">first3</s:if>' >
	<!-- update apply start -->
	<s:if test="right==2">
	<form action="/user/loan/userApplyManag!updateApply.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
	<!-- 企业经营贷款快速申请类型=136 -->
	<s:hidden name="apply.id"></s:hidden>
		<div class="C_title">融资需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
		</div>
		<div class="C_form">
	            <dl>
	              <dd>
	                <h6 style="width:280px">融资用途：</h6>
	                <common:select id="other" name="apply.loanPurpose" valueSetId="14" cssClass="S_width" style="width:160px;" onchange="otherPurpose()"></common:select>
	              	<div id="otherPurpose">
	              		<s:if test="apply.loanPurpose == 68">
	              			<input type='text' name='apply.loanPurposeOther' class='required' value="${apply.loanPurposeOther }"/>
	              		</s:if>
	              	</div>
	              </dd>
	              <dd> 
	                <h6 style="width:280px">融资金额：</h6>
	                <s:textfield name="apply.loanAmount" cssClass="input-text required digits" id="apply_loanAmount" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
	                <label for="apply_loanAmount" class="error" generated="true" style="display:none;"></label>
	              </dd>
	              <dd>
	                <h6 style="width:280px">融资期限：</h6>
	                <s:textfield name="apply.loanMonth" cssClass="input-text required digits" id="apply_loanMonth" maxlength="2"></s:textfield>&nbsp;&nbsp;个月
	                <label for="apply_loanMonth" class="error" generated="true" style="display:none;"></label>
					</dd>
					<dd>
	                <h6 style="width:280px">是否有抵押物：</h6>
					  <input id="radio1" type="radio" onclick="$('.hid').show()" name="apply.haveMortgage" value="1" class="required" <s:if test="apply.haveMortgage == 1">checked</s:if>/><label for="radio1">能提供</label>
					  <input id="radio2" type="radio" onclick="$('.hid').hide()" name="apply.haveMortgage" value="0" <s:if test="apply.haveMortgage == 0">checked</s:if>/><label for="radio2">无法提供</label>
					</dd>
					<dd class="hid"> 
	                <h6 style="width:280px">抵押物类型：</h6>
	                <common:select  name="apply.mortgageType" valueSetId="86" cssClass="S_width" style="width:160px;"></common:select>
	              </dd>
	             <dd class="hid"> 
	                <h6 style="width:280px">抵押物估值：</h6>
	                <input type="text" name="apply.mortgageWorth" value="${apply.mortgageWorth }" class="input-text required digits"  id="apply_mortgageWorth" maxlength="6"/>&nbsp;&nbsp;万元
	                <label for="apply_mortgageWorth" class="error" generated="true" style="display:none;"></label>
	              </dd>
				 </dl>
		</div>
		<div class="clear"></div>
		<div class="C_title">企业经营信息</div>
		<div class="C_form">
			<dl>
				<dd>
					<h6 style="width:280px">企业<span class="year"></span>年销售额约为：</h6>
					<s:textfield name="apply.lastyearSaleVolume" cssClass="input-text required number"  id="apply.lastyearSaleVolume" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.lastyearSaleVolume" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">企业<span class="year"></span>年经营成本约为：</h6>
					<s:textfield name="apply.lastyearCost" cssClass="input-text required number"  id="apply.lastyearCost" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.lastyearCost" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">企业<span class="year"></span>年净利润率约为：</h6>
					<s:textfield name="apply.lastyearProfit" cssClass="input-text required number"  id="apply.lastyearProfit" maxlength="10"></s:textfield>&nbsp;&nbsp;%
					<label for="apply.lastyearProfit" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">截止到<span class="yearmoth"></span>，企业应收账款约为：</h6>
					<s:textfield name="apply.receivable" cssClass="input-text required number"  id="apply.receivable" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.receivable" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">截止到<span class="yearmoth"></span>，企业总库存约为：</h6>
					<s:textfield name="apply.stockSum" cssClass="input-text required number"  id="apply.stockSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply.stockSum" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">截止到<span class="yearmoth"></span>，企业总资产约为：</h6>
					<s:textfield name="apply.assetSum" cssClass="input-text required number"  id="apply.assetSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<!--  {assetSumcls:['apply_debtSum','apply_loanAmount']} -->
					<label for="apply.assetSum" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
					<h6 style="width:280px">截止到<span class="yearmoth"></span>，企业总负债约为：</h6>
					<s:textfield name="apply.debtSum" cssClass="input-text required number"  id="apply_debtSum" maxlength="10"></s:textfield>&nbsp;&nbsp;万元
					<label for="apply_debtSum" class="error" generated="true" style="display:none;"></label>
				</dd>
			</dl>
		</div>
		<div class="clear"></div>
		<s:if test="extendsPropertyList != null && extendsPropertyList.size() > 0">
		<div class="C_title">其它申请信息</div>
		<div class="C_form">
			<dl>
				<s:iterator value="extendsPropertyList" id="epid">
					<dd>
						<h6 style="width:280px">${fieldName }：</h6>
						<s:if test="fieldType == 1">
							<input type="text" name="epValue${id }" value="${entityValue }" class="input-text required"/>
						</s:if>
						<s:if test="fieldType == 2">
							<textarea name="epValue${id }" rows="5" cols="50" class="required">${entityValue }</textarea>
						</s:if>
						<s:if test="fieldType == 3">
							<select name="epValue${id }">
								<s:iterator value="propertyDicSet">
									<option value="${dicValue }" <s:if test='selected == 1'>selected</s:if>>${dicName }</option>
								</s:iterator>
							</select>
						</s:if>
						<s:if test="fieldType == 4">
							<s:iterator value="propertyDicSet">
								<input type="checkbox" name="epValue${epid.id }" value="${dicValue }" class="required" <s:if test='selected == 1'>checked</s:if>/>${dicName }
							</s:iterator>
							<label for="epValue${epid.id }" class="error" generated="true" style="display:none;"></label>
						</s:if>
					</dd>
				</s:iterator>
			</dl>
		</div>
		</s:if>
			<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:400px;">
				<s:submit value="保存申请信息"  cssClass="but_gray" style="width:200px;" id="loanSubmit"></s:submit>
			</div>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
	</form>
	</s:if>
	<!-- update apply end -->
	     </div>
	</div>
	</div>
</div>

<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
