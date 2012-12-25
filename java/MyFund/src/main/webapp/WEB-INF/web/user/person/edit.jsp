<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>完善信息（个人）用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
$(document).ready(function(){
	$("#birthday").datepicker({changeMonth: true,changeYear: true,maxDate: "-18y"});
	$("#city").val('${usrPerson.cityid}');
	$("#district").val('${usrPerson.districtid}');
	$("#personForm").validate({
		meta:"validate"
	});
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
&nbsp;&nbsp;账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;<a href="/user/Profile.act">详细信息</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;编辑信息
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950 box_4">
	<div class="P_title">详细信息</div>
	<div class="line">
		<h6><img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:
		<s:if test="#session._user.auditstatus==0"><span class="no_ok">未审核</span></s:if>
		<s:elseif test="#session._user.auditstatus==1"><span class="no_ok">待审核</span></s:elseif>
		<s:elseif test="#session._user.auditstatus==2"><span class="no_ok">已审核</span></s:elseif>
		&nbsp;&nbsp;&nbsp;&nbsp;
		您的账户类型：个人</h6>
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
          <s:if test="usrPerson==null">
				<div class="graph_red"><span style="width:0%"></span></div>
			</s:if>
          	<s:elseif test="usrPerson.completerate<60">
				<div class="graph_red"><span style="width:${usrPerson.completerate}%"></span></div>
			</s:elseif><s:elseif test="60<=usrPerson.completerate && usrPerson.completerate<100">
				<div class="graph_orange"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:elseif><s:else>
				<div class="graph_green"><span  style="width:${usrPerson.completerate}%"></span></div>
			</s:else>
          </dd>
        </dl>
      </div>
    <form id="personForm" action="/user/Profile!update.act" method="post" class="box_form">
       <table border="0" cellpadding="0" cellspacing="0" class="psfs_tb">
         <s:if test="msg!=null">
          <tr>
           <td colspan="4"><div class="notification attention png_bg"><div>${msg }</div></div></td>
         </tr>
	     </s:if>
	     <tr>
           <td colspan="4">
           	<div class="box_4" style="font-size:12px;margin:10px 26px;line-height:24px;padding:10px 20px;background: #EDF0FF;">提交基本信息是您使用中国资金网各项服务的最基本要求，请务必填写完整并保证信息的真实性。通过系统审核后，您即可享受中国资金网的各项服务</div>
			</td>
         </tr>
         <tr>
           <td class="a_right">姓名：</td>
           <td colspan="3" class="v-align">${session._user.realname} <s:if test="#session._user.gender==1">先生</s:if><s:else>女士</s:else></td>
         </tr>
         <!-- <tr>
           <td class="a_right">出生年月：</td>
           <td colspan="3" class="v-align"><input id="birthday" type="text" value="<s:date name="usrPerson.birthday" />" class="input-text dateISO userbirthday" name="usrPerson.birthday"/><span class="ask_text"></span></td>
         </tr> -->
         <tr>
           <td class="a_right" style="vertical-align:top;">教育程度：</td>
           <td colspan="3">
           <s:iterator value="dataMap['eduAtion']" id="eduAtion">
           <input type="radio" name="usrPerson.education" value="${eduAtion.id }" <s:if test="%{usrPerson.education == #eduAtion.id}"> checked</s:if>/>${eduAtion.name}
           </s:iterator>
           </td>
         </tr>
         <tr>
           <td class="a_right">身份证号码：</td>
           <td colspan="3" class="v-align"><input type=text value="${usrPerson.cid}" class="input-text idcardno" name="usrPerson.cid"/></td>
         </tr>
         <tr>
           <td class="a_right" style="vertical-align: top;">所在地：</td>
           <td colspan="3">
            <s:select id="province" name="usrPerson.provinceid" cssClass="tb_sele" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/><span class="v-align">省/直辖市&nbsp;</span>
            <select id="city" name="usrPerson.cityid" onchange="changeCity('city','district');" class="tb_sele">
          	 <option value="0">--请选择--</option>
          	 <s:iterator value="cityMap['city']">
				<option value="${id}">${name}</option>
			 </s:iterator>
          	</select><span class="v-align">市&nbsp;</span>
            <select id="district" name="usrPerson.districtid" class="tb_sele">
          	 <option value="0">--请选择--</option>
          	 <s:iterator value="districtMap['district']">
				<option value="${id}">${name}</option>
			 </s:iterator>
          	</select><span class="v-align">区/县&nbsp;</span>         
           </td>
         </tr>
         <tr>
           <td class="a_right">详细地址：</td>
           <td colspan="3" class="v-align"><input type=text value="${usrPerson.address }" class="input-text {validate:{maxlength:32}} chne" style="width:534px;" name="usrPerson.address" /><span class="ask_text"></span></td>
         </tr>              
         <tr>
           <td class="a_right">邮政编码：</td>
           <td colspan="3" class="v-align"><input type="text" value="${usrPerson.postcode }" name="usrPerson.postcode" id="textfield" class="input-text zipCode"/><span class="ask_text"></span></td>
         </tr>            
         <tr>
           <td class="a_right">职业：</td>
           <td colspan="3" class="v-align">
            <s:select name="usrPerson.careerid" list="dataMap['psersoncareer']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele"/>               	
           </td>
         </tr>
         <tr>
           <td class="a_right">固定电话：</td>
           <td colspan="3" class="v-align"><input type="text" value="${usrPerson.telephone }" class="input-text phone" name="usrPerson.telephone"/><span class="ask_text"></span></td>
         </tr>
         <tr>
           <td class="a_right">联系方式：</td>
           <td colspan="3" class="v-align"><s:select name="usrPerson.im1type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele" style="float:left;"/>
          <input type=text value="${usrPerson.im1 }" class="input-text {validate:{maxlength:32}} ContacInfo" name="usrPerson.im1"/><span class="ask_text"></span></td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3" class="v-align"><s:select name="usrPerson.im2type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele" style="float:left;"/>
          <input type=text value="${usrPerson.im2 }" class="input-text {validate:{maxlength:32}} ContacInfo" name="usrPerson.im2"/><span class="ask_text"></span></td>
         </tr>
         <tr>
           <td class="a_right">&nbsp;</td>
           <td colspan="3" class="v-align"><s:select name="usrPerson.im3type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--" cssClass="tb_sele" style="float:left;"/>
          <input type=text value="${usrPerson.im3 }" class="input-text {validate:{maxlength:32}} ContacInfo" name="usrPerson.im3"/><span class="ask_text"></span></td>
         </tr>
         <tr>
           <td colspan="4" style="text-align:center; padding-top:10px; padding-bottom:10px;">
           <input type="submit" class="but_gray" style="width:200px;" value="保存" />&nbsp;&nbsp;
           <input type="button" class="but_gray" onclick="javascript:window.location.href='/user/Profile.act'" style="width:200px;" value="取消" />
           </td>
         </tr>
       </table>        	
   </form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>