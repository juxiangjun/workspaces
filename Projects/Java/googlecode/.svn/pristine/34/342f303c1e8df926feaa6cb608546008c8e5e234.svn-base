<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		form = document.getElementById("frmBankProduct");
		form.submit();
	}
</script>

</head>

<body>
<!--头部开始-->
<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="M_menu">
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">银行理财产品</a>
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_box">
  <s:form id="frmBankProduct" action="bankProduct!search.act" method="post" namespace="finance" cssClass="box_form">
  		<input type="hidden" id="pageNo" name="pageNo" />
    	<div class="M_box_out">
            <div class="M_box_top">
                <ul>
                	<li><span class="Title">产品状态</span>
                	
                     <s:select id="q0" name="query" list="productStatus" label="name" listValue="name" listKey="id" value="query[0]"></s:select>
          			</li>
                	<li><span class="Title">发行银行</span>
                      <s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name" value="query[1]"/>
          			</li>
                	<li><span class="Title">产品期限</span>
                     <s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id" value="query[2]"></s:select>
          			</li>
                	<li>
                    	<input type="submit" value="搜索" name="" style="width:100px; float:right;"/>
          			</li>
                </ul>
            </div>
            <div class="clear"> &nbsp; </div>
            <div class="M_box_top">
                <ul>
                	<li><span class="Title">年收益率</span>
                      <s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id" value="query[3]"></s:select>
          			</li>
                	<li><span class="Title">起购金额</span>
                      <s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id" value="query[4]"></s:select>
          			</li>
                	<li><span class="Title">产品名称</span>
                		<s:textfield id="q5" name="query" value="关键字" onclick="this.value=''"></s:textfield>
          			</li>
                	<li>
                    	<input type="reset" value="重置"  name="" style="width:100px; float:right;"/>
          			</li>
                </ul>
            </div>
        </div>
		<div class="clear"> &nbsp;</div>
        <div style="height:10px;"></div>
    </s:form>
  </div>
  <div class="hr_10"> &nbsp;</div>
  <div class="hr_10"> &nbsp;</div>
  <div class="M_box">
        <table border="0" cellspacing="0" cellpadding="0" style="width:100%" >
     		<tr class="BankProductHeader">
            <th>产品名称</th>
            <th>发行银行</th>
            <th>起销日期</th>
            <th>投资期限</th>
            <th>起点金额</th>
            <th>预期年收益率</th>
            <th>操作</th>

          </tr>
		 	<s:iterator id ="item" value="bankProductList">
			<tr  class="gold_connect">
				<td><a href="/finance/bankProduct!showDetails.act?code=${item.code}"> ${item.name} </a> </td>
	   			<td>${item.bank}</td>
	   			<td><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
	   			<td>${item.manageperiod}</td>
	   			<td>${item.minamount}</td>
	   			<td>${item.benefitrate}</td>
	   			<td><a href="/finance/bankProduct!showDetails.act?code=${item.code}">查看</a></td>
			</tr>
			</s:iterator>
        </table>
  </div>
   <div class="hr_10"> &nbsp;</div>
    <!--分页-->
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
           
        </div>
    </div>
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
