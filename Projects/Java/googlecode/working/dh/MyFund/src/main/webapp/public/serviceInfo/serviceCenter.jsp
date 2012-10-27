<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'serviceCenter.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <a href="/service/serviceCenter!addType.act">增加服务类型</a><br/>
    <hr/>
    服务类型列表<br/>
    <table border="1">
       <tr>
          <td>类型名称</td>
          <td>创建人</td>
          <td>使用状态</td>
          <td>创建日期</td>
          <td colspan="2">操作</td>
       </tr>
    	<s:iterator value="sinTypeList" id="st">
       <tr>
          <td>${st.name }</td>
          <td>${st.createdBy }</td>
          <td><s:if test="#st.isCancelled==1">使用</s:if><s:else>停用</s:else></td>
          <td><s:date name="#st.createdDate" format="yyyy-MM-dd HH:mm:ss" /></td>
          <td><a href="/service/serviceCenter!edit.act?typeId=${st.id }">修改</a></td>
          <td><a href="/service/serviceCenter!deleteType.act?sinType.id=${st.id }">删除</a></td>
       </tr>
    </s:iterator>
    </table>
    
  </body>
</html>
