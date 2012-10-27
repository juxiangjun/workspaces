<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>完善信息（服务方）用户中心_中国资金网</title>
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
new PCAS("province", "city", "area");
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
  <div class="box_948"> <span class="yourposition">请完善您的用户信息</span>
    <div class="hr_10"> &nbsp; </div>
    <form class="box_form" action="/user/Profile!update.act" method="post">
      <dl>
        <dt>
          <h6>服务方基本信息</h6>
        </dt>
    <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
        <dd>
          <h6>企业名称：</h6>
          <input type=text value="${ usrServiceorg.orgname}" class="input-text" name="usrServiceorg.orgname"/>
          <h6>营业执照号码：</h6>
          <input type=text value="${ usrServiceorg.licensecode}" class="input-text" name="usrServiceorg.licensecode"/>
        </dd>
        <dd>
          <h6>组织机构代码证号码：</h6>
          <input type=text value="${ usrServiceorg.organizationcode}" class="input-text" name="usrServiceorg.organizationcode"/>
          <h6>税务登记证号码：</h6>
          <input type=text value="${ usrServiceorg.faxcode}" class="input-text" name="usrServiceorg.faxcode"/>
        </dd>
        <dd>
          <h6>法定代表人：</h6>
          <input type=text value="${ usrServiceorg.legalperson}" class="input-text" name="usrServiceorg.legalperson"/>
          <h6>注册地址：</h6>
          <input type=text value="${ usrServiceorg.regaddress}" class="input-text" name="usrServiceorg.regaddress"/>
        </dd>
        <dd>
          <h6>注册日期：</h6>
          <input type=text value="${ usrServiceorg.registerdate}" class="input-text" name="usrServiceorg.registerdate"/>
          <h6>注册资本：</h6>
          <input type=text value="${ usrServiceorg.registeredcapital}" class="input-text" name="usrServiceorg.registeredcapital"/>
          &nbsp;万元 </dd>
        <dd>
          <h6>机构类型：</h6>
          <s:select name="usrServiceorg.orgtypeid" list="dataMap['companyType']" listKey="id" listValue="name"></s:select>
        </dd>
        <dd>
          <h6>企业联系地址：</h6>
          <s:select id="province" name="usrServiceorg.bizprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/>
          <select id="city" name="usrServiceorg.bizcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district" name="usrServiceorg.bizdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${ usrServiceorg.bizaddress}" class="input-text" style="width:534px;" name="usrServiceorg.bizaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${ usrServiceorg.bizpostcode}" class="input-text" name="usrServiceorg.bizpostcode"/>
        </dd>
        <dd>
          <h6>联系人姓名：</h6>
          <input type=text value="${ usrServiceorg.linkname}" class="input-text" name="usrServiceorg.linkname"/>
          &nbsp;&nbsp;
          <s:radio name="usrServiceorg.linkgender" list="#{1:'先生',0:'女士'}" value="usrServiceorg.linkgender" listKey="key" listValue="value"/>
        </dd>
        <dd>
          <h6>联系人邮箱：</h6>
          <input type=text value="数据库表中没有改字段" class="input-text" name=" "/>
          <h6>联系人电话：</h6>
          <input type=text value="数据库表中没有改字段" class="input-text" name=" "/>
        </dd>
        <dd>
          <h6>所属部门：</h6>
          <input type=text value="${ usrServiceorg.department}" class="input-text" name="usrServiceorg.department"/>
          <h6>职位：</h6>
          <input type=text value="${ usrServiceorg.position}" class="input-text" name="usrServiceorg.position"/>
        </dd>
        <dd>
          <h6>服务产品（数据库表中没有该字段）：</h6>
          <input id="fw1" type="radio" name="group1" value="1" name="usrServiceorg"/>
          <label for="fw1">审计</label>
          &nbsp;&nbsp;
          <input id="fw2" type="radio" name="group1" value="2" name="usrServiceorg"/>
          <label for="fw2">资产评估</label>
          &nbsp;&nbsp;
          <input id="fw3" type="radio" name="group1" value="3" name="usrServiceorg" />
          <label for="fw3">财务咨询</label>
          &nbsp;&nbsp;
          <input id="fw4" type="radio" name="group1" value="4" name="usrServiceorg"/>
          <label for="fw4">税务咨询</label>
          &nbsp;&nbsp;
          <input id="fw5" type="radio" name="group1" value="5" name="usrServiceorg"/>
          <label for="fw5">质押监管</label>
          &nbsp;&nbsp;
          <input id="fw6" type="radio" name="group1" value="6" name="usrServiceorg"/>
          <label for="fw6">投资咨询</label>
        </dd>
        <dd>
          <h6>服务介绍：</h6>
          <textarea rows=5 cols=60 name="usrServiceorg.remarks">${ usrServiceorg.remarks}</textarea>
        </dd>
      </dl>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <hr width="90%" />
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="center" style="width:205px;">
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