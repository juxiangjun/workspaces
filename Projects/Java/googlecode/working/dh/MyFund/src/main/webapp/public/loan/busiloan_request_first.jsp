<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/index.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})

$(function(){
	$("#loanForm").validate();
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
<div class="apply_title" >
	<p>企业经营贷款快速申请</p>
	<div class="apply_menu">
        <div class="apply_menu_text01" >1、填写申请信息</div>
        <div class="apply_menu_text02">2、完善需求</div>
        <div class="apply_menu_text03">3、申请成功</div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<s:form action="/loan/LoanRequest!loanSecond.act" id="loanForm"  cssClass="box_form" style="margin:0px;" >
<!-- 企业经营贷款快速申请类型=136 -->
<s:hidden name="loan.applyType" value="136"></s:hidden>
	<div class="apply_form_title">第一步&nbsp;&nbsp;填写申请信息</div>
	<div class="C_title">贷款需求信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span>
	</div>
	<div class="C_form">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>贷款用途：</h6>
                <s:select name="loan.loanPurpose" list="dataMap['loanpurpose']" listKey="id" listValue="name" cssClass="S_width input-text"></s:select>
                <h6>贷款金额：</h6>
                <s:textfield name="loan.loanAmount" cssClass="input-text required number"  id="loan.loanAmount"></s:textfield>&nbsp;&nbsp;万元
                <label for="loan.loanAmount" class="error" generated="true" style="display:none;"></label>
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <s:textfield name="loan.loanMonth" cssClass="input-text required digits"  id="loan.loanMonth"></s:textfield>&nbsp;&nbsp;月
                <label for="loan.loanMonth" class="error" generated="true" style="display:none;"></label>
				</dd>
				<dd>
                <h6>是否有抵押物：</h6>
				  <input id="radio1" type="radio" name="loan.haveMortgage" value="1" class="required" checked/><label for="radio1">能提供</label>
				  <input id="radio2" type="radio" name="loan.haveMortgage" value="0" /><label for="radio2">无法提供</label>
				</dd>
			 </dl>
	</div>
	<div class="C_title">申请企业信息</div>
	<div class="C_form">
		<dl>
			<dd>
				<h6>企业经营类型：</h6>
				<s:select name="loan.busiRunningType"  list="userTypeList" listKey="id" listValue="name" cssClass="S_width input-text"></s:select>
			</dd>
			<dd>
				<h6>上年度销售额：</h6>
				<s:textfield name="loan.lastyearVolume" cssClass="input-text required number"  id="loan.lastyearVolume"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearVolume" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>上年度资产负债率：</h6>
				<s:textfield name="loan.lastyearDebt" cssClass="input-text required number"  id="loan.lastyearDebt"></s:textfield>&nbsp;&nbsp;%
				<label for="loan.lastyearDebt" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>上年度销售成本：</h6>
				<s:textfield name="loan.lastyearCost" cssClass="input-text required number"  id="loan.lastyearCost"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearCost" class="error" generated="true" style="display:none;"></label>
			</dd>
			<dd>
				<h6>上年度净利润：</h6>
				<s:textfield name="loan.lastyearProfit" cssClass="input-text required number"  id="loan.lastyearProfit"></s:textfield>&nbsp;&nbsp;万元
				<label for="loan.lastyearProfit" class="error" generated="true" style="display:none;"></label>
			</dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
		<div class="center" style="width:200px;">
		<s:submit value="下一步"  cssClass="but_gray" style="width:200px;"></s:submit>
		</div>
		<div class="hr_10"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div>
	</div>
</s:form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
