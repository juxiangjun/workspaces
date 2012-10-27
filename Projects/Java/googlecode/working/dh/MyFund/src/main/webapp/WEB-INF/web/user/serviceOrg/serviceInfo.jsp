<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>serviceCenter.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <a href="/service/serviceCenter!addInfo.act">增加服务信息（在某种类型下）</a><br/>
    <hr/>
    服务信息列表<br/>
    <table border="1">
    <s:iterator value="sinItemList" id="si">
       <tr>
          <td>${si.typeName }</td>
          <td>${si.title }</td>
          <td>${si.companyName }</td>
          <td><s:if test="#si.isCancelled==1">未发布</s:if><s:else>已发布</s:else></td>
          <td>${si.regionName }</td>
          <td>${si.targetName }</td>
          <td>${si.chargeRange }</td>
          <td><s:date name="#si.issuedDate" format="yyyy-MM-dd" />至<s:date name="si.expiredDate" format="yyyy-MM-dd" /></td>
          <td>${si.serviceInfo }</td>
          <td>${si.createdDate }</td>
          <td><s:if test="#si.isAuthenticated==0">正在审核中。。。</s:if><s:else>通过审核</s:else></td>
          <td><a href="/service/serviceCenter!editInfo.act?sinItem.id=${si.id }">修改</a></td>
          <td><a href="/service/serviceCenter!deleteInfo.act?sinItem.id=${si.id }&sinItem.typeId=${si.typeId}">删除</a></td>
       </tr>
    </s:iterator>
    </table>
    
  </body>
</html>
