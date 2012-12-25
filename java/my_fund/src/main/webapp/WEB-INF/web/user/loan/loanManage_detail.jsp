<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资意向查看</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript">
/*
//推荐产品
function Recommend(id,appId){
	$("#pro_recommend").dialog({
		width:980,
		height:418,
		modal: true
	});
	$.post("/user/loan/financeProduct!recommendProduct.act",{requestId:id,appId:appId},function(data){
			$("#pro_recommend").html(data);
	});
	return false;
} 
//选择推荐产品后提交
function SelectRecom(){
	var arrChk=$("input[name='checkId']:checked");
	if(arrChk.length>3){
		alert("最多只能推荐3款产品！");
		return false;
	}
	var checkIds = new Array(arrChk.length);
    for(var j=0;j<arrChk.length;j++){
    	checkIds[j] = arrChk[j].value
    }
	$.post("/user/loan/recommendPro!selectRecProdcut.act",{checkId:checkIds.toString(),requestId:$("input[name='requestId']").val()});
	$("#pro_recommend").dialog("close");
}
*/
//个人用户查看金融机构推荐的贷款产品
function LookRecPro(id, org_id){
	$.post("/user/loan/recommendPro!lookRecPro.act",{requestId:id,orgId:org_id},function(data){
			$("#org_allocation").html(data);
			$("#org_allocation").dialog({width:970,modal:true});
	});
}
</script>
<style>
.f_box p{width:720px; margin-left: 50px; margin-top: 10px; font-size: 14px; line-height:25px;}
.f_box_table .bank_title{width:200px; font-weight:bolder; padding-left:5px; padding-right: 100px;}
.f_box_table td{padding:0 5px 20px 5px;}
</style>
</head>

<body>
	<!--头部-->
	<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
	  <div class="clear"> &nbsp; </div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<!--头部结束-->
  <div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="LoanRequest.act">融资意向单管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资意向单查看
  </div>
	<!--主体部分开始-->
	<div class="hr_10"> &nbsp; </div>
	<div class="container_950 box_4">
		<div class="P_title">融资意向单详情</div>
		<div class="line" style="background:#f9f9f7; height:25px;" >
			<div class="f_text01 fl">
				<span>需求编号：${loan.applyNum }</span>
				<span>状态：<font color="d5652c"><common:print valueId="loan.applyStatus" /></font></span>
			</div>
			
		</div>
	</div>
	<div class="hr_10">&nbsp;</div>	

<s:if test="loan.applyStatus == 145 && loan.toOrgStatus == 1">
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>中国资金网处理意见</h6></div>
    <div class="f_box">
	  <span class="f_gz">融资建议：</span>
	  <p>${loan.toOrgMemo }</p>  	
	</div>
    <s:if test="recommendPrdList != null && recommendPrdList.size() > 0">
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
      <s:iterator value="recommendPrdList">
	      <tr class="top_color01">
	        <td style="padding-left:25px;">
	        	<s:if test="logo == null || logo == ''">
			        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:if>
		        <s:else>
		        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap; padding-top:2px;"/>
		        </s:else>
		        <div style="padding-left:45px;">        
		        	<s:if test="orgName.indexOf(' ') >= 0">
						<s:property value="orgName.substring(0,orgName.indexOf(' '))"></s:property>
					</s:if>
					<s:else>
						${orgName }
					</s:else><br/>
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
<s:if test="loan.applyStatus == 145 && loan.toOrgStatus == 2">
<div class="hr_10"> &nbsp;</div>
<div class="container_950 box_6">
    <div class="menu_blue white"><h6>金融机构处理回复</h6></div>
    <div class="f_box">
		<table class="f_box_table">
			<s:iterator value="loanAllocationList">
				<s:if test="orgCheckStatus == 1">
				<tr>
					<td>
						<s:if test="logo == null || logo == ''">
							<img src="/images/banklogo/b/zj198.jpg" class="fl"/>
						</s:if> 
						<s:else>
							<img src="/images/banklogo/b/${logo }"  class="fl"/>
						</s:else>
						&nbsp;&nbsp;&nbsp;&nbsp;${orgName }
					</td>
					<td><h6><a href="javascript:LookRecPro('${loan.id }','${orgId }');">点击查看回复详情</a></h6></td>
				</tr>
				</s:if>
			</s:iterator>								
		</table>  	
	</div>
</div>	   
</s:if>   	
<div class="hr_10">&nbsp;</div>	
	<div class="container_950 box_6">
	    <div class="menu_blue white"><h6>意向单详情</h6></div>
	      	<div class="f_box">
				<div class="f_sqxx">
		      		<span class="f_gz">需求信息</span>
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
					<div class="hr_20"> &nbsp;</div>			      			
		      	</div>
				<div class="hr_20"> &nbsp;</div>		
				<div class="f_sqxx">
		      		<span class="f_gz">需求方信息</span>
						<table class="special_psfs_tb">
							<tr>
								<td class="a_right">姓名：</td>
								<td class="a_left">${usrPerson.realName }</td>
								<!-- 
								<td class="a_right">出生年月：</td>
								<td class="a_left"><s:date name="usrPerson.birthday" /> </td>
								 -->
								<td class="a_right">教育程度：</td>
								<td ><common:print valueId="usrPerson.education" /> </td>
							</tr>
							<tr>
								<td class="a_right">身份证号码：</td>
								<td >${usrPerson.cid }</td>
								<td class="a_right">所在地：</td>
								<td >${profileMap['address'] }</td>
							</tr>
							<tr>
								<td class="a_right">职业：</td>
								<td ><common:print valueId="usrPerson.careerid" /> </td>
								<td class="a_right">行业：</td>
								<td class="a_left">${profileMap['parentIndustry'] }&nbsp;&nbsp;${profileMap['industry'] }</td>
							</tr>
							<tr>
								<td class="a_right">行业经验：</td>
								<td class="a_left">${loan.experience }年 </td>
								<td class="a_right">年营业额：</td>
								<td ><common:print valueId="loan.allyearVolume"/> </td>
							</tr>
							<tr>
								<td class="a_right">经营场所：</td>
								<td ><s:if test="loan.runningArea==1">有</s:if><s:else>无</s:else> </td>
								<td class="a_right">银行借款经历：</td>
								<td ><s:if test="loan.hostoryLoan==1">有</s:if><s:else>无</s:else></td>
							</tr>
							<tr>
								<td class="a_right">使用信用卡经历：</td>
								<td ><s:if test="loan.userCreditCard==1">有</s:if><s:else>无</s:else> </td>
								<td class="a_right">银行流水：</td>
								<td colspan="3"><s:if test="loan.bankSalaryList==1">有</s:if><s:else>无</s:else> </td>
							</tr>
						</table>
					<div class="hr_20"> &nbsp;</div>						      			      	
					</div>		      			
		    </div>			    	    
	</div>
<div class="hr_10"> &nbsp;</div>
<!-- 意向单状态为已处理且为非转发金融机构 -->

<!-- 查看金融机构回复 -->
<div id="org_allocation" style="display:none;" title="详情">
</div>

<div class="hr_10">&nbsp;</div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
