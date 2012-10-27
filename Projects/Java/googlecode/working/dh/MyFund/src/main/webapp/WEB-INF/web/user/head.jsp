<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a  href="http://www.zj198.com">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
		您好，<a href="/user/UserAction.act">${session._user.realname}</a> | <a href="/Account!logout.act"> 退出</a></div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>

  
  <!-- 个人 -->
  <s:if test="#session._user.type==1">
  <div class="container_960">
    <div class="tab_menu user_nav">
      <ul>
        <li class="hover"><a href="/user/UserAction.act">中心首页</a></li>
        <li><a href="/">帐户管理</a></li>
        <li><a href="/">融资管理</a></li>
        <li><a href="/">服务管理</a></li>
		<li><a href="/">更多功能</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="user_subnav" style="position:relative;">
      <div class="xxkbox"></div>
      <div class="xxkbox"><a href="">账户信息</a> | <a href="">协议管理</a>| <a href="">付款管理</a> | <a href="">证书管理</a> | <a href="">信用评价</a> | <a href="">消息管理</a></div>
      <div class="xxkbox"><a href="">搜索融资产品</a> | <a href="/loan/LoanRequest!loanManage.act">融资需求管理</a> | <a href="">融资申请管理</a> | <a href="">贷后管理</a></div>
      <div class="xxkbox"><a href="">服务需求管理</a> | <a href="">服务订单管理</a></div>
      <div class="xxkbox"><a href="">项目信息管理</a></div>
      <img alt="" style="float: right; margin-bottom: 500px;position: absolute;margin-top: 10px;" src="/images/fenzhan.jpg">
  	</div>
  </div>
  </s:if>
  
  <!-- 银行 -->
  <s:if test="#session._user.type==6">
  <div class="container_960">
    <div class="tab_menu user_nav">
      <ul>
        <li class="hover"><a href="/user/UserAction.act">中心首页</a></li>
        <li><a href="/">账户管理</a></li>
        <li><a href="/">融资管理</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="user_subnav" style="position:relative;">
      <div class="xxkbox"></div>	
      <div class="xxkbox"><a href="">账户信息</a> | <a href="">协议管理</a> | <a href="">信用评价</a>| <a href="">消息管理</a></div>
      <div class="xxkbox"><a href="">融资产品管理</a> | <a href="/loan/LoanRequest!loanManage.act">融资需求管理</a> | <a href="">融资申请管理</a> | <a href="">贷后管理</a></div>
      <img alt="" style="float: right; margin-bottom: 500px;position: absolute;margin-top: 10px;" src="/images/fenzhan.jpg">
  	</div>
  </div>
  </s:if>
  
  <!-- 企业 -->
  <s:if test="#session._user.type>=2 && #session._user.type<=5">
  <div class="container_960">
    <div class="tab_menu user_nav">
      <ul>
        <li class="hover"><a href="/user/UserAction.act">中心首页</a></li>
        <li><a href="/">帐户管理</a></li>
        <li><a href="/">融资管理</a></li>
        <li><a href="/">服务管理</a></li>
        <li><a href="/">更多功能</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="user_subnav" style="position:relative;">
      <div class="xxkbox"></div>
      <div class="xxkbox"><a href="">账户信息</a> | <a href="">协议管理</a>| <a href="">付款管理</a> | <a href="">证书管理</a> | <a href="">信用评价</a> | <a href="">消息管理</a></div>
      <div class="xxkbox"><a href="">搜索融资产品</a> | <a href="/loan/LoanRequest!loanManage.act">融资需求管理</a> | <a href="">融资申请管理</a> | <a href="">贷后管理</a></div>
      <div class="xxkbox"><a href="">服务需求管理</a> | <a href="">服务订单管理</a></div>
      <div class="xxkbox"><a href="">项目信息管理</a></div>
      <img alt="" style="float: right; margin-bottom: 500px;position: absolute;margin-top: 10px;" src="/images/fenzhan.jpg">
    </div>
  </div>
  </s:if>
  
  <!-- 金融机构 -->
  <s:if test="#session._user.type>=7 && #session._user.type<=12">
  <div class="container_960">
    <div class="tab_menu user_nav">
      <ul>
        <li class="hover"><a href="/user/UserAction.act">中心首页</a></li>
        <li><a href="/">账户管理</a></li>
        <li><a href="/">融资管理</a></li>
        <li><a href="/">更多功能</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="user_subnav" style="position:relative;">
      <div class="xxkbox"></div>
      <div class="xxkbox"><a href="">账户信息</a> | <a href="">协议管理</a>| <a href="">付款管理</a>| <a href="">信用评价</a>| <a href="">消息管理</a></div>
      <div class="xxkbox"><a href="">融资产品管理</a> | <a href="">融资需求管理</a> | <a href="">融资申请管理</a> | <a href="">贷后管理</a></div>
      <div class="xxkbox"><a href="">资金信息管理</a></div>
      <img alt="" style="float: right; margin-bottom: 500px;position: absolute;margin-top: 10px;" src="/images/fenzhan.jpg">
  	</div>
  </div>
  </s:if>
  
  <!-- 服务机构 -->
  <s:if test="#session._user.type>=13">
  <div class="container_960">
    <div class="tab_menu user_nav">
      <ul>
        <li class="hover"><a href="/user/UserAction.act">中心首页</a></li>
        <li><a href="/">账户管理</a></li>
        <li><a href="/service/serviceCenter.act">服务管理</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="user_subnav" style="position:relative;">
      <div class="xxkbox"></div>
      <div class="xxkbox"><a href="">账户信息</a> | <a href="">协议管理</a>| <a href="">信用评价</a>| <a href="">消息管理</a></div>
      <div class="xxkbox"><a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act">服务产品管理</a>　|　<a href="/service/serviceCenter!showPublisherOrders.act">服务需求管理</a>　|　<a href="/">服务申请管理</a></div>
      <img alt="" style="float: right; margin-bottom: 500px;position: absolute;margin-top: 10px;" src="/images/fenzhan.jpg">
    </div>
  </div>
  </s:if>