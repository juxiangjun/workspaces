<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>注册页面-中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/reg.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/register.js" > </script>
<script type="text/javascript">
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
	$(".close").click(function() {
        $(this).parent().fadeTo(400, 0,
        function() { // Links with the class "close" will close parent
            $(this).slideUp(400);
        });
        return false;
    });
	<s:if test="msg!=null">checkAll();</s:if>
});
</script>
</head>
<body>
<!--头部2-->
<div class="header user_header2 reg_header">
<jsp:include page="/public/head3.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948"> <span class="yourposition">新用户注册</span>
  <s:if test="msg!=null">
      <div class="notification attention png_bg"> <a href="#" class="close"><img src="/images/icons/cross_grey_small.png"  title="关闭此信息" alt="关闭" /></a>
        <div>${msg }</div>
      </div>
      </s:if>
    <div class="hr_10"> &nbsp; </div>
    <p class="notice fr" style="font-size:14px;">已有资金网账号？可以<a class="red" href="/Account.act">直接登录</a></p>
    <div class="clear"> &nbsp; </div>
    <form id="regform" class="box_form" action="/Register!register.act" method="post">
      <dl>
        <dd>
          <h6><span class="txt-impt">*</span>用户名：</h6>
          <input id="username" name="username" onblur="check_username()" type=text value="${username}" class="input-text" />
          <span id="username_error" class="txt-info">6-18个字符，可使用字母、数字、下划线。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>密码：</h6>
          <input id="pass" name="password" onblur="check_pass()" type=password value="" class="input-text" />
          <span id="pass_error" class="txt-info">6~16个字符，区分大小写。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>确认密码：</h6>
          <input id="rpass" onblur="check_rpass()" type=password value="" class="input-text" />
          <span id="rpass_error" class="txt-info">请再次输入密码。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>姓名：</h6>
          <input id="fullname" name="realname" onblur="check_fullname()" type=text value="${realname}" class="input-text-t" />
          &nbsp;&nbsp;
          <s:if test="gender==null">
          <s:radio name="gender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio name="gender" list="#{1:'先生',0:'女士'}" value="gender" listKey="key" listValue="value"/>
          </s:else>
          <span id="fullname_error" class="txt-info">请输入真实姓名。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>邮箱：</h6>
          <input id="email" name="email" onblur="check_email()" type=text value="${email}" class="input-text" />
          <span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>手机号：</h6>
          <input id="mobile" name="mobile" onblur="check_mobile()" type=text value="${mobile}" class="input-text" />
          <span id="mobile_error" class="txt-info">常用的手机号码，用于接受通知和验证等。</span></dd>
        <dd>
          <h6>&nbsp; </h6>
          <input id=u4 type="button" onclick="checkform()" class="but_gray" style="width:200px;" value="同意以下协议并提交" />
        </dd>
      </dl>
      <textarea class="txt_tiaokuan" readonly="readonly">中国资金网用户服务协议
本协议是您与中国资金网（简称"本站"，网址：www.zj198.com）所有者（鼎辉信息技术有限公司）之间就中国资金网服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击"同意以下协议，提交"按钮后，本协议即构成对双方有约束力的法律文件。一． 服务条款的确认和接纳
本服务协议双方为上海易迅电子商务发展有限公司（下称"易迅"）与易迅网用户，本服务协议具有合同效力。
本服务协议内容包括协议正文及所有易迅已经发布的或将来可能发布的各类服务条款。所有条款为协议不可分割的一部分，与协议正文具有同等法律效力。
易迅网的各项服务的所有权和运作权归易迅。易迅提供的服务将完全按照其发布的服务条款和操作规则严格执行。
用户在使用易迅提供的各项服务的同时，承诺接受并遵守各项相关条款的规定。易迅有权根据需要不时地制定、修改本协议或各项条款，如本协议有任何变更，易迅将在网站上刊载公告，通知予用户。如用户不同意相关变更，必须停止使用易迅所提供的服务。经修订的协议一经在易迅网公布后，立即自动生效。各项条款会在发布后生效，亦成为本协议的一部分。登录或继续使用易迅所提供的服务将表示用户接受经修订的协议。除另行明确声明外，任何使易迅所提供的服务的范围扩大或功能增强的新内容均受本协议约束。
用户确认本服务协议后，本服务协议即在用户和易迅之间产生法律效力。请用户务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向易迅咨询。
无论用户事实上是否在注册之前认真阅读了本服务协议，只要用户点击协议正本下方的"确认"按钮并按照易迅注册程序成功注册为用户，用户的行为仍然表示其同意并签署了本服务协议。
用户确认：本协议条款是处理双方权利义务的当然约定依据，除非违反国家强制性法律，否则始终有效。在下订单的同时，用户也同时承认了用户拥有购买这些产品的权利能力和行为能力，并且对用户在订单中提供的所有信息的真实性负责。
二． 服务简介
易迅运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：
(1)自行配备上网的所需设备，包括个人电脑、调制解调器或其它必备上网装置。
(2)自行负担个人上网所支付的与此服务有关的电话费用、网络费用。
基于易迅所提供的网络服务的重要性，用户应同意：
(1)提供详尽、准确的个人资料。
(2)不断更新注册资料，符合及时、详尽、准确的要求。
易迅不公开用户的姓名、地址、电子邮箱和笔名， 除以下情况外：
(1)用户授权易迅透露这些信息。
(2)相应的法律及程序要求易迅提供用户的个人资料。
如果用户提供的资料包含有不正确的信息，易迅保留结束用户使用网络服务资格的权利。
</textarea>
    </form>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>