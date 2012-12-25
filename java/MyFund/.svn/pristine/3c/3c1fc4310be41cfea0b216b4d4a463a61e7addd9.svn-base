<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务产品页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script language="javascript" >
	function toPage(pageNo, pageCount) {
		document.getElementById("pageNo").value = pageNo;
		form = document.getElementById("frmQueryBankProduct");
		form.submit();
	}
	
</script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;银行理财产品
  </div>
  <div class="hr_10"> &nbsp; </div> 
	<!--main1-->
	<div class="container_950" >
	<div class="box_4" style="padding:20px 20px 0px 20px;">
	  <form id="frmQueryBankProduct" action="/finance/bankProduct!search.act" method="post"  >
  		<input type="hidden" id="pageNo" name="pageNo" /> 	
			<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			  <tr>
			    <td width="80" height="28" style="padding-bottom:15px;">产品状态：</td>
			    <td >&nbsp;<s:select id="q0" name="query" list="productStatus" label="name" listValue="name" listKey="id" value="query[0]" style="width:140px;"></s:select></td>
			    <td width="80" align="right">发行银行：</td>
			    <td >&nbsp;<s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name" value="query[1]" style="width:140px;"/></td>
			    <td width="80" align="right">产品期限：</td>
			    <td >&nbsp;<s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id" value="query[2]" style="width:140px;"></s:select></td>
			    <td height="28" align="right" ><input type="submit" value="查询" style="width:90px;" class="btnsub bred" /></td>
			  </tr>
			  <tr>
			    <td height="28" style="padding-bottom:15px;">年化收益率：</td>
			    <td >&nbsp;<s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id" value="query[3]" style="width:140px;"></s:select></td>
			    <td width="80" align="right">起购金额：</td>
			    <td >&nbsp;<s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id" value="query[4]"  style="width:140px;"></s:select></td>
			    <td width="80" align="right">产品名称：</td>
			    <td >&nbsp;<input id="q5" type="text" name="query" value="${query[5]}" class="input-text1" style="width:134px;" onclick="this.value=''"/></td>
			    <td ></td>
			  </tr>
			</table>
	   </form>		
		<div class="clear">&nbsp;</div>
	</div>
	</div>
	<!--main1-->

  <div class="hr_10"> &nbsp;</div>
	<div class="M_box">
		<!--银行理财列表开始-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		      <tr class="top_color">
		        <td style="padding-left:15px;">产品名称</td>
		        <td >发行银行</td>
		        <td >起销日期</td>
		        <td >投资期限</td>
		        <td >起点金额</td>
		        <td >预期年化收益率</td>
		        <td ></td>
		      </tr>
				<s:if test="pager.data.size()<0">
				  <tr class="capital_table" >
			        <td class="capital_table_0">抱歉！未查询到相符的结果</td>
			      </tr>
				</s:if>	
				<s:iterator id="item" value="pager.data">		      
		      <tr class="top_color01" >
		        <td style="padding-left:15px;"><a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.id}" style="color: #003961;"> ${item.name} </a></td>
		        <td >${item.bank}</td>
		        <td ><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
		        <td >${item.manageperiod}</td>
		        <td >${item.minamount}</td>
		        <td class="red">${item.benefitrate}%</td>
		        <td class="view_detail" style="padding-right:10px;"><a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.id}" >查看</a></td>
		      </tr>
		      </s:iterator>
		      <tr >
			        <td style="padding-left:20px; font-size:14px;" colspan="9">
			        <div class="pagination right">
					<s:include value="/public/pagination.jsp"/>
					</div>
					</td>
			   </tr>
		      	      
		</table>
		<!--银行理财项目列表结束-->		
	</div>   
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
	<div class="clear"> &nbsp; </div>
	<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
