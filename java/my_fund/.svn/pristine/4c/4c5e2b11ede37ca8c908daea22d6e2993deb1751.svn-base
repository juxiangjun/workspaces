<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>资信通vip宣传页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script language="javascript">
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
    //} 
});
function send(id){
	var url = "/user/payment!orderEdit.act?memberType="+id;
	var user_status = "${session._user.auditstatus}";
	if (user_status != "2") {
		alert("您的注册资料尚未通过审核，暂不能申请会员!");
	} else {
		window.location.href = url;
	}
}
function valid(){
	if('${ordMembership}' != 'null'){
		if(window.confirm("是否需要保存更多信息")){
			$("#comForm").submit();
		}else{
			window.location.href="/user/Profile!edit.act?companyMark=1";
		}
	}
}
</script>

<style>
.zxt_m_rz{width:468px; height:200px; background: #f9f9f7; border-bottom:5px solid #97181d;}
.zxt_m_rz .rz_img{width:125px; height:80px; float: left; margin:25px 25px 0 25px;}
.zxt_m_rz .rz_connect{width:250px; float: left; margin-top:25px; line-height:30px;}
.zxt_left{width:410px; margin: 0 auto; margin-top: 20px; height:160px;}
.zxt_left .zxt_left_img{width:60px; height:60px; float: left;}
.zxt_left .zxt_left_rt{width:330px; float: right;}
</style>

</head>
<body>
<!--头部-->
<!--头部-->
<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<!--资信通vip宣传页-->
<div class="container_950">
	<div><img src="/images/zxt_banner.jpg" alt="资信通vip宣传页" /></div>
	<div class="hr_10"> &nbsp; </div>
	<!--左边部分 -->
	<div class="box_4 fl" style="width:468px;height:1340px;">
		<div class="zxt_m_rz">
			<div class="rz_img"><img src="/images/rz_member.jpg" alt="资信通认证会员" /></div>
			<div class="rz_connect">
				<h1>资信通认证会员</h1>
				<h6>年费：365元人民币</h6>
				<h6>多重特权，融资全程无忧!</h6>
				<div class="center">
				  <input type="button" onclick="send(1);" class="but_gray" value="申请资信通认证会员" />
				</div>
				<span>您也可以拨打客服热线400-8890-189进行申请</span>								
			</div>
		</div>	
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon01.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>身份认证，诚信保障</h6>
				<p>资信通认证会员将获得特殊的身份标识，诚信指数将大幅提升，同等条件下信息将得到优先推荐，可以受到更多金融机构的关注。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon03.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>融资顾问，全程协助</h6>
				<p>中国资金网将指定专业金融服务人员为资信通会员提供一对一的服务，全程协助融资业务的进行，帮助客户完成融资产品选择、融资申请、融资审批状态实时追踪等业务。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon05.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>全面评估，专业建议</h6>
				<p>在整个申请融资过程中间，中国资金网的金融服务专员将会全程跟踪服务，在贷前为用户进行全面评估，根据用户的实际情况，提出专业的方案或建议。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon06.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专业评估，精准掌控</h6>
				<p>资信通认证会员可使用资信评估、财务分析、融资预测等专业分析工具，让您随时对自己的财务状况进行科学分析，精准把握，做到知己知彼，百贷百胜！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon07.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>一盾在手，安全无忧</h6>
				<p>资信通认证会员能以优惠的价格购买资金网专属的资金盾，通过简单绑定，便能全方位保护您的帐户安全，通过数字签名方式即可在线传递文件，既安全又便捷，免去您线下传递文件的种种繁琐操作，鼠标一点，轻松实现。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon09.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>优惠服务，省钱省心</h6>
				<p>资信通认证会员在申请中国资金网上的第三方金融服务时，可享受各种折扣和优惠，让您在融资及其他商务拓展的过程中，既省钱，又省心。 </p>
			</div>
		</div>			
		<div style="text-align:center; margin-bottom: 20px;"><input type="button" onclick="send(1);" class="but_gray" value="立即申请"/></div>									
	</div>
	<!--右边部分 -->
	<div style="width:468px;height:1340px;" class="box_4 fr">
		<div class="zxt_m_rz">
			<div class="rz_img"><img src="/images/vip_member.jpg" alt="资信通VIP会员" /></div>
			<div class="rz_connect">
				<h1>资信通VIP会员</h1>
				<h6>年费：5000元人民币</h6>
				<h6>最高特权，尊享贵宾待遇!</h6>
				<div class="center">
				  <input type="button" onclick="send(2);" class="but_gray"  value="申请资信通VIP会员" />
				</div>
				<span>您也可以拨打客服热线400-8890-189进行申请</span>								
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon02.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专员服务全面升级，VIP特权荣耀尊享</h6>
				<p>金融服务专员一对一专享服务全面升级，资信通VIP会员可以独享融资业务全流程协助服务，包括合同签订、放款过程追踪、还息还贷提醒、配合银行贷后管理等全流程的咨询和支持服务，为您的成功融资提供最给力的支持！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon04.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>贷后服务面面俱到，续待机会手到擒来</h6>
				<p>资信通VIP会员能独享中国资金网提供的贷后管理服务，包括贷后检查提醒、贷后管理软件工具、在融资期内定期上传企业经营信息，获得良好的信用积累，以获得更高的续贷机会！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon10.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专业工具免费使用，财务状况精准掌控</h6>
				<p>中国资金网为资信通VIP会员提供完整的资信评估、财务分析、融资预测等专业分析工具，并且不限次数，永久免费升级，随时随地进行评估与分析，让您对自己的财务现状精准掌控，随时调整，知己知彼，百贷百胜！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon11.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>免费获得安全保障，文件传输方便快捷</h6>
				<p>资信通VIP会员可免费获得资金网专属的资金盾，通过简单绑定，便能全方位保护您的帐户安全，通过数字签名方式即可在线传递文件，既安全又便捷，免去线下传递文件的种种繁琐操作，鼠标一点，轻松实现。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon08.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>金融服务活动丰富，商业拓展机会多多</h6>
				<p>资信通VIP会员能够参加中国资金网举办的政府、行业协会、金融机构等参与的专业融资对接会。以及金融服务俱乐部等活动，与资金方零距离接触，面对面交流，有效扩大融资渠道和机会。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon09.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>优惠享受诸多服务，事业前景风光无限</h6>
				<p>中国资金网将不定期联合第三方推出各种针对VIP会员的特惠活动，让您在融资以及其它商务拓展的过程中，省钱省力又省心，助您在事业的大道上一路坦途，风光无限！ </p>
			</div>
		</div>				
		<div style="text-align:center; margin-bottom: 20px;"><input type="button" onclick="send(2);" class="but_gray" value="立即申请"/></div>			
	</div>
	<div class="clear"> &nbsp;</div>	
</div>
<!--资信通vip宣传页--> 
<div class="clear"> &nbsp;</div>
<div class="hr_10"> &nbsp;</div>
<!--弹出框内容订单信息--> 
<s:if test="ordMembership != null">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script language="javascript">
$(function(){
	$("#ord_valid").dialog({width:500,modal:true});
});
function reset(){
	if(window.confirm("是否确定要重新下单")){
		window.location.href = "/user/payment!resetOrder.act?memberType="+${ordMembership.memberType}+"&ordId="+${ordMembership.id};
	}
}
function ordView(){
	window.location.href = "/user/payment!orderView.act?ordId="+${ordMembership.id};
}
</script>
	<div id="ord_valid" style="display:none;" title="提示">
	   <table>
	   	<tr>
	   		<td>提示</td>
	   	</tr>
	   	<tr>
	   		<td>您编号为 ${ordMembership.ordNum } 的 <s:if test="ordMembership.memberType == 1">资信通认证会员</s:if><s:elseif test="ordMembership.memberType == 2">资信通vip会员</s:elseif>
	   		  订单尚未付款，重新下单将自动取消该订单！
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>您确定要取消原定单并重新下单吗？</td>
	   	</tr>
	   	<tr>
	   		<td>
	   			<input type="button" class="but_gray" onclick="reset()" value="重新下单" />
	   			<input type="button" class="but_gray" onclick="ordView()"  value="查看原定单" />
	   		</td>
	   	</tr>
	   </table>
	</div>
</s:if>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>