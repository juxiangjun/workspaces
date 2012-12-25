<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript" src="/script/jquery.vticker-min.js" > </script>
<script type="text/javascript">
$(function(){
	$('#ggdiv').vTicker({
      speed: 500,
      pause: 3000,
      showItems: 1,
      animation: 'fade',
      mousePause: false,
      height: 36,
      direction: 'up'
     });
});
</script>
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a href="/Index.act">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
      <s:if test="#session._user!=null">${session._user.realname} 您好，欢迎来到中国资金网！ | <a href="/Account!logout.act"> 退出</a>
      </s:if>
      <s:else>
        <a href="/Account.act"> 登录</a><a href="/Register.act">注册</a>
      </s:else> | <a href="/user/UserAction.act">用户中心</a>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
<div class="container_960">
    <div class="tab_menu index_nav">
      <ul>
        <li id="page_index_sel"><a href="/Index.act">首 页</a></li>
        <li id="page_loan_sel"><a href="/loan/LoanService.act">融资服务</a></li>
        <li id="page_finance_sel"><a href="/finance/financeProduct.act">理财产品</a></li>
        <li id="page_club_sel"><a href="/club/clubAction.act">融资俱乐部</a></li>
        <li id="page_news_sel"><a href="/news/InfoCenter.act">信息中心</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <s:action name="Gonggao" namespace="/news" executeResult="true"></s:action>
  </div>