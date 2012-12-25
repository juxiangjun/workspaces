<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财产品_中国资金网</title>
<meta name="keywords" content="理财，理财产品，信托，信托产品，理财顾问，银行理财产品"/>
<meta name="description" content="找理财产品就上中国资金网!中国资金网在理财服务领域深耕多年，拥有丰富的经验和资源，与国内外多家银行及理财服务机构建立长期稳定的合作关系，可以为个人提供各种类型的理财服务。"/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/mark.js"></script>

<script type="text/javascript" src="/script/public.js"> </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script type="text/javascript">
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
function showNewsHome(typeId){
	url = "/news/Info!infoGroup.act?typeId="+typeId;
	window.location.href = url;
}

function showBankProductHome() {
	$("#frmSearchBankProduct").submit();
}
function showFundHome() {
	url = "/finance/fund!fundHome.act";
	window.location.href = url;
}
function selectTag(showContent,selfObj){
	// 切换标签
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 切换内容
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}
</script>

<style type=text/css>
/*tab 切换部分 */
ol li {
	MARGIN: 8px
}
#con {
	FONT-SIZE: 12px; MARGIN: 0px auto; WIDTH: 600px
}
#tags {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; WIDTH: 400px; PADDING-TOP: 0px; HEIGHT: 30px; font-size: 14px;
}
#tags li {
	BACKGROUND: url(images/tagleft.gif) no-repeat left bottom; FLOAT: left; MARGIN-RIGHT: 1px; LIST-STYLE-TYPE: none; HEIGHT: 30px;
}
#tags li a {
	PADDING-RIGHT: 12px; PADDING-LEFT: 12px; BACKGROUND: url(images/tagright.gif) no-repeat right bottom; FLOAT: left; PADDING-BOTTOM: 0px; COLOR: #fff; LINE-HEIGHT: 30px; PADDING-TOP: 0px; HEIGHT: 30px; TEXT-DECORATION: none
}
#tags li.emptyTag {
	BACKGROUND: none transparent scroll repeat 0% 0%; WIDTH: 4px
}
#tags li.selectTag {
	BACKGROUND-POSITION: left top; MARGIN-BOTTOM: -2px; POSITION: relative; HEIGHT: 25px
}
#tags li.selectTag a {
	BACKGROUND-POSITION: right top; COLOR: #000; LINE-HEIGHT: 30px; HEIGHT: 30px; background:#fff; 
}
.tagContent {
	DISPLAY: none; BACKGROUND: url(images/bg.gif) repeat-x; WIDTH: auto; COLOR: #474747; HEIGHT: 200px
}
#tagContent div.selectTag {
	DISPLAY: block
}

/* css截取字符 */
.ctl {
	table-layout: fixed;
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding: 2px;
}
/* 新更改部分 */
.hz_logo{padding:10px;}
.hz_logo td{padding:5px 10px;}
.width_228{width:228px; height:auto; overflow:hidden;}
.gj_bg{background:url('/images/gj_bg.jpg') 130px 60px no-repeat;}
.border_1{border:solid #d6d6d6; border-width:0 1px 1px 1px; overflow:hidden;}
.orange_bg{background:url('/images/orange_bg.gif') repeat-x; height:auto;}
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
    <div class="user_login fr" style="background: none; border:2px solid #c53b0d;">
      <div class="tabs_menu tab_menu2">
        <ul>
          <li class="hover">银行理财</li>
          <li>基金理财</li>
        </ul>
      </div>
      <div class="xxkContent">
        <div class="xxkbox2">
	      <div style="padding-bottom:20px;">
	          <form id="frmSearchBankProduct" action="/finance/bankProduct!search.act" class="box_form1" method="post">
	          	<input type="hidden" id="q0" name="query" value="0"/>
	            <dl>
	              <dd><h6>发行银行</h6>
	              	<s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name"/>
	              </dd>
	              <dd><h6>产品期限</h6>
	              	<s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id"></s:select>
	              </dd>
	              <dd><h6>年化收益率</h6>
	           		<s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id"></s:select>
	              </dd>
	              <dd><h6>起购金额</h6>
	              		<s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id"></s:select>
				      	<input id="q5" name="query" maxlength="30" type="hidden"/>
	              </dd>
	            </dl>
	          <div style="margin-left:70px;">
	            <input  type="submit" value="搜索" class="btnsub bred" name="" style="width:100px; height:25px; line-height:25px;" />
	          </div>
	          </form>            
	      </div>
        </div>
        <div class="xxkbox2">
	      <div style="padding-bottom:20px;">
	          <form action="/finance/fund!fundHome.act" class="box_form1" method="post">
	            <dl>
	              <dd><h6>基金公司</h6>
	              	<s:select name="companyName" list="compList" listKey="fullName" listValue="fullName" headerValue="不限" headerKey=""></s:select>
	              </dd>
	              <dd><h6>基金名称</h6>
	              <input name="fullName" type="text"  style="width:104px;"/>
	              </dd>
	              <dd><h6>基金代码</h6>
	           		<input name="fundCode" type="text" style="width:104px;"/>
	              </dd>
	            </dl>
	          <div style="margin-left:70px;">
	            <input  type="submit" value="搜索" class="btnsub bred" name="" style="width:100px; height:25px; line-height:25px;" />
	          </div>
	          </form>            
	      </div>
        </div>
      </div>
	</div>   
    <!--列表1开始-->
       <div class="hr_10"> &nbsp; </div>
        <div class="box_4 fl width_228">
          <div class="menu_red" style="border-bottom:3px solid #c53b0d; background-color:#f9f9f7; color: #424240;">
            <h6 style="font-weight:bolder; color: #c53b0d;">合作基金</h6>
          </div>
          <div class="hz_logo">
			<table >
				<tr>
					<td><a ><img src="/images/fund_logo_gf.jpg"/></a></td>
					<td><a ><img src="/images/fund_logo_htf.jpg"/></a></td>
				</tr>
				<tr>
					<td><a ><img src="/images/fund_logo_bs.jpg"/></a></td>
					<td><a ><img src="/images/fund_logo_by.jpg"/></a></td>
				</tr>
				<tr>
					<td><a ><img src="/images/fund_logo_js.jpg"/></a></td>
					<td><a ><img src="/images/fund_logo_ry.jpg"/></a></td>
				</tr>		
				<tr>
					<td><a ><img src="/images/fund_logo_stmg.jpg"/></a></td>
					<td><a ><img src="/images/fund_logo_zs.jpg"/></a></td>
				</tr>		
				<tr>
					<td><a ><img src="/images/fund_logo_ha.jpg"/></a></td>
					<td><a ><img src="/images/fund_logo_mg.jpg"/></a></td>
				</tr>								
			</table>
          </div>
        </div>
       
    <div class="hr_10"> &nbsp; </div>
    <div class="box_4 fl width_228">
      <div class="menu_red" style="border-bottom:3px solid #c53b0d; background-color:#f9f9f7; color: #424240;">
        <h6 style="font-weight:bolder; color: #c53b0d;">理财小工具</h6>
      </div>    
	    <div class="gj_bg">
	      <ul class="new_li">
	       	<jsp:include page="_financing_tools.jsp" />
	      </ul>
	    </div>
    </div>    
    <div class="hr_10"> &nbsp; </div>
    <div class="box_4 fl width_228">
	    <div class="menu_red" style="border-bottom:3px solid #c53b0d; background-color:#f9f9f7; color: #424240;"><span class="fr"><a href="javascript:showNewsHome(7)">更多»</a></span>
	      <h6 style="font-weight:bolder; color: #c53b0d;">理财资讯</h6>
	    </div>
	     <div>
	       <ul class="new_li">
	         <s:iterator value="financeInfoNews" id="item" status="st">
	      	  	<s:if test="#st.first">
	      	  		<li class="hover"> <a href="/news/Info.act?id=${item.id}">${item.title}</a> </li>
	      	  	</s:if>
				<s:else>
					<li > <a href="/news/Info.act?id=${item.id}">${item.title}</a> </li>
				</s:else>
	      	  </s:iterator>
	       </ul>
	     </div>
   </div>    
  
   <!--列表1结束-->
    <div class="hr_10"> &nbsp; </div>
 </div>
    <div class="grid_710">
        <div class="focus"> 
          <!-- size: 708px * 293px -->
            <div class="img"><a href="/finance/fund.act?jtype=1" class="fl" style="margin-right:10px;"><img src="/images/ad01.jpg"/></a><a href="/finance/fund.act?jtype=2" class="fl" style="margin-right:10px;"><img src="/images/ad02.jpg"/></a><a href="/finance/fund.act?jtype=3" class="fl" style="margin-right:10px;"><img src="/images/ad03.jpg"/></a><a href="/finance/bankProduct!showDetails.act?id=382"><img src="/images/ad04.jpg"/></a></div>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <!--main 2 -->
        <div class="grid_350 fl">
	      	<div class="menu_red" style="border-bottom:3px solid #c53b0d; background:none;">
	        	<h6 style="width:95px; height:30px; font-weight:bolder; background:#c53b0d;">银行理财</h6>
	      	</div>    
		    <div class="border_1" id="div_left">
		    <s:iterator value="bankRecommendationList">
			    <div class="orange_bg">
			      <ul class="new3_li">
			       	<li><span><a href="/finance/bankProduct!showDetails.act?id=${prodId }">${title }</a></span></li>
			       	 </ul>
			      <div style="margin-left: 23px;">${memo }</div>
			    </div>
		    </s:iterator>
		    </div>
	    </div>
	    <div class="grid_350 fr">
	      	<div class="menu_red" style="border-bottom:3px solid #c53b0d; background:none;">
        		<h6 style="width:95px; height:30px; font-weight:bolder; background:#c53b0d;">基金理财</h6>
	      	</div>    
		    <div class="border_1" id="div_right">
		    <s:iterator value="fundRecommendationList">
			    <div class="orange_bg">
			      <ul class="new3_li">
			       	<li><span><a href="/finance/fund!fundDetails.act?fundId=${prodId}&companyId=${bankId}">${title }</a></span></li>
			      </ul>
			      <div style="margin-left: 23px;">${memo }</div>
			    </div>
			 </s:iterator>
		    </div>
	    </div>
        <!--main 2-->
        <div class="hr_10"> &nbsp; </div>       
           <!--中间部分开始-->
           <div class="box_4" style="height:230px;"> 
                <div class="menu_red white" style="background:#c53b0d;">
					<ul id=tags>
					  <li class=selectTag><a onClick="selectTag('tagContent0',this)" href="javascript:void(0)">银行理财</a></li>
					  <li><a onClick="selectTag('tagContent1',this)" href="javascript:void(0)">基金理财</a></li>
					</ul>
					<!-- tab切换 -->
					<div id=tagContent>
						<div class="tagContent selectTag" id=tagContent0 style="width:708px;">
			                <table class="gold-table" style="border-top:0px; background:none;">
			                      <tr>
			                        <th style="background:none;">产品名称</th>
			                        <th style="background:none;">发行银行</th>
			                        <th style="background:none;">起销日期</th>
			                        <th style="background:none;">投资期限</th>
			                        <th style="background:none;">起购金额</th>
			                        <th style="padding-right: 10px; background:none;">预期年化收益率</th>
			                      </tr>          
			                      <s:iterator id ="item" value="bankProductList">  
								  <tr class="txt_content">
									  	<td style="padding-left: 20px;" title="${item.name}">
										  	<div class="ellipsis_text_220">
										  		<a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.id}"  style="color: #424240;">
										  			${item.name}
										  		</a>
										  	</div>
									  	</td>
				   						<td style="padding-left: 20px;"><div class="ellipsis_text_80" title="${item.bank}">${item.bank}</div></td>
				   						<td style="padding-left: 20px;"><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
				   						<td style="padding-left: 20px;">${item.manageperiod}</td>
				   						<td style="padding-left: 20px;">${item.minamount}</td>
				   						<td style="padding-left: 50px;">${item.benefitrate}%</td>
								</tr> 
								</s:iterator>
			        
			                </table>
			                <div><a href="javascript:showBankProductHome()" style="color:#424240; margin-right: 15px; margin-top:5px;" class="fr">更多»</a></div>    
						</div>
						<div class="clear">&nbsp;</div>
						<div class="tagContent" id=tagContent1>
			                <table class="gold-table" style="border-top:0px; background:none;">
			                      <tr>
			                        <th style="background:none; width:50px;">基金代码</th>
			                        <th style="background:none;">基金全称</th>
			                        <th style="background:none;">基金公司</th>
			                        <th style="background:none;">基金类型</th>
			                        <th style="background:none; width:80px;">基金经理</th>
			                        <th style="padding-right: 10px; background:none; width:80px;">成立日期</th>
			                      </tr>
		                      <s:if test="fundPager.data.size()<=0">
								  <tr class="txt_content" >
							        <td colspan="6">暂无此相关信息</td>
							      </tr>
							</s:if><s:else>
			                      <s:iterator id="item" value="fundPager.data">
								  <tr class="txt_content">
									  	<td style="padding-left: 20px;" title="${item.code}" >
										  	<div class="ellipsis_text_70"><a target="_blank" href="/finance/fund!fundDetails.act?fundId=${item.id}&companyId=${item.fundCompanyId}" style="color: #424240;">
										  	${item.code}</a></div></td>
				   						<td style="padding-left: 20px;" title="${item.fullName}"><div class="ellipsis_text_120"><a target="_blank" href="/finance/fund!fundDetails.act?fundId=${item.id}&companyId=${item.fundCompanyId}" style="color: #424240;">${item.fullName}</a></div></td>
				   						<td style="padding-left: 20px;" title="${item.fundCompanyName }"><div class="ellipsis_text_60">${item.fundCompanyName }</div></td>
				   						<td style="padding-left: 20px;"><div class="ellipsis_text_70">${item.catelogName}</div></td>
				   						<td style="padding-left: 20px;" title="${item.manager}">
						   						<div class="ellipsis_text_70">${item.manager}</div>
										</td>
				   						<td><div class="ellipsis_text_100">${item.issuedDate}</div></td>
								</tr> 
								</s:iterator>
		        		</s:else>
			                </table>
							<div><a href="javascript:showFundHome()" style="color:#424240; margin-right: 15px; margin-top: 5px;" class="fr">更多»</a></div> 			                 						
						</div>
					</div>
					<!-- tab切换 -->
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
					  	<td><a href="/finance/bankProduct!showDetails.act?id=${item.id}"> ${item.name}</a></td>
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
 </div>
</div>
<!--主体部分结束-->
<div class="hr_10">&nbsp;</div>
<jsp:include page="/public/bottom.jsp" />
 <script type="text/javascript">
   document.getElementById("div_right").style.height=document.getElementById("div_left").offsetHeight+"px";
  </script>
</body>
</html>
