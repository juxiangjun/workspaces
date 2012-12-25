<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人经营性贷款申请</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script language="javascript">
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
})	


//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
$(function(){
	if($("#radio6").attr("checked")=="checked"&&$("#radio10").attr("checked")=="checked"){
		$(".brek").hide();
	}else{
		$(".brek").show();
	}
	if('${apply.breakRepay}'=='0'){
		$('#cishu').hide();
	}
	if('${apply.bankSalaryList}'=='0'){
		$('#liush').hide();
	}
	$("#city").val('${userPerson.cityid}');
	$("#district").val('${userPerson.districtid}');
	$("#applyForm").validate();
});
function brekChange(){
	if($("#radio6").attr("checked")=="checked"&&$("#radio10").attr("checked")=="checked"){
		$(".brek").hide();
	}else{
		$(".brek").show();
		if('${apply.breakRepay}'=='0'){
			$('#cishu').hide();
		}
	}
}
function otherPurpose(){
	var j = $('#other').val();
	if(j==68){
		$('#otherPurpose').html("<input type='text' name='apply.loanPurposeOther' class='required'/>");
	}else{
		$('#otherPurpose').html('');
	}
}

	function industryList(id){
		if(id!=''){
			$.post("/user/loan/financeApply!industry.act",{industryId:id},function(data){
				$("#runningTradeChild").html(data);
			});
		}
	}
	
	function industryListAndSel(id,childId){
		if(id!=''){
			$.post("/user/loan/financeApply!industry.act",{industryId:id},function(data){
				$("#runningTradeChild").html(data);
				$("#runningTradeChild").val(childId);
			});
		}
	}
jQuery.validator.addMethod("loanAmount", function(value, element, param) {
return this.optional(element) || (value >= param[0] && value <= param[1]);
}, $.validator.format("必须大于{0}小于{1}"));
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
<div class="container_950 box_4">
	<div class="P_title">修改融资申请</div>
	<div class="line">
	<form id="upstatus" action="/user/loan/userApplyManag!updateApplyStatus.act" method="post">
		<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
		<input type="hidden"  name="apply.id" value="${apply.id }">
		<input type="hidden"  name="left" value="${left }">
		<input type="hidden"  name="right" value="${right }">
		您的融资申请单填写不符合要求，请在完成修改后点击确认修改完成并提交给中国资金网重新审核！
		<span style="padding-left:50px">
			<input type="button" value="修改完成提交审核" class="btnsub blue1" id="submitApply" onclick="$('#upstatus').submit();"/>
		</span>
	</form>
	</div>
</div>
	<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="box_4">
		<div class="gray news_menu01 tab_menu3" >
			<s:if test="left==2">
				<s:if test="updateType == null || updateType == 'updateOrdCom'">
			    	<li class="hover" style="width:200px;">个人信息</li>
				</s:if>
				<s:else>
					<li style="width:200px;">个人信息</li>
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
		<div>
		<div class='xxkbox3 <s:if test="left==2 && (updateType == null || updateType == 'updateOrdCom')">first3</s:if>' >
			<s:if test="left==2">
			<form action="/user/loan/userApplyManag!updateOrdCom.act" id="loanForm"  cssClass="box_form" style="margin:0px;" method="post">
				<!-- 企业经营贷款快速申请类型=136 -->
				<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
				<input type="hidden"  name="apply.id" value="${apply.id }">
				<input type="hidden"  name="left" value="${left }">
				<input type="hidden"  name="right" value="${right }">
					<div class="C_title">个人信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
						<div class="hr_10"> &nbsp; </div>
						 <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
						 <tr>
				           <td class="a_right">姓名:</td>
				           <td><input name="userPerson.realname" value="${userPerson.realname}"/> </td>
				         </tr>
				         <tr>
				           <td class="a_right">性别:</td>
				           <td>
				           		<input type="radio" name="userPerson.gender" value="1" <s:if test="#session._user.gender==1">checked="checked"</s:if> >先生</input>
				           		<input type="radio" name="userPerson.gender" value="0" <s:if test="#session._user.gender!=1">checked="checked"</s:if> >女士</input>
				           </td>
				         </tr>
				         <!-- 
				         <tr>
				           <td class="a_right">出生年月</td>
				           <td><s:date name="userPerson.birthday" /></td>
				         </tr> -->
				         <tr>
				           <td class="a_right">教育程度:</td>
				           <td>
				           <s:iterator value="dataMap['eduAtion']" id="eduAtion">
				           <input type="radio" name="userPerson.education" value="${eduAtion.id }" <s:if test="%{userPerson.education == #eduAtion.id}"> checked</s:if>/>${eduAtion.name}
				           </s:iterator>
				           </td>
				           <!-- <td>${profileMap['eduAtion'] }</td> -->
				         </tr>
				         <tr>
				           <td class="a_right">身份证号码:</td>
				           <td><input type=text value="${userPerson.cid}" class="input-text required idcardno" name="userPerson.cid"/></td>
				           <!-- <td>${userPerson.cid}</td>-->
				         </tr>
				         <tr>
				           <td class="a_right">所在地:</td>
				           <td>
				            <s:select id="province" name="userPerson.provinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/><span class="v-align">省/直辖市&nbsp;</span>
				            <select id="city" name="userPerson.cityid" onchange="changeCity('city','district');" class="tb_sele">
				          	 <option value="0">--请选择--</option>
				          	 <s:iterator value="cityMap['city']">
								<option value="${id}">${name}</option>
							 </s:iterator>
				          	</select><span class="v-align">市&nbsp;</span>
				            <select id="district" name="userPerson.districtid" class="tb_sele">
				          	 <option value="0">--请选择--</option>
				          	 <s:iterator value="districtMap['district']">
								<option value="${id}">${name}</option>
							 </s:iterator>
				          	</select><span class="v-align">区/县&nbsp;</span>         
				           </td>
				           <!-- 
				           <td style="vertical-align: middle;">
				            ${profileMap['address'] }
				           </td>-->
				         </tr>
				         <tr>
				           <td class="a_right">详细地址:</td>
				           <td><input type=text value="${userPerson.address }" class="input-text required {maxlength:32}" style="width:534px;" name="userPerson.address" /><span class="ask_text"></span></td>
				           <!-- 
				           <td>${userPerson.address }</td>-->
				         </tr>              
				         <tr>
				           <td class="a_right" style="vertical-align:top;">邮政编码:</td>
				           <td><input type="text" value="${userPerson.postcode }" name="userPerson.postcode" id="textfield" class="input-text required zipCode"/><span class="ask_text"></span></td>
				           <!-- 
				           <td>${userPerson.postcode }</td>-->
				         </tr> 
						</table>
						
						
						<div class="hr_10"> &nbsp; </div>
						<div class="center" style="width:200px;">
							<input type="submit" value="保存个人信息"  class="but_gray" style="width:200px;" id="loanSubmit">
						</div>
						<div class="hr_10"> &nbsp; </div>
						<div class="hr_10"> &nbsp; </div>
				</form>
			</s:if>
		</div>
		
		<div class='xxkbox3 <s:if test="right==2 && (updateType == 'updateApply' || left != 2)">first3</s:if>' >
			<s:if test="right==2">
			<form action="/user/loan/userApplyManag!updateApply.act" id="applyForm" method="post" class="box_form" style="margin:0px;" >
			<!-- 个人经营性贷款快速申请类型 -->
			<input type="hidden" id="applyid" name="applyId" value="${apply.id }">
			<input type="hidden"  name="apply.id" value="${apply.id }">
			<input type="hidden"  name="left" value="${left }">
			<input type="hidden"  name="right" value="${right }">
				<div class="C_title">融资需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
				</div>	
				<div class="C_form">
			             <dl>
			              <dd>
			                <h6>融资用途：</h6>
			                <common:select id="other" name="apply.loanPurpose" valueSetId="14" cssClass="S_width" style="width:160px;" onchange="otherPurpose()"></common:select>
			              	<div id="otherPurpose">
			              		<s:if test="apply.loanPurpose == 68">
			              			<input type='text' name='apply.loanPurposeOther' class='required' value="${apply.loanPurposeOther }"/>
			              		</s:if>
			              	</div>
			              </dd>
			              <dd> 
			                <h6>融资金额：</h6>
			                <s:textfield name="apply.loanAmount" cssClass="input-text required digits" id="apply_loanAmount" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
			                <label for="apply_loanAmount" class="error" generated="true" style="display:none;"></label>
			              </dd>
			              <dd>
			                <h6>融资期限：</h6>
			                <s:textfield name="apply.loanMonth" cssClass="input-text required digits" id="apply_loanMonth" maxlength="2"></s:textfield>&nbsp;&nbsp;个月
			                <label for="apply_loanMonth" class="error" generated="true" style="display:none;"></label>
							</dd>
							<dd>
			                <h6>是否有抵押物：</h6>
							  <input id="radio1" type="radio" name="apply.haveMortgage" value="1" class="required" <s:if test="apply.haveMortgage == 1">checked</s:if>/><label for="radio1">能提供</label>
							  <input id="radio2" type="radio" name="apply.haveMortgage" value="0" <s:if test="apply.haveMortgage == 0">checked</s:if>/><label for="radio2">无法提供</label>
							</dd>
							<dd class="hid"> 
				                <h6>抵押物类型：</h6>
				                <common:select  name="apply.mortgageType" valueSetId="86" cssClass="S_width" style="width:160px;"></common:select>
				              </dd>
				             <dd class="hid"> 
				                <h6>抵押物估值：</h6>
				                <input type="text" name="apply.mortgageWorth" value="${apply.mortgageWorth }" class="input-text required digits"  id="apply_mortgageWorth" maxlength="6"/>&nbsp;&nbsp;万元
				                <label for="apply_mortgageWorth" class="error" generated="true" style="display:none;"></label>
				              </dd>
						 </dl>
				</div>
				<div class="clear"></div>
				<div class="C_title">个人及经营信息</div>
				<div class="C_form">
					<dl>
						<dd>
							<h6>行业：</h6>
							<select id="runningTrade"  name="apply.runningTrade" onchange="industryList(this.options[this.options.selectedIndex].value)"  class="required">
								<option value="">--请选择--</option>
			                	<s:iterator value="industryList">
									<option value="${id}" <s:if test='apply.runningTrade == id'>selected</s:if>>${name}</option>
								</s:iterator>
							</select>
							<script language="javascript">
								industryListAndSel('${apply.runningTrade}','${apply.runningTradeChild}');
								
							</script>
							<select id="runningTradeChild" name="apply.runningTradeChild">
								<option>--请选择--</option>
							</select>
						</dd>
						<dd>
							<h6>行业经验：</h6>
							<s:textfield name="apply.experience" cssClass="input-text required" maxlength="3" id="apply.experience"></s:textfield>&nbsp;&nbsp;年
							<label for="apply.experience" class="error" generated="true" style="display:none;"></label>
						</dd>
						<dd>
							<h6>年营业额：</h6>
							<common:select name="apply.allyearVolume" valueSetId="24" cssClass="S_width"></common:select>
							<label for="apply.allyearVolume" class="error" generated="true" style="display:none;"></label>
						</dd>
						<dd>
							<h6>经营场所：</h6>
							<s:radio name="apply.runningArea" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
							<label for="apply.runningArea" class="error" generated="true" style="display:none;"></label>
						</dd>
						<dd>
							<h6><span class="txt-impt">*</span>银行借款经历：</h6>
							<input id="radio9" type="radio" name="apply.hostoryLoan" onclick="brekChange()" value="1" class="required" <s:if test="apply.hostoryLoan==1">checked="checked"</s:if>  /><label for="radio9">有</label>
							<input id="radio10" type="radio" name="apply.hostoryLoan" onclick="brekChange()" value="0" <s:if test="apply.hostoryLoan==0">checked="checked"</s:if>  /><label for="radio10">无</label>
						</dd>
						<dd>
							<h6><span class="txt-impt">*</span>使用信用卡经历：</h6>
							<input id="radio5" type="radio" name="apply.useCreditcard" onclick="brekChange()" value="1" class="required" <s:if test="apply.useCreditcard==1">checked="checked"</s:if>  /><label for="radio5">有</label>
							<input id="radio6" type="radio" name="apply.useCreditcard" onclick="brekChange()" value="0" <s:if test="apply.useCreditcard==0">checked="checked"</s:if> /><label for="radio6">无</label>
						</dd>
						<dd class="brek">
							<h6><span class="txt-impt">*</span>逾期还款记录：</h6>
							<input id="radio7" type="radio" onclick="$('#cishu').show()" name="apply.breakRepay" value="1" class="required" <s:if test="apply.breakRepay==1">checked="checked"</s:if> /><label for="radio7">有</label>
							<input id="radio8" type="radio" onclick="$('#cishu').hide()" name="apply.breakRepay" value="0" <s:if test="apply.breakRepay==0">checked="checked"</s:if> /><label for="radio8">无</label>
						</dd>
						<dd id="cishu" class="brek">
							<h6><span class="txt-impt">*</span>近两年逾期次数：</h6>
							<input name="apply.breakNum" value="${apply.breakNum }" class="input-text required num" maxlength="2">&nbsp;&nbsp;次
							<label for="apply.breakNum" class="error" generated="true" style="display:none;"></label>
						</dd>
						<dd>
							<h6><span class="txt-impt">*</span>银行流水：</h6>
							<input id="radio3" type="radio" onclick="$('#liush').show()" name="apply.bankSalaryList" value="1" class="required" <s:if test="apply.bankSalaryList==1">checked="checked"</s:if> /><label for="radio3">有</label>
							<input id="radio4" type="radio" onclick="$('#liush').hide()" name="apply.bankSalaryList" value="0" <s:if test="apply.bankSalaryList==0">checked="checked"</s:if>/><label for="radio4">无</label>
						</dd>
						<dd id="liush">
							<h6><span class="txt-impt">*</span>近半年银行流水量：</h6>
							<s:textfield name="apply.sixmonthBanklist" cssClass="input-text required digits"  id="apply_sixmonthBanklist" maxlength="6"></s:textfield>&nbsp;&nbsp;万元
							<label for="apply_sixmonthBanklist" class="error" generated="true" style="display:none;"></label>
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
								<h6 style="width:235px">${fieldName }：</h6>
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
