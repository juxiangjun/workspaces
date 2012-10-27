<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>融资服务搜索结果页_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<style type="text/css">
#main { width:960px; font-size:12px; border:1px solid #FFC44C; margin:0 auto;}
#box1 { width:500px; height:80px; }
.box2 { border-top:#FFC44C solid 1px; width:500px; height:80px; border-bottom:1px #FFC44C solid; }
.boxS { border-top:#FFC44C solid 1px; width:500px; height:80px; border-bottom:1px #FFE6B3 solid;margin-bottom:1px; }
.filter { border-bottom:#FFE6B3 solid 1px; width:500px; margin-bottom:1px; display:none; }
.boxt { border-bottom:#FFE6B3 solid 1px; width:500px; margin-bottom:1px; display:block; }
#box4 { width:500px; height:5px; background:#FFF7E5; position:relative; }
#box4 span { width:80px; border:1px #FFC44C solid; position:absolute; left:40%; top:5px; background:#FFF7E5; border-top:none; text-align:center; cursor:pointer; }
</style>

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
    
    function search(){
		document.getElementById("financeBigamount").value = $('#financeLittleamount').val();
		document.getElementById("financeMostdt").value = $('#financeLittledt').val();
		var form = document.getElementById("searchForm");
		form.submit();
	}
    function clear(){
    	alert(22);
	}
</script>

</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
<!--融资服务搜索结果页-->
<div class="M_menu">
<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资服务</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">搜素结果</a>
</div>
<div class="hr_10"> &nbsp; </div> 
<!--main1-->
<s:form>
<div class="center container_960 box_4" style="height:150px;">
	<s:form id="searchForm" action="financeProduct!financeSearchDetail.act" namespace="loanadmin" method="post">
    <input name="product.financeBigamount" type="hidden" id="financeBigamount"/>
    <input name="product.financeMostdt" type="hidden" id="financeMostdt"/>
	<table style="margin-top: 20px;">
		<tr>
			<td width="25%" align="right">贷款用途:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="product.purposeType"/></td>
			<td width="25%" align="right">贷款金额:</td>
			<td width="25%" style="padding:5px;"><s:textfield id="financeLittleamount" name="product.financeLittleamount"/></td>
		</tr>
		<tr>
			<td width="25%" align="right">贷款期限:</td>
			<td width="25%" colspan="3" style="padding:5px;"><s:textfield id="financeLittledt" name="product.financeLittledt"/></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" onclick="search()" value="搜索" style="width:100px;"/>
				<input type="button" onclick="clear()" value="重置" style="width:100px;"/>
			</td>
		</tr>
	</table>
	</s:form>
</div>
<div class="hr_10"> &nbsp; </div>
<!--main1-->
<!--main2-->
	<script type="text/javascript">
		$(function () {
			var box_2 = document.getElementById("box2");
			var box_3 = document.getElementById("filter");
			var box_4 = document.getElementById("box4").getElementsByTagName("span")[0];
			box_4.onclick=function(){
				box_3.className=(box_3.className=="filter")?"boxt":"filter";
				box_2.className=(box_2.className=="boxS")?"box2":"boxS";
				this.innerHTML=(this.innerHTML=="更多搜索条件")?"收起":"更多搜索条件";
			}		
			//选中filter下的所有a标签，为其添加hover方法，该方法有两个参数，分别是鼠标移上和移开所执行的函数。
			$("#filter a").hover(
				function () {
					$(this).addClass("seling");
				},
				function () {
					$(this).removeClass("seling");
				}
			);


			//选中filter下所有的dt标签，并且为dt标签后面的第一个dd标签下的a标签添加样式seled。(感叹jquery的强大)
			$("#filter dt+dd a").attr("class", "seled"); /*注意：这儿应该是设置(attr)样式，而不是添加样式(addClass)，
														  不然后面通过$("#filter a[class='seled']")访问不到class样式为seled的a标签。*/       

			//为filter下的所有a标签添加单击事件
			$("#filter a").click(function () {
				$(this).parents("dl").children("dd").each(function () {
					$(this).children("div").children("a").removeClass("seled");
				});
				$(this).attr("class", "seled");
				alert(RetSelecteds()); //返回选中结果
			});
			alert(RetSelecteds()); //返回选中结果
		});

		function RetSelecteds() {
			var result = "";
			$("#filter a[class='seled']").each(function () {
				result += $(this).attr("id")+"\n";
			});
			
			return result;
		}
	</script>

</head>
<body>
	<s:form action="" method="post">
	<table class="container_960 center box_4">
	      <tr class="top_color">
	        <td style="padding-left:22px; font-size:14px;">推荐产品筛选条件</td>
	      </tr>
	</table>
	<div id="main">
	<div id="box1"></div>
  	<div id="box2" class="boxS"></div>
    <div id="filter"  class="filter" style="width:933px; padding:20px 0 30px 25px;">
        <dl>
            <dt>融资渠道：<input type="hidden" name="" value=""/></dt>
            <dd><div><a id="-1">不限</a></div></dd>
            <dd><div><a id="6">银行</a></div></dd>
            <s:iterator value="dataMap['finaceType']" >
            <dd><div><a id="<s:property value="id"/>"><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt>担保方式：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <s:iterator value="dataMap['mortgageType']" >
            <dd><div><a><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt>还款方式：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <s:iterator value="dataMap['repaymentType']" >
            <dd><div><a><s:property value="name"/></a></div></dd>
            </s:iterator>
        </dl>
        <dl>
            <dt>审批时间：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <dd><div><a>3天以内</a></div></dd>
            <dd><div><a>3-7天</a></div></dd>
            <dd><div><a>7-15天</a></div></dd>
            <dd><div><a>15-30天</a></div></dd>
        </dl>
        <dl>
            <dt>企业总资产：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <dd><div><a>不足100万</a></div></dd>
            <dd><div><a>100-300万</a></div></dd>
            <dd><div><a>300-500万</a></div></dd>
            <dd><div><a>500-1000万</a></div></dd>
            <dd><div><a>1000-5000万</a></div></dd>
            <dd><div><a>5000万及以上</a></div></dd>            
        </dl>
        <dl>
            <dt>企业年营业收入：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <dd><div><a>300万以下</a></div></dd>
            <dd><div><a>300~500万</a></div></dd>
            <dd><div><a>500~1000万</a></div></dd>
            <dd><div><a>1000~5000万</a></div></dd>
            <dd><div><a>5000~10000万</a></div></dd>
            <dd><div><a>10000万以上</a></div></dd>            
        </dl> 
        <dl>
            <dt>企业成立年数：<input type="hidden" name="" value=""/></dt>
            <dd><div><a>不限</a></div></dd>
            <dd><div><a>1年</a></div></dd>
            <dd><div><a>2年</a></div></dd>
            <dd><div><a>3年</a></div></dd>
            <dd><div><a>3年</a></div></dd>
            <dd><div><a>4年</a></div></dd>
            <dd><div><a>5年及以上</a></div></dd>            
        </dl>
    </div>
    <div id="box4"><span>更多搜索条件</span></div>
    </div>
    
    </s:form>
    
<!--main2-->
<div class="hr_10"> &nbsp; </div>
<!--main3-->
<table class="container_960 center box_4">
      <tr class="top_color">
        <td width="16%" style="padding-left:25px;">银行/项目</td>
        <td width="10%">总利息</td>
        <td width="15%">利率说明（年利率）</td>
        <td width="10%">还款方式</td>
        <td width="10%">担保方式</td>
        <td width="10%">放款时间</td>
        <td width="10%">产品特点</td>
        <td width="19%"><select name=""><option>默认排序</option><option>总利息</option></select></td>
      </tr>
      <s:iterator value="OrdFinanceProducts" id="product">
      <tr class="top_color01">
        <td width="16%" style="padding-left:25px;"><img src="/images/icons/zg_icon.jpg"  class="td_img"/>${product.financeName }</td>
        <td width="10%">${product.financeName }</td>
        <td width="15%">${product.interestType }</td>
        <td width="10%">${product.financeName }</td>
        <td width="10%">${product.financeName }</td>
        <td width="10%">${product.financeName }</td>
        <td width="10%">${product.financeName }</td>
        <td width="19%"><input  type="button" value="查看" class="but_gray" name="" style="width:80px;" /></td>
      </tr>
      </s:iterator>
</table>

<div class="hr_10"> &nbsp; </div>
<!--分页-->
<input type="hidden" id="pageNo" name="pageNo" />
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
            <input class="pages01_inp" type="text"/>
            <input class="pages01_btn" type="button" value="GO"/>
        </div>
    </div>
    </s:form>
	<!--分页-->
<!--main3-->
<!--融资服务搜索结果页--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<div class="footer">
  <div class="footer-nav"><a href="/">安全说明</a>|<a href="/">关于我们</a>|<a href="/">联系我们</a>|<a href="/">法律声明</a>|<a href="/">友情链接</a>|<a href="/">意见反馈</a>|<a href="/">隐私保密条款</a></div>
  <p class="copyright">客服热线：400123456  融资服务热线：021-60007888  理财服务热线：40084008<br />
    2012 <font style="font-family:'Arial';">&copy;</font> 版权所有 鼎辉信息技术（上海）有限公司</p>
</div>
<!--foot-->
</body>
</html>
