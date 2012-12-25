<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>快速申请查看</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(":button").button();
    $(":submit").button();
	$(".tablesorter").tablesorter();
	$("#allocation_form").validate();
	$("#toOrg_form").validate();
});
var fs = {
	prd_list_event : function(){		//绑定已选择框中checkbox的事件，确定，取消事件响应
			$("#prd_list").find(":input").live("click",function(){
				$(this).parent().remove();
			});
	},
	sel_user_list_event : function(){		//绑定已选择框中checkbox的事件，确定，取消事件响应
			$("#sel_user_list").find(":input").live("click",function(){
				$(this).parent().remove();
			});
	}
	};

/*
function updatestatus(value){
	if (window.confirm('确定提交吗！')) {
		$("#loanForm").submit();
	}
}*/

//推荐产品
function Recommend(id){
	var params = {requestId:id,orgName:$('#r_orgName').val(),prdName:$('#r_prdName').val()};
	$.post("/admin/loan/loanRecommendPrd.act",params,function(data){
		$("#recommendPrdList").html(data);
		$("#pro_recommend").dialog({
			width:990,
			height:418,
			modal: true
		});
	});
} 
function RecommendFind(id){
	var params = {requestId:id,orgName:$('#r_orgName').val(),prdName:$('#r_prdName').val()};
	$.post("/admin/loan/loanRecommendPrd.act",params,function(data){
		$("#recommendPrdList").html(data);
	});
} 
//选择推荐产品后提交
function SelectRecom(){
	var arrChk=$("input[name='checkId']:checked");
	var arrprd=$("input[name='prdIds']:checked");
	var checkhtml = "";
	
	var cstatus=0;
	var sumsel = arrprd.length;
	for(var j=0;j<arrChk.length;j++){
    	var checkvalue = arrChk[j].value;
    	var pid = checkvalue.substring(0,checkvalue.indexOf('_'));
    	var pname = checkvalue.substring(checkvalue.indexOf('_')+1);
    	cstatus = 0;
    	for(var k=0;k<arrprd.length;k++){
    		if(pid == arrprd[k].value){
    			cstatus = 1;
    		}
    	}
    	if(cstatus == 0){
	    	checkhtml = checkhtml + "<div><input type='checkbox' name='prdIds' value='" + pid + "' checked/><span>" + pname + "</span></div>";
	    	sumsel = sumsel+1;
    	}
    }
    if(sumsel > 3){
    	alert("最多只能推荐三个产品！");
		return;
    }
	$("#prd_list").append($(checkhtml));
	fs.prd_list_event();
	$("#pro_recommend").dialog('close');
}

function toOrg(id){
	var params = {requestId:id,orgName:$('#o_orgName').val()};
	$.post("/admin/loan/loanToOrg.act",params,function(data){
		$("#user_list").html(data);
		$("#org_select").dialog({
			width:990,
			height:418,
			modal: true
		});
	});
} 
function toOrgFind(id){
	var params = {requestId:id,orgName:$('#o_orgName').val()};
	$.post("/admin/loan/loanToOrg.act",params,function(data){
		$("#user_list").html(data);
	});
} 
function selectToOrg(){
	var arrChk=$("input[name='userId']:checked");
	var arrprd=$("input[name='userIds']:checked");
	var checkhtml = "";
	
	var cstatus=0;
	var sumsel = arrprd.length;
	for(var j=0;j<arrChk.length;j++){
    	var checkvalue = arrChk[j].value;
    	var uid = checkvalue.substring(0,checkvalue.indexOf('_'));
    	var uname = checkvalue.substring(checkvalue.indexOf('_')+1);
    	cstatus = 0;
    	for(var k=0;k<arrprd.length;k++){
    		if(uid == arrprd[k].value){
    			cstatus = 1;
    		}
    	}
    	if(cstatus == 0){
	    	checkhtml = checkhtml + "<div><input type='checkbox' name='userIds' value='" + uid + "' checked/><span>" + uname + "</span></div>";
	    	sumsel = sumsel+1;
    	}
    }
    if(sumsel > 3){
    	alert("最多只能推荐三个产品！");
		return;
    }
	$("#sel_user_list").append($(checkhtml));
	fs.sel_user_list_event();
	$("#org_select").dialog('close');
}
/*
function details(id){
	$.post("/admin/user/User!details.act",{uid:id,updateStatus:1},function(a){
		$("#pop_info").html(a).dialog({width:500,modal: true});
	});
}*/

function allocation(){
	$("#loan_allocation").dialog({width:680,modal: true});
}
function loanToOrg(){
	$("#loan_to_org").dialog({width:680,modal: true});
}
function validateAllocation(){
	if(confirm("确认保存吗？")){
		$("#allocation_form").submit();
	}
	/*
	var arrChk=$("input[name='prdIds']:checked");
	if(arrChk.length <= 0){
		alert("请选择推荐产品！");
		return ;
	}else{
	}*/
}
function validateToOrg(){
	var arrChk=$("input[name='userIds']:checked");
	if(arrChk.length <= 0){
		alert("请选择转发的金融机构！");
		return ;
	}else{
		if(confirm("确认保存吗？")){
			$("#toOrg_form").submit();
		}
	}
}
function LookRecPro(id, org_id){
	$.post("/admin/loan/loanRecommendPrd!lookRecPro.act",{requestId:id,orgId:org_id},function(data){
			$("#org_allocation").html(data);
			$("#org_allocation").dialog({width:970,modal:true});
	});
}
</script>
  </head>
  
  <body>
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
<!--主体部分开始-->
<div class="hr_10"> &nbsp; </div>
	<div class="container_950 box_4">
		<div class="P_title">融资意向单详情</div>
		<div class="line" style="background:#f9f9f7; height:25px;" >
			<div class="f_text01 fl">
				<span>需求编号：${loan.applyNum }</span>
				<span>状态：<font color="d5652c"><common:print valueId="loan.applyStatus" /></font></span>
			</div>
			<div class="view_detail fr" style="margin-right: 20px;">
		  		<s:if test="loan.applyStatus == 143">
					<input type="button" value="处理"  class="but_gray" onclick="allocation();" ></input>
					<input type="button" value="转发"  class="but_gray" onclick="loanToOrg();" ></input>
				</s:if>
			</div>
		</div>
	</div>

<form action="/admin/loan/loanRequest!updateStatus.act" id="loanForm"  class="box_form" style="margin:0px;" method="post">
<input type="hidden" name="loan.id" value="<s:property value="loan.id"/>"/>
<input type="hidden" name="loan.applyStatus" id="applyStatus" />

	<div class="hr_10"> &nbsp; </div>		
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>意向单详情</h6></div>
      	<div class="f_box">
			<div class="f_sqxx">
	      		<span class="f_gz">需求信息</span>
				<div>
					<table class="special_psfs_tb">
						<tr>
							<td class="a_right">需求金额：</td>
							<td class="a_left"><s:number name="loan.loanAmount" />万元</td>
							<td class="a_right">类别：</td>
							<td class="a_left"><common:print valueId="loan.applyType" /> </td>
						</tr>
						<tr>
							<td class="a_right">用途：</td>
							<td><common:print valueId="loan.loanPurpose"/> </td>
							<td class="a_right">期限：</td>
							<td><s:property value="loan.loanMonth" />个月 </td>
						</tr>
						<tr>
							<td class="a_right">是否有抵押物：</td>
							<td><common:print valueId="loan.haveMortgage" valueSetMap="ZJ102" /></td>
							<td class="a_right">接受金融机构：</td>
							<td><common:print valueId="loan.loanOrganization" valueSetMap="ZJ110"/> </td>
						</tr>
						<tr>
							<td class="a_right">接受利率：</td>
							<td><s:property value="loan.rateLowerLimit" />~<s:property value="loan.rateUpperLimit" />% </td>
							
							<td class="a_right">发布时间：</td>
							<td colspan="3" ><s:date name="loan.createdt" format="yyyy-MM-dd"/> </td>
						</tr>
					</table>
				</div>
				<div class="hr_20"> &nbsp;</div>		      		
	      	</div>
	      	<div class="hr_20"> &nbsp;</div>	      	
	      	<div class="f_sqxx">
	      		<span class="f_gz">发布方联系信息</span>
				<div>
					<table class="special_psfs_tb">
						<tr>
							<td class="a_right">用户名：</td>
							<td class="a_left">${user.username}</td>
							<td class="a_right">姓名：</td>
							<td class="a_left">${user.realname}
							</td>
						</tr>
						<tr>
							<td class="a_right">手机号码：</td>
							<td >${user.mobile}</td>
							<td class="a_right">邮箱：</td>
							<td >${user.email}</td>
						</tr>
					</table>
				</div>      		
	      		<div class="hr_20"> &nbsp;</div>		
	      	</div>	  
	      	<div class="hr_20"> &nbsp;</div>	
			<div class="f_sqxx">
	      		<span class="f_gz">需求方信息</span>
				<div>
					<table class="special_psfs_tb">
						<tr>
							<td class="a_right">企业名称：</td>
							<td class="a_left">${usrCompany.companyname}</td>
							<td class="a_right">企业类型：</td>
							<td class="a_left">${profileMap['companyType'] }
							</td>
						</tr>
						<tr>
							<td class="a_right">所属行业：</td>
							<td >${profileMap['industry'] }</td>
							<td class="a_right">组织机构代码证号码：</td>
							<td >${usrCompany.organizationcode}</td>
						</tr>
						<tr>
							<td class="a_right">企业经营地址：</td>
							<td colspan="3">${profileMap['bizaddress'] } ${usrCompany.bizaddress }</td>
						</tr>
						<tr>
							<td class="a_right">上年度销售额：</td>
							<td >${loan.lastyearVolume}万元</td>
							<td class="a_right">上年度资产负债率：</td>
							<td >${loan.lastyearDebt} %</td>
						</tr>
						<tr>
							<td class="a_right">上年度销售成本：</td>
							<td >${loan.lastyearCost}万元</td>
							<td class="a_right">上年度净利润：</td>
							<td>${loan.lastyearProfit }万元</td>
						</tr>
					</table>
				</div>      		
	      		<div class="hr_20"> &nbsp;</div>		
	      	</div>	      	
	    </div>
</div>
<!-- 意向单状态为已处理且为非转发金融机构 -->
<s:if test="loan.applyStatus == 145 && loan.toOrgStatus == 1">
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>中国资金网处理意见</h6></div>
    <div class="f_box">
	  <span class="f_gz">融资建议：</span>
	  <p>${loan.toOrgMemo }</p>  	
	</div>
    <s:if test="recommendProducts != null && recommendProducts.size() > 0">
    <div class="f_box" style="margin-bottom:10px;">
    	<span class="f_gz">推荐产品：</span>
    </div>
    <table class="container_950">
      <tr class="top_color">
        <td width="13%" style="padding-left:25px; border-top:1px solid #d7d7d7;">产品名称</td>
        <td width="9%" style="border-top:1px solid #d7d7d7;">金额</td>
        <td width="8%" style="border-top:1px solid #d7d7d7;">期限</td>
        <td width="10%" style="border-top:1px solid #d7d7d7;">利率说明(年利率)</td>
        <td width="10%" style="border-top:1px solid #d7d7d7;">产品特点</td>
        <td width="8%" style="border-top:1px solid #d7d7d7;">担保方式</td>
        <td width="6%" style="border-top:1px solid #d7d7d7;">审核时间</td>
        <td width="7%" style="border-top:1px solid #d7d7d7;"></td>
      </tr>
      <s:iterator value="recommendProducts">
	      <tr class="top_color01">
	        <td style="padding-left:25px;">
	        	<s:if test="logo == null || logo == ''">
			        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:if>
		        <s:else>
		        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:else>
		        <div style="padding-left:45px;">        
		        	${orgName }<br/>
		        	<div class="red" style="font-size:15px;font-weight: bolder;" >${financeName }</div>
		        </div>
	        </td>
	        <td><s:number name="financeLittleamount" />~<s:number name="financeBigamount" />万元</td>
	        <td>${financeLittledt }~${financeMostdt }个月</td>
	        <td>
	        	<s:if test="interestType == 155">
	        		<s:iterator value="interests">
	        			<s:if test="loan.loanMonth > financeStartdt && loan.loanMonth <= financeEnddt">
	        				<img src="/images/ico_upward.png"  style="float:left;margin:6px 3px 0 0;"/>${rateDown }%-${rateUp }%
	        			</s:if>
	        		</s:iterator>
	        	</s:if>
	        	<s:else>
	        		视具体情况而定
	        	</s:else>
	        </td>
	        <td><common:print valueId="repaymentType" divide="br"/></td>
	        <td><common:print valueId="proSpecial" divide="br"/></td>
	        <td>${checkTime}个工作日</td>
	        <td><a href="/loan/financeProduct!cusViewFinance.act?product.id=${id}" class="btn_s blue2" target="_blank">查看</a></td>
	      </tr>
      </s:iterator>          
	</table>                                       
    </s:if>
</div>
</s:if>
<s:if test="loan.toOrgStatus == 2">
<div class="hr_10"> &nbsp;</div>
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>金融机构</h6></div>
    <div class="f_box">
	  <span class="f_gz">转发说明：</span>
	  <p>${loan.toOrgMemo }</p>  	
	</div>
    <div class="f_box">
		<table class="f_box_table">
			<s:iterator value="loanAllocationList">
				<tr>
					<td>
						<s:if test="logo == null || logo == ''">
							<img src="/images/banklogo/b/zj198.jpg" class="fl"/>
						</s:if> 
						<s:else>
							<img src="/images/banklogo/b/${logo }"  class="fl"/>
						</s:else>
						<h6 class="bank_title">${orgName }</h6>
					</td>
					<td>
						<s:if test="orgCheckStatus == 1">
							<h6><a href="javascript:LookRecPro('${loan.id }','${orgId }');">点击查看回复详情</a></h6>
						</s:if>
					</td>
				</tr>
			</s:iterator>								
		</table>  	
	</div>
</div>	   
</s:if>   
		</div>
	</div>
</form>
</div>
<div id="pop_info" style="display:none;" title="用户信息"></div>
</div>
<!--弹出框内容推荐产品页面-->
<div id="pro_recommend" style="display:none;" title="推荐融资产品">
	<span style="padding-left:30px;">
		机构名称：<input type="text" name="orgName" id="r_orgName" class="input-text"/>&nbsp;
		产品名称：<input type="text" name="prdName" id="r_prdName" class="input-text"/>
	</span>&nbsp;
	<input type="button" onclick="RecommendFind(${loan.id})" value="查询"/>
	<div class="hr_10"> &nbsp;</div>
	<div id="recommendPrdList"></div>
</div>
<!-- 处理 -->
<div id="loan_allocation" style="display:none;" title="处理">
<form action="/admin/loan/loanRequest!allocation.act" method="post" id="allocation_form">
	<s:hidden name="requestId"></s:hidden>
	已推荐产品：
	<input type="button" value="推荐产品"  class="but_gray" onclick="Recommend(${loan.id },${loan.applyType });" ></input>
	<div class="hr_10"> &nbsp;</div>
	<div id="prd_list" style="padding-left:60px;"></div>
	<div class="hr_10"> &nbsp;</div>
	<div class="hr_10"> &nbsp;</div>
	填写融资建议<br/>
	<textarea name="allocationContent" rows="7" cols="80" class="required {maxlength:500}"></textarea><br/>
	<div class="hr_10"> &nbsp;</div>
	<div class="center" style="width:200px;">
		<input type="button" value="保存" onclick="validateAllocation();" class="but_gray"></input>
	</div>
</form>
</div>

<!--查询金融机构-->
<div id="org_select" style="display:none;" title="推荐融资产品">
	<span style="padding-left:30px;">机构名称：<input type="text" name="orgName" id="o_orgName"/></span>&nbsp;
	<input type="button" onclick="toOrgFind(${loan.id})" value="查询"/>
	<div class="hr_10"> &nbsp;</div>
	<div id="user_list"></div>
</div>
<!-- 转发金融机构 -->
<div id="loan_to_org" style="display:none;" title="处理">
<form action="/admin/loan/loanRequest!toOrg.act" method="post" id="toOrg_form">
	<s:hidden name="requestId"></s:hidden>
	选择转发机构：<input type="button" value="选择"  class="but_gray" onclick="toOrg(${loan.id },${loan.applyType });" ></input>
	<div class="hr_10"> &nbsp;</div>
	<div id="sel_user_list" style="padding-left:60px;"></div>
	<div class="hr_10"> &nbsp;</div>
	<div class="hr_10"> &nbsp;</div>
	填写转发说明<br/>
	<textarea name="allocationContent" rows="7" cols="80" class="required {maxlength:500}"></textarea>
	<div class="hr_10"> &nbsp;</div>
	<div class="hr_10"> &nbsp;</div>
	<div class="center" style="width:200px;">
		<input type="button" value="保存" onclick="validateToOrg();" class="but_gray"></input>
	</div>
</form>
</div>
<!-- 查看金融机构回复 -->
<div id="org_allocation" style="display:none;" title="详情">
</div>
  </body>
</html>
