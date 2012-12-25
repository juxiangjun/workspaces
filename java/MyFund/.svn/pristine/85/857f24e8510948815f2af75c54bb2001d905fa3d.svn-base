<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascrip" src="/script/public.js"> </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script type="text/javascript">
$(function(){
    $(".tab>h6>span").click(
        function(){
            $(this).addClass("current").siblings().removeClass("current");
            $(".tab>div").eq($(".tab>h6>span").index(this)).show().siblings("div").hide();
        }
    );
});
function fundDetail(fundUrl ,div){
	url="/finance/fund!"+fundUrl+".act";
	$.post(url,{fundId:'${fundId}'}, function(data){
		$("#"+div).html(data);
   	});
}
</script>
<style type="text/css">
*{margin:0; padding:0}
.tab{ margin:0 auto;}
h6{font-size:12px; height:31px; }
h6 span{float:left; padding:0 4px; display:inline; margin-right:2px; cursor:pointer;  background:#F9F9F7;line-height:30px; border:1px solid #ccc; position:relative; margin-bottom:-2px;}
.current{ color:red; position:relative; z-index:999; border-bottom:2px solid #fff; border-top:1px solid #ccc;border-left:1px solid #ccc;border-right:1px solid #ccc;background:#fff;}
.tab div{clear:both; display:none;}
.tab .block{display:block;}
.box_fund1{ border : #d6d6d6 solid; border-width :1px; overflow:hidden;min-height:300px;}
.box_fund2{ border : #d6d6d6 solid; border-width : 1px 1px 1px 1px; overflow:hidden;min-height:300px;}
.box_fund1 table {margin-bottom:20px; width:100%;}
.box_fund1 table th {background:#f9f9f7;width:100px;}
</style>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务详情页面开始-->
  <div class="M_menu">
  	<a href="/finance/financeProduct.act">理财服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/finance/fund!fundHome.act">基金产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;基金产品详情
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  <div class="tab M_out_L">
    <h6>
        <s:if test="fundTabs.size>0">
     		<s:iterator id="i" value="fundTabs">
     			<s:if test="#i==1">
     				<span class="current">基金概况</span>
     			</s:if><s:elseif test="#i==2">
     				<span onclick="fundDetail('fundManager','manager');">基金经理</span>
     			</s:elseif><s:elseif test="#i==3">
     				<span onclick="fundDetail('fundInvest','invest');">投资组合</span>
    			</s:elseif><s:elseif test="#i==4">
     				<span onclick="fundDetail('fundNav','nav');">基金净值</span>
     			</s:elseif><s:elseif test="#i==5">
     				<span onclick="fundDetail('fundFile','file');">基金文件</span>
     			</s:elseif><s:elseif test="#i==6">
     				<span onclick="fundDetail('fundDividend','dividend');">分红记录</span>
     			</s:elseif><s:elseif test="#i==7">
     				<span onclick="fundDetail('fundSales','sales');">销售机构</span>
     			</s:elseif><s:elseif test="#i==8">
     				<span onclick="fundDetail('fundCharge','charge');">基金费率</span>
     			</s:elseif><s:elseif test="#i==9">
     				<span onclick="fundDetail('fundRoi','roi');">业绩表现</span>
     			</s:elseif><s:elseif test="#i==10">
     				<span onclick="fundDetail('fundAnnouncement','announcement');">基金公告</span>
     			</s:elseif>
     		</s:iterator>
     	</s:if><s:else>
     		暂无此相关信息。
     	</s:else>
    </h6>
    <s:if test="fundTabs.size>0">
     		<s:iterator id="i" value="fundTabs">
     			<s:if test="#i==1">
     				<div class="block box_fund1" style="padding:20px 20px 0 20px;"><s:include value="/public/fund/_fund_fund.jsp"></s:include></div>
     			</s:if><s:elseif test="#i==2">
     				<div id="manager" class="box_fund1" style="padding:20px 20px 0 20px;"></div>
     			</s:elseif><s:elseif test="#i==3">
     				<div id="invest" class="box_fund1" style="padding: 20px;"></div>
     			</s:elseif><s:elseif test="#i==4">
     				<div id="nav"  class="box_fund2"></div>
     			</s:elseif><s:elseif test="#i==5">
     				<div id="file"  class="box_fund2">
	        </div>
     			</s:elseif><s:elseif test="#i==6">
     				<div id="dividend"  class="box_fund2">
	        </div>
     			</s:elseif><s:elseif test="#i==7">
     				<div id="sales"  class="box_fund1" style="padding:20px 20px 0 20px;">
	        </div>
     			</s:elseif><s:elseif test="#i==8">
     				<div id="charge"  class="box_fund1" style="padding:20px 20px 0 20px;">
	        </div>
     			</s:elseif><s:elseif test="#i==9">
     				<div id="roi"  class="box_fund1" style="padding:20px 20px 0 20px;">
	        </div>
     			</s:elseif><s:elseif test="#i==10">
     				<div id="announcement" class="box_fund2">
	        </div>
     			</s:elseif>
     		</s:iterator>
     	</s:if><s:else>
     		暂无此相关信息。
     	</s:else>
  </div>
  <div class="fr">
	<div class="M_out_right">
	 	<img src="/images/img_lcx_top.jpg" style="margin-bottom:10px;"/>
	</div>
    <div class="M_out_right_text">
    	<h1>热门理财产品</h1>
        <div class="box_3">
	        	<div class="qyrz-top" style="width : 230px;">
				    <table class="qyrz-top_table">
					  <s:iterator value="bankFinanceRecommendationList" id="item" >
					   <tr>
					     <td style="vertical-align: middle;">
							<s:if test="logo == null">
						        <img src="/images/banklogo/zj198.jpg" class="td_img" style="white-space: nowrap;"/>
					        </s:if>
					        <s:else>
					        	<img src="/images/banklogo/${item.logo}" class="td_img" style="white-space: nowrap;"/>
					        </s:else>
					     </td>
					     <td class="hot_connect">
					     	<a href="/finance/bankProduct!showDetails.act?id=${item.prodId}">
					     		<s:if test="#item.title != null && #item.title.length()>15">
									<s:property value="#item.title.substring(0,15)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
					     	</a>
					     </td>
					   </tr>
					  </s:iterator>
					</table>
			    </div>
	        </div>
    </div>
</div>    	  
  </div>
  <!--理财服务详情页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
