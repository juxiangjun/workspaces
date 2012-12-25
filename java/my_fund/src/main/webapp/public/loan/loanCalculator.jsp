<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资服务_中国资金网</title>
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/load-loan.js"></script>

<script type="text/javascript" src="/upload/base-rate.js" > </script>
<SCRIPT language=javascript src="/script/loan_calculator/Calendar.js"></SCRIPT>
<SCRIPT language=javascript src="/script/loan_calculator/Calculator.js"></SCRIPT>
<SCRIPT language=javascript src="/script/loan_calculator/Components.js"></SCRIPT>
<SCRIPT language=javascript src="/script/loan_calculator/CheckDataFunction.js"></SCRIPT>
<SCRIPT language=javascript src="/script/loan_calculator/CalcLoan.js"></SCRIPT>
<SCRIPT language=javascript src="/script/loan_calculator/loanCalculator.js"></SCRIPT>
</head>
<SCRIPT language=javascript>
$(function(){
	SetTableColor(Table3);	
});

</SCRIPT>

<body>
<!--头部-->
<div class="header index_header">
	<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<!--tab-->
<div class="container_950">
	<xml id=xmldso async="false">
	  <Root>
	    <Items>
	      <Times />
	      <Year />
	      <RateSum />
	      <Corpus />
	      <CorpusRate />
	      <LeavCorpus />
	    </Items>
	  </Root>
	</xml>
<div class="apply_title" style="height:50px">
	<p>贷款计算器</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form box_4" style="width:948px;">
	<div class="box_form" style="width:100%; ">
		<table class="C_table" align="center">
			<tr>
				<td class="c-left">贷款金额：</td>
				<td><s:textfield id="edLastSum" cssClass="input-text" name="edLastSum"></s:textfield>元</td>
			</tr>
			<tr>
				<td class="c-left">贷款期限：</td>
					<td><s:textfield onblur="AutoShowRate();" id="edTimes" cssClass="input-text" name="edTimes"></s:textfield>月</td>
			</tr>
			<tr>
				<td class="c-left">年利率：</td>
					<td><s:textfield id="edRate" cssClass="input-text" name="edRate"></s:textfield>&nbsp;%</td>
			</tr>
			<tr>
				<td class="c-left">还款方式：</td>
					<td>
						<s:select list="#{1:'等额本息还款法',2:'等额本金还款法',3:'一次性还本付息法'}" id="ddlPayWay" name="ddlPayWay" headerKey="1"></s:select>
				</td>
			</tr>
			<tr>
				<td>偿还频率：</td>
					<td><s:radio list="#{1:'每月',3:'每季',4:'一次性' }" name="rbPayFreq" value="1"></s:radio>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><INPUT id=btnReturnList class="btnsub bred" onclick="javascript:if(CheckData()) {GetPlayList(document);SetTableColor(Table3);}" value=计算 type=button name=btnReturnList></td>
			</tr>
		</table>
	</div>
	<DIV id=divReturnList class=scdiv>
         <TABLE id=Table3 dataSrc=#xmldso border=0 class="container_950 center box_4">
           <THEAD>
	           <tr>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">期次</TH>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">还款时间</TH>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">偿还利息</TH>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">偿还本金</TH>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">偿还本息</TH>
	             <TH class="capital_table_a3" style="border-bottom:3px solid #97181d;">剩余本金</TH>
	           </TR>
           </THEAD>
           <TBODY>
           <TR>
             <TD align="center"><SPAN dataFld=Times></SPAN></TD>
             <TD align="center"><SPAN dataFld=Year></SPAN></TD>
             <TD align="center"><SPAN dataFld=RateSum></SPAN></TD>
             <TD align="center"><SPAN dataFld=Corpus></SPAN></TD>
             <TD align="center"><SPAN dataFld=CorpusRate></SPAN></TD>
             <TD align="center"><SPAN dataFld=LeavCorpus></SPAN></TD>
           </TR>
           </TBODY>
        </TABLE>
     </DIV>
</div>
</div>
<!--主体部分结束-->
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<SCRIPT language=javascript>
if($('#edLastSum').val() != '' && $('#edTimes').val() != '' && $('#edRate').val() != ''){
		if(CheckData()) {
			GetPlayList(document);
			SetTableColor(Table3);
		}
	}
</script>
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
