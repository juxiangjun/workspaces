<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>首页_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/index.js" > </script>
<style>
.focus { position:relative; width:708px; height:293px; overflow:hidden; }
.focus img.img { width:708px; height:293px; display:none; }
.focus img.img a { position:absolute; top:0; display:block; }
.focus .btn { position:absolute; z-index:100; bottom:5px; right:5px; }
.focus .btn span { float:left; text-align:center; background:#fff; cursor:pointer; width:16px; height:16px; line-height:16px; margin:3px 2px 0 2px; border:1px solid #fff; color:#9b0583; font-family:Arial; font-size:0.9em; }
.focus .btn span.hov { width:21px; height:21px; margin:0 2px; font-weight:bold; font-size:1.4em; background:#97181d; line-height:21px; border:1px solid #fff; color:#fff; }
</style>
</head>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="grid_230">
    <div class="box_4"><img src="/images/left_ad1.jpg" /></div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_red white"><span class="fr white"><a href="">更多</a>»</span>
      <h6>快速融资申请</h6>
    </div>
    <div class="box_3">
      <form action="/loan/LoanRequest!loanRequest.act" method="post" style="padding:15px;">
        <ul class="Fast-reg">
          <li>
            <label>融资类型</label>
            <select name="loan.applyType">
              <option value="136">企业经营快速申请</option>
              <option value="137">个人综合消费快速申请</option>
              <option value="138">个人经营快速申请</option>
              <option value="139">个人购房快速申请</option>
            </select>
          </li>
          <li>
            <label>贷款期限</label>
            <input type="text" name="loan.loanMonth" value="" style="width:135px;"/>
          </li>
          <li>
            <label>贷款金额</label>
            <input type="text" name="loan.loanAmount" value="" style="width:135px;"/>
          </li>
          <li style="text-align:center">
            <input  type="submit" value="立即申请" class="but_gray"  style="width:100px;" />
          </li>
        </ul>
      </form>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
      <h6>融资工具</h6>
    </div>
    <div class="hr_5"> &nbsp; </div>
    <div class="box_4 fl"><img src="/images/zxpg.jpg" /></div>
    <div class="box_4 fr"><img src="/images/cwfx.jpg" /></div>
    <div class="hr_5"> &nbsp; </div>
    <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
      <h6>融资案例</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <li><a href="">上海科发生物公司获得招商银行280万...</a></li>
        <li><a href="">上海欧特商务公司获得中国银行150万...</a></li>
        <li><a href="">上海宜品贸易公司获得工商银行380万...</a></li>
        <li><a href="">上海宜品贸易公司获得工商银行380万...</a></li>
        <li><a href="">上海立身有限公司获得招商银行380万...</a></li>
        <li><a href="">上海西里餐饮公司获得上海银行280万...</a></li>
      </ul>
    </div>
   <div class="hr_10"> &nbsp; </div> 
   <div class="h_images"><img src="/images/h_img.jpg" /></div>
  </div>
  <div class="grid_710">
    <div class="focus box_4"> 
      <!-- size: 708px * 293px -->
        <div class="btn"> <span class="hov">1</span><span>2</span><span>3</span> </div>
        <div class="img"> <a href="/1"><img src="/images/focus.jpg" alt="1" /></a> <a href="/2"><img src="/images/focus.jpg" alt="2" /></a> <a href="/3"><img src="/images/focus.jpg" alt="3" /></a> </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">企业融资服务</h6>
      </div>
      <div class="box_3 qyrz" style="height:auto;">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table">
              <tr>
                <td colspan="2" class="remen">热门融资产品</td>
              </tr>
              <tr>
                <td><img src="/images/icons/zg_icon.jpg" /></td>
                <td class="hot_connect">中国银行&nbsp;&nbsp;&nbsp;无担保贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/js_icon.jpg" /></td>
                <td class="hot_connect">建设银行上海分行&nbsp;&nbsp;&nbsp;中小企业无抵押速贷</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">平安银行&nbsp;&nbsp;&nbsp;信用贷款最高500万</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr>
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <hr style="width:90%" />
        <div class="qyrz-bot">
          <div class="qyrz-bot-l fl">
            <h6>集品餐饮基金</h6>
            <p>集品企联，只为优质餐饮企业量身定制的金融服务！创造餐饮行业的抱团价值，问题当然迎刃而解！</p>
            <span><a class="lchot" href="">了解详情</a></span> </div>
          <img class="fr" src="/images/sp.jpg" style="margin-top:10px;"/>
         </div>
        <div class="hr_10"> &nbsp; </div>
      </div>
    </div>
    <div class="grid_350 fr">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">金融理财产品</h6>
      </div>
      <div class="box_3 qyrz" style="height:auto;">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table">
              <tr>
                <td colspan="2" class="remen">最新理财产品</td>
              </tr>
              <tr>
                <td><img src="/images/icons/zg_icon.jpg" /></td>
                <td class="hot_connect">中国银行&nbsp;&nbsp;&nbsp;无担保贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/js_icon.jpg" /></td>
                <td class="hot_connect">建设银行上海分行&nbsp;&nbsp;&nbsp;中小企业无抵押速贷</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">平安银行&nbsp;&nbsp;&nbsp;信用贷款最高500万</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr>
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <hr style="width:90%" />
        <div class="qyrz-bot">
          <div class="qyrz-bot-l fl">
            <h6>理财产品类别</h6>
            <ul class="new_li" style="float:left; margin-right:60px;">
              <li><a href="">银行理财</a></li>
              <li><a href="">股票</a></li>
              <li><a href="">信托</a></li>
            </ul>
             <ul class="new_li">
              <li><a href="">基金</a></li>
              <li><a href="">私募</a></li>
              <li><a href="">保险</a></li>
            </ul>
          </div>
          <img class="fr" src="/images/jrlc2.jpg"  style="margin-top:10px;"/> </div>
        <div class="hr_5"> &nbsp; </div>
      </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="grid_350 box_4 fl" style="width:348px;height:134px; overflow:hidden;">
      <div class="menu_red white grid_350" style="width:348px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000;"><span class="fr"><a href="/news/knwTitle!showHome.act" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">新闻</h6>
      </div>
      <div class="xxkContent">
      	<s:iterator value="newsGroupTitles" id="list" status="st">
       	  		<ul class="xxkbox first new_li">
       	  			<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
      	</s:iterator>
      </div>
    </div>
    <div class="grid_350 box_4 fr" style="width:348px;height:134px; overflow:hidden;">
      <div class="menu_red white grid_350" style="width:348px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000;"><span class="fr"><a href="/service/serviceCenter!showServiceItemHome.act" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">服务</h6>
      </div>
      <div>
	     	<ul class="xxkbox first new_li">
		        <s:iterator id="item" value="serviceItemList" status="s">
		        	<li>
		        		<a href="/service/serviceCenter!showSinItemDetail.act?itemId=${item.id}">${item.typeName} | ${item.title}</a>
		        	</li>
		        </s:iterator>
	     	</ul>
      </div>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="links container_960">
  <div class="menu_gray2"> <span class="fr"><a href="/">银行保险</a> | <a href="/">机构</a> | <a href="/">担保机构</a></span>
    <h6>合作机构</h6>
  </div>
  <div class="box_3"> 
    <div class="hr_5"> &nbsp; </div>
    <ul class="bank_logo">
      <li><a href="/"><img src="/images/bank_logo/icbc.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/ccb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/boc.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/abc.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/bankcomm.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/bos.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/sdb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/cmb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/hxb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/cib.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/chinapost.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/gzcb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/njcb.png" /></a></li>
      <li><a href="/"><img src="/images/bank_logo/ecitic.png" /></a></li>
    </ul>
    <div class="hr_5"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>