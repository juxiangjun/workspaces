<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/xheditor-1.1.14-zh-cn.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
	$("#hid").toggle(function(){
		$(this).attr("class","jt_block");
		$(".hid").hide();
		$(this).val("显示");
		
	},function(){
		$(this).attr("class","jt_hidden");
		$(".hid").show();
		$(this).val("隐藏");
	});
	$("#hidn").toggle(function(){
		$(this).attr("class","jt_block");
		$(".hidn").hide();
		$(this).val("显示");		
	},function(){
		$(this).attr("class","jt_hidden");
		$(".hidn").show();
		$(this).val("隐藏");
	});
	
	
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    $("#bizCity").val('${usrCompany.bizcityid}');
	$("#bizDistrict").val('${usrCompany.bizdistrictid}');
	$("#industry").val('${usrCompany.industryid}');
  //  $('textarea').xheditor({tools:'simple',skin:'nostyle'});
    $("#regDate").datepicker({changeMonth: true,changeYear: true});
    $("#regCity").val('${usrCompany.regcityid}');
	$("#regDistrict").val('${usrCompany.regdistrictid}');
	
	$("#lpliveCity").val('${usrCompany.lplivecityid}');
	$("#lpliveDistrict").val('${usrCompany.lplivedistrictid}');
		
	$("#lphkCity").val('${usrCompany.lphkcityid}');
	$("#lphkDistrict").val('${usrCompany.lphkdistrictid}');
	$("#loanForm").validate({
		meta:"validate"
	});
	$('#errores').html('');
});
function servicedetail(){
		if($("#zjservice").attr("checked")){
			$("#loanSubmit").attr("disabled",false);
		}else{
			$("#loanSubmit").attr("disabled",true);
		}
}
</script>
<style>
.jt_block{background:url(/images/up_jiant.gif) 8px 6px no-repeat; float:right; border:0; cursor:pointer; height:20px; line-height:20px; padding-left:22px; color: #424240; font-family:"微软雅黑";}
.jt_hidden{background:url(/images/down_jiant.gif) 8px 6px no-repeat; float:right; border:0; cursor:pointer; height:20px; line-height:20px; padding-left:22px; color: #424240; font-family:"微软雅黑";}
.jt_bg{background:#f9f9f7; height:30px; width:900px; display:block; line-height:30px;}
</style>
  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>融资申请-企业经营贷款</p>
	<div class="center" style="width:900px;">
		<div class="left_gray">&nbsp;</div>
		<div class="m_red">完善企业信息</div>
		<div class="m_gray">填写申请信息</div>
		<div class="m_gray">预审中</div>
		<div class="m_gray">提交资料</div>
		<div class="m_gray">资金网审核</div>
		<div class="m_gray">金融机构审核</div>
		<div class="right_gray">&nbsp;</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<s:if test="mg!=null">
	<div class="notification attention png_bg"><div>对不起，该融资产品暂不支持您的企业所在地区，请您重新选择其他融资产品！</div></div>
</s:if>
<div class="container_950">
	<div class="box_4">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
			      <tr>
			        <td colspan="2" style="padding:20px 0 0 30px;">
			        <div class="fl">	
			        	<s:if test="product.logo == null || product.logo == ''">
					        <img src="/images/banklogo/b/zj198.jpg" style="white-space: nowrap;"/>
				        </s:if>
				        <s:else>
				        	<img src="/images/banklogo/b/${product.logo }"/>
				        </s:else></div>
			        <div class="Search_t_title red">&nbsp; ${product.financeName }</div>
			        </td>			        
			      </tr>
			       <tr>
			      	<td style="padding:0 0 20px 30px;"><h6>类型：<common:print valueId="product.financeType" />&nbsp; &nbsp; &nbsp; &nbsp; 
			      	金额：${product.financeLittleamount }~${product.financeBigamount }万&nbsp; &nbsp; &nbsp; &nbsp; 
			      	期限：${product.financeLittledt }~${product.financeMostdt }月</h6></td>
			      	<td style="padding:0 30px 20px 0;"><span class="view_detail fr"><a href="/loan/financeProduct!cusViewFinance.act?product.id=${product.id}" target="_blank" >产品详情</a></span></td>
			      </tr>
			    </table>
	</div>
	<div class="box_3">
	<form action="/user/loan/financeApply!busiApplyFirst.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
	<s:hidden name="usrCompany.userid"></s:hidden>
	<!-- 企业经营贷款快速申请类型=136 -->
	<s:hidden name="product.id"></s:hidden>
		<div class="C_title">企业基本信息</div>
		<div class="hr_10">&nbsp;</div>
		<table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
			<tr>
             <td class="a_right">企业名称：</td>
             <td class="v-align"><input type="hidden" name="companyMark" value="1"/><input id="companyname" type="text" value="${usrCompany.companyname }" class="input-text required chne {validate:{maxlength:15}}"  name="usrCompany.companyname"/>
       	    </td>
             <td class="a_right">营业执照号码：</td>
             <td class="v-align"><input type="text" value="${usrCompany.licensecode }" class="input-text required alnum {validate:{maxlength:15}}" name="usrCompany.licensecode"/></td>
           </tr>
          <tr>
            <td class="a_right">组织机构代码证号码：</td>
            <td colspan="3" class="v-align"><input id="organizationcode" type="text" value="${usrCompany.organizationcode }" class="input-text required Organization {validate:{maxlength:10}}" name="usrCompany.organizationcode" /></td>
          </tr>
           <tr>
             <td class="a_right">所属行业：</td>
             <td colspan="3" class="v-align">
             	<s:select id="industryParent" name="usrCompany.industryparentid" list="industryList" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"  onchange="changeindustry('industryParent','industry');"></s:select>
                <select id="industry" name="usrCompany.industryid">
         	      <option value="0">--请选择--</option>
         	      <s:iterator value="industry">
			        <option value="${id}">${name}</option>
		          </s:iterator>
               </select>
             </td>
          </tr>
          <tr>
             <td class="a_right">企业经营地址：</td>
             <td colspan="3" class="v-align">
              <s:select id="bizProvince" name="usrCompany.bizprovinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('bizProvince','bizCity','bizDistrict');"/>
              <select id="bizCity" name="usrCompany.bizcityid" onchange="changeCity('bizCity','bizDistrict');" class="tb_sele">
                <option value="0">--请选择--</option>
          	    <s:iterator value="cityMap['bizCity']">
				  <option value="${id}">${name}</option>
			    </s:iterator>
	          </select>
	         <select id="bizDistrict" name="usrCompany.bizdistrictid" class="tb_sele">
	          <option value="0">--请选择--</option>
	         	<s:iterator value="districtMap['bizDistrict']">
				 <option value="${id}">${name}</option>
			    </s:iterator>
		     </select>         
           </td>
        </tr>
        <tr>
           <td class="a_right">详细地址：</td>
           <td colspan="3" class="v-align"><input type="text" value="${usrCompany.bizaddress }" class="input-text required chne {validate:{maxlength:32}}" style="width:534px;" name="usrCompany.bizaddress"/></td>
       </tr>              
       <!-- <tr>
          <td class="a_right">邮政编码：</td>
          <td colspan="3" class="v-align"><input type="text" value="${usrCompany.bizpostcode }" class="input-text required zipCode" name="usrCompany.bizpostcode"/></td>
       </tr> -->            
       <tr>
         <td class="a_right">联系人姓名：</td>
         <td colspan="3" class="v-align">
           <input type=text value="${usrCompany.linkname }" class="input-text required {validate:{maxlength:6}} chcharacter" name="usrCompany.linkname"/>
           <s:if test="usrCompany == null || usrCompany.linkgender == null">
          <s:radio id="gender1" name="usrCompany.linkgender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio id="gender2" name="usrCompany.linkgender" list="#{1:'先生',0:'女士'}" value="usrCompany.linkgender" listKey="key" listValue="value"/>
          </s:else>
         </td>
       </tr>
       <tr>
         <td class="a_right">联系人邮箱：</td>
       	 <td class="v-align">
          <input id="linkemail" type=text value="${usrCompany.linkemail }" class="input-text required iemail {validate:{maxlength:30}}" name="usrCompany.linkemail"/>
         </td>

         <td class="a_right">联系人电话：</td>
         <td class="v-align">
         	<input type=text value="${usrCompany.linktelephone }" class="input-text required mobile {validate:{maxlength:20}}" name="usrCompany.linktelephone"/>
         </td>
      </tr> 
	</table>
		<div class="C_title">企业更多信息</div>
		<div class="hr_10"> &nbsp; </div>
		<table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
	         <s:if test="msg!=null">
	          <tr>
	           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
	         </tr>
		     </s:if>
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>税务登记证号码：</td>
	          <td colspan="3" class="v-align"><input type="text" value="${usrCompany.faxcode }" class="input-text required alnum {maxlength:15}" name="usrCompany.faxcode"/>
	          </td>
	        </tr>
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>注册日期：</td>
	          <td class="v-align"><input id="regDate" type="text" value="<s:date name="usrCompany.registerdate" />" class="input-text required dateISO" name="usrCompany.registerdate" /></td>
	          <td class="a_right"><span class="txt-impt">*</span>注册资本：</td>
	          <td class="v-align"><input type="text" value="<s:if test="usrCompany.registeredcapital!=null"><s:text name="format.float"><s:param value="usrCompany.registeredcapital"></s:param></s:text></s:if>" class="input-text required number {maxlength:12}" name="usrCompany.registeredcapital" id="registeredcapital"/>
	          &nbsp;万元 <label for="registeredcapital" class="error" generated="true" style="display:none;"></label>
	          </td>
	        </tr>
	        <tr>
	        	<td colspan="4" style="height:0;">
	        		<span class="jt_bg">&nbsp;&nbsp;填写更多企业信息，提高融资申请成功率<input id="hid" type="button" value="隐藏" class="jt_hidden" /></span>
	        	</td>        
	        </tr>
	        <tr class="hid">
	          <td class="a_right">开户许可证号码：</td>
	          <td width="300px" class="v-align"><input id="bankpermitcode" type="text" value="${usrCompany.bankpermitcode }" class="input-text alnum {maxlength:32}" name="usrCompany.bankpermitcode"/></td>
	          <td class="a_right">贷款卡号：</td>
	          <td width="300px" class="v-align"><input type="text" value="${usrCompany.loancard }" class="input-text alnum {maxlength:32}" name="usrCompany.loancard"/></td>
	        </tr>
	        <tr class="hid">
	          <td class="a_right">企业类型：</td>
	          <td class="v-align"><s:select name="usrCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"  cssClass="S_width" style="width:158px;"></s:select></td>
	          <td class="a_right">员工人数：</td>
	          <td class="v-align"><s:select name="usrCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"  cssClass="S_width" style="width:158px;"></s:select></td>
	        </tr>
	        <!-- 
	        <tr>
	          <td class="a_right">所属部门：</td>
	          <td class="v-align"><input id="department" type=text value="${usrCompany.department }" class="input-text chne {maxlength:8}" name="usrCompany.department"/></td>
	          <td class="a_right">职位：</td>
	          <td class="v-align"><input type=text value="${usrCompany.position }" class="input-text chne {maxlength:8}" name="usrCompany.position"/></td>
	        </tr>
	          -->
	        <tr class="hid" style="border-bottom:1px solid #C0C0C0;">
	          <td class="a_right" style="vertical-align: top;">经营范围：</td>
	          <td colspan="3" style="padding-bottom:20px;"><textarea name="usrCompany.bizscope" class="input-text chne {maxlength:30}" style="width: 613px;height: 100px;">${usrCompany.bizscope }</textarea></td>
	        </tr>        
        </table>
        <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>法人姓名：</td>
	          <td class="v-align"><input type="text" value="${usrCompany.legalperson }" class="input-text required chcharacter {maxlength:8}" name="usrCompany.legalperson"/></td>
	          <td class="a_right"><span class="txt-impt">*</span>学历：</td>
	          <td class="v-align"><s:select headerKey="" headerValue="--请选择--" cssClass="S_width required" name="usrCompany.lpeducation" list="dataMap['eduAtion']" value="usrCompany.lpeducation" listKey="id" listValue="name" style="width:158px;"></s:select></td>
	        </tr>
	        <tr>
	          <td class="a_right"><span class="txt-impt">*</span>从事所属行业年限：</td>
	          <td width="300px" class="v-align"><s:select name="usrCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"  cssClass="S_width required"  style="width:158px;"></s:select></td>
	          <td class="a_right"><span class="txt-impt">*</span>婚姻状况：</td>
	          <td width="300px" class="v-align"><s:select name="usrCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"  cssClass="S_width required"  style="width:158px;"></s:select></td>
	        </tr>
	        <tr>
	        	<td colspan="4">
	        		<span class="jt_bg">&nbsp;&nbsp;填写更多企业信息，提高融资申请成功率<input id="hidn" type="button" value="隐藏" class="jt_hidden"/></span>
	        	</td>
	        </tr>
	        <tr class="hidn">
	          <td class="a_right">身份证号码：</td>
	          <td class="v-align"><input type="text" value="${usrCompany.lpcid }" class="input-text" name="usrCompany.lpcid"/></td>
	          <td class="a_right">手机：</td>
	          <td class="v-align"><input id="lpmobile" type="text" value="${usrCompany.lpmobile}" class="input-text" name="usrCompany.lpmobile"/></td>
	        </tr>
	        <tr class="hidn">
	          <td class="a_right">常住地址：</td>
	          <td colspan="3" class="v-align"><s:select id="lpliveProvince" name="usrCompany.lpliveprovinceid" list="listProvince" headerKey="" headerValue="--请选择--"  listKey="id" listValue="name" onchange="changeProvince('lpliveProvince','lpliveCity','lpliveDistrict');" cssClass="S_width" style="width:158px; float: none;"/>
	          <select class="S_width" style="width:158px; float: none;" id="lpliveCity" name="usrCompany.lplivecityid" onchange="changeCity('lpliveCity','lpliveDistrict');">
	          	<option value="0">--请选择--</option>
	          	<s:iterator value="cityMap['lpliveCity']">
					<option value="${id}">${name}</option>
				</s:iterator>
	          </select>
	          <select class="S_width" style="width:158px; float: none;" id="lpliveDistrict" name="usrCompany.lplivedistrictid">
	          	<option value="0">--请选择--</option>
	          	<s:iterator value="districtMap['lpliveDistrict']">
					<option value="${id}">${name}</option>
				</s:iterator>
			  </select>
			  <label for="lpliveProvince" class="error" generated="true" style="display:none;"></label>
			  </td>
	        </tr>
	        <tr class="hidn">
	          <td class="a_right">详细地址：</td>
	          <td colspan="3" class="v-align"><input type="text" value="${usrCompany.lpliveaddress }" class="input-text {maxlength:30}" style="width:604px;"  name="usrCompany.lpliveaddress"/></td>
	        </tr>
	        <tr class="hidn">
	          <td class="a_right">家庭电话：</td>
	          <td class="v-align" colspan="3"><input type="text" value="${usrCompany.lphometel }" class="input-text phone {maxlength:20}" name="usrCompany.lphometel"/></td>
	        </tr>
	        <tr>
	           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
	           <input type="checkbox" name="copy" value="1"/>
	           	将申请企业信息保存到用户注册信息中
	           </td>
	         </tr>
	        <tr>
	           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="submit" class="but_gray" style="width:200px;" value="下一步" /></td>
	         </tr>
         </table>
	</form>         
		</div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
