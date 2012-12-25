<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="common" uri="/Common"%>
<div class="user_login01">
	<table class="M_box">
		<tr class="top_color" style="border-bottom:1px solid #d7d7d7; font-weight:bolder;">
			<th></th>
			<th>机构类型</th>
			<th>机构名称</th>
		</tr>
		<s:if test="bankList.size() > 0">
			<s:iterator value="bankList">
				<tr class="top_color01">
					<td style="text-align: center;"><input type="checkbox" name="userId" value="${userid }_${detailname }"/></td>
					<td style="text-align: center;">银行</td>
					<td style="text-align: center;">${detailname }</td>
				</tr>
			</s:iterator>
		</s:if>
		<s:iterator value="financeorgList">
			<tr class="top_color01">
				<td style="text-align: center;"><input type="checkbox" name="userId" value="${userid }_${orgname }"/></td>
				<td style="text-align: center;">${typeName }</td>
				<td style="text-align: center;">${orgname }</td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="3" style="padding-bottom:5px; padding-top:3px;" style="border-left:1px solid #d7d7d7; border-bottom:1px solid #d7d7d7;">
				<input type="button" onclick="selectToOrg()" value="选择" class="but_gray" />&nbsp;
			</td>
		</tr>
	</table>
</div>