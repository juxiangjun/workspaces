<%@ page language="java" contentType="utf-8; charset=UTF-8"%>
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
<link rel="stylesheet" href="/css/jquery-ui-1.8.21.custom.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery-ui-1.8.21.custom.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">
	    //隔行变色
	    $(function() {
	        $("table.gold-table tr:nth-child(even)").addClass("gold-table-altrow");
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
	    
	    
	    function showAssessmentPage(orderId) {
	    	$( "#dialog:ui-dialog" ).dialog( "destroy" );
			$( "#dialog-message" ).dialog({
				modal: true,
				buttons: {
					Ok: function() {
						assessment = $("#txtAssessment").attr('value');
						serviceLevel = $('input[name=serviceLevel]:checked', '#frmAssessment').val();
						var labelId = "#frmAssessment label[for='serviceLevel"+serviceLevel+"']";
						console.log(labelId);
						label = $(labelId).html();
						console.log(label);
						var url = "/service/serviceCenter!doAssessment.act";
						$.ajax({
							url: url,
							type: 'post',
							data: {orderId: orderId, serviceLevel: serviceLevel, serviceLevelDesc: label, assessment: assessment},
							contentType: 'application/x-www-form-urlencoded;charset=utf-8',
							success: function(data, status, response){
								var result = response.responseText;
								result = jQuery.parseJSON(result);
								if (result.status=='success'){
									$('#order_status_'+orderId).html('已结案');
									$('#order_operations_'+orderId).html('评价完成');
								} else {
									alert('操作失败,请重试!');
								}
							}
						});
						
						$( this ).dialog( "close" );
					}
				}
			});
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
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<!-- 当取得的结果值大于０,才显示下面的表格 -->
		<!-- 表格 -->
		<div class="hr_10"> &nbsp; </div> 
		<div class="M_box">
		   	<table border="0" cellspacing="0" cellpadding="0" style="width:100%"  >
		   		<tr class="BankProductHeader">
		   			<th>申请编号</th>
		   			<th>服务编号</th>
		   			<th>服务标题</th>
		   			<th>服务类型</th>
		   			<th>申请方名称</th>
		   			<th>申请时间</th>
		   			<th>状态</th>
		   			<th>操作</th>
		   		</tr>
		   		<s:if test="sinOrderList.size()>0">
			   		<s:iterator id="item" value="sinOrderList">
		  			<tr  class="gold_connect">
		  				<td><a href="/service/serviceCenter!showSinOrderDetail.act?orderId=${item.id}">${item.orderNo}</a></td>
		  				<td>${item.serviceNo }</td>
		  				<td>
		  					<label title="${item.itemTitle}">
								<s:if test="#item.itemTitle.length()>25">
			   						<a href="/service/serviceCenter!showSinOrderDetail.act?orderId=${item.id}"><s:property value="#item.itemTitle.substring(0,25)"></s:property>...</a>
			   					</s:if><s:else>
			   						<a href="/service/serviceCenter!showSinOrderDetail.act?orderId=${item.id}">${item.itemTitle}</a>
			   					</s:else>
			  				</label>
		  				</td>
		  				<td>${item.itemTypeName }</td>
		  				<td>${item.contactName }</td>
		  				<td><s:date name="#item.applyDate"/></td>
		  				<td id="order_status_${item.id}">
			          	<s:if test="#item.status==0">
			          		待确认
			          	</s:if>
			          	<s:if test="#item.status==-1">
			          		已拒绝
			          	</s:if>
			          	<s:if test="#item.status==1">
			          		已受理
			          	</s:if>
			          	<s:if test="#item.status==2">
			          		已结束
			          	</s:if>
			          </td>
			          <td id="order_operations_${item.id}">
				          	<s:if test="#item.status==1">
				          		<a href="javascript:showAssessmentPage(${item.id})">评价</a> &nbsp;
				          	</s:if>
				          	<s:else>
				          		--
				          	</s:else>
			          </td>
		  			</tr>
		  			</s:iterator>
		  		</s:if><s:else>
		  			<tr  class="gold_connect">
		  				<td colspan="8">无数据</td>
		  			</tr>
	  			</s:else>
			</table>
		  </div>
		  
		  <div style="width:960px; margin:0 auto; text-align:right;">
	        <div class="pages01">
	        	<s:if test="pagination.pages>0">
		            <label title="共0条">
		            第
		            <span>${pagination.current}</span>
		            页/共
		            <strong>${pagination.pages}</strong>
		            页
		            </label>
		            &nbsp;
		            <s:if test="pagination.pages>1">
			            <a href="/service/serviceCenter!showSinOrdersByApplicant.act?pageNo=${pagination.first}">&nbsp;首页&nbsp;</a>
			            <a href="/service/serviceCenter!showSinOrdersByApplicant.act?pageNo=${pagination.previous}">&nbsp;上一页&nbsp;</a>
			            <a href="/service/serviceCenter!showSinOrdersByApplicant.act?pageNo=${pagination.next}">&nbsp;下一页&nbsp;</a>
			            <a href="/service/serviceCenter!showSinOrdersByApplicant.act?pageNo=${pagination.last}">&nbsp;末页&nbsp;</a>
		            </s:if>
		        </s:if>
		    </div>
	     </div>
     
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
<div id="dialog-message" title="服务质量评价">
	<form id="frmAssessment">
	<s:radio id="serviceLevel" list="serviceLevelList" listKey="id" listValue="name" name="serviceLevel"></s:radio>
	<textarea id="txtAssessment" rows="7" cols="30"></textarea>
	</form>
</div>
</body>
</html>