<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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

  </head>
  
  <body>
<!--头部2-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分开始-->
<div class="apply_title">
	<p>企业经营贷款快速申请</p>
	<div class="apply_menu">
        <div class="apply_menu_text0001">1、填写申请信息</div>
        <div class="apply_menu_text0002">2、完善需求</div>
        <div class="apply_menu_text0003">3、
        <s:if test="applyNum==null or applyNum==''">申请失败</s:if>
        <s:else>申请成功</s:else>
        </div>	
	</div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="S_table">
	<div class="S_table_icon"><img src="/images/S_icon.png" /></div>
	<div class="S_table_connect">
		<s:if test="applyNum==null or applyNum==''">
			<span class="Prompt_01">${msg}</span>
		</s:if>
		<s:else>		
			<span class="Prompt_01">恭喜您,您的贷款需求成功提交！</span><br/>
			<span class="Prompt_02">您的贷款需求编号为<a href=""><s:property value="applyNum"/></a>  ，您可以在您的用户中心在贷款需求管理中查看。</span><br/>
			<span class="Prompt_02">我们的工作人员将在1-3个工作日内与您进行联系。</span>
		</s:else>
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
	<div class="center" style="width:200px;">
	  <input type="button" onfocus="this.blur()" onclick="window.location='/user/UserAction.act'" class="but_gray" style="width:200px;" value="确定" />
	</div>
	<div class="hr_10"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div>
</div>
<!--主体部分结束-->
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
