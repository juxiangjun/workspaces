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
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
});
//通用选项卡2
$(document).ready(function() {
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
    if($("#comm").val()=="确认提交"){
      if(window.confirm("是否保存信息")){
      		$("#comForm").submit();
	        $(this).addClass('hover').siblings().removeClass();
	        var nb = sb.index(this);
	        $('.xxkbox2').eq(nb).show().siblings().hide();
        }
     }
     $(this).addClass('hover').siblings().removeClass();
	        var nb = sb.index(this);
	        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
});
//文本框触发焦点效果
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});
function Scroll(ul, delay, speed, lineHeight) {
    var slideBox = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    var delay = delay || 1000;
    var speed = speed || 20;
    var lineHeight = lineHeight || 24;
    var tid = null,
    pause = false;
    var start = function() {
        tid = setInterval(slide, speed);
    };
    var slide = function() {
        if (pause) return;
        slideBox.scrollTop += 2;
        if (slideBox.scrollTop % lineHeight == 0) {
            clearInterval(tid);
            slideBox.appendChild(slideBox.getElementsByTagName('li')[0]);
            slideBox.scrollTop = 0;
            setTimeout(start, delay);
        }
    };
    slideBox.onmouseover = function() {
        pause = true;
    };
    slideBox.onmouseout = function() {
        pause = false;
    };
    setTimeout(start, 2000);
}
function changeProvince(provinceid,cityid,districtid){
	$("#"+districtid).html("<option value='0'>--请选择--</option>");
	if($("#"+provinceid).val()=='0'){
		$("#"+cityid).html("<option value='0'>--请选择--</option>");
	}else{
		$.post("/DataCommon!findCity.act",{provinceId:$("#"+provinceid).val()},function(a){
			$("#"+cityid).html(a);
		});
	}
}
function changeCity(cityid,districtid){
	if($("#"+cityid).val()=='0'){
		$("#"+districtid).html("<option value='0'>--请选择--</option>");
	}else{
		$.post("/DataCommon!findDistrict.act",{cityId:$("#"+cityid).val()},function(a){
			$("#"+districtid).html(a);
		});
	}
}
</script>
<script language="javascript">
$(document).ready(function(){
	changeProvince();
	var saveForm=function saveForm(){
		$("#comForm").submit();
	};
	var edit=function edit(){
		$(".input-text").removeAttr("readonly");
	    $(".input-text").removeAttr("style");
	    $("#bizcope").removeAttr("readonly");
	    $("#bizcope").removeAttr("style");
	    $("#ctype1").hide();
	    $("#ctype11").show();
	    $("#eloyee1").hide();
	    $("#eloyee11").show();
	    $("#indus1").hide();
	    $("#indus11").show();
	    $("#lepduc1").hide();
	    $("#lepduc11").show();
	    $("#lpmarry1").hide();
	    $("#lpmarry11").show();
	    $("#lpindus1").hide();
	    $("#lpindus11").show();
	    $("#citys1").hide();
	    $("#province1").show();$("#city1").show();$("#district1").show();
	    $("#comm").attr("value","确认提交");
	    $("#comm").unbind("click").removeAttr("onclick").click(saveForm);
	};
	<s:if test="nb==0">
		$("status1").hide();
		$("#22").hide();
		$("#33").hide();
		$("#44").hide();
	</s:if>
	<s:elseif test="nb==1">
		$(".input-text").attr({style:"border:0;background:transparent;",readonly:"readonly"});
		$("#bizcope").attr({style:"border:0;background:transparent;",readonly:"readonly"});
	    $("#ctype1").html($("#ctype11").find("option:selected").text());
	    $("#ctype11").hide();
	    $("#eloyee1").html($("#eloyee11").find("option:selected").text());
	    $("#eloyee11").hide();
	    $("#indus1").html($("#indus11").find("option:selected").text());
	    $("#indus11").hide();
	    $("#lepduc1").html($("#lepduc11").find("option:selected").text());
	    $("#lepduc11").hide();
	    $("#lpmarry1").html($("#lpmarry11").find("option:selected").text());
	    $("#lpmarry11").hide();
	    $("#lpindus1").html($("#lpindus11").find("option:selected").text());
	    $("#lpindus11").hide();
	    $("#citys1").html($("#province1").find("option:selected").text()+$("#city1").find("option:selected").text()+$("#district1").find("option:selected").text());
	    $("#province1").hide();$("#city1").hide();$("#district1").hide();
	    $("#citys2").html($("#province2").find("option:selected").text()+$("#city2").find("option:selected").text()+$("#district2").find("option:selected").text());
	    $("#province2").hide();$("#city2").hide();$("#district2").hide();
	    $("#comm").attr("value","编辑");
	    $("#comm").unbind("click").removeAttr("onclick").click(edit);
	    $("#t").hide();
	</s:elseif>
});
</script>
</head>
<body>
<!--头部-->
<s:if test="nb==1">
	<div class="header user_header">
		<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
	</div>
</s:if>
<s:else>
	<div class="header index_header">
		<jsp:include page="/public/head3.jsp"></jsp:include>
	</div>
</s:else>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_950">
	<div class="P_title">企业信息管理</div>
	<div class="line">&nbsp;</div>
	<div id="status1" class="P_connect"><img src="/images/icon01.jpg" alt="" class="P_connect_img"/>当前账户状态:<span class="no_ok">未审核</span>您的帐户功能受限，请您尽快<span style="float:right; margin-right:15px;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" value="申请审核" /></span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前信息完善度：<span style="color:#97181d;">80% </span></div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--tab-->
<div>
    <div class="box_4 center" style="width:950px;">
      <div class="gray news_menu tab_menu2">
        <ul>
          <li id="11" class="hover">企业基本信息</li>
          <li id="22">企业法人信息</li>
          <li id="33">企业经营信息</li>
          <li id="44">企业财务信息</li>
        </ul>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="xxkContent">
        <div class="xxkbox2" >
          <form id="comForm" class="box_form" action="/user/Profile!update.act" method="post" >
            <dl>
			<dd id="t" style="display:inline; padding-left:10px;">
				<input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:100px;" value="跳过" />
			</dd>
               <dd>
          <h6><span class="txt-impt">*</span>企业名称：</h6>
          <input type=text value="${usrCompany.companyname }" class="input-text"  name="usrCompany.companyname"/>
          <h6>营业执照号码：</h6>
          <input type=text value="${usrCompany.licensecode }" class="input-text" name="usrCompany.licensecode"/>
        </dd>
        <dd>
          <h6>组织机构代码证号码：</h6>
          <input type=text value="${usrCompany.organizationcode }" class="input-text" name="usrCompany.organizationcode"/>
          <h6>税务登记证号码：</h6>
          <input type=text value="${usrCompany.faxcode }" class="input-text" name="usrCompany.faxcode"/>
        </dd>
        <dd>
          <h6>开户许可证号码：</h6>
          <input type=text value="${usrCompany.bankpermitcode }" class="input-text" name="usrCompany.bankpermitcode"/>
          <h6>贷款卡号：</h6>
          <input type=text value="${usrCompany.loancard }" class="input-text" name="usrCompany.loancard"/>
        </dd>
        <dd>
          <h6>法定代表人：</h6>
          <input type=text value="${usrCompany.legalperson }" class="input-text" name="usrCompany.legalperson"/>
        </dd>
        <dd>
          <h6>注册地址：</h6>
          <label id="citys1"></label>
          <s:select id="province1" name="usrCompany.regprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province1','city1','district1');"/>
          <select id="city1" name="usrCompany.regcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district1" name="usrCompany.regdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>详细地址：</h6>
          <input type=text value="${usrCompany.regaddress }" class="input-text" style="width:534px;" name="usrCompany.regaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrCompany.regpostcode }" class="input-text" name="usrCompany.regpostcode"/>
        </dd>
        <dd>
          <h6>注册日期：</h6>
          <input type=text value="${usrCompany.registerdate }" class="input-text" name="usrCompany.registerdate"/>
          <h6>注册资本：</h6>
          <input type=text value="${usrCompany.registeredcapital }" class="input-text" name="usrCompany.registeredcapital"/>
          &nbsp;万元 </dd>
        <dd>
          <h6>企业类型：</h6>
          <label id="ctype1"></label>
          <s:select id="ctype11" name="usrCompany.enterprisetypeid" list="dataMap['companyType']" listKey="id" listValue="name"></s:select>
          <h6>员工人数：</h6>
          <label id="eloyee1"></label>
          <s:select id="eloyee11" name="usrCompany.employeesid" list="dataMap['companyTmployee']" listKey="id" listValue="name"></s:select>
        </dd>
        <dd>
          <h6>所属行业：</h6>
          <label id="indus1"></label>
          <s:select id="indus11" name="usrCompany.industryid" list="industryList" listKey="id" listValue="name"></s:select>
        </dd>
        <dd>
          <h6>经营范围：</h6>
          <textarea id="bizcope" rows=5 cols=60 name="usrCompany.bizscope">${usrCompany.bizscope }</textarea>
        </dd>
        <dd>
          <h6>企业经营地址：</h6>
          <label id="citys2"></label>
          <s:select id="province2" name="usrCompany.bizprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province2','city2','district2');"/>
          <select id="city2" name="usrCompany.bizcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district2" name="usrCompany.bizdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>详细地址：</h6>
          <input type=text value="${usrCompany.bizaddress }" class="input-text" style="width:534px;" name="usrCompany.bizaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrCompany.bizpostcode }" class="input-text" name="usrCompany.bizpostcode"/>
        </dd>
            </dl>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <hr width="90%" />
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="center" style="width:200px;">
              <input id="comm" type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="确认提交"/>
            </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
          </form>
        </div>
        <div class="xxkbox2">
          <form id="comForm" class="box_form" action="/user/Profile!update.act" method="post" >
            <dl>
			<dd  style="display:inline; padding-left:10px;">
				<input id="t" type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:100px;" value="保存修改" />
			</dd>
              <dd>
          <h6>法人姓名：</h6>
          <input type=text value="${usrCompany.linkname }" class="input-text" name="usrCompany.linkname"/>
        </dd>
        <dd>
          <h6>学历：</h6>
           <label id="lepduc1"></label>
          <s:select id="lepduc11" name="usrCompany.lpeducation" list="dataMap['eduAtion']" value="usrCompany.lpeducation" listKey="id" listValue="name"></s:select>
        </dd>
        <dd>
          <h6>婚姻状况：</h6>
          <label id="lpmarry1"></label>
          <s:select id="lpmarry11" name="usrCompany.lpmarry" list="dataMap['marry']" listKey="id" listValue="name"></s:select>
          <h6>从事所属行业年限：</h6>
          <label id="lpindus1"></label>
          <s:select id="lpindus11" name="usrCompany.lpindustryyears" list="dataMap['workYears']" listKey="id" listValue="name"></s:select>
        </dd>
        <dd>
          <h6>身份证号码：</h6>
          <input type=text value="${usrCompany.lpcid }" class="input-text" name="usrCompany.lpcid"/>
        </dd>
        <dd>
          <h6>手机：</h6>
          <input type=text value="${usrCompany.lpmobile}" class="input-text" name="usrCompany.lpmobile"/>
          <h6>家庭电话：</h6>
          <input type=text value="${usrCompany.lphometel }" class="input-text" name="usrCompany.lphometel"/>
        </dd>
        <dd>
          <h6>常住地址：</h6>
          <label id="citys3"></label>
          <s:select id="province3" name="usrCompany.lpliveprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province3','city3','district3');"/>
          <select id="city3" name="usrCompany.lplivecityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district3" name="usrCompany.lplivedistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${usrCompany.lpliveaddress }" class="input-text" style="width:534px;" name="usrCompany.lpliveaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrCompany.lplivepostcode }" class="input-text" name="usrCompany.lplivepostcode"/>
        </dd>
        <dd>
          <h6>户籍所在地：</h6>
          <label id="citys4"></label>
          <s:select id="province4" name="usrCompany.lphkprovinceid" list="listProvince" headerKey="0" headerValue="--请选择--" listKey="id" listValue="name" onchange="changeProvince('province4','city4','district4');"/>
          <select id="city4" name="usrCompany.lphkcityid" onchange="changeCity('city','district');"><option value="0">--请选择--</option></select>
          <select id="district4" name="usrCompany.lphkdistrictid"><option value="0">--请选择--</option></select>
        </dd>
        <dd>
          <h6>&nbsp;</h6>
          <input type=text value="${usrCompany.lphkaddress }" class="input-text" style="width:534px;" name="usrCompany.lphkaddress"/>
        </dd>
        <dd>
          <h6>邮编：</h6>
          <input type=text value="${usrCompany.lphkpostcode }" class="input-text" name="usrCompany.lphkpostcode"/>
        </dd>
            </dl>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <hr width="90%" />
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="center" style="width:200px;">
              <input id="comm" type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="确认提交"/>
            </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
          </form>
        </div>
        <div class="xxkbox2">
          <form id="comForm" class="box_form" action="/user/Profile!update.act" method="post" >
            <dl class="jy_info">
			<dd style="display:inline; padding-left:10px;">
				<input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:100px;" value="保存修改" />
			</dd>
              <dd>
                <h6>企业近1年经营成本约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;万元 </dd>
              <dd>
                <h6>企业近1年净利润率约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;% </dd>
              <dd>
                <h6>截止到今天，企业应收账款约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;万元 </dd>
              <dd>
                <h6>截止到今天，企业总库存约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;万元 </dd>
              <dd>
                <h6>截至到今天，企业总资产约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;万元 </dd>
              <dd>
                <h6>截至到今天，企业总负债约为：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;万元 </dd>
              <dd>
                <h6>最大下游客户与您的合作时长：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;年 </dd>
              <dd>
                <h6>第二大下游客户与您的合作时长：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;年 </dd>
              <dd>
                <h6>以上两家客户占您年销售额比率：</h6>
                <input type=text value="" class="input-text" />
                &nbsp;% </dd>
            </dl>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <hr width="90%" />
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="center" style="width:200px;">
              <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="保存修改" />
            </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
          </form>
        </div>
        <div class="xxkbox2">
			<form id="comForm" class="box_form" action="/user/Profile!update.act" method="post" >
				<dl class="jy_info">
					<dd  style="display:inline; padding-left:10px;">
						<input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:100px;" value="保存修改" />
					</dd>
				</dl>
			<!--box-->
			<div class="list">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="list_tb">
				  <tr>
					<td class="text_tt" width="20%">&nbsp;</td>
					<td class="text_tt" width="20%">2009年度</td>
					<td class="text_tt" width="20%">2010年度</td>
					<td class="text_tt" width="20%">2011年度</td>
				  </tr>
					<tr>
					<td class="text_lt">货币资金：</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="input" type="text" />
				万元</td>
					</tr>
				  <tr>
					<td class="text_lt">应收票据：</td>
					<td><input name="input2" type="text" />
				万元</td>
					<td><input name="input13" type="text" />
				万元</td>
					<td><input name="input24" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">应收帐款：</td>
					<td><input name="input3" type="text" />
				万元</td>
					<td><input name="input14" type="text" />
				万元</td>
					<td><input name="input25" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">预付帐款：</td>
					<td><input name="input4" type="text" />
				万元</td>
					<td><input name="input15" type="text" />
				万元</td>
					<td><input name="input26" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他应收款：</td>
					<td><input name="input5" type="text" />
				万元</td>
					<td><input name="input16" type="text" />
				万元</td>
					<td><input name="input27" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">存货：</td>
					<td><input name="input6" type="text" />
				万元</td>
					<td><input name="input17" type="text" />
				万元</td>
					<td><input name="input28" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他流动资产：</td>
					<td><input name="input7" type="text" />
				万元</td>
					<td><input name="input18" type="text" />
				万元</td>
					<td><input name="input29" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt" style="font-weight:bolder;">流动资产合计：</td>
					<td><input name="input8" type="text" />
				万元</td>
					<td><input name="input19" type="text" />
				万元</td>
					<td><input name="input30" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">固定资产：</td>
					<td><input name="input9" type="text" />
				万元</td>
					<td><input name="input20" type="text" />
				万元</td>
					<td><input name="input31" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">固定资产净值：</td>
					<td><input name="input10" type="text" />
				万元</td>
					<td><input name="input21" type="text" />
				万元</td>
					<td><input name="input32" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他长期资产：</td>
					<td><input name="input11" type="text" />
				万元</td>
					<td><input name="input22" type="text" />
				万元</td>
					<td><input name="input33" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt" style="font-weight:bolder;">资产总计：</td>
					<td><input name="input12" type="text" />
				万元</td>
					<td><input name="input23" type="text" />
				万元</td>
					<td><input name="input34" type="text" />
				万元</td>
				  </tr>
				</table>
				<div class="hr_10"> &nbsp; </div>
				<hr width="90%" />
				</div>
				<!--box-->
				<!--box01-->
			<div class="list">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="list_tb">
				  <tr>
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
				  </tr>
					<tr>
					<td class="text_lt">货币资金：</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="input" type="text" />
				万元</td>
					</tr>
				  <tr>
					<td class="text_lt">应收票据：</td>
					<td><input name="input2" type="text" />
				万元</td>
					<td><input name="input13" type="text" />
				万元</td>
					<td><input name="input24" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">应收帐款：</td>
					<td><input name="input3" type="text" />
				万元</td>
					<td><input name="input14" type="text" />
				万元</td>
					<td><input name="input25" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">预付帐款：</td>
					<td><input name="input4" type="text" />
				万元</td>
					<td><input name="input15" type="text" />
				万元</td>
					<td><input name="input26" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他应收款：</td>
					<td><input name="input5" type="text" />
				万元</td>
					<td><input name="input16" type="text" />
				万元</td>
					<td><input name="input27" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">存货：</td>
					<td><input name="input6" type="text" />
				万元</td>
					<td><input name="input17" type="text" />
				万元</td>
					<td><input name="input28" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他流动资产：</td>
					<td><input name="input7" type="text" />
				万元</td>
					<td><input name="input18" type="text" />
				万元</td>
					<td><input name="input29" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt" style="font-weight:bolder;">流动资产合计：</td>
					<td><input name="input8" type="text" />
				万元</td>
					<td><input name="input19" type="text" />
				万元</td>
					<td><input name="input30" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">固定资产：</td>
					<td><input name="input9" type="text" />
				万元</td>
					<td><input name="input20" type="text" />
				万元</td>
					<td><input name="input31" type="text" />
				万元</td>
				  </tr>
				</table>
				<div class="hr_10"> &nbsp; </div>
				<hr width="90%" />
				</div>
				<!--box01-->
				<!--box02-->
			<div class="list">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="list_tb">
				<tr>
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
				  </tr>
					<tr>
					<td class="text_lt">货币资金：</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="input" type="text" />
				万元</td>
					</tr>
				  <tr>
					<td class="text_lt">应收票据：</td>
					<td><input name="input2" type="text" />
				万元</td>
					<td><input name="input13" type="text" />
				万元</td>
					<td><input name="input24" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">应收帐款：</td>
					<td><input name="input3" type="text" />
				万元</td>
					<td><input name="input14" type="text" />
				万元</td>
					<td><input name="input25" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">预付帐款：</td>
					<td><input name="input4" type="text" />
				万元</td>
					<td><input name="input15" type="text" />
				万元</td>
					<td><input name="input26" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他应收款：</td>
					<td><input name="input5" type="text" />
				万元</td>
					<td><input name="input16" type="text" />
				万元</td>
					<td><input name="input27" type="text" />
				万元</td>
				  </tr>
				</table>
				<div class="hr_10"> &nbsp; </div>
				<hr width="90%" />
				</div>
				<!--box02-->
				<!--box03-->
			<div class="list">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="list_tb">
				<tr>
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
				  </tr>
					<tr>
					<td class="text_lt">货币资金：</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="input" type="text" />
				万元</td>
					</tr>
				  <tr>
					<td class="text_lt">应收票据：</td>
					<td><input name="input2" type="text" />
				万元</td>
					<td><input name="input13" type="text" />
				万元</td>
					<td><input name="input24" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">应收帐款：</td>
					<td><input name="input3" type="text" />
				万元</td>
					<td><input name="input14" type="text" />
				万元</td>
					<td><input name="input25" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">预付帐款：</td>
					<td><input name="input4" type="text" />
				万元</td>
					<td><input name="input15" type="text" />
				万元</td>
					<td><input name="input26" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他应收款：</td>
					<td><input name="input5" type="text" />
				万元</td>
					<td><input name="input16" type="text" />
				万元</td>
					<td><input name="input27" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">存货：</td>
					<td><input name="input6" type="text" />
				万元</td>
					<td><input name="input17" type="text" />
				万元</td>
					<td><input name="input28" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">其他流动资产：</td>
					<td><input name="input7" type="text" />
				万元</td>
					<td><input name="input18" type="text" />
				万元</td>
					<td><input name="input29" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt" style="font-weight:bolder;">流动资产合计：</td>
					<td><input name="input8" type="text" />
				万元</td>
					<td><input name="input19" type="text" />
				万元</td>
					<td><input name="input30" type="text" />
				万元</td>
				  </tr>
				</table>
				<div class="hr_10"> &nbsp; </div>
				<hr width="90%" />
				</div>
				<!--box03-->
				<!--box04-->
			<div class="list">
				<table width="80%" border="0" cellspacing="0" cellpadding="0" class="list_tb">
				<tr>
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
				  </tr>
					<tr>
					<td class="text_lt">货币资金：</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="" type="text" /> 万元</td>
					<td><input name="input" type="text" />
				万元</td>
					</tr>
				  <tr>
					<td class="text_lt">应收票据：</td>
					<td><input name="input2" type="text" />
				万元</td>
					<td><input name="input13" type="text" />
				万元</td>
					<td><input name="input24" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">应收帐款：</td>
					<td><input name="input3" type="text" />
				万元</td>
					<td><input name="input14" type="text" />
				万元</td>
					<td><input name="input25" type="text" />
				万元</td>
				  </tr>
				  <tr>
					<td class="text_lt">预付帐款：</td>
					<td><input name="input4" type="text" />
				万元</td>
					<td><input name="input15" type="text" />
				万元</td>
					<td><input name="input26" type="text" />
				万元</td>
				  </tr>
				</table>
				<div class="hr_10"> &nbsp; </div>
				<hr width="90%" />
				</div>
				<!--box04-->
			<div class="center" style="width:200px;">
			  <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="保存修改" />
			</div>
			<div class="hr_10"> &nbsp; </div>
			<div class="hr_10"> &nbsp; </div>
			</form>
		</div>
      </div>
    </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>