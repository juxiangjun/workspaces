<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>服务机构用户中心_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
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
  <div class="user_box">
    <div class="user_info fl"> <img class="user_logo fl" src="/images/member_logo.jpg" alt="${session._user.realname}" />
        <h6> ${typeName } </h6>
        <span id="ca"><a href="/" class="ca_on" title="通过CA证书认证"></a></span>
        <span id="mobile"><a href="/" class="mobile_off"></a></span>
        <span id="mail"><a href="/" class="mail_off"></a></span>
        <span id="vip"><a href="/" class="vip_off"></a></span>
      <div class="hr_10"> &nbsp; </div>
      <h6>${session._user.realname}</h6>
    </div>
    <div class="user_real fl">
      <h6>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else></h6>
      <p class="notice">您上次登录的时间为 <font color="#CC0000"><s:date name="usrLoginhistory.logindt" format="yyyy-MM-dd HH:mm:ss" /></font>，如有疑问请及时修改密码并联系客服。</p>
      <span class="msg">您有（<a href="/" class="red">0</a>）条新消息</span>
      <p>查看您的<a href="/user/Profile.act">服务机构信息</a>，编辑您的 <a href="/user/Profile.act" class="red">服务机构信息</a>。</p>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="grid_710">
    <div class="box_4 fl"><a href=""><img src="/images/member_adpic1.jpg" /></a></div>
    <div class="box_4 fr"><a href=""><img src="/images/member_adpic3.jpg" /></a></div>
    <div class="box_4" style="margin:0 auto; width:228px;"><a href=""><img src="/images/member_adpic2.jpg" /></a></div>
    <div class="hr_10"> &nbsp; </div>
    <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
      <caption>
      <span class="fr view_all"><a href="/service/serviceCenter!showPublisherOrders.act">查看全部»</a></span>
      <h6>服务订单</h6>
      </caption>
      <tr>
        <th>申请编号</th>
		<th>服务编号</th>
		<th>服务标题</th>
		<th>服务类型</th>
		<th>申请方名称</th>
		<th>申请时间</th>
		<th>状态</th>
      </tr>
		<s:iterator id="item" value="sinOrderList">
		<tr  class="gold_connect">
			<td>${item.orderNo }</td>
			<td>${item.serviceNo }</td>
			<td title="点击查看服务详情"><a href="/service/serviceCenter!showSinItemDetail.act?itemId=${item.itemId }">${item.itemTitle}</a></td>
			<td>${item.itemTypeName }</td>
			<td>${item.contactName }</td>
			<td><s:date name="#item.applyDate"/></td>
			<td id="status_${item.id}">
				<s:if test="#item.status==0">
		       		待确认
		       	</s:if>
		       	<s:if test="#item.status==1">
		       		已受理
		       	</s:if>
		       	<s:if test="#item.status==-1">
		       		已拒绝
		       	</s:if>
			</td>
		</tr>
		</s:iterator>
    </table>
    <div class="hr_10"> &nbsp; </div>
    <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
      <caption>
      <span class="fr view_all"><a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act">查看全部»</a></span>
      <h6>我发布的服务信息</h6>
      </caption>
      <tr>
        <th>服务主题</th>
		<th>服务类型</th>
		<th>费用范围</th>
		<th>服务区域</th>
		<th>发布日期</th>
		<th>截止日期</th>
		<th>审核状态</th>
      </tr>
		<s:iterator id="item" value="sinItemList">
		<tr  class="gold_connect">
			<td>${item.title }</td>
			<td>${item.typeName }</td>
			<td>${item.chargeRange }</td>
			<td>${item.regionName }</td>
			<td><s:date name="#item.issuedDate"/></td>
			<td><s:date name="#item.expiredDate"/></td>
			<td>
				<s:if test="#item.isAuthenticated==0">
					待审核
				</s:if> 
				
				<s:if test="#item.isAuthenticated==1">
					通过审核
				</s:if> 
				
				<s:if test="#item.isAuthenticated==2">
					未通过审核
				</s:if> 
				
				<s:if test="#item.isAuthenticated==-1">
					已取消
				</s:if> 
			</td>
		</tr>
		</s:iterator>
    </table>
    <div class="hr_10"> &nbsp; </div>
    <div class="box_4"><img src="/images/ad_708.jpg" /></div>
  </div>
  <div class="grid_230">
    <div class="menu_blue white"><span class="fr white"><a href="">更多»</a></span>
      <h6>我收到的服务订单</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
        <li><a href="">样式边框使用灰色；</a></li>
        <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
        <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
      </ul>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_blue white"><span class="fr white"><a href="">更多»</a></span>
      <h6>推荐理财产品</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
        <li><a href="">样式边框使用灰色；</a></li>
        <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
        <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
      </ul>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_blue white"><span class="fr white"><a href="">更多»</a></span>
      <h6>实用工具</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
        <li><a href="">样式边框使用灰色；</a></li>
        <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
        <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>