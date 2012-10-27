<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>完善信息（银行金融机构）用户中心_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
$(document).ready(function(){
    $(".input-text").css("style","border:0;background:transparent;");
});
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948"> <span class="yourposition">请完善您的用户信息,可以跳过</span>
    <div class="hr_10"> &nbsp; </div>
    <form class="box_form" action="/user/Profile!update.act" method="post">
      <dl>
        <dt>
           <h6>银行金融机构基本信息</h6>
        </dt>
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
        <dd>
          <h6><span class="txt-impt">*</span>机构名称：</h6>
          <input type=text value="${usrBank.detailname }" class="input-text" name="usrBank.detailname" />
        </dd>
        <dd>
          <h6>联系人姓名：</h6>
          <input type=text value="${usrBank.linkname }" class="input-text" name="usrBank.linkname"/>
          &nbsp;&nbsp;
          <s:if test="usrBank.linkgenderr==null">
          <s:radio name="usrBank.linkgenderr" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if>&nbsp;&nbsp;<s:else>
          <s:radio name="usrBank.linkgenderr" list="#{1:'先生',0:'女士'}" value="usrBank.linkgenderr" listKey="key" listValue="value"/>
          </s:else>
        </dd>
        <dd>
          <h6>联系人邮箱：</h6>
          <input type=text value="${usrBank.linkemail }" class="input-text" name="usrBank.linkemail" />
          <h6>联系人电话：</h6>
          <input type=text value="${usrBank.linktelephone }" class="input-text" name="usrBank.linktelephone"/>
        </dd>
        <dd>
          <h6>所属部门：</h6>
          <input type=text value="${usrBank.department }" class="input-text" name="usrBank.department" />
          <h6>职位：</h6>
          <input type=text value="${usrBank.position }" class="input-text" name="usrBank.position"/>
        </dd>
        <dd>
          <h6>服务介绍：</h6>
          <textarea rows=5 cols=60 name="usrBank.remarks">${usrBank.remarks }</textarea>
        </dd>
      </dl>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <hr width="90%" />
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="center" style="width:200px;">
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="确认提交" />
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
    </form>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>