<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>佣金结算查询</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
    $(function() {
        $("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
    });
	function toPage(pageNum, pageSize){
		var url = '/pnr/pnrResource!findFee.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
		$('#userSearch').attr('action',url);
		$('#userSearch').submit();
	}
</script>


</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/partner/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	合作伙伴管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;佣金结算查询
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">佣金结算查询</div>
  <form id="userSearch" action="/pnr/pnrResource!findFee.act" method="post">
	<table style="width:100%;margin:20px;!important display:inline;">
		<tr>
			<td  align="right">放款日期:</td>
			<td  style="padding:5px;width:400px;">
				<s:textfield name="feeSpModel.startDt" id="timeOne" readonly="readonly">
					<s:param name="value"><s:date name="feeSpModel.startDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>~
				<s:textfield name="feeSpModel.endDt" id="timeTwo" readonly="readonly">
					<s:param name="value"><s:date name="feeSpModel.endDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>
				</td>
			<td  align="right">支付状态:</td>
			<td  style="padding:5px;">
				<s:select name="feeSpModel.paymentStatus" list="#{'':'--请选择--','0':'未支付','1':'已支付'}" listKey="key" listValue="value"/>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="查询" class="but_gray" style="width:100px;"/></td>
		</tr>
	</table>
  </div> 
  <div class="hr_10"> &nbsp; </div> 
        <table class="container_950 box_4">
	      <tr class="top_color">
            <td style="padding-left:25px;">融资申请编号</td>
            <td>放款日期</td>
            <td>佣金金额</td>
            <td>支付状态</td>
            <td>支付日期</td>
          </tr>
          	<s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="top_color01">
				<td style="padding-left:25px;">${applyNum}</td>
				<td><s:date name="createDt" format="yyyy-MM-dd"/></td>
				<td>${feeAmount}</td>
				<td>
					<s:if test="paymentStatus == 1">
						已支付
					</s:if>
					<s:else>
						未支付
					</s:else>
				</td>
				<td><s:date name="paymentDate" format="yyyy-MM-dd"/></td>
			</tr>
			</s:iterator>
			</s:if>
        </table>
    <div style="width:960px; margin:0 auto; text-align:right;">
       <s:include value="/public/pagination.jsp"/>
    </div>
    </form>
       <div class="container_950 box_4">
			<s:else>
			<div class="l_out">
					<p>
					抱歉！未查询到相符的结果
					</p>
					</div>
			</s:else>
       </div> 

<!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
