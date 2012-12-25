<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资信通_付款_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	<s:if test="ordMembership.invoiceType ==2" >
		$("#invoice_1").hide();   
		$("#invoice_2").hide(); 
	</s:if>
});
function ordCancel(id){
	if(window.confirm("是否确定取消该订单")){
		window.location.href="/user/payment!deleteOrd.act?ordId="+id;
	}
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
<div class="M_menu">
	账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<a href="/user/member/payment!orderList.act">付款管理</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;订单详情
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950 box_4">
	<div class="P_title">订单详情</div>
	<div class="line" style="background:#f9f9f7; height:25px;" >
		<div class="f_text01 fl">
			<span>订单编号：${ordMembership.ordNum}</span>
			<span>状态：<font color="d5652c"><s:if test="ordMembership.payStatus==0">未付款</s:if><s:else>已付款</s:else></font></span>
		</div>
		<div class="view_detail fr" style="margin-right: 20px;">
			<s:if test="ordMembership.payStatus==0">
				<input type="button" value="<s:if test="ordMembership.payWay == 1">查看电汇信息</s:if><s:else>付款</s:else>" onclick="javascript:window.location.href='/user/member/payment!payment.act?ordId=${ordMembership.id}'" class="but_gray"/>&nbsp;&nbsp;
				<!-- <input type="button" value="修改订单" onclick="javascript:window.location.href='/user/member/payment!orderEdit.act?ordId=${ordMembership.id}'" class="but_gray"/>&nbsp;&nbsp; -->
				<input type="button" value="取消订单" onclick="javascript:ordCancel(${ordMembership.id})" class="but_gray"/>
			</s:if><s:else>
				订单已付款成功
			</s:else>
		</div>
	</div>
</div>		 
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="box_6">
	<div class="f_box">	
		<div class="f_sqxx">
			<span class="f_gz">付款信息</span>		
			<table class="special_psfs_tb">
				<tr>
					<td class="a_right">服务名称：</td>
					<td><s:if test="ordMembership.memberType == 1">资信通认证会员服务费</s:if>
						<s:elseif test="ordMembership.memberType == 2">资信通vip会员服务费</s:elseif></td>
				</tr>
				<tr>
					<td class="a_right">购买时长：</td>
					<td>1年</td>
				</tr>			
				<tr>
					<td class="a_right">付款金额：</td>
					<td><span class="red" style="padding-right:40px;">${ordMembership.payAmount } 元</span><span>1年会员费</span></td>
				</tr>
				<tr>
					<td class="a_right">付款方式：</td>
					<td>
						<s:if test="ordMembership.payWay == 1">
							银行电汇
						</s:if><s:elseif test="ordMembership.payWay == 2">
							在线支付
						</s:elseif>
					</td>
				</tr>
				<tr>
					<td class="a_right">下单时间：</td>
					<td>${ordMembership.createTime}</td>
				</tr>						
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>
		<div class="hr_20"> &nbsp;</div> 
		<div class="f_sqxx">
			<span class="f_gz">发票信息</span>			 			
			<table class="special_psfs_tb">
				<tr>
					<td class="a_right">发票类型：</td>
					<td><s:if test="ordMembership.invoiceType == 1">普通发票</s:if><s:else>不要发票</s:else></td>
				</tr>
			</table>
			<div id="invoice_1">
				<table class="special_psfs_tb">
					<tr>
						<td class="a_right">发票抬头：</td>
						<td>${ordMembership.invoiceTitle }</td>
					</tr>
					<tr>
						<td class="a_right">发票内容：</td>
						<td><s:if test="ordMembership.invoiceContent == 1">服务</s:if><s:elseif test="ordMembership.invoiceContent == 2">咨询</s:elseif></td>
					</tr>
					<tr>
						<td class="a_right">寄送方式：</td>
						<td><s:if test="ordMembership.invoiceSendway == 1">快递 中国资金网通过快递寄送给您</s:if><s:elseif test="ordMembership.invoiceSendway == 2">自取 您前往指定地点领取发票</s:elseif></td>
					</tr>
				</table>
			</div>
			<div class="hr_20"> &nbsp;</div>     			
		 </div>	
		 <div id="invoice_2">		
			<div class="hr_20"> &nbsp;</div>			
			<div>
				<s:if test="ordMembership.invoiceSendway == 1">
				<span class="f_gz">收件地址</span>	
					<table class="special_psfs_tb">
						<tr>
							<td class="a_right">收件地址：</td>
							<td>${profileMap['address'] } ${ordMembership.address }</td>
						</tr>
						<tr>
							<td class="a_right">收件人：</td>
							<td>${ordMembership.invoiceReceiver}</td>
						</tr>
						<tr>
							<td class="a_right">联系电话：</td>
							<td>${ordMembership.telphone }</td>
						</tr>
					</table>			
				</s:if><s:elseif test="ordMembership.invoiceSendway == 2">
				<span class="f_gz">自提地址</span>	
					<table class="special_psfs_tb">
							<tr>
								<td class="a_right"></td>
								<td>上海市浦东新区张杨路707号生命人寿大厦5楼 501室</td>
							</tr>
							<tr>
								<td class="a_right"></td>
								<td>中国资金网上海总部</td>
							</tr>
							<tr>
								<td class="a_right"></td>
								<td>联系电话：400-8890-198</td>
							</tr>
							<tr>
								<td class="a_right"></td>
								<td>
									<a target="_bank" href="http://ditu.google.cn/maps/place?q=%E4%B8%8A%E6%B5%B7%E5%B8%82%E7%94%9F%E5%91%BD%E4%BA%BA%E5%AF%BF%E5%A4%A7%E5%8E%A6&hl=zh-CN&ie=UTF8&cid=14739133017521868503" class="red">
									查看交通路线</a>
								</td>
							</tr>
						</table>			
					&nbsp;&nbsp; 
				</s:elseif>			
				<div class="hr_20"> &nbsp;</div>			      			
			</div>	
			</div>				
			<div class="hr_10"> &nbsp;</div>			
		<div>		
			<div class="hr_20"> &nbsp;</div>		
			<div class="center" align="center">
				<input type="button" value="返回" onclick="javascript: window.location.href='/user/payment!orderList.act'" class="but_gray" style="width:100px;"/>
			</div>						      			      	
		</div>
	</div>			
	</div>	

</div>    
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>