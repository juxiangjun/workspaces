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
    <a href="/service/serviceCenter!addType.act">增加服务类型</a><br/>
    <a href="/Account!login.act?loginType=1">返回用户中心中心</a>
    <hr/>
    服务类型列表<br/>
    <table border="1">
       <tr>
          <td>类型名称</td>
          <td>创建人</td>
          <td>使用状态</td>
          <td>创建日期</td>
          <td>最后修改人</td>
          <td>修改日期</td>
          <td colspan="2">操作</td>
       </tr>
    	<s:iterator value="sinTypeList" id="st">
       <tr>
          <td><a href="/service/serviceCenter!findInfo.act?typeId=${st.id }">${st.name }</a></td>
          <td>${st.createdBy }</td>
          <td><s:if test="#st.isCancelled==0">使用</s:if><s:else>停用</s:else></td>
          <td><s:date name="#st.createdDate" format="yyyy-MM-dd HH:mm:ss" /></td>
          <td>${st.lastModifiedBy }</td>
          <td><s:date name="#st.lastModifiedDate" format="yyyy-MM-dd HH:mm:ss" /></td>
          <td><a href="/service/serviceCenter!editType.act?typeId=${st.id }">修改</a></td>
          <td><a href="/service/serviceCenter!deleteType.act?sinType.id=${st.id }">删除</a></td>
       </tr>
    </s:iterator>
    </table>
    
  </body>
</html>
