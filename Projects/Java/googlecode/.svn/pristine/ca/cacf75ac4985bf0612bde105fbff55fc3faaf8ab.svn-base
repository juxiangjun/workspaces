<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>验证并完成注册-中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/phone_test.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
//文本框触发焦点效果
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    $("#reEmail").focus(function() {
        $(this).attr("value","");
    });
      
});
function recoveryInfo(){
  $("#recoveryInfo").toggle();
}
</script>
</head>
<body>
<div class="header user_header reg_header">
<jsp:include page="/public/head3.jsp" />
</div>
<!--主体部分-->
<div class="container_960">
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
  <div class="box_4 phone_test" style="width:90%x; height:450px; margin:0 auto;">
    <s:if test="msg!=null"><div><h5 class="red">&nbsp;&nbsp;&nbsp;&nbsp;${msg}</h5></div></s:if>
    <s:else><h5 class="red">&nbsp;&nbsp;&nbsp;&nbsp;您的账户还未激活，请输入激活码。</h5></s:else>
    <hr width="90%" />
    <div class="big_phone_ico">
      <form class="box_form" action="/Account!activate.act" method="post">
        <dl>
          <dd>
            <h6 style="width:175px;">输入激活码：</h6><input id="Verification_code" name="activeCode" type=text value="" class="input-text" style="width:90px;"/>
          </dd>
          <dd>
            <h6 style="width:175px;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:98px;" value="确认提交" /></h6>
          </dd>
            <dd>&lt;如果您填写的email或mobile有误请点击<a href="javascript:recoveryInfo();">email</a>或<a href="javascript:recoveryInfo();">mobile</a>修改信息&gt;</dd>
          </dl>
      </form>
      <div id="recoveryInfo" style="display: none;">
      <form class="box_form" action="/Account!reSendActiveCode.act" method="post">
         <div class="hr_10">
          <hr width="90%" />
          <dl>
            <dd>
            	<h6 style="width:175px;">email：</h6><h6 style="width:175px;"><input id="reEmail" type="text" name="email"  class="input-text" style="width:170px;" value="更改注册邮箱" /></h6>&nbsp;
            </dd>
            <dd>
            	<h6 style="width:175px;"><input type="submit" onfocus="this.blur()" class="but_gray" style="width:98px;" value="确认提交" /></h6>
            </dd>
          </dl>
        </div>
        </form>
        </div>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>