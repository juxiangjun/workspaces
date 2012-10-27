<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>个人消费贷款快速申请</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css"
	media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css"
	media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js"> </script>
<script type="text/javascript" src="/script/jquery.validate.min.js"> </script>
<script type="text/javascript" src="/script/index.js"> </script>
</head>

<body>
	<!--头部-->
	<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
	  <div class="clear"> &nbsp; </div>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<!--头部结束-->
	<!--主体部分开始-->
	<div class="hr_10"> &nbsp; </div>
	<div class="apply_form" >
	<div class="box_form" >
		<div class="C_title">需求信息</div>
		<div class="C_form" style="margin-top:20px;">
			<table style="width:660px; font-size:13px;">
				<tr>
					<td width="25%" align="right">需求编号：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.applyNum"/> </td>
					<td width="25%" align="right">融资产品类型：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.applyType" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">需求金额：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.loanAmount"/> </td>
					<td width="25%" align="right">贷款期限：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.loanMonth" />月 </td>
				</tr>
				<tr>
					<td width="25%" align="right">贷款用途：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanPurpose"/> </td>
					<td width="25%" align="right">需求方名称：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.busiName" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">是否有抵押物：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.haveMortgage==1">有</s:if><s:else>无</s:else> </td>
					<td width="25%" align="right">接受还款方式：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.repaymentType" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">接受金融机构：</td>
					<td width="25%" style="padding:15px;"><common:print valueId="loan.loanOrganization"/> </td>
					<td width="25%" align="right">接受利率：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.rateLowerLimit" />~<s:property value="loan.rateUpperLimit" />% </td>
				</tr>
				<tr>
					<td width="25%" align="right">发布时间：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.createdt" format="yyyy-MM-dd"/> </td>
					<td width="25%" align="right">有效截止日期：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.effectiveDateend" format="yyyy-MM-dd"/> </td>
				</tr>
				<tr>
					<td width="25%" align="right">状态：</td>
					<td colspan="3"  style="padding:15px;"><common:print valueId="loan.applyStatus" /> </td>
				</tr>
			</table>
		</div>
		<div class="C_title">需求方信息</div>
		<div class="C_form" style="margin-top:20px;">
			<table style="width:660px; font-size:13px;">
				<tr>
					<td width="25%" align="right">姓名：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.busiName" /> </td>
					<td width="25%" align="right">出生年月：</td>
					<td width="25%" style="padding:15px;"><s:date name="loan.birthday" format="yyyy-MM-dd"/> </td>
				</tr>
				<tr>
					<td width="25%" align="right">教育程度：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.teachLevel"/> </td>
					<td width="25%" align="right">现单位性质：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.companyType" />~<s:property value="loan.rateUpperLimit" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">现单位工作时长：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.workTime"/> </td>
					<td width="25%" align="right">税后月收入：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.salaryLevel" /> </td>
				</tr>
				<tr>
					<td width="25%" align="right">发薪形式：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.putSalaryType"/> </td>
					<td width="25%" align="right">自有房产：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.haveHouse==1">有</s:if><s:else>无</s:else> </td> 
				</tr>
				<tr>
					<td width="25%" align="right">银行借款经历：</td>
					<td width="25%" style="padding:15px;"><s:property value="loan.hostoryLoan"/> </td>
					<td width="25%" align="right">使用信用卡经历：</td>
					<td width="25%" style="padding:15px;"><s:if test="loan.userCreditCard==1">有</s:if><s:else>无</s:else> </td>
				</tr>
				<tr>
					<td width="25%" align="right">银行流水：</td>
					<td colspan="3"  style="padding:15px;"><s:property value="loan.bankSalaryList" /> </td>
				</tr>
			</table>
		</div>
	</div>	
	</div>
	<!--主体部分结束-->
	<div class="hr_10">&nbsp;</div>
	<div class="hr_10">&nbsp;</div>
	<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
</body>
</html>
