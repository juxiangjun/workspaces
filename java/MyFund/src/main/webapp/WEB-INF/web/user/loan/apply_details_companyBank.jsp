<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户中心-融资管理-融资申请详情页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js"></script>
<script type="text/javascript" src="/script/jquery.metadata.js"> </script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript">
$(function(){
	$('#checkForm').validate();
	$('#checkForm2').validate();
	$('#checkForm3').validate();
	$('#checkForm4').validate();
	$('#checkForm5').validate();
	$('#checkForm6').validate();
	$('#checkForm7').validate();
	$('#checkForm8').validate();
	$('#timeOne').datepicker();
	$('#timeTwo').datepicker();
});
$(function(){
	var i = 0;
	var res = true;
	$(".upstatus").each(function(){
		var j = $(this).val();
		//所有的材料都审核过
		if(j=='213'||j=='214'||j=='216'||j=='218'){
			res = false;
			return false;
		}
	});
	if(res){
		$("#pass").hide();
		$("#unpass").hide();
	}
})
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
    //} 
});
function applyCancel(){
	//$("#loanForm").("action","/user/loan/financeAttach!selectCancel.act");
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		$("#loanForm").submit();
	}else{
		alert("请您选择操作数据！");
		return false;
	}
}
function allPass(){
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		if(confirm("确定所选资料审核通过吗？")){
			$("#loanForm").attr("action","/user/loan/financeAttach!allMaterialsPass.act");
			$("#loanForm").submit();
		}
	}else{
		alert("请您选择至少一条资料操作！");
		return false;
	}
}
function allUnPass(){
	var arrChk=$("input[name='ckbox']:checked");
	if(arrChk.length > 0){
		if(confirm("确定所选资料审核不通过吗？")){
			$("#loanForm").attr("action","/user/loan/financeAttach!allMaterialsUnPass.act");
			$("#loanForm").submit();
		}
	}else{
		alert("请您选择至少一条资料操作！");
		return false;
	}
}
function exportPdf(){
	window.location.href = "/user/loan/downloadAttach!downPdf.act?apply.id=${apply.id}";
}
$(function() {
	$("#selectall").bind("click",function() {
		if($(this).attr("checked")){
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', true);
			});
		}else{
			$("input[name='ckbox']").each(function() {
				$(this).attr('checked', false);
			});
		}
		
	});
})
$(function() {
	var j = new Date();
	var y = j.getFullYear() - 1;
	$('.year').html(y);
	var jm = j.getFullYear() + "年" + j.getMonth() + "月";
	$('.yearmoth').html(jm);
})
function all() {
		$.post('/user/loan/userApplyManag!applyCheckListByLoan.act', {
			applyId : $('#applyid').val()
		}, function(data) {
			$("#all_log").html(data);
		})
		$("#all_log").dialog({
			width : 800,
			modal : true
		});
	}
function print(appId){
	window.open('/user/loan/userApplyManag!print.act?print=1&apply.id='+appId)
}

function step1(){
	$("#step1").dialog({
		width : 600,
		modal : true
	});
}
function step2(){
	var res = true;
	var cont = "";
	var k = 0;
	$(".upstatus").each(function(){
		var j = $(this).val();
		//所有的材料都审核过
		if(j=='213'||j=='216'||j=='218'||j=='214'){
			cont = "请确认已审核完所有资料后再执行此操作！";
			res = false;
			return false;
		}else{
			//所有的材料都通过
			if(j=='215'){
				k++
			}
		}
	});
	
	if(res){
		if(k>0){
			$("#step2").dialog({
				width : 600,
				modal : true
			});
		}else{
			cont="请指定需要退回的资料后再执行此操作！";
			alert(cont);
		}
	}else{
		alert(cont);
	}
	
}
function step3(){
	var res = true;
	var cont = "";
	$(".upstatus").each(function(){
		var j = $(this).val();
		//所有的材料都审核过
		if(j=='213'||j=='216'||j=='218'||j=='214'){
			cont = "请确认已审核完所有资料后再执行此操作！";
			res = false;
			return false;
		}else{
			//所有的材料都通过
			if(j=='215'){
				cont = "已有资料退回，无法执行此操作！";
				res = false;
				return false;
			}
		}
	});
	if(res){
		$("#step3").dialog({
			width : 600,
			modal : true
		});
	}else{
		alert(cont);
	}
}
function step4(){
	$("#step4").dialog({
		width : 600,
		modal : true
	});
}
function step5(){
	$("#step5").dialog({
		width : 760,
		modal : true
	});
}
function stepRes1(){
	$('#check_view1').val($('#area1').val());
	$('#checkForm1').submit();
}
function stepRes2(){
	$('#check_view2').val($('#area2').val());
	$('#checkForm2').submit();
}
function stepRes3(){
	$('#check_view3').val($('#area3').val());
	$('#checkForm3').submit();
}
function stepRes4(){
	$('#check_view4').val($('#area4').val());
	$('#checkForm4').submit();
}
function stepRes5(){
	$('#check_view5').val($('#area5').val());
	$('#checkForm5').submit();
}

function downloadAttach(attachid){
	var url = "financeAttach!viewAttach.act";
	var param = {'attachId':attachid};
	$.post(url,param, function(data){
		var da = $('#downloadform');
		if(da.length == 0){
			da = $("<div id='downloadform'></div>");
		}else{
			da.remove();
			da = $("<div id='downloadform'></div>");
		}
		da.append(data);
		$('#download_attach').append(da);
		$('#download_attach').dialog({width:400,modal:true});
	}, 'html');
}

var row_count = 2; 
function addNewAttach() { 
	var table1 = $('#supplyAttachTable'); 
	var row = $("<tr></tr>"); 
	var str = "<td><input type='checkbox' name='newData' value='New'>资料" + row_count + "</td>";
	str += "<td><input type='text' name='saveAttachListSpModel.supplyName' class='input-text required'/></td>";
	str += '<td><input type="hidden" name="saveAttachListSpModel.supplyWay"/><input type="checkbox" name="supplyWayOnline" value="175"/>网上提交';
	str += '<input type="checkbox" name="supplyWayOffline" value="176"/>线下邮寄</td>';
	
	row.append($(str)); 
	table1.append(row); 
	row_count++; 
} 
function delAttach() 
{ 	
	var k=0;
	var checked = $("input[type='checkbox'][name='newData']"); 
	$(checked).each(function(){ 
		if($(this).attr("checked")){ 
			k++;
			if(confirm('确定删除所选资料吗？')){
				$(this).parent().parent().remove(); 
			}
		} 
	}); 
	if(k==0){
		alert("请选择需要删除的条目");
	}
} 
function submitNewAttach(){
	var swname = $("input[type='text'][name='saveAttachListSpModel.supplyName']");
	for(var i = 0; i < swname.size(); i++){
		if(swname.eq(i).val() == ''){
			alert('资料名称不能为空！');
			swname.eq(i).focus();
			return ;
		} 
	}
	
	var swValue = $("input[type='hidden'][name='saveAttachListSpModel.supplyWay']");
	var swOnline = $("input[type='checkbox'][name='supplyWayOnline']");
	var swOffline = $("input[type='checkbox'][name='supplyWayOffline']");
	for(var i = 0; i < swValue.size(); i++){
		if(swOnline.eq(i).attr("checked") == undefined && swOffline.eq(i).attr("checked") == undefined){
			alert('资料递交方式最少选择一种！');
			swOnline.eq(i).focus();
			return ;
		}
	}
	for(var i = 0; i < swValue.size(); i++){
		if(swOnline.eq(i).attr("checked")){
			swValue.eq(i).val("," + swOnline.eq(i).val());
		}
		if(swOffline.eq(i).attr("checked")){
			swValue.eq(i).val(swValue.eq(i).val()+ "," + swOffline.eq(i).val());
		}
		swValue.eq(i).val(swValue.eq(i).val()+ ",");
	}
	$('#supplyAttachForm').submit();
}
function showAddSupplyAttach(){
	$("#addSupplyAttach").dialog({
		width : 600,
		modal : true
	});
}

$(function(){
	/*
	$('.hid tr').each(function () {
		if($(this).attr("class")=="top_color01"){
			$(this).hide();
		}
	})*/
	$("#myhide").toggle(function(){
		$('.hid tr').show();
	},function(){
		$('.hid tr').each(function () {
			if($(this).attr("class")=="top_color01"){
				$(this).hide();
			}
		})
	})
})
function watchIt(id){
	$('#img_app').html("<img src='/user/loan/downloadAttach.act?type=0&falistId="+id+"'/>");
	$('#img_app').dialog({
		width : 700,
   		modal:true
	});
}	
function prdTemplate(applyId){
	var url = "/user/loan/supplyAttach.act";
	var param = {'applyId':applyId};
   	$.post(url,param, function(data){
   		$('#prdTemplateList').html(data);
   		$("#prdTemplateList").dialog({
    		width:700,
    		modal:true
    	});
   	}, 'html');
}
</script>

<style>
.ico_name{margin-right:20px; display:block;}
.sq_t {
	border-top: 1px solid #d6d6d6;
	border-right: 1px solid #d6d6d6;
	width: 700px;
	margin: 0 auto;
}

.sq_t th {
	background: #edf0ff;
	height: 28px;
	line-height: 28px;
	border-bottom: 1px solid #d6d6d6;
	border-left: 1px solid #d6d6d6;
}

.sq_t td {
	padding: 10px;
	border-bottom: 1px solid #d6d6d6;
	border-left: 1px solid #d6d6d6;
}

.ui-widget-header {
	border: 1px solid #225376;
	background: #225376 url(images/ui-bg_gloss-wave_0_97181d_500x100.png)
		50% 50% repeat-x;
	color: #ffffff;
	font-weight: bold;
}

.buchong_t{border:1px solid #ccc; margin: 0 auto;}
.buchong_t td{padding:5px; border-bottom:1px solid #ccc;}
.ico_name{margin-right:20px; display:block;}
.cs_table{border-top:1px solid #ccc; border-right:1px solid #ccc; width:750px;}
.cs_table td{border-bottom:1px solid #ccc; border-left:1px solid #ccc; padding:5px; padding-left:12px;}
</style>
</head>


<body>
	<!--头部-->
	<div class="header user_header">
		<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
		<div class="clear">&nbsp;</div>
	</div>
	<div class="hr_10">&nbsp;</div>
	<!--主体部分开始-->
	<div class="M_menu">
		融资管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a
			href="/user/loan/userApplyManag.act">融资申请管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查看
	</div>
	<div class="hr_10">&nbsp;</div>
	
<!-- start -->
<div class="container_950 box_4">
	<div class="P_title">融资申请详情页</div>
	<div class="line" style="background:#f9f9f7;">
		<div class="f_text01">
			<span>申请单号：${apply.applyNum}</span>
			<span>申请状态：<font color="d5652c"><common:print valueId="apply.applyStatus" /></font></span>
			<span style="padding-right:0px; float:right; margin-left: 5px; margin-right: 20px;"><input class="btnsub blue1" type="button" onclick="exportPdf()" value="导出申请单"></input></span>
		</div>
		<div class="hr_20"> &nbsp; </div>
		<div class="center">
			<div class="left_gray">&nbsp;</div>
			<s:if test="apply.applyStatus ==301 || apply.applyStatus ==303">
				<div class="m_gray1">企业信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_red">预审中</div>
				<div class="m_gray">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:if>
			<s:elseif test="apply.applyStatus ==302 || apply.applyStatus ==308">
				<div class="m_gray1">企业信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_red">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus >303 && apply.applyStatus <=305">
				<div class="m_gray1">企业信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交资料</div>
				<div class="m_red">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:elseif>
			<s:elseif test="apply.applyStatus>305 && apply.applyStatus<310 && apply.applyStatus!=308">
				<div class="m_gray1">企业信息</div>
				<div class="m_gray1">填写申请信息</div>
				<div class="m_gray1">预审中</div>
				<div class="m_gray1">提交资料</div>
				<div class="m_gray1">资金网审核</div>
				<div class="m_red">金融机构审核</div>
			</s:elseif>
			<s:else>
				<div class="m_gray">企业信息</div>
				<div class="m_gray">填写申请信息</div>
				<div class="m_gray">预审中</div>
				<div class="m_gray">提交资料</div>
				<div class="m_gray">资金网审核</div>
				<div class="m_gray">金融机构审核</div>
			</s:else>
			<div class="right_gray">&nbsp;</div>	
		</div>
		<div class="clear">&nbsp;</div>
		<div class="hr_10"> &nbsp; </div>
		<div>
			<div class="f_gz" style="margin-bottom:5px;"><span class="fl">申请单跟踪</span></div>
			<div class="hr_10"></div>
			<div class="clear">&nbsp;</div>
			<!--<div class="y_title">
				<span class="y_title_01">操作时间</span>
				<span class="y_title_01">操作人</span>
				<span class="y_title_01">处理信息</span>
			</div>
			<s:iterator value="applyCheckList">
			<div class="y_connect">
				<span class="y_title_01"><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss"/></span>
				<span class="y_title_01">${createUserName } &nbsp;</span>
				<span class="y_title_01">${checkView }</span>
			</div>
			</s:iterator>  -->
			<table border="0" cellspacing="0" cellpadding="0" class="y_table">
			  <tr>
			    <td class="y_table_title02" style="background:#ebe6b9; padding-left: 10px;">操作时间</td>
			    <td class="y_table_title02" style="background:#ebe6b9;">处理信息</td>			    
			    <td class="y_table_title02" style="background:#ebe6b9;">操作人</td>
			  </tr>
			  <s:iterator value="applyCheckList">
			  <tr>
			    <td class="y_table_title02" style="padding-left: 10px;"><s:date name="createdt" format="yyyy-MM-dd hh:mm:ss"/></td>
			    <td class="y_table_title02">${checkView }</td>			    
			    <td class="y_table_title02">${createUserName } &nbsp;</td>
			  </tr>
			  </s:iterator>
			</table>
			<a href="javascript:all();" style="float:right; margin-right: 40px;">更多..</a>			
			<div class="clear"> &nbsp; </div>									
		</div>		
	</div>
</div>
<!-- end -->
<div class="hr_10"> &nbsp;</div>
<!-- start -->
	<div class="container_950 box_6">
      <div class="menu_blue white"><h6>申请单详情</h6></div>
      <div class="f_box">
  
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">申请信息</span>
			<div class="y_connect">
				<span class="y_title_02">融资用途：<font color="d5652c"> <common:print valueId="apply.loanPurpose" /> &nbsp;${apply.loanPurposeOther }</font></span>
				<span class="y_title_02">金额：<font color="d5652c"><s:number name="apply.loanAmount" />万元</font></span>
				<span class="y_title_02">期限：<font color="d5652c">${apply.loanMonth}个月</font></span>
				<span>是否有抵押物：<font color="d5652c"><common:print valueId="apply.haveMortgage" valueSetMap="ZJ102" /></font></span>
			</div>
			<div class="hr_10"> &nbsp;</div>
			<div class="y_connect">
			<s:if test="apply.haveMortgage!=null&&apply.haveMortgage!=''">
				<s:if test="apply.mortgageType!=null">
				<span class="y_title_02">抵押物类型：<font color="d5652c"><common:print valueId="apply.mortgageType" /></font></span>
				</s:if>
				<s:if test="apply.mortgageWorth!=null">
				<span class="y_title_02">抵押物估值：<font color="d5652c">${apply.mortgageWorth }万元</font></span>
				</s:if>
			</s:if>
				<span class="y_title_02">申请产品：<font color="d5652c">${product.financeName }</font></span>
				<span class="y_title_02" >融资渠道：<font color="d5652c">${loanOrgName }</font></span>
			</div>
			<div class="clear">&nbsp;</div>			
			<div class="hr_20"> &nbsp;</div>
      	</div>
      	<div class="f_sqxx">
      		<span class="f_gz" style="margin-top:15px;">联系人信息</span>
			<div class="y_connect">
				<span class="y_title_02">联系人姓名：${ordCompany.linkname}</span>
				<span class="y_title_02">邮箱：${ordCompany.linkemail }</span>
				<span class="y_title_02">电话：${ordCompany.linktelephone }</span>
				<span class="y_title_02">所属部门：${ordCompany.department }</span>
				<span>职务：${ordCompany.position }</span>
			</div>
			<div class="hr_20"> &nbsp;</div>
      	</div> 
      	<div class="m_20">
      		<span class="f_gz" style="margin-top:15px;">申请方信息</span>
			<div>
				<div class="fl f_qyxx">
				    <div class="menu_out">
				      <div class="menu_nobg">企业信息</div>
				      <span>企业名称：${usrCompany.companyname }</span>
				      <span>营业执照号码：${usrCompany.licensecode }</span>
				      <span>组织机构代码证号码：${usrCompany.organizationcode }</span>
				      <span>税务登记证号码：${usrCompany.faxcode }</span>
				      <span>开户许可证号码：${usrCompany.bankpermitcode }</span>
				      <span>贷款卡号：${usrCompany.loancard }</span>
				      <span>企业类型：<common:print valueId="usrCompany.enterprisetypeid" /></span>
				      <span>员工人数：<common:print valueId="usrCompany.employeesid" /></span>
				      <span>经营范围：${usrCompany.bizscope }</span>
				      <span>企业经营地址：${profileMap['bizaddress'] } ${usrCompany.bizaddress }</span>
				      <span>邮编：${usrCompany.bizpostcode }</span>				      
				    </div>						
				</div>
				<div class="fr f_qyxx">
				    <div class="menu_out">
				      <div class="menu_nobg">法人信息</div>
				      <span>法定代表人：${usrCompany.legalperson }</span>
				      <span>学历：<common:print valueId="usrCompany.lpeducation" /></span>
				      <span>婚姻状况：<common:print valueId="usrCompany.lpmarry" /></span>
				      <span>从事所属行业年限：<common:print valueId="usrCompany.lpindustryyears" /></span>
				      <span>身份证号码：${usrCompany.lpcid }</span>
				      <span>手机：${usrCompany.lpmobile}</span>
				      <span>家庭电话：${usrCompany.lphometel }</span>
				      <span>常住地址：${profileMap['lpliveaddress'] } ${usrCompany.lpliveaddress }</span>
				    </div>
				</div>				
			</div>
			<div class="clear">&nbsp;</div>
      	</div>
      	
      	 <div class="f_sqxx">
			     <div class="y_connect">
			      <span class="f_gz" style="margin-top:15px;">企业经营信息</span>
			      <span>企业<font class="year"></font>年销售额约为：<font><s:number name="apply.lastyearSaleVolume" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>企业<font class="year"></font>年经营成本约为：<font><s:number name="apply.lastyearCost" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>企业<font class="year"></font>年净利润率约为：<font>${apply.lastyearProfit }&nbsp;&nbsp;%</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业应收账款约为：<font><s:number name="apply.receivable" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总库存约为：<font><s:number name="apply.stockSum" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总资产约为：<font><s:number name="apply.assetSum" />&nbsp;&nbsp;万元</font></span><br/>
			      <span>截止到<font class="yearmoth"></font>，企业总负债约为：<font><s:number name="apply.debtSum" />&nbsp;&nbsp;万元</font></span><br/>			      
			     </div>
			     <div class="hr_20"> &nbsp;</div>
		    </div>	
		 <s:if test="extendsValueList != null && extendsValueList.size() > 0">
		 <div>
		      <span class="f_gz" style="margin-top:15px;">其它信息</span>
		      <s:iterator value="extendsValueList">
		      <span>${fieldName }：<font>&nbsp;&nbsp;${entityValue }</font></span><br/>
		      </s:iterator>	
		      <div class="hr_10"> &nbsp;</div>				
		</div>
		</s:if>	     	     	
      </div>
    </div>  
<!-- end -->
<div class="hr_10"> &nbsp;</div>
<div class="container_950 center box_6 hid">
		<form action="/user/loan/financeAttach!selectCancel.act" id="loanForm" class="box_form" style="margin:0px;" method="post">
        <input type="hidden" id="applyid" name="applyId" value="${apply.id }">
        <input type="hidden" name="apply.id" value="${apply.id }">
        <table width="100%" border="0" cellspacing="0">
        <tr class="menu_blue white">
        <td colspan="3"><h6>申贷资料</h6></td>
		<td align="right"><a  href="javascript:void(0)" id="myhide" class="ico_name"><img src="/images/down_ico.png"/></a></td> 
        </tr>
     	<tr class="top_color">
     		<td width="32%" style="padding-left:25px;"><input type="checkbox" name="ckboxs" class="ckbox" id="selectall"/>全选&nbsp;资料名称</td>
            <td >递交方式</td>
            <td width="10%">状态</td>
            <td width="30%" align="center">操作</td>
        </tr>
        <% int num = 1; %>
        <s:iterator id ="item" value="attachList">
        <tr class="top_color01">
          <td style="padding-left:25px;"><s:if test="#item.uploadStatus!=212 && #item.uploadStatus!=215 && #item.uploadStatus!=217"><input type="checkbox" name="ckbox" class="ckbox" value="${item.id }"/></s:if>&nbsp;<%=num++ %>.&nbsp;${item.dataName }
						${item.supplyName }<input type="hidden" value="${item.uploadStatus }" class="upstatus"/></td>
          <td><common:print valueId="#item.supplyWay"/></td>
          <td><s:if test="#item.uploadStatus == 213 || #item.uploadStatus == 216 || #item.uploadStatus == 218"><font color="red"> <common:print valueId="#item.uploadStatus"/></font></s:if><s:else> <common:print valueId="#item.uploadStatus"/></s:else></td>
          <td align="right" class="view_detail01" style="padding-right:20px;">
	          <s:if test="#item.uploadStatus != 212">
			          <a href="javascript:void(0);" onclick="downloadAttach('${item.id}');">查看 </a>&nbsp;
			          
			  	<s:if test="#item.uploadStatus != 215 && #item.uploadStatus != 217 && apply.applyStatus==307">    	
			          <a href="javascript:void(0);" onclick="if(confirm('确定所选资料审核通过吗？')){window.location.href='/user/loan/financeAttach!eachMaterialsPass.act?apply.id=${apply.id}&ckbox=${item.id }'}">通过</a>
			          <a href="javascript:void(0);" onclick="if(confirm('确定退回所选资料退回吗？')){window.location.href='/user/loan/financeAttach!eachMaterialsUnPass.act?apply.id=${apply.id}&ckbox=${item.id }'}">退回</a>
			    </s:if>
		      </s:if>
		        <s:if test="#item.uploadStatus != 215 && #item.uploadStatus != 217 && apply.applyStatus==307">    	
			          <a href="javascript:void(0);" onclick="if(confirm('确定删除所选资料吗？')){window.location.href='/user/loan/financeAttach!selectCancel.act?apply.id=${apply.id}&ckbox=${item.id }'}" >删除</a>
			    </s:if>
          </td>          
        </tr>
        </s:iterator>
         <s:if test="apply.applyStatus==307">
        <tr class="top_color01">
          <td colspan="4" class="view_detail01" style="padding-left:25px;">
          	<input id="pass" type="button" class="but_gray" value="通过" onclick="allPass()"/>
          	<input id="unpass" type="button" class="but_gray" value="退回" onclick="allUnPass()"/>
          </td>     
        </tr> </s:if>                        
		</table>
		</form>
</div>
<div class="hr_20"> &nbsp;</div>


<div align="center">
	<s:if test="apply.applyStatus==306">
		<input class="btnsub blue1" type="button" onclick="step1()" value="收到申请"/>
	</s:if>
	<s:if test="apply.applyStatus==307">
		<input class="btnsub blue1" type="button" onclick="showAddSupplyAttach();" value="补充资料"/>
		<input class="btnsub blue1" type="button" onclick="step2()" value="退回修改资料"/>
		<input class="btnsub blue1" type="button" onclick="step3()" value="审核通过"/>
		<input class="btnsub blue1" type="button" onclick="step4()" value="审核不通过"/>
		<input class="btnsub blue1" type="button" onclick="prdTemplate('${apply.id }');" value="上传补充资料模版"/>
	</s:if>
	<s:if test="apply.applyStatus==308">
		<input class="btnsub blue1" type="button" onclick="showAddSupplyAttach();" value="补充资料"/>
		<input class="btnsub blue1" type="button" onclick="prdTemplate('${apply.id }');" value="上传补充资料模版"/>
	</s:if>
	<s:if test="apply.applyStatus==309">
		<input class="btnsub blue1" type="button" onclick="step5()"  value="放款"/>
	</s:if>
</div>
<!--尾部-->
<div class="hr_20"> &nbsp;</div>
<!--尾部-->
	<jsp:include page="/public/bottom.jsp" />
	
<!-- 弹出补充资料 -->
<div id="addSupplyAttach" style="display: none;" title="填写补充资料"> 
<form id="supplyAttachForm" action="/user/loan/addOrgAttach.act" method="post">
<table id="supplyAttachTable" width="95%" border="0" cellspacing="0" class="buchong_t">
	<tr>
		<td colspan="3" align="right">
			<input type="hidden" name="applyId" value="${apply.id }"/>
			<input type="button" value="删除" onclick="delAttach()" class="btnsub blue1"/>		
		</td>
	</tr>  
	<tr class="top_color">
		<td width="12%">&nbsp;</td>
		<td width="28%">名称</td>
		<td width="32%">递交方式</td>
	</tr>
	<tr>
		<td><input type='checkbox' name='newData' value='New'>资料1</td>
		<td><input type="text" name="saveAttachListSpModel.supplyName" class="input-text"/></td>
		<td><input type="hidden" name="saveAttachListSpModel.supplyWay"/>
			<input type="checkbox" name="supplyWayOnline" value="175"/>网上提交<input type="checkbox" name="supplyWayOffline" value="176"/>线下邮寄
		</td>
	</tr>
</table> 
<div class="hr_20"> &nbsp;</div>
<div class="hr_20"> &nbsp;</div>
<div align="center">
	<input type="button" value="继续补充资料" onclick="addNewAttach()" class="btnsub blue1"/>
	<input type="button" value="补充完成并提交" class="btnsub blue1" onclick="submitNewAttach();"></input>
</div>
</form>
</div> 
	
<!--弹出框内日志页面-->
	<div id="all_log" style="display:none;" title="查看全部日志信息："></div>
	
<!--弹出框接收到申请页面-->
	<div id="step1" title="填写接收到申请意见：" style="display: none;">
		<form action="/user/loan/userApplyManag!updateAccept.act" id="checkForm1" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="log.checkView" id="check_view1"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table>
				<tr>
					<td class="r_td" style="vertical-align: top;">接收到申请意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required {maxlength:150}" name="checkViewInput" id="area1">资金方正在对您的融资申请进行审核，请随时关注进展状况，谢谢！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认接收到申请" class="but_gray" onclick="stepRes1();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
<!--弹出框退回修改材料页面-->
	<div id="step2" title="填写退回修改材料意见：" style="display: none;">
		<form action="/user/loan/userApplyManag!updateMaterial.act" id="checkForm2" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="log.checkView" id="check_view2"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table class="cs_table">
				<tr>
					<td class="r_td" style="vertical-align: top;">退回修改材料意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required {maxlength:150}" name="checkViewInput" id="area2">抱歉，您提交的申贷资料不符合要求，请您重新提交，谢谢！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认退回修改材料" class="but_gray" onclick="stepRes2();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
<!--弹出框资金方审核通过页面-->
	<div id="step3" title="填写资金方审核通过意见：" style="display: none;">
		<form action="/user/loan/userApplyManag!updateSucc.act" id="checkForm3" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="log.checkView" id="check_view3"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table class="center">
				<tr>
					<td class="r_td" style="vertical-align: top;">资金方审核通过意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required {maxlength:150}" name="checkViewInput" id="area3">恭喜您，您的融资申请已通过资金方的审核，资金方将尽快放款，请注意查收！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" align="center">
						<input type="button" value="确认审核通过" class="but_gray" onclick="stepRes3();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
	 
<!--弹出框资金方审核不通过页面-->
	<div id="step4" title="填写资金方审核不通过意见：" style="display: none;">
		<form action="/user/loan/userApplyManag!updateFail.act" id="checkForm4" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="log.checkView" id="check_view4"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table class="center">
				<tr>
					<td class="r_td" style="vertical-align: top;">资金方审核不通过意见：</td>
					<td class="p_td"><textarea rows="5" cols="60" class="required {maxlength:150}" name="checkViewInput" id="area4">很遗憾，您本次融资申请未能通过资金方的审核。您可以再次申请或尝试本站其它融资方式，感谢您的理解和支持！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="2" class="r_td" align="center">
						<input type="button" value="确认审核不通过" class="but_gray" onclick="stepRes4();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
<!--弹出框放款页面-->
	<div id="step5" title="填写资金方放款意见：" style="display: none;">
		<form action="/user/loan/userApplyManag!updateFkuan.act" id="checkForm5" class="box_form" style="margin:0px;" method="post">
			<s:hidden name="apply.id"></s:hidden>
			<s:hidden name="log.checkView" id="check_view5"></s:hidden>
			<div class="hr_10"> &nbsp;</div>
			<table class="cs_table">
				<tr>
	              <td>合同编号：</td>
	              <td>
	               		<s:textfield name="appLoan.contractNum" cssClass="input-text required" id="appLoan_contractNum"></s:textfield>
	                	<label for="appLoan_contractNum" class="error" generated="true" style="display:none; float: left;"></label>		                
	               </td>
	              <td>借款方名称：</td>
	              <td>
		                <s:textfield name="appLoan.customerName" cssClass="input-text required"  id="appLoan_customerName"></s:textfield>
		                <label for="appLoan_customerName" class="error" generated="true" style="display:none;"></label>
	              </td>
	            </tr>
				<tr> 
	              <td>贷款金额(万元)：</td>
	              <td>
		                <s:textfield name="appLoan.loanAmount" cssClass="input-text required number"  id="appLoan_loanAmount"></s:textfield>
		                <label for="appLoan_loanAmount" class="error" generated="true" style="display:none; float: left;"></label>
	              </td>
	              <td>贷款期限(月)：</td>
		          <td>      
		                <s:textfield name="appLoan.loanMonth" cssClass="input-text required digits"  id="appLoan_loanMonth"></s:textfield>
		                <label for="appLoan_loanMonth" class="error" generated="true" style="display:none;"></label>
	              </td>
	            </tr>
				<tr>
	              <td>执行利率(%)：</td>
	              <td> 
		                <s:textfield name="appLoan.interestRate" id="appLoan_interestRate" cssClass="input-text required number" ></s:textfield>
		                <label for="appLoan_interestRate" class="error" generated="true" style="display:none; float: left;"></label>
	              </td>
	              <td>担保方式：</td>
	              <td>  	
	                	<common:select name="appLoan.mortgageType" cssClass="input-text " valueSetId="35"></common:select>
	              </td>
	            </tr>
				<tr>
	              <td>担保机构：</td>
	              <td>
	              	  	<s:textfield name="appLoan.mortgageOrg" id="appLoan_mortgageOrg" cssClass="input-text required"></s:textfield>
	               		<label for="appLoan_mortgageOrg" class="error" generated="true" style="display:none; float: left;"></label>
	              </td> 
	              <td>保证金：</td>
	              <td> 	
	                	<s:radio value="1" name="appLoan.ensureRate" list="%{#{1:'有',0:'无'}}" cssClass="required"></s:radio>
	              </td>
	            </tr>
				<tr>
	              <td>贷款发放日期：</td>
		          <td>      
		                <input type="text" name="appLoan.loanDate" id="timeOne" readonly="readonly" class="input-text required"/>
		                <label for="timeOne" class="error" generated="true" style="display:none; float: left;"></label>
	              </td> 
	              <td>贷款到期日期：</td>
	              <td>  
		                <input type="text" name="appLoan.loanEndDate"   class="input-text required" readonly="readonly" id="timeTwo"/>
		                <label for="timeTwo" class="error" generated="true" style="display:none;"></label> 
	              </td>
	            </tr>
				<tr>
	              <td>利息还款方式：</td>
	              <td>  	
	                	<common:select name="appLoan.interestWay" cssClass="input-text " valueSetId="55"></common:select> 
	              </td>
	              <td>本金还款方式：</td>
	              <td>	
	              		<common:select name="appLoan.capitalWay" cssClass="input-text required" valueSetId="43" onchange="paymentway(this.value)"></common:select>
				  </td>	
				</tr>
				<tr>
					<td class="r_td" style="vertical-align: top;">放款意见：</td>
					<td colspan="3" class="p_td"><textarea rows="5" cols="60" class="required {maxlength:150}" name="checkViewInput" id="area5">恭喜您，资金方已放款，请查收相关款项。感谢您对中国资金网的支持，祝您事业蒸蒸日上！
					</textarea><br />
					</td>
				</tr>
				<tr>
					<td colspan="4" class="r_td" style="vertical-align: top;" align="right">
						<input type="button" value="确认放款" class="but_gray" onclick="stepRes5();"></input>
					</td>
				</tr>
			 </table>
		</form>
	 </div>
<!-- 查看资料 --> 
	<div id="download_attach" style="display:none;" title="文件查看"></div>  
	
	<div id="img_app" style="display:none;" title="图片预览"></div>  
	
	<div id="prdTemplateList" style="display:none;" title="资料模版上传"></div>
</body>
</html>