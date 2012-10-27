<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>完善信息（非银行金融机构）用户中心_中国资金网</title>
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
new PCAS("province1", "city1", "area1");
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948"> <span class="yourposition">请完善您的用户信息</span>
    <div class="hr_10"> &nbsp; </div>
     <form class="box_form" action="/user/Profile!update.act" method="post">
      <dl>
        <dt>
          <h6>非银行金融机构基本信息</h6>
        </dt>
    <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
        <dd>
          <h6>机构名称：</h6>
          <input type=text value="${usrFinanceorg.orgname }" class="input-text" name="usrFinanceorg.orgname"/>
          <h6>营业执照号码：</h6>
          <input type=text value="${usrFinanceorg.licensecode }" class="input-text" name="usrFinanceorg.licensecode"/>
        </dd>
        <dd>
          <h6>组织机构代码证号码：</h6>
          <input type=text value="${usrFinanceorg.organizationcode }" class="input-text" name="usrFinanceorg.organizationcode"/>
          <h6>税务登记证号码：</h6>
          <input type=text value="${usrFinanceorg.faxcode }" class="input-text" name="usrFinanceorg.faxcode"/>
        </dd>
        <dd>
          <h6>法定代表人：</h6>
          <input type=text value="${usrFinanceorg.legalperson }" class="input-text" name="usrFinanceorg.legalperson"/>
        </dd>
        <dd>
          <h6>注册地址：</h6>
          <s:select id="province" name="usrFinanceorg.regprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/>
          <select id="city" name="usrFinanceorg.regcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district" name="usrFinanceorg.regdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${usrFinanceorg.regaddress }" class="input-text" style="width:534px;" name="usrFinanceorg.regaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrFinanceorg.regpostcode }" class="input-text" name="usrFinanceorg.regpostcode"/>
        </dd>
        <dd>
          <h6>注册日期：</h6>
          <input type=text value="${usrFinanceorg.registerdate }" class="input-text" name="usrFinanceorg.registerdate"/>
          <h6>注册资本：</h6>
          <input type=text value="${usrFinanceorg.registeredcapital }" class="input-text" name="usrFinanceorg.registeredcapital"/>
          &nbsp;
          万元 </dd>
        <dd>
          <h6>机构类型：</h6>
          <s:select name="usrFinanceorg.orgtypeid" list="dataMap['companyType']" listKey="id" listValue="name"/>
        </dd>
        <dd>
          <h6>机构联系地址：</h6>
          <s:select id="province" name="usrFinanceorg.bizprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province','city','district');"/>
          <select id="city" name="usrFinanceorg.bizcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district" name="usrFinanceorg.bizdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${usrFinanceorg.bizaddress }" class="input-text" style="width:534px;" name="usrFinanceorg.bizaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrFinanceorg.bizpostcode }" class="input-text" name="usrFinanceorg.bizpostcode"/>
        </dd>
        <dd>
          <h6>经营范围：</h6>
          <textarea rows=5 cols=60 name="usrFinanceorg.bizscope" name="usrFinanceorg.orgname">${usrFinanceorg.bizscope }</textarea>
        </dd>
        <dd>
          <h6>联系人姓名：</h6>
          <input type=text value="${usrFinanceorg.linkname }" class="input-text" name="usrFinanceorg.linkname"/>
          &nbsp;&nbsp;
           <s:radio name="usrFinanceorg.linkgender" list="#{1:'先生',0:'女士'}" value="usrFinanceorg.linkgender"/>
        </dd>
        <dd>
          <h6>联系人邮箱：</h6>
          <input type=text value="数据库表中没该字段" class="input-text" name=""/>
          <h6>联系人电话：</h6>
          <input type=text value="数据库表中没该字段" class="input-text" name="" />
        </dd>
        <dd>
          <h6>所属部门：</h6>
          <input type=text value="${usrFinanceorg.department }" class="input-text" name="usrFinanceorg.department"/>
          <h6>职位：</h6>
          <input type=text value="${usrFinanceorg.position }" class="input-text" name="usrFinanceorg.position"/>
        </dd>
        <dd>
          <h6>产品介绍：</h6>
          <textarea rows=5 cols=60 name="usrFinanceorg.remarks">${usrFinanceorg.remarks }</textarea>
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