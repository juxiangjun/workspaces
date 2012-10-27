<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>完善信息（企业）用户中心_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
//通用选项卡2
$(document).ready(function() {
var nb=1;
if(nb==1){
    $('.xxkbox2:not(nb)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
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
<!--主体部分-->
<div class="container_960">
  <div class="box_948"><span class="yourposition">请完善您的用户信息</span>
    <div class="hr_10"> &nbsp; </div>
     <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover">企业基本信息</li>
          <li>企业法人信息</li>
          <li>企业经营信息</li>
          <li>企业财务信息</li>
        </ul>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="xxkContent">
        <div class="xxkbox2">
                  企业基本信息
			<form class="box_form" action="/user/Profile!update.act" method="post">
			          <h6><span class="txt-impt">*</span>企业名称：</h6>
          <input type=text value="${usrCompany.companyname }" class="input-text"  name="usrCompany.companyname"/>
			<input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
			</form>
        </div>
        <div class="xxkbox2">
                 企业法人信息
        <form class="box_form" action="/user/Profile!update.act" method="post">
                  <h6><span class="txt-impt">*</span>企业名称：</h6>
          <input type=text value="${usrCompany.companyname }" class="input-text"  name="usrCompany.companyname"/>
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
			</form>
        </div>
        <div class="xxkbox2">
                 企业经营信息
        <form class="box_form" action="/user/Profile!update.act" method="post">
                  <h6><span class="txt-impt">*</span>企业名称：</h6>
          <input type=text value="${usrCompany.companyname }" class="input-text"  name="usrCompany.companyname"/>
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
			</form>
        </div>
        <div class="xxkbox2">
        企业财务信息
        <form class="box_form" action="/user/Profile!update.act" method="post">
                  <h6><span class="txt-impt">*</span>企业名称：</h6>
          <input type=text value="${usrCompany.companyname }" class="input-text"  name="usrCompany.companyname"/>
        <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
			</form>
        </div>
      </div>
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