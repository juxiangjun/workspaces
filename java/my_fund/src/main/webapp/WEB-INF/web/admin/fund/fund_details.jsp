<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基金详细信息</title>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/xheditor-1.1.14-zh-cn.min.js"></script>
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
	url="/admin/fund/fund!"+fundUrl+".act";
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
<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
		<div class="block">
		<div id="umsg" class="message success" style="display: none;"></div>
			<s:if test="msg!=null"><div class="message success">
			<p>${msg}</p>
			</div></s:if>
			<div class="block_head">
				<div class="bheadl"></div>
				<div class="bheadr"></div>
				<h2>产品管理 » 基金 » 基金详细信息</h2>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
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
			     				<span onclick="fundDetail('fundNav','fundNav');">基金净值</span>
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
			     				<div id="fundNav"  class="box_fund2"></div>
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
			  </div>
			<!-- .block_content ends -->
			<div class="bendl"></div>
			<div class="bendr"></div>
		</div>
	</div>
</div>
</div>
<!--头部结束-->
</body>
</html>
