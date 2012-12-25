<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script>
	function toPage(pageNo, pageCount) {
		$("#announcement").html("");
		$.post("/finance/fund!fundAnnouncement.act",{pageNo:pageNo,fundId:'${fundId}'},function(data){
			$("#announcement").html(data);
		});
	}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr class="top_color">
        <td class="capital_table_0">标题</td>
        <td class="capital_table_0">发布日期</td>
      </tr>
		<s:if test="pager.data.size()<0">
		  <tr class="capital_table" >
	        <td class="capital_table_0">暂无此相关信息。</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="pager.data">
	      <tr class="capital_table" >
	        <td class="capital_table_0"><div class="ellipsis_text_500" title="${title }" style="display: block;"><a target="_blank" href="http://${url}">${title }</a></div></td>
	        <td class="capital_table_0"><s:date name="issuedDate"/></td>
	      </tr>
		</s:iterator>
		<tr>
	      	<td colspan="3" style="line-height:40px;"><s:include value="/public/pagination.jsp"/></td>
      	</tr>
		</s:else>
</table>
