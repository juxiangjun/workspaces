<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="1" cellspacing="0" cellpadding="0"> 
		<s:if test="fundManagerList.size<=0">
		  <tr >
	        <td colspan="3">暂无此相关信息。</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundManagerList">
			<tr>
				<td><img src='<s:if test="pic == null ">/images/icon_fund_head_img.png</s:if><s:else>http://${pic }</s:else>'/></td>
				<td width="2%">&nbsp;</td>
				<td style="vertical-align:top;">基金经理：${manager } ${gender } <br/> ${resume }</td>
			</tr>
			<tr>
				<td colspan="3"> <a target="_blank" href="/admin/fund/fund!editFundManager.act?detailId=${id }">修改</a></td>
			</tr>
	      </s:iterator>
		</s:else>
</table>
