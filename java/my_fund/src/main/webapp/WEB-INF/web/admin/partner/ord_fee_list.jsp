<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery-ui-1.8.21.custom.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function(){
		$('.message').hide();
	})
	function ajaxsubmit(oid){
		$.ajax({
			url:'/admin/payment/ordfee!finish.act',
			dataType : 'json',
			data: {'ordFee.id': oid},
			cache : false,
			type : 'get',
			success : function(r){
				if(r){
					$(".message").html(r.msg);
					$(".message").show();
					$("#zf").html("已支付");
					$("#st").html("已完成");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$(".message").html(textStatus);
				$(".message").show();
			}
		})
	}
</script>
</head>
<body>

<div id="hld">
	<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
			<input type="hidden" name="pager.currentPage" id="current_page"/>
			<input type="hidden" name="pager.pageCount" id="page_count"/>
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>服务费管理</h2>
				</div>
				<div class="block_content">
					<div class="message success">
						ddd
					</div>
					<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
						<thead>
				     		<tr>
					            <th>费用类型</th>
					            <th>订单编号</th>
					            <th>费用金额</th>
					            <th>支付状态</th>
					            <th>支付日期</th>
					            <th>创建时间</th>
					            <th>状态</th>
					            <th>操作</th>
				          	</tr>
			          	</thead>
			          	<tbody>
						 <s:iterator id ="item" value="list" status="st">
							<tr id="item_${item.id}" class="<s:if test="#st.even">odd</s:if><s:else>even</s:else>">
								<td><common:print valueId="#item.feeType" /> </td>
								<td style="width:120px;word-wrap:break-word;word-break:break-all;">${item.ordId}</td>
								<td>${item.feeAmount }元</td>
								<td id="zf"><s:if test="#item.paymentStatus==1">已支付</s:if><s:else>未支付</s:else></td>
								<td><s:date name="#item.paymentDate"/></td>
					   			<td><s:date name="#item.createDt"/></td>
					   			<td><s:if test="#item.status==0">有效</s:if><s:else>无效</s:else></td>
					   			<td id="st"><s:if test="#item.paymentStatus!=1">
					   				<input type="button" value="完成支付" onclick="ajaxsubmit('${item.id}')"/>
					   				</s:if>
					   				<s:else>已完成</s:else>
					   			</td>
							</tr>
						</s:iterator>
						</tbody>
				        </table>
					</div>
		</div>
				
   	</div>
 </div>


</body>
</html>
