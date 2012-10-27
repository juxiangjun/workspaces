<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="common" uri="/Common"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>企业经营贷款快速申请</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/index.js" > </script>
<script language="javascript">
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})

$(function(){
	$("#loanForm").validate();
});
</script>
  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分开始-->
<div class="apply_title" >
	<p>发布贷款产品</p>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="apply_form">
<form action="#" class="box_form" style="margin:0px;">
	<div class="C_title">产品参数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">${msg }</span></div>
	<div class="C_form">
            <dl>
              <dd>
                <h6>贷款产品名称：</h6>
                ${product.financeName}
              </dd>
              <dd>
                <h6>贷款类型：</h6>
                <common:print valueId="product.financeType" />
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                ${product.financeLittledt } ~ ${product.financeMostdt }
				</dd>
				<dd>
                <h6>贷款金额：</h6>
                ${product.financeLittleamount}~
                ${product.financeBigamount} &nbsp;&nbsp;万
				</dd>
			  <dd class="finance_type_154" style="display:none;" >
                <h6>房屋性质：</h6>
                <common:print valueId="product.houseProperty" />
              </dd>
              <dd class="finance_type_154" style="display:none;" >
                <h6>房屋使用年限：</h6>
                ${product.useTime}
              </dd>
				<dd>
                <h6>贷款利率：</h6>
				  <common:print valueId="product.interestType" />
				</dd>
				<dd>
					<div><!--利率浮动范围 --></div>
				</dd>
				<dd>
                <h6>支持还款方式：</h6>
				  <common:print valueId="product.repaymentType" />
				</dd>
				<dd class="finance_type_151 finance_type_152 finance_type_153">
                <h6>抵押类型：</h6>
				  <common:print valueId="product.mortgageType" />
				</dd>
				<dd>
                <h6>支持用途：</h6>
				  <common:print valueId="product.purposeType" />
				</dd>
				
				<dd class="finance_type_154" style="display:none;" >
                <h6>支持公积金：</h6>
                <common:print valueId="product.surplus" valueSetMap="ZJ102"/>
              </dd>

              
				<dd>
                <h6>审批时间：</h6>
                ${product.checkTime }
              </dd>
              <dd>
                <h6>面向区域：</h6>
                
              </dd>
			  
			 </dl>
			 
	</div>
	<div class="C_title">产品介绍</div>
	<div class="C_form">
		<dl>
           <dd>
             	<h6>贷款产品特色：</h6>
			  <common:print valueId="product.proSpecial" />
		   </dd>
			<dd>
                <h6>贷款产品介绍：</h6>
                ${product.proIntroduce }
              </dd>
		</dl>
	</div>
	<div class="C_title">申贷资料</div>
	<div class="C_form">
		<dl>
			<dd>
                <h6>申贷需要资料清单</h6>
              </dd>
              <dd>
              	<h6>资料递交方式：</h6>
				  <common:print valueId="product.uploadWay" />
			  </dd>
		</dl>
	</div>
	<div class="C_title">申请条件</div>
	<div class="C_form">
		<dl>
			  <dd>
                <h6>申请企业所属行业</h6>
              </dd>
              <dd class="finance_type_151 finance_type_152">
                <h6>企业的总资产：</h6>
                ${product.companyAllAsset}&nbsp;&nbsp;万元
              </dd>
              <dd class="finance_type_151">
                <h6>企业的年营业收入：</h6>
                <common:print valueId="product.operatIncome" valueSetMap="ZJ104"/>
              </dd>
              <dd class="finance_type_151">
                <h6>企业成立年数：</h6>
                <common:print valueId="product.settingYear" valueSetMap="ZJ105"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>保证金：</h6>
                <common:print valueId="product.needEnsure" valueSetMap="ZJ101"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>申请人行业经验：</h6>
                <common:print valueId="product.experience" valueSetMap="ZJ106"/>
              </dd>
              <dd class="finance_type_152" style="display:none;" >
                <h6>经营场所：</h6>
                <common:print valueId="product.runningArea" valueSetMap="ZJ103"/>
              </dd>
              
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>申请人月工资收入：</h6>
                <common:print valueId="product.salaryIncome" valueSetMap="ZJ107"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>工资发放形式：</h6>
                <common:print valueId="product.salaryPutWay" valueSetMap="ZJ108"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>现单位工作时长：</h6>
                <common:print valueId="product.workTime" valueSetMap="ZJ109"/>
              </dd>
              <dd class="finance_type_153 finance_type_154" style="display:none;" >
                <h6>所在地自有房产：</h6>
                <common:print valueId="product.house" valueSetMap="ZJ103"/>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>信用记录：</h6>
                <common:print valueId="product.creditAcount" valueSetMap="ZJ103"/>
              </dd>
              <dd class="finance_type_152 finance_type_153 finance_type_154" style="display:none;" >
                <h6>银行流水：</h6>
                <common:print valueId="product.bankSalaryList" valueSetMap="ZJ103"/>
              </dd>
              
              <dd>
                <h6>其他申请条件：</h6>
                ${product.otherRequire }
              </dd>
		</dl>
		<div class="hr_10"> &nbsp; </div>
			<div class="center" style="width:200px;">
			<input type="button" value="返回产品列表"  class="but_gray" onclick="" style="width:200px;"></input>
			</div>
			<div class="hr_10"> &nbsp; </div>
	</div>
</form>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
