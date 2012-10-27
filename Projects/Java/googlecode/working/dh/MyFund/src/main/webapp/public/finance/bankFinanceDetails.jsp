<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bank_finance_details.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
 		  <table width="100%" border="1" cellpadding="0" cellspacing="0" class="showTable03">
		      <tr>
		        <td>产品名称</td>
		        <td colspan="3">${prdBankfinance.name}</td>
	          </tr>
		      <tr>
		        <td>发行银行</td>
		        <td>${prdBankfinance.bank}</td>
		        <td>币种</td>
		        <td>${prdBankfinance.currency}</td>
	          </tr>
		      <tr>
		        <td class="td1">委托管理期</td>
		        <td>${prdBankfinance.manageperiod}</td>
		        <td class="td3">收益起计日</td>
		        <td>${prdBankfinance.benefitstart}</td>
	          </tr>
		      <tr>
		        <td class="td1">销售起始日期</td>
		        <td id='sell_s'>${prdBankfinance.sellstart}</td>
		        <td class="td3">销售终止日期</td>
		        <td id='sell_e'>${prdBankfinance.sellend}</td>
	          </tr>
		      <tr>
		        <td class="td1">付息周期</td>
		        <td>${prdBankfinance.benefitperiod}</td>
		        <td class="td3">预期最高年化收益率（%）</td>
		        <td>${prdBankfinance.benefitrate}</td>
	          </tr>
		      <tr>
		        <td class="td1">产品类型</td>
		        <td>${prdBankfinance.type}</td>
		        <td class="td3">委托起始金额</td>
		        <td>${prdBankfinance.minamount}</td>
	          </tr>
		      <tr>
		        <td class="td1">收益类型</td>
		        <td>${prdBankfinance.benefittype}</td>
		        <td class="td3">发售地区</td>
		        <td>${prdBankfinance.sellarea}</td>
	          </tr>
		      <tr>
		        <td class="td1">递增单位（单位：元）</td>
		        <td>${prdBankfinance.addunit}</td>
		        <td class="td3">产品管理费</td>
		        <td>${prdBankfinance.managefee}</td>
	          </tr>
		      <tr>
		        <td class="td1">是否保本</td>
		        <td>${prdBankfinance.guarantee}</td>
		        <td class="td3">在售状态</td>
		        <td id="sell_c">${prdBankfinance.sellstatus}</td>
	          </tr>
		      <tr>
		        <td class="td1">提前终止条件</td>
		        <td colspan="3">${prdBankfinance.endcondition}</td>
	          </tr>
		      <tr>
		        <td class="td1">产品说明</td>
		        <td colspan="3">${prdBankfinance.description}</td>
	          </tr>
              <tr>
		        <td class="td1">收益率说明</td>
		        <td colspan="3">${prdBankfinance.benefitratedesc}</td>
	          </tr>
        </table>

    	
  </body>
</html>
