<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="container_950 box_4">
	<div class="P_title">订单详情</div>
	<div class="line" style="background:#f9f9f7; height:25px;" >
		<div class="f_text01 fl">
			<span>订单编号：${ordMembership.ordNum}</span>
			<span>状态：<font color="d5652c"><s:if test="ordMembership.payStatus==0">未付款</s:if><s:else>已付款</s:else></font></span>
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
		</div>
	</div>			
	</div>	
</div>
<script type="text/javascript">
<s:if test="ordMembership.invoiceType ==2" >
	$("#invoice_1").hide();   
	$("#invoice_2").hide(); 
</s:if>
</script>