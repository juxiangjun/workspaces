<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>理财服务信息_中国资金网</title>
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
  </head>
  
  <body>
	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<!--主体部分-->
	<div class="container_960">
		<!-- 菜单项 -->
		
		<div class="M_menu">
		 	<a href="/service/serviceCenter!showServiceItemHome.act?typeId=0">全部</a>
					<s:iterator id ="item" value="sinTypeList">
						<a href="/service/serviceCenter!showServiceItemHome.act?typeId=${item.id}">${item.name}</a>&nbsp;&nbsp;
					</s:iterator>
		 </div>
	
		<div class="clear"> &nbsp; </div>
		<div class="hr_10"> &nbsp; </div> 
		<!-- 表格 -->
		<div class="M_box">
		   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%" class="gold-table">
		   		<tr class="BankProductHeader">
		   			<th>服务主题</th>
		   			<th>服务类型</th>
		   			<th>费用范围</th>
		   			<th>服务区域</th>
		   			<th>发布日期</th>
		   			<th>截止日期</th>
		   			<th>操作</th>
		   		</tr>
		   		<s:if test="sinItemList.size()>0">
			   		<s:iterator id="item" value="sinItemList">
		  			<tr>
		  				<td>${item.title }</td>
		  				<td>${item.typeName }</td>
		  				<td>${item.chargeRange }</td>
		  				<td>${item.regionName }</td>
		  				<td><s:date name="#item.issuedDate"/></td>
		  				<td><s:date name="#item.expiredDate"/></td>
		  				<td><a href="/service/serviceCenter!showSinItemDetail.act?itemId=${item.id}" >查看详情</a></td>
		  			</tr>
		  			</s:iterator>
		  		</s:if><s:else>
		  			<tr  class="gold_connect">
		  				<td colspan="7">无数据</td>
		  			</tr>
		  		</s:else>
			</table>
		  </div>
		  
		  <div style="width:960px; margin:0 auto; text-align:right;">
		 	<s:if test="#pagination.pages>0">
	        <div class="pages01">
		            <label title="共0条">
		            第
		            <span>${pagination.current}</span>
		            页/共
		            <strong>${pagination.pages}</strong>
		            页
		            </label>
		            <s:if test="#pagination.pages>1">
		            &nbsp;
		            <a href="/service/serviceCenter!showServiceItemHome.act?pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
		            <a href="/service/serviceCenter!showServiceItemHome.act?pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
		            <a href="/service/serviceCenter!showServiceItemHome.act?pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
		            <a href="/service/serviceCenter!showServiceItemHome.act?pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
		            </s:if>
		        </div>
		      </s:if>
	     </div>
	</div>
  </body>
</html>