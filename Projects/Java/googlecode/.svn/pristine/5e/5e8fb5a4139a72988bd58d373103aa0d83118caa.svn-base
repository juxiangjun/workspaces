<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>信息中心_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/pcasunzip.js" > //省、市、地区联动选择JS封装类</script>
<script language="javascript">
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

//通用选项卡2
$(document).ready(function() {
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
    //} 
});

//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})
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
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="hr_10"> &nbsp; </div>
<div style=" width:958px; margin:0 auto;"><img src="/images/main.jpg"/></div>
<!--主体部分结束-->
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
