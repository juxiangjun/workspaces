<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript">
function toPage(pageNum, pageSize){
	var url = "/user/loan/userApplyManag.act?pager.currentPage=" + pageNum + "&pager.pageCount=" + pageSize;
	$('#financeManage').attr('action',url);
	$('#financeManage').submit();
}
</script>
</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--开始-->
  <div class="M_menu">
  	融资管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;融资申请管理
  </div>
  <div class="hr_10"> &nbsp; </div>
<div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">融资申请管理</div>
  <form id="financeManage" action="/user/loan/userApplyManag.act" method="post">
       <table class="container_950 center">
	      <tr class="top_color">
            <td style="padding-left:25px;">申请编号</td>
            <td>申请时间</td>
            <td>融资渠道/项目</td>
            <td>产品类型</td>
            <td>融资额度</td>
            <td>期限</td>
            <td>协议编号</td>
            <td>状态</td>
            <td>操作</td>

          </tr>
          	<s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="top_color01">
				<td style="padding-left:25px;">${item.applyNum}</td>
	   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td>
				<td width="130px;">
				<common:print valueId="productUserId" type="user"/>/${productName }</td>
	   			<td><common:print valueId="#item.applyType"/></td>
				<td><s:number name="loanAmount" />万元</td>
	   			<td>${item.loanMonth}个月</td>
	   			<td>${agreeNum }</td>
	   			<td><common:print valueId="#item.applyStatus"/></td>
	   			<td class="view_detail01">
	   				<a href="/user/loan/userApplyManag!viewFinanceApply.act?apply.id=${item.id }">查看</a>
	   			</td>
			</tr>
			</s:iterator>
			 <tr class="top_color">
		        <td style="padding-left:22px; font-size:14px; " colspan="9">
		        <div class="pagination right">
				<s:include value="/public/pagination.jsp"/>
				</div>
				</td>
		   </tr>
			</s:if>
        </table>
    </form>
       <div>
			<s:else>
			<div class="l_out">
					<h1 class="l_title">您还未提交过融资申请</h1>
					<p>
					<s:if test="groupType==5">
					您可以去<a href="/loan/financeProduct.act?financeType=152&financeDate=12">融资服务频道</a>搜索适合您的融资产品<br/>
					您也可以<a href="/loan/LoanRequest.act?loan.applyType=138">点此提交融资意向</a><br/>
					</s:if>
					<s:elseif test="groupType==1">
					您可以去<a href="/loan/financeProduct.act?financeType=151&financeDate=12">融资服务频道</a>搜索适合您的融资产品<br/>
					您也可以<a href="/loan/LoanRequest.act?loan.applyType=136">点此提交融资意向</a><br/>
					</s:elseif>
					</p>
					</div>
			</s:else>
       </div>
</div>
  <!--结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
