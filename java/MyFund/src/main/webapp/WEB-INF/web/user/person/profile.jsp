<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（个人）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
$(document).ready(function(){
	if('${session._user.auditstatus}' != '2'){
		$("#status").show();
	}
});

</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;详细信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
	<s:if test="usrUser == null || #session._user.id == usrUser.id">
		<h6><img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
		&nbsp;&nbsp;&nbsp;&nbsp;
		您的账户类型：个人</h6>
	</s:if>
	</div>
	<div id="status" class="P_connect" style="display: none;padding-left:64px;">
		<span>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else>&nbsp;感谢您注册中国资金网，您需要完善详细信息后才能使用中国资金网用户中心的各项功能。</span>
		<span style="margin-right:15px;" class="view_detail">
		<a href="/user/UserAction!next.act" style="float:none;">以后再说</a></span>
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div class="box_4 center" style="width:950px;">
	<div class="news_menu" style="height: 50px;">
        <dl style="margin-left: 30px;">
          <dd><h6>个人基本信息</h6></dd>
          <dd>
          	<s:if test="usrPerson.completerate==null || usrPerson.completerate<60">
				<div class="graph_red"><span style="width:${usrPerson.completerate+0}%"></span></div>
			</s:if><s:elseif test="60<=usrPerson.completerate && usrPerson.completerate<100">
				<div class="graph_orange"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
      <form class="box_form">
	     <s:if test="msg!=null">
      <table border="0" cellpadding="0" cellspacing="0" class="special_psfs_tb">
		    <tr>
	           <td>
	           	  <div class="notification success png_bg">
	           	  	  <div>
	           	  	  	${msg }
	           	  	  	<s:if test="#session._user.auditstatus==2 && #session.APPLY_LOAN_PRODUCT_ID != null && #session.APPLY_LOAN_PRODUCT_ID != ''">
	           	  	  	您有未完成的融资产品申请，您可以
	           	  	  	<a href="/user/loan/financeApply.act?product.id=${session.APPLY_LOAN_PRODUCT_ID}" class="zj_href">继续申请</a>

	           	  	  	</s:if>
	           	  	  </div>
	           	  </div>
	           </td>
	         </tr>
      </table>
		    </s:if>
       <table border="0" cellpadding="0" cellspacing="0" class="special_psfs_tb">	
       <tr>
           <td colspan="4">
           	<div class="box_4" style="font-size:12px;margin:10px 26px;line-height:24px;padding:10px 20px;background: #EDF0FF;">提交基本信息是您使用中国资金网各项服务的最基本要求，请务必填写完整并保证信息的真实性。通过系统审核后，您即可享受中国资金网的各项服务</div>
			</td>
         </tr>     
         <tr>
           <td class="a_right">姓名：</td>
           <td colspan="3"> ${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else></td>
         </tr>
         <!-- <tr>
           <td class="a_right">出生年月：</td>
           <td colspan="3"><s:date name="usrPerson.birthday" /></td>
         </tr> -->
         <tr>
           <td class="a_right">教育程度：</td>
           <td colspan="3">${profileMap['eduAtion'] }</td>
         </tr>
         <tr>
           <td class="a_right">身份证号码：</td>
           <td colspan="3">${usrPerson.cid}</td>
         </tr>
         <tr>
           <td class="a_right">所在地：</td>
           <td colspan="3" style="vertical-align: middle;">
            ${profileMap['address'] }
           </td>
         </tr>
         <tr>
           <td class="a_right">详细地址：</td>
           <td colspan="3">${usrPerson.address }</td>
         </tr>              
         <tr>
           <td class="a_right" style="vertical-align:top;">邮政编码：</td>
           <td colspan="3">${usrPerson.postcode }</td>
         </tr>            
         <tr>
           <td class="a_right">职业：</td>
           <td colspan="3">
            ${profileMap['psersoncareer'] }               	
           </td>
         </tr>
         <tr>
           <td class="a_right">固定电话：</td>
           <td colspan="3">${usrPerson.telephone }</td>
         </tr>
         <tr>
           <td class="a_right">联系方式：</td>
           <td colspan="3">${profileMap['imtype1'] }&nbsp;&nbsp; ${usrPerson.im1 }</td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3">${profileMap['imtype2'] }&nbsp;&nbsp;${usrPerson.im2 }</td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3">${profileMap['imtype3'] }&nbsp;&nbsp;${usrPerson.im3 }</td>
         </tr>
         <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;"><input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile!edit.act';" style="width:200px;" value="编辑信息" /></td>
         </tr>
       </table>        	
   </form>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>