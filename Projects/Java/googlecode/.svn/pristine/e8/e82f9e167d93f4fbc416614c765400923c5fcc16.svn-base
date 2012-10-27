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
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.metadata.js" > </script>
<script type="text/javascript" src="/script/proofRule.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
window.onload = function () { 
	changeProvince(province1,city1,district1);
	changeProvince(province2,city2,district2);
};
$(document).ready(function(){
	changeProvince();
	//changeProvince(province1,city1,district1);
	//changeProvince(province2,city2,district2);
	$("#finaForm").validate({
		meta:"validate"
	});
	var saveForm=function saveForm(){
		$("#finaForm").submit();
	};
	var edit=function edit(){
		$(".input-text").removeAttr("readonly");
	    $(".input-text").removeAttr("style");
	    $("#bizscope").removeAttr("readonly");
	    $("#bizscope").removeAttr("style");
	    $("#remarks").removeAttr("readonly");
	    $("#remarks").removeAttr("style");
	    $("#orgtype1").hide();
	    $("#orgtype11").show();
	    $("#regcity1").hide();
	    $("#province1").show();$("#city1").show();$("#district1").show();
	    $("#bizcity2").hide();
	    $("#province2").show();$("#city2").show();$("#district2").show();
	    $("#linkgender1").hide();
	    $("#linkgender").show();
	    $("#comm").attr("value","确认保存");
	    $("#comm").unbind("click").removeAttr("onclick").click(saveForm);
	};
	<s:if test="nb==1">
	    $(".input-text").attr({style:"border:0;background:transparent;",readonly:"readonly"});
	    $("#bizscope").attr({style:"border:0;background:transparent;",readonly:"readonly"});
	    $("#remarks").attr({style:"border:0;background:transparent;",readonly:"readonly"});
	    $("#orgtype1").html($("#orgtype11").find("option:selected").text());
	    $("#orgtype11").hide();
	    $("#regcity1").html($("#province1").find("option:selected").text()+$("#city1").find("option:selected").text()+$("#district1").find("option:selected").text());
	    $("#province1").hide();$("#city1").hide();$("#district1").hide();
	    $("#bizcity2").html($("#province2").find("option:selected").text()+$("#city2").find("option:selected").text()+$("#district2").find("option:selected").text());
	    $("#province2").hide();$("#city2").hide();$("#district2").hide();
	    $("#linkgender1").html($("#linkgender").find("checked").val());
	    $("#linkgender").hide();
	    $("#comm").attr("value","编辑");
	    $("#comm").unbind("click").removeAttr("onclick").click(edit);
	    $("#t").hide();
	</s:if>
});
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
    <form id="finaForm" class="box_form" action="/user/Profile!update.act" method="post" style="width: 948px;">
      <dl>
      <dd id="t">
          <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="跳过" />
        </dd>
        <dt>
          <h6>非银行金融机构基本信息</h6>
        </dt>
        <dd width: 948px;>
          <h6>机构名称：</h6>
          <input type=text value="${usrFinanceorg.orgname }" class="input-text {validate:{stringMaxLength:30}} chne" name="usrFinanceorg.orgname"/>
          <h6>营业执照号码：</h6>
          <input type=text value="${usrFinanceorg.licensecode }" class="input-text alnum" name="usrFinanceorg.licensecode"/>
        </dd>
        <dd>
          <h6>组织机构代码证号码：</h6>
          <input type=text value="${usrFinanceorg.organizationcode }" class="input-text alnum" name="usrFinanceorg.organizationcode"/>
          <h6>税务登记证号码：</h6>
          <input type=text value="${usrFinanceorg.faxcode }" class="input-text alnum" name="usrFinanceorg.faxcode"/>
        </dd>
        <dd>
          <h6>法定代表人：</h6>
          <input type=text value="${usrFinanceorg.legalperson }" class="input-text {validate:{stringMaxLength:8}} chne" name="usrFinanceorg.legalperson"/>
        </dd>
        <dd>
          <h6>注册地址：</h6>
          <label id="regcity1"></label>
          <input  id="rprovince1" type="text" value="${usrFinanceorg.regprovinceid }" />
          <input  id="rcity1" type="text" value="${usrFinanceorg.regcityid }" />
          <input  id="rdistrict1" type="text" value="${usrFinanceorg.regdistrictid }" />
          <s:select id="province1" name="usrFinanceorg.regprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province1','city1','district1');"/>
          <select id="city1" name="usrFinanceorg.regcityid" onchange="changeCity('city1','district1');"><option value="0">--请选择--</option></select>
          <select id="district1" name="usrFinanceorg.regdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>详细地址：</h6>
          <input type=text value="${usrFinanceorg.regaddress }" class="input-text" style="width:534px;" name="usrFinanceorg.regaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrFinanceorg.regpostcode }" class="input-text zipCode" name="usrFinanceorg.regpostcode"/>
        </dd>
        <dd>
          <h6>注册日期：</h6>
          <input type=text value="${usrFinanceorg.registerdate }" class="input-text date" name="usrFinanceorg.registerdate"/>
          <h6>注册资本：</h6>
          <input type=text value="${usrFinanceorg.registeredcapital }" class="input-text digits" name="usrFinanceorg.registeredcapital"/>
          &nbsp;
          万元 </dd>
        <dd>
          <h6>机构类型：</h6>
          <label id="orgtype1"></label>
          <s:select id="orgtype11" name="usrFinanceorg.orgtypeid" list="dataMap['companyType']" listKey="id" listValue="name"/>
        </dd>
        <dd>
          <h6>机构联系地址：</h6>
          <label id="bizcity2"></label>
          <s:select id="province2" name="usrFinanceorg.bizprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province2','city2','district2');"/>
          <select id="city2" name="usrFinanceorg.bizcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district2" name="usrFinanceorg.bizdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>详细地址：</h6>
          <input type=text value="${usrFinanceorg.bizaddress }" class="input-text {validate:{stringMaxLength:32}} chne" style="width:534px;" name="usrFinanceorg.bizaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrFinanceorg.bizpostcode }" class="input-text zipCode" name="usrFinanceorg.bizpostcode"/>
        </dd>
        <dd>
          <h6>经营范围：</h6>
          <textarea id="bizscope" class="{validate:{stringMaxLength:200}}" rows=5 cols=60 name="usrFinanceorg.bizscope" name="usrFinanceorg.orgname">${usrFinanceorg.bizscope }</textarea>
        </dd>
        <dd>
          <h6>联系人姓名：</h6>
          <input type=text value="${usrFinanceorg.linkname }" class="input-text {validate:{stringMaxLength:8}} chne" name="usrFinanceorg.linkname"/>
          &nbsp;&nbsp;<label id="linkgender1"></label>
           <s:radio id="linkgender" name="usrFinanceorg.linkgender" list="#{1:'先生',0:'女士'}" value="usrFinanceorg.linkgender"/>
        </dd>
        <dd>
          <h6>所属部门：</h6>
          <input type=text value="${usrFinanceorg.department }" class="input-text {validate:{stringMaxLength:20}} chne" name="usrFinanceorg.department"/>
          <h6>职位：</h6>
          <input type=text value="${usrFinanceorg.position }" class="input-text {validate:{stringMaxLength:20}} chne" name="usrFinanceorg.position"/>
        </dd>
        <dd>
          <h6>产品介绍：</h6>
          <textarea id="remarks" class="{validate:{stringMaxLength:200}} chne" rows=5 cols=60 name="usrFinanceorg.remarks">${usrFinanceorg.remarks }</textarea>
        </dd>
      </dl>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <hr width="90%" />
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="center" style="width:205px;">
        <input id="comm" type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="确认提交" />
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