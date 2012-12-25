<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
	function toPage(pageNo, pageCount) {
		$("#nav").html("");
		$.post("/admin/fund/fund!fundNav.act",{pageNo:pageNo,fundId:'${fundId}'},function(data){
			$("#fundNav").html(data);
		});
	}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr class="top_color">
        <td class="capital_table_0">日期</td>
        <td class="capital_table_0">单位净值</td>
        <td class="capital_table_0">累计净值</td>
      </tr>
		<s:if test="pager.data.size()<0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">暂无此相关信息。</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="pager.data">	
	      <tr class="capital_table" >
	        <td class="capital_table_0"><s:date name="navDate"/></td>
	        <td class="capital_table_0">${nav}</td>
	        <td class="capital_table_0">${accumulatedNav }</td>
	      </tr>
	      </s:iterator>
	      <tr>
	      	<td colspan="3" style="line-height:40px;"><s:include value="/public/pagination.jsp"/></td>
      	</tr>
		</s:else>
</table>
