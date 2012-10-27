<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>理财服务产品页_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script language="javascript">
    //隔行变色
    $(function() {
        $("table.gold-table tr:nth-child(odd)").addClass("gold-table-altrow");
    });

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
</script>

<style>
.focus { position:relative; width:708px; height:293px; overflow:hidden; }
.focus img.img { width:708px; height:293px; display:none; }
.focus img.img a { position:absolute; top:0; display:block; }
.focus .btn { position:absolute; z-index:100; bottom:5px; right:5px; }
.focus .btn span { float:left; text-align:center; background:#fff; cursor:pointer; width:16px; height:16px; line-height:16px; margin:3px 2px 0 2px; border:1px solid #fff; color:#9b0583; font-family:Arial; font-size:0.9em; }
.focus .btn span.hov { width:21px; height:21px; margin:0 2px; font-weight:bold; font-size:1.4em; background:#97181d; line-height:21px; border:1px solid #fff; color:#fff; }
</style>
<script type="text/javascript">
    $(function() {
        var index = 0;
		showImg(index);//初始化
        $(".focus .btn span").mouseover(function() {
            index = $(".focus .btn span").index(this);
            showImg(index);
        });
        //滑入停止动画，滑出开始动画.
        $('.focus').hover(function() {
            if (MyTime) {
                clearInterval(MyTime);
            }
        },function() {
            MyTime = setInterval(function() {
                showImg(index);
				index++;
                if (index == 3) {
                    index = 0;
                }
            },3000);
        });
        //自动开始
        var MyTime = setInterval(function() {
            showImg(index);
			 index++;
            if (index == 3) {
                index = 0;
            }
        },3000);
    })
    //关键函数：通过控制i，来显示不同的幻灯片
    function showImg(i) {
        $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
        $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
    }
</script>

<script language="javascript" >
	function doQuery(pageNo) {
		document.getElementById("pageNo").value = pageNo;
		form = document.getElementById("frmLoanManage");
		form.submit();
	}
</script>

</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资需求管理</a>
  </div>
  <s:form id="frmLoanManage" action="LoanRequest!loanManage.act" namespace="loan">
  <s:if test="userType==1">
  <div class="M_menu" style="margin-top: 20px; height: 220px;">
	<table style="margin-top: 20px;">
		<tr>
			<td width="25%" align="right">需求编号:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="loan.applyNum"/></td>
			<td width="25%" align="right">需求方名称:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="loan.busiName"/></td>
		</tr>
		<tr>
			<td width="25%" align="right">贷款用途:</td>
			<td width="25%" style="padding:5px;"><s:select  headerKey="" headerValue="--请选择类型--" name="loan.loanPurpose" list="dataMap['loanpurpose']"  listKey="id" listValue="name" ></s:select></td>
			<td width="25%" align="right">贷款类型:</td>
			<td width="25%" style="padding:5px;"><s:select headerKey="" headerValue="--请选择类型--" name="loan.companyType" list="dataMap['loantype']" listKey="id" listValue="name" ></s:select></td>
		</tr>
		<tr>
			<td width="25%" align="right">发布时间:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="loan.createdt"/></td>
			<td width="25%" align="right">需求金额:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="loan.loanAmount"/></td>
		</tr>
		<tr>
			<td width="25%" align="right">贷款期限:</td>
			<td colspan="3" style="padding:5px;"><s:textfield name="loan.loanMonth"/></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><s:submit value="筛选"/> </td>
			<td colspan="2" width="25%" style="padding:5px;" ><input type="button" onclick="doQuery()" value="查看全部"/> </td>
			
		</tr>
	</table>
  </div>
  </s:if>
  <div class="hr_10"> &nbsp; </div> 
  <div class="hr_10"> &nbsp;</div>
  <div class="M_box">
        <table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
     		<tr class="BankProductHeader">
            <th>贷款需求编号</th>
            <th>发布时间</th>
            <th>需求金额</th>
            <th>贷款用途</th>
            <th>贷款期限</th>
            <th>可接受利率</th>
            <th>有效期截止</th>
            <th>状态</th>
            <th>操作</th>

          </tr>
		 	<s:iterator id ="item" value="loans">
			<tr  class="gold_connect">
				<td>${item.applyNum}</td>
	   			<td><s:date name="#item.createdt" format="yyyy-MM-dd"/></td></td>
	   			<td>${item.loanAmount}万元</td>
	   			<td>${item.loanPurpose}</td>
	   			<td>${item.loanMonth}月</td>
	   			<td>年利率${item.rateUpperLimit}~${item.rateLowerLimit}%</td>
	   			<td>${item.effectiveDateend}</td>
	   			<td><common:print valueId="#item.applyStatus"/></td>
	   			<td class="view_detail"><a href="/loan/LoanRequest!loanManageDetail.act?industryId=${item.id }">查看</a></td>
			</tr>
			</s:iterator>
        </table>
  </div>
   <div class="hr_10"> &nbsp;</div>
    <!--分页-->
    
    <input type="hidden" id="pageNo" name="pageNo" />
    <div style="width:960px; margin:0 auto; text-align:center;">
        <div class="pages01">
            <label title="共0条">
            第
            <span>${pagination.current}</span>
            页/共
            <strong>${pagination.pages}</strong>
            页
            </label>
            &nbsp;
            <a href="javascript:doQuery(${pagination.first});">&nbsp;首页&nbsp;</a>
            <a href="javascript:doQuery(${pagination.previous});">&nbsp;上一页&nbsp;</a>
            <a href="javascript:doQuery(${pagination.next});">&nbsp;下一页&nbsp;</a>
            <a href="javascript:doQuery(${pagination.last});">&nbsp;末页&nbsp;</a>
            <input class="pages01_inp" type="text"/>
            <input class="pages01_btn" type="button" value="GO"/>
        </div>
    </div>
    </s:form>
	<!--分页-->
  <!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<div class="footer">
  <div class="footer-nav"><a href="/">安全说明</a>|<a href="/">关于我们</a>|<a href="/">联系我们</a>|<a href="/">法律声明</a>|<a href="/">友情链接</a>|<a href="/">意见反馈</a>|<a href="/">隐私保密条款</a></div>
  <p class="copyright">客服热线：400123456  融资服务热线：021-60007888  理财服务热线：40084008<br />
    2012 <font style="font-family:'Arial';">&copy;</font> 版权所有 鼎辉信息技术（上海）有限公司</p>
</div>
<!--foot-->
</body>
</html>
