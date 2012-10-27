<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>理财服务_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/mark.js"></script>
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/index.js"> </script>
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
<jsp:include page="/public/head1.jsp" />
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="container_960">
    <div class="grid_230">
		<div class="box_4 user_login fr">
      <div class="user_login_menu">
        <ul>
          <li id="list0" class="selected">银行理财</li>
          <li id="list1">基金理财</li>
        </ul>
      </div>
      <div class="clear"> &nbsp; </div>
      <!--<div class="notification attention png_bg"> <a href="#" class="close"><img src="../images/icons/cross_grey_small.png"  title="关闭此信息" alt="关闭" /></a>
        <div>这个是个错误信息提示框，需要时调用。</div>
      </div>-->
      <div class="clear"> &nbsp;</div>
      <div class="user_login_content">
        <div class="on" id="login-cont0">
          <s:form action="bankProduct!search.act" namespace="finance" cssClass="box_form1">
          	<input type="hidden" id="q0" name="query" value="0"/>
            <dl>
              <dd><h6>发行银行</h6>
              	<s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name"/>
              </dd>
              <dd><h6>产品期限</h6>
              	<s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id"></s:select>
              </dd>
              <dd><h6>年收益率</h6>
           		<s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id"></s:select>
              </dd>
              <dd><h6>起购金额</h6>
              		<s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id"></s:select>
			      	<input id="q5" name="query" maxlength="30" type="hidden"/>
              </dd>
            </dl>
          <div style="margin-left:70px; margin-top:10px;">
            <input  type="submit" value="搜索" class="but_gray" name="" style="width:100px;" />
          </div>            
          </s:form>
        </div>
        <div class="off" id="login-cont1">
          <form class="box_form1" action="/finance/fund!showHome.act">
            <dl>
              <dd><h6>基金类型</h6>
              		<s:select id="q10" name="query" list="fundTypeList" label="name" listValue="name" listKey="name"></s:select>
              </dd>
              <dd><h6>基金公司</h6>
					<s:select id="q11" name="query" list="fundFirmList"></s:select>
			  </dd>
              <dd><h6>代销银行</h6>
           			<s:select id="q12" name="query" list="bankList" label="name" listValue="name" listKey="name"/>
           		</dd>
            </dl>
          <div style="margin-left:70px; margin-top:10px;">
            <input  type="submit" value="搜索" class="but_gray" name="" style="width:100px;"/>
          </div>            
          </form>
        </div>
      </div>
    </div>
    <!--列表1开始-->
       <div class="hr_10"> &nbsp; </div>
       <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
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
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
        <li><a href="">样式边框使用灰色；</a></li>
      </ul>
    </div>
   <!--列表1结束-->
       <div class="hr_10"> &nbsp; </div>
    <div class="box_3"><img src="/images/img_jb.jpg" alt="1" /></div>
   </div>
    <div class="grid_710">
        <div class="focus box_4"> 
          <!-- size: 708px * 293px -->
            <div class="btn"> <span class="hov">1</span><span>2</span><span>3</span> </div>
            <div class="img"> <a href="/1"><img src="/images/focus.jpg" alt="1" /></a> <a href="/2"><img src="/images/focus.jpg" alt="2" /></a> <a href="/3"><img src="/images/focus.jpg" alt="3" /></a> </div>
        </div>
        <div class="hr_10"> &nbsp; </div>
           <!--中间部分开始-->
           <div class="F_main">
                <ul id = "lifirst">
                    <li class="tabin">银行理财</li>
                    <li>基金理财</li>
                </ul>
                <div class = "indiv contantfirst">
                <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th>产品名称</th>
                        <th>发行银行</th>
                        <th>起销日期</th>
                        <th>投资期限</th>
                        <th>起点金额</th>
                        <th>预期年收益率</th>
                      </tr>
                      <s:iterator id ="item" value="bankProductList">
					  <tr>
					  	<td title="${item.name}" ><a href="/finance/bankProduct!showDetails.act?code=${item.code}"><s:if test="%{null!=#item.name&&#item.name.length()>20}"><s:property value="%{#item.name.substring(0, 20)}" />..</s:if></a></td>
   						<td>${item.bank}</td>
   						<td><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
   						<td>${item.manageperiod}</td>
   						<td>${item.minamount}</td>
   						<td>${item.benefitrate}</td>
					</tr>
					</s:iterator>
                </table>    
                </div>
                <div class="contantfirst">
                <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th>产品名称</th>
                        <th>发行银行</th>
                        <th>起销日期</th>
                        <th>投资期限</th>
                        <th>起点金额</th>
                        <th>预期年收益率</th>
                      </tr>
                      <s:iterator id ="item" value="bankProductList">
					  <tr>
					  	<td><a href="/finance/bankProduct!showDetails.act?code=${item.code}"> ${item.name} </a> </td>
   						<td>${item.bank}</td>
   						<td><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
   						<td>${item.manageperiod}</td>
   						<td>${item.minamount}</td>
   						<td>${item.benefitrate}</td>
					</tr>
					</s:iterator>
                </table>                            
                </div>
           </div>
           <!--中间部分结束-->
          
           <!--列表2开始-->
            <div class="main02_box">
              <div class="main02_box_li">
                <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
                  <h6>热销产品</h6>
                </div>
                <div class="box_3">
                  <ul class="new_li">
                    <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
                    <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
                    <li><a href="">样式边框使用灰色；</a></li>
                    <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
                    <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
                  </ul>
                </div>
             </div>
              <div class="main02_box_li" style="float:right;">
                <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
                  <h6>理财资讯</h6>
                </div>
                <div class="box_3">
                  <ul class="new_li">
                  <s:iterator value="knwTitleList" id="item" status="st">
		       	  	<s:if test="#st.first">
		       	  		<li class="hover"> <a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a> </li>
		       	  	</s:if>
					<s:else>
						<li> <a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a> </li>
					</s:else>
		       	  </s:iterator>
                  </ul>
                </div>
              </div>
            </div>
           <!--列表2结束-->
           <div class="clear"> &nbsp; </div>
           <div class="hr_10"> &nbsp;</div>
           <div class="lc"><img src="/images/img_lc.jpg" /></div>
    </div>
</div>
<!--主体部分结束-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
