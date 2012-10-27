<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Fund Home</title>
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
		function checkFundCode() {
			var tfFundCode = document.getElementById('tfFundCode');
			var value = tfFundCode.value()
			if (value == '' || value=='NaN') {
				return false;
			}
		}
	</script>
  </head>
  <body>
	<div class="header index_header"><jsp:include page="/public/head1.jsp" /></div>
	<div class="clear"> &nbsp; </div><div class="hr_10"> &nbsp; </div> 
	<div class="M_menu"><a href="#">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">未定义</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">未定义</a></div><br/>
	<div class="hr_10"> &nbsp; </div> 
	<div id="u82_rtf"><p style="text-align:center;">
		<span style="font-family:微软雅黑;font-size:20px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">${title.title}</span></p><p style="text-align:center;">
		<span style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;text-decoration:none;">&nbsp;</span></p>
		<p style="text-align:center;">
		<span style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">${title.source} &nbsp; &nbsp;&nbsp; ${title.author} &nbsp; &nbsp;&nbsp; ${title.issuedDate} </span></p>
	</div>
	<div id="u81_rtf" class="M_box"><p style="text-align:left;"><span style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">${content.contents }</span></div>
  </body>
  </html>
