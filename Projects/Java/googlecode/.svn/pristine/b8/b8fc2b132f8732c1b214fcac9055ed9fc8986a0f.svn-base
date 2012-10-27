<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a href="/Index.act">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
      <s:if test="#session._user!=null">您好，<a href="/user/UserAction.act">${session._user.realname}</a> | <a href="/Account!logout.act"> 退出</a>
      </s:if>
      <s:else>
        <a href="/Account.act"> 登录</a><a href="/Register.act">注册</a>
      </s:else> | <font color="#555">上海站<a href="#">▼</a></font>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
<div class="container_960">
    <div class="tab_menu index_nav">
      <ul>
        <li class="hover"><a href="/Index.act">首 页</a></li>
        <li><a href="/loan/LoanRequest!financingService.act">融资服务</a></li>
        <li><a href="/finance/financeProduct.act">理财服务</a></li>
        <li><a href="/news/helpCenter.act">信息中心</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="index_subnav" style="position:relative;">
      <div class="xxkbox"> <font class="fl" style="line-height:36px; font-weight:bold;">网站公告：</font>
        <ul class="fl" id="IssueList" style="height:24px;line-height:24px;overflow:hidden; margin-top:6px;width:800px;">
        <s:iterator value="#application.announcements" id="item">
        	<li>${item.title}</li>
        </s:iterator>
        </ul>
        <script language="JavaScript" type="text/javascript">Scroll('IssueList', 2000, 32, 24);//停留时间，相对速度（越小越快）,每次滚动多少，最好和Li的Line-height一致。</script> 
      </div>
      <div class="xxkbox"><a href="">企业融资贷款</a> | <a href="">个人消费贷款</a> | <a href="">个人经营贷款</a></div>
      <div class="xxkbox"><a href="/finance/fund!searchByType.act">基金</a> | <a href="">股票</a> | <a href="">期货</a> | <a href="/finance/bankProduct!getList.act">银行理财产品</a></div>
      <!-- <div class="xxkbox"><a href="/news/information.act?typeId=1">政府动态</a> | <a href="/news/information.act?typeId=2">金融资讯</a> | <a href="/news/information.act?typeId=3">中国资金网动态</a></div> -->
      <div class="xxkbox"><a href="/news/helpCenter.act">融资指南</a> | <a href="/news/helpCenter.act">法律政策</a> | <a href="/news/helpCenter.act">会员条款</a> | <a href="/news/helpCenter.act">申请流程</a></div>
    </div>
    
  </div>