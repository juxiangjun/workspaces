
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>服务机构用户中心_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
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
<script language="javascript">
		function changeSinItemStatus(itemId, isCancelled) {
			var url = '/service/serviceCenter!cancelSinItem.act?itemId='+itemId+'&isCancelled='+isCancelled;
			$.ajax({
				url: url
			}).done(
				function(data, status, response) {
					var text = jQuery.parseJSON(response['responseText']);
					if (text.status =='success') {
						var t1 = '#cancel_'+itemId;
						var t2 = '#user_status_'+itemId;
						$(t1).html("已取消");
						$(t2).html("已取消");
					} else {
						alert('操作失败');
					}
				}		
			);	
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
<!--主体部分-->
<div class="container_960">
	<!-- 菜单项 -->
	<div class="clear"> &nbsp; </div>
	<div class="M_menu">
	  		<a href="/service/serviceCenter!addInfo.act">发布新服务</a>
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<!-- 表格 -->
	<div class="M_BOX">
	   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%" class="gold-table">
	   		<tr class="BankProductHeader">
	   			<th>服务主题</th>
	   			<th>服务类型</th>
	   			<th>费用范围</th>
	   			<th>服务区域</th>
	   			<th>发布日期</th>
	   			<th>截止日期</th>
	   			<th>审核状态</th>
	   			<th>用户状态</th>
	   			<th>操作</th>
	   		</tr>
	   		<s:if test="sinItemList.size()>0">
		   		<s:iterator id="item" value="sinItemList">
	  			<tr  class="gold_connect">
	  				<td>${item.title }</td>
	  				<td>${item.typeName }</td>
	  				<td>${item.chargeRange }</td>
	  				<td>${item.regionName }</td>
	  				<td><s:date name="#item.issuedDate"/></td>
	  				<td><s:date name="#item.expiredDate"/></td>
	  				<td>
	  					<s:if test="#item.isAuthenticated==0">
	  						待审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==1">
	  						通过审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==2">
	  						未通过审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==-1">
	  						已取消
	  					</s:if> 
	  				</td>
	  				<td id="user_status_${item.id}">
	  					<s:if test="#item.isCancelled==1">
	  						已取消
	  					</s:if> 
	  					<s:if test="#item.isCancelled==0">
	  						已启用
	  					</s:if> 
	  				</td>
	  				<td id="cancel_${item.id}">
	  					<s:if test="#item.isAuthenticated==0 and #item.isCancelled==0">
	  						
	  						<a href="javascript:changeSinItemStatus(${item.id},1)">取消</a>
	  					</s:if> <s:else>
	  						<label title="审核过的服务不可以取消">--</label>
	  					</s:else>
	  				</td>
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
	 	<s:if test="pagination.pages>0">
        <div class="pages01">
	            <label title="共0条">
	            第
	            <span>${pagination.current}</span>
	            页/共
	            <strong>${pagination.pages}</strong>
	            页
	            </label>
	            <s:if test="pagination.pages>1">
	            &nbsp;
	            <a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act?pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
	            <a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act?pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
	            <a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act?pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
	            <a href="/service/serviceCenter!showServiceInfoHomeByPublisher.act?pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
	            </s:if>
	        </div>
	      </s:if>
     </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
