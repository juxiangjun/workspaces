<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资申请查询</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script language="javascript">
    $(function() {
        $("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
    });
	function toPage(pageNum, pageSize){
		var url = '/pnr/pnrResource!findApply.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
		$('#userSearch').attr('action',url);
		$('#userSearch').submit();
	}
</script>


</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/partner/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	合作伙伴管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;融资申请查询
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">融资申请查询</div>
  <form id="userSearch" action="/pnr/pnrResource!findApply.act" method="post">
	<table style="width:100%;margin:20px;!important display:inline;">
		<tr>
			<td  align="right">申请时间:</td>
			<td  style="padding:5px;width:400px;">
				<s:textfield name="applySpModel.startDt" id="timeOne" readonly="readonly">
					<s:param name="value"><s:date name="applySpModel.startDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>~
				<s:textfield name="applySpModel.endDt" id="timeTwo" readonly="readonly">
					<s:param name="value"><s:date name="applySpModel.endDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>
				</td>
			<td  align="right">申请类型:</td>
			<td  style="padding:5px;">
				<common:select name="applySpModel.applyType" headerKey="" headerValue="--请选择类型--" valueSetId="32"></common:select>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit" value="查询" class="but_gray" style="width:100px;"/></td>
		</tr>
	</table>
  </div> 
  <div class="hr_10"> &nbsp; </div> 
        <table class="container_950 box_4">
	      <tr class="top_color">
            <td style="padding-left:25px;">申请编号</td>
            <td>申请类型</td>
            <td>申请金额</td>
            <td>申请时间</td>
            <td>状态</td>
          </tr>
          	<s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="top_color01">
				<td style="padding-left:25px;">${applyNum}</td>
				<td><common:print valueId="applyType"/></td>
				<td><s:number name="loanAmount" />万元</td>
				<td><s:date name="createdt" format="yyyy-MM-dd"/></td>
				<td><common:print valueId="applyStatus"/></td>
			</tr>
			</s:iterator>
			</s:if>
        </table>
    <div style="width:960px; margin:0 auto; text-align:right;">
       <s:include value="/public/pagination.jsp"/>
    </div>
    </form>
       <div class="container_950 box_4">
			<s:else>
			<div class="l_out">
					<p>
					抱歉！未查询到相符的结果
					</p>
					</div>
			</s:else>
       </div> 

<!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
