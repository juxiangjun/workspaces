<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
$(function() {
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkboxmenu').eq(nb).show().siblings().hide();
    });
});
</script>
<div class="container_960 top">
	<div class="fl logo">
    	<h1><a  href="/user/UserAction.act">中国资金网</a></h1>
	</div>
	<div class="fr logo_r">
		<div class="hr_10"> &nbsp; </div>
		<div class="user_menu">${session.PARTNER_USER.companyName} 您好，欢迎来到中国资金网！ | <a href="/pnr/pnrLogin!logout.act"> 退出</a>| <a href="/Index.act"> 网站首页</a></div>
		<div class="hr_10"> &nbsp; </div>
		<div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg"/></div>
	</div>
	<div class="clear"> &nbsp; </div>
</div>
<div class="container_960">
	<div class="tab_menu user_nav">
		<ul>
			<li><a href="/pnr/pnrResource!findUser.act">注册用户查询</a></li>
			<li><a href="/pnr/pnrResource!findApply.act">融资申请查询</a></li>
			<li><a href="/pnr/pnrResource!findFee.act">佣金结算查询</a></li>
	    </ul>
	</div>
</div>