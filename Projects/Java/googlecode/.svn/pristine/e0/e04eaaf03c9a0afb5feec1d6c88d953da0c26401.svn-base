<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>完善信息（个人）用户中心_中国资金网</title>
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
	$(document).ready(function(){
		changeProvince();
		//$("#city").val('${usrPerson.cityid}');
		//alert('${usrPerson.cityid}');
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
    <form class="box_form" action="/user/Profile!update.act" method="post">
      <dl>
        <dt>
          <h6>个人基本信息</h6>
        </dt>
    <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
        <dd>
          <h6><span class="txt-impt">*</span>姓名：</h6> 
          <input type=text value="${session._user.realname}" class="input-text" readonly="readonly" />
        </dd>
        <dd>
          <h6>身份证号码：</h6>
          <input type=text value="${usrPerson.cid}" class="input-text" name="usrPerson.cid" />
        </dd>
        <dd>
          <h6><span class="txt-impt">*</span>所在地：</h6>
          <s:select id="province" name="usrPerson.provinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/>
          <select id="city" name="usrPerson.cityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district" name="usrPerson.districtid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${usrPerson.address }" class="input-text" style="width:534px;" name="usrPerson.address" />
        </dd>
        <dd>
          <h6><span class="txt-impt">*</span>职业：</h6>
          <s:select name="usrPerson.careerid" list="dataMap['psersoncareer']" listKey="id" listValue="name" headerKey="#userPerson.careerid" headerValue="%{dataMap['psersoncareer'].get(usrPerson.careerid).getName()}"></s:select>
        </dd>
        <dd>
          <h6><span class="txt-impt">*</span>固定电话：</h6>
          <input type=text value="${usrPerson.telephone }" class="input-text" style="width:534px;" name="usrPerson.telephone" />
        </dd>
        <dd>
          <h6>联系方式：</h6>
          <s:select name="usrPerson.im1type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"/>
          <input type=text value="${usrPerson.im1 }" class="input-text" name="usrPerson.im1"/>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <s:select name="usrPerson.im2type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"/>
          <input type=text value="${usrPerson.im2 }" class="input-text" name="usrPerson.im2"/>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <s:select name="usrPerson.im3type" list="dataMap['mtool']" listKey="id" listValue="name" headerKey="0" headerValue="--请选择--"/>
          <input type=text value="${usrPerson.im3 }" class="input-text" name="usrPerson.im3"/>
        </dd>
      </dl>
      <div class="hr_10"> &nbsp; </div>
      <hr width="90%" />
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