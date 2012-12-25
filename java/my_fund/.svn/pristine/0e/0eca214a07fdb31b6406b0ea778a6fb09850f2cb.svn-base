<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
		<s:if test="fundSalesList.size<=0">
		  <tr >
	        <td >暂无此相关信息。</td>
	      </tr>
		</s:if><s:else>
		<s:iterator value="fundSalesList">
	      <tr>
	        <td>直销机构</td>
	      </tr>
	      <tr>
	        <td>${fundName}</td>
	      </tr>
	      <tr>
	        <td>代销机构</td>
	      </tr>
	      <tr>
	        <td>${salesAgent}</td>
	      </tr>
	      </s:iterator>
		</s:else>
</table>
