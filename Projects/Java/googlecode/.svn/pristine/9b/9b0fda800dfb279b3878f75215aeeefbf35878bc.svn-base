<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>融资服务_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
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
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<!--tab-->
<div style="width:950px; margin:0 auto;">
	<div style="width:630px; height:1050px; float:left;">
    <div class="center" style="width:630px; height:358px; float:left; border : #d6d6d6 solid 1px;">
      <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover" >企业贷款</li>
          <li>个人贷款</li>
        </ul>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="xxkContent">
        <div class="xxkbox2" >
          <form class="box_form" action="/member.html">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>贷款类别：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="1">企业经营性贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款用途：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="1">购买原材料</option>
                  <option value="2">购买设备</option>
                  <option value="3">购买土地</option>
                  <option value="4">建造厂房</option>
                  <option value="5">对外投资</option>
                  <option value="6">发放或偿还其他债务</option>
                  <option value="7">其他</option>
                </select>
              </dd>
              <dd>
                <h6>贷款金额：</h6>
                <input type=text value="" class="input-text" />万元
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <input type=text value="" class="input-text" />个月
              </dd>
            <div style="margin-left:170px; margin-top:20px;">
              <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="搜素" />
            </div>              
            <div class="hr_10"> &nbsp; </div>
          </form>
        </div>
        <div class="xxkbox2">
          <form class="box_form" action="/member.html">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>贷款类别：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="1">个人综合消费贷款</option>
                  <option value="1">个人经营性贷款</option>
                  <option value="1">个人购房贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款用途：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="1">二级联动</option>
                </select>
              </dd>
              <dd>
                <h6>贷款金额：</h6>
                <input type=text value="" class="input-text" />万元
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <input type=text value="" class="input-text" />个月
              </dd>
              <dd>
              <h6>是否有抵押物：</h6>
              <input name="" type="radio" value="" />能提供
              <input name="" type="radio" value="" />无法提供
              </dd>
            <div class="center" style="margin-left:170px; margin-top:20px;">
              <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="搜素" />
            </div>              
            <div class="hr_10"> &nbsp; </div>
          </form>        
        </div>        
      </div>
      <div class="hr_10"> &nbsp; </div>
      <!--热门融资产品-->
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">热门融资产品</h6>
      </div>
      <div class="box_3" style="overflow:auto; height:auto; width: 628px">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table" width="600px">
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行-幸福时贷 年利率0.73%，无信用记录也可申请</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">平安银行-无抵押速贷 有1年以上房贷记录即可申请，当天放款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">宜信-薪薪贷 条件宽松，月打卡工资满2000元即可申请 </td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">工商银行-房屋按揭贷款 首套房8.5折，处理速度快</td>
              </tr>
              <tr>
                <td><img src="/images/icons/zg_icon.jpg" /></td>
                <td class="hot_connect">深圳发展银行-车贷 买二手车也可贷款，年利率0.82%起，无其他费用</td>
              </tr> 
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
      </div>
    </div>
      <!--热门融资产品-->
   <div class="hr_10"> &nbsp; </div>   
    <!--热门融资产品-->
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">热门融资服务</h6>
      </div>
     <div class="box_3" style="overflow:auto; height:auto; width: 628px;">
        <div class="hr_10" style="width: 100%;"> &nbsp; </div>
        <div class="hr_10" style="width: 100%;"> &nbsp; </div>
        <div class="qyrz-top" style="width: 580px;">
         <div style="width: 100%;"> 
         <table width="100%">
         <tr>
           <td colspan="2"><h6>上海百恩克商务咨询有限公司</h6></td>
         </tr>
         <tr>
           <td width="90%">百恩克秉着智慧和专业的知识为客户提供快捷、方便、实际、周到的贷款服务。</td>
           <td align="right"><input type="button" class="but_gray fr" value="详情"/></td>
         </tr>
         <tr>
           <td colspan="2">中介费1%～5%</td>
         </tr>
         <tr><td colspan="2">&nbsp;</td></tr>
         <tr>
           <td colspan="2"><h6>上海百恩克商务咨询有限公司</h6></td>
         </tr>
         <tr>
           <td width="90%">百恩克秉着智慧和专业的知识为客户提供快捷、方便、实际、周到的贷款服务。</td>
           <td align="right"><input type="button" class="but_gray fr" value="详情"/></td>
         </tr>
         <tr>
           <td colspan="2">中介费1%～5%</td>
         </tr>
         <tr><td colspan="2">&nbsp;</td></tr>
         <tr>
           <td colspan="2"><h6>上海百恩克商务咨询有限公司</h6></td>
         </tr>
         <tr>
           <td width="90%">百恩克秉着智慧和专业的知识为客户提供快捷、方便、实际、周到的贷款服务。</td>
           <td align="right"><input type="button" class="but_gray fr" value="详情"/></td>
         </tr>
         <tr>
           <td colspan="2">中介费1%～5%</td>
         </tr>
          </table>
         </div>
        </div>
        <div class="hr_10"> &nbsp; </div>
      </div>
      <div class="hr_10"> &nbsp; </div>
<!--news-->
    <div class="grid_350 box_4 fl" style="width:308px;height:134px; overflow:hidden; float:left; margin-right:10px;">
      <div class="menu_red white grid_350" style="width:308px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000;"><span class="fr"><a href="" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">融资资讯</h6>
      </div>
      <div class="xxkContent">
      	<s:iterator value="newsGroupTitles" id="list" status="st">
      		<s:if test="#st.first">
       	  		<ul class="xxkbox first new_li">
       	  			<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
       	  	</s:if>
			<s:else>
				 <ul class="xxkbox new_li">
		          	<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
			</s:else>
      	</s:iterator>
      </div>
    </div>
<!--news-->

<!--news-->
    <div class="grid_350 box_4 fl" style="width:308px;height:134px; overflow:hidden;">
      <div class="menu_red white grid_350" style="width:308px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000;"><span class="fr"><a href="" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">融资指南</h6>
      </div>
      <div class="xxkContent">
      	<s:iterator value="newsGroupTitles" id="list" status="st">
      		<s:if test="#st.first">
       	  		<ul class="xxkbox first new_li">
       	  			<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
       	  	</s:if>
			<s:else>
				 <ul class="xxkbox new_li">
		          	<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
			</s:else>
      	</s:iterator>
      </div>
    </div>
<!--news-->
    </div>
      <!--热门融资产品-->              
    </div>
  </div>
    <div style="width:310px; float:right;">
    <!--中间右边部分-->
    <div style="width:308px; height:356px; float:right; background:url(/images/shipin_img.jpg) 0 0 no-repeat; border:1px solid #CCC;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px; margin-top:310px; margin-left:60px;" value="立刻查阅详情" /></div>
    <div class="hr_10"> &nbsp; </div>
       <!--中间右边部分-->
<!--    <div style="width:308px; height:356px; float:right; background:url(/images/cy.jpg) 0 0 no-repeat; border:1px solid #CCC;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px; margin-top:310px; margin-left:60px;" value="立刻查阅详情" /></div>
    <div class="hr_10"> &nbsp; </div>-->
<!--    <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
      <h6>融资案例</h6>
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
    </div>-->
     <div class="grid_350 box_4 fl" style="width:308px;height:174px; overflow:hidden;">
     <div class="menu_red white"><span class="fr white"></span>
        <h6 class="white_dot">投资俱乐部</h6>
      </div>
    <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover" style="width: 154px">找项目</li>
          <li style="width: 153px">找资金</li>
        </ul>
      </div>
      <div class="xxkContent">
      <div class="xxkbox2" style="display: block;">
        <a href="">[典当] 5000万典当金，手续齐全可当天放款</a><br/>
        <a href="">[担保] 提供上海地区专业房地产交易担保</a><br/>
        <a href="">[借贷] 专业短期抵押、无抵押贷款</a><br/>
        <a href="">[风险投资] 全国范围寻优质项目，无前期费用</a><br/>
        <a href="">[融资租赁] 为生产设备制造企业提供融资租赁</a><br/>
        </div> 
        <div class="xxkbox2">
        <a href="">[文化产业] 长沙17.5望城今典影城项目</a><br/>
        <a href="">[高新技术] 清大华创（日照）科技孵化器项目</a><br/>
        <a href="">[石油化工] 生物柴油生产技术与装置项目</a><br/>
        <a href="">[食品饮料] 国家星火计划项目寻求融资5000万</a><br/>
        <a href="">[建筑建材] 聚氨酯泡沫填缝剂技术</a><br/>
        </div>        
      </div>
      </div>
    <div class="hr_10"> &nbsp; </div>    
    <!--2111111-->
     <div style="width:308px; height:143px; float:right; background:url(/images/rz_bottom_img.jpg) 0 0 no-repeat; border:1px solid #CCC;"></div>
    <!--中间右边部分-->
    </div>  
  <script language="javascript"> 
  new PCAS("province","city","area");
  new PCAS("province1","city1","area1");
  new PCAS("province2","city2","area2");
  new PCAS("province3","city3","area3");
</script>
</div>
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
