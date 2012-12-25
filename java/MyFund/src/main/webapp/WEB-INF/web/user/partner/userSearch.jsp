<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>推荐用户查询</title>
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
		var url = '/pnr/pnrResource!findUser.act?pager.currentPage=' + pageNum + "&pager.pageCount=" + pageSize;
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
  	合作伙伴管理&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;注册用户查询
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="container_950 box_4">
	<div class="P_title" style="border-bottom:5px solid #003961;">注册用户查询</div>
  <form id="userSearch" action="/pnr/pnrResource!findUser.act" method="post">
	<table style="width:100%;margin:20px;!important display:inline;">
		<tr>
			<td  align="right">注册时间:</td>
			<td  style="padding:5px;width:400px;">
				<s:textfield name="userSpModel.startDt" id="timeOne" readonly="readonly">
					<s:param name="value"><s:date name="userSpModel.startDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>~
				<s:textfield name="userSpModel.endDt" id="timeTwo" readonly="readonly">
					<s:param name="value"><s:date name="userSpModel.endDt" format="yyyy-MM-dd"/></s:param> 
				</s:textfield>
				</td>
			<td  align="right">用户类型:</td>
			<td  style="padding:5px;">
				<s:select name="userSpModel.userType" list="#{'-1':'--用户类型--','1':'个人','2-5':'企业'}" listKey="key" listValue="value"/>
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
            <td style="padding-left:25px;">帐号名</td>
            <td>姓名</td>
            <td>用户类型</td>
            <td>状态</td>
            <td>注册时间</td>
          </tr>
          	<s:if test="pager.data.size()>0">
		 	<s:iterator id ="item" value="pager.data">
			<tr class="top_color01">
				<td style="padding-left:25px;">${username}</td>
				<td>${realname}</td>
				<td>
					<s:if test="type==1">个人</s:if>
					<s:elseif test="type>=2 && type<=5">企业</s:elseif>
				</td>
				<td><s:if test="auditstatus==0">未审核</s:if><s:elseif test="auditstatus==1">待审核</s:elseif><s:elseif test="auditstatus==2">已审核</s:elseif></td>
				<td><s:date name="createdt" format="yyyy-MM-dd"/></td>
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
