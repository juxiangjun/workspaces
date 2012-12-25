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
<script type="text/javascript" src="/script/profile.js" > </script>
<link href="/css/jquery-validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	$("#frmRequestInfo").validate();
	$("#city").val('${ordMembership.cityid}');
	$("#district").val('${ordMembership.districtid}');
	<s:if test="ordMembership.invoiceType ==2" >
		$("#invoice_1").hide();   
		$("#invoice_2").hide(); 
	</s:if>
	<s:if test="ordMembership.invoiceSendway == null || ordMembership.invoiceSendway == 1">
		$("#sendWay_2").hide(); 
	</s:if>
});
function switchoverDetails(showDiv,num) {
	var i;  
	for(i=1;i<=2;i++)  {  
		if(i==num) {     
			if(showDiv == 'invoice')
				if(num==1){
					$("#"+showDiv+"_"+1).show();   
					$("#"+showDiv+"_"+2).show(); 
				}else{
					$("#"+showDiv+"_"+1).hide();   
					$("#"+showDiv+"_"+2).hide(); 
				}
			else
				$("#"+showDiv+"_"+i).show();   
		}else{ 
			if(showDiv != 'invoice')
				$("#"+showDiv+"_"+i).hide();
		}
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
	<a href="/user/payment.act">资信通详情</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<s:if test="ordMembership.memberType == 1">资信通认证会员</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员</s:elseif>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="P_title box_4" style="border-bottom:5px solid #003961;">申请<s:if test="ordMembership.memberType == 1">资信通认证会员</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员</s:elseif></div>
<!--发布新资金信息-->
	<div class="box_3">
	<form id="frmRequestInfo" action="/user/member/payment!saveOrder.act" method="post">
		<input type="hidden" name="ordId" value="${ordMembership.id}"/>
		<input type="hidden" name="ordMembership.memberType" value="${ordMembership.memberType }"/>
		<input type="hidden" name="ordMembership.ordNum" value="${ordMembership.ordNum}"/>
		<input type="hidden" name="ordMembership.payStatus" value="${ordMembership.payStatus}"/>
		<input type="hidden" name="ordMembership.iscancelled" value="${ordMembership.iscancelled}"/>
	<div class="f_box">	
		<div class="f_sqxx">
		<s:if test="msg != null">
			<div class="notification attention png_bg" style="width:100%;">
				<div>${msg }</div>
			</div>	
		</s:if>						
		<span class="f_gz">确认付款信息</span>
		<table class="special_psfs_tb">
			<tr>
				<td class="a_right">服务名称：</td>
				<td ><input type="hidden" name="ordMembership.id" value="${ordMembership.id }"/><s:if test="ordMembership.memberType == 1">资信通认证会员服务费</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员服务费</s:elseif></td>
			</tr>
			<tr>
				<td class="a_right">收款方：</td>
				<td>中国资金网</td>
			</tr>
			<tr>
				<td class="a_right">付款金额：</td>
				<td ><span class="red" style="padding-right:40px;">
				<s:if test="ordMembership.payAmount !=null">
		       	 <s:text name="format.float"><s:param value="ordMembership.payAmount"></s:param></s:text>&nbsp;
		       </s:if>元
				</span><span><input type="radio" name="a" value="1" checked="checked"/>1年会员费&nbsp;&nbsp; <!-- <input type="radio" name="b" value="2" />2年会员费&nbsp;&nbsp; <input type="radio" name="c" value="3" />3年会员费 --></span></td>
			</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>
		<div class="hr_20"> &nbsp;</div> 
		<div class="f_sqxx">
		<span class="f_gz">确认发票信息</span>			 			
			<table class="special_psfs_tb">
			<tr>
				<td class="a_right">发票类型：</td>
				<td>
					<input type="radio" name="ordMembership.invoiceType" value="1" onclick="switchoverDetails('invoice',1);" <s:if test="ordMembership.invoiceType ==null || ordMembership.invoiceType ==1" >checked="checked"</s:if> />普通发票
					<input type="radio" name="ordMembership.invoiceType" <s:if test="ordMembership.invoiceType ==2" >checked="checked"</s:if> value="2" onclick="switchoverDetails('invoice',2);"/>不要发票
				</td>
			</tr>
			</table>
			<div id="invoice_1">
				<table class="special_psfs_tb">
				<tr>
					<td class="a_right">发票抬头：</td>
					<td ><input type="text" name="ordMembership.invoiceTitle" value="${ ordMembership.invoiceTitle}" class="required" maxlength="50" style="width:200px;"/></td>
				</tr>
				<tr>
					<td class="a_right">发票内容：</td>
					<td><input type="radio" name="ordMembership.invoiceContent" value="1" <s:if test="ordMembership.invoiceContent == null || ordMembership.invoiceContent == 1">checked="checked"</s:if>/>服务
					<input type="radio" name="ordMembership.invoiceContent" <s:if test="ordMembership.invoiceContent == 2">checked="checked"</s:if> value="2"/>咨询
					</td>
				</tr>
				<tr>
					<td class="a_right">寄送方式：</td>
					<td><input type="radio" name="ordMembership.invoiceSendway" value="1" onclick="switchoverDetails('sendWay',1);" <s:if test="ordMembership.invoiceSendway == null || ordMembership.invoiceSendway == 1">checked="checked"</s:if>/>快递 中国资金网通过快递寄送给您</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="ordMembership.invoiceSendway" <s:if test="ordMembership.invoiceSendway == 2">checked="checked"</s:if>value="2" onclick="switchoverDetails('sendWay',2);"/>自取 您前往指定地点领取发票
					</td>
				</tr>
				</table>
			</div>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>		
		 	<div id="invoice_2">
			<div id="sendWay_1">
			<div class="hr_20"> &nbsp;</div>			
			<div class="f_sqxx">
			<span class="f_gz">确认收件地址</span>				
			<table class="special_psfs_tb">
				<tr>
					<td class="a_right">收件地址：</td>
					<td><input type="radio" name="sendway" onclick="switchoverDetails('newAddress',2);" value="1" checked="checked"/>收件地址</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td style="padding-left:20px;">
						收件人：${ordMembership.invoiceReceiver } 联系电话: ${ordMembership.telphone }<br/>
						收件地址：${profileMap['address'] } ${ordMembership.address } 
						<!-- 邮政编码：${ordMembership.postcode } -->
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="radio" name="sendway" value="2" onclick="switchoverDetails('newAddress',1);"/>新建收件地址</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td  style="padding-left:20px;">
						<div id="newAddress_1" style="display:none;">
						<table >
						<tr>							
							<td>收件人：&nbsp;&nbsp;<input type="text" name="ordMembership.invoiceReceiver" class="required" value="${ordMembership.invoiceReceiver }"/>
							</td>
						</tr>
						<tr>							
							<td>地址&nbsp;&nbsp;<s:select id="province" name="ordMembership.provinceid" cssClass="tb_sele required" list="listProvince" listKey="id" listValue="name" onchange="changeProvince('province','city','district');" />省/直辖市&nbsp;
					            <select id="city" name="ordMembership.cityid" onchange="changeCity('city','district');" class="tb_sele required">
					          	 <s:iterator value="cityMap['city']">
									<option value="${id}">${name}</option>
								 </s:iterator>
					          	</select>市&nbsp;
					            <select id="district" name="ordMembership.districtid" class="tb_sele required">
					          	 <s:iterator value="districtMap['district']">
									<option value="${id}">${name}</option>
								 </s:iterator>
					          	</select>区/县&nbsp;
							</td>
						</tr>
						<tr>
							<td>详细地址：&nbsp;&nbsp;<input type="text" size="100px;" name="ordMembership.address" value="${ordMembership.address }" style="width:345px;" class="required"/>
							</td>
						</tr>
						<!--<tr>
							<td>邮编&nbsp;&nbsp;<input type="text" name="ordMembership.postcode" value="${ordMembership.postcode }"/>
							</td>
						</tr> -->
						<tr>
							<td>联系电话：&nbsp;&nbsp;<input type="text" name="ordMembership.telphone" value="${ ordMembership.telphone}" class="required"/>
							</td>
						</tr>
						</table>
						</div>								
					</td>
				</tr>
			</table>
			<div class="hr_20"> &nbsp;</div>			      			
		 </div>					
			</div>
			<div id="sendWay_2">
				<div class="hr_20"> &nbsp;</div>				
				<div class="f_sqxx">
					<span class="f_gz">发票领取地址</span>				
					<table class="special_psfs_tb">
					<tr>
						<td  class="a_right">&nbsp;</td>
						<td>上海市浦东新区张杨路707号生命人寿大厦5楼&nbsp;&nbsp;中国资金网上海总部<br/><a target="_bank" href="http://ditu.google.cn/maps/place?q=%E4%B8%8A%E6%B5%B7%E5%B8%82%E7%94%9F%E5%91%BD%E4%BA%BA%E5%AF%BF%E5%A4%A7%E5%8E%A6&hl=zh-CN&ie=UTF8&cid=14739133017521868503" class="red">
						查看交通路线</a>
						</td>
					</tr>
					</table>
					<div class="hr_20"> &nbsp;</div>	
				</div>
			</div>
			</div>
			<div class="hr_20"> &nbsp;</div>			
			<div >
			<span class="f_gz">选择支付方式</span>			
			<table class="special_psfs_tb">
				<tr>
					<td  class="a_right"><input type="radio" onclick="radionPay(this);" name="ordMembership.payWay" <s:if test="ordMembership.payWay == 1">value="${ordMembership.payWay}" checked="checked"</s:if><s:else>value="1" checked="checked"</s:else>/>银行电汇：</td>
					<td>（收款人）上海银众文化传播有限公司<br/>（开户行）中国农业银行股份有限公司上海市虹口区曲阳支行<br/>（账号）03-311500040020241</td>
				</tr>
				<tr>
					<td  class="a_right"><input type="radio" name="ordMembership.payWay" <s:if test="ordMembership.payWay == 2">value="${ordMembership.payWay}" checked="checked"</s:if><s:else>value="2"</s:else> onclick="payW(this);" disabled="disabled"/>在线支付：</td>
					<td>银联在线支付支持大部分银行。</td>
				</tr> 
				<tr>
					<td>&nbsp;</td>
					<td >
						<div id="payw">
						<table >
						<tr >
							<td ><span class="fl" style="border : #d6d6d6 solid 1px;height:40px;padding:5px;width:190px;"><img src="/images/unionpay.png"/></span></td>
						</tr>
						</table>
						</div>
					</td>
				</tr>
			</table>
		<div class="hr_20"> &nbsp;</div>		
		<div class="center" style="width:200px;"><input type="submit" value="确认提交" class="but_gray" style="width:200px;"/></div>
		<div class="hr_10"> &nbsp;</div>						      			      	
	</div>
	</div>			
	</form>
	</div>	

</div>    
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>