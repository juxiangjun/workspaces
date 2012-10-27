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
    <a href="/service/serviceCenter!addInfo.act">增加信息页</a><br/>
    <hr/>
    增加信息<br/>
    <form action="/service/serviceCenter!saveType.act" method="post">
    <table border="1">
       <tr>
          <td>类型名称：</td><input type="text" name="sinType.id" value="${sinType.id }"/>
          <td><input type="text" name="sinType.name" value="${sinType.name }"/></td>
       </tr>
       <tr>
          <td>创建人：</td>
          <td><input type="text" name="sinType.createdBy" value="${session._user.username }" readonly="readonly" /></td>
       </tr>
       <tr>
          <td><input type="submit" value="确认发布" /></td>
          <td><input type="button" value="返回" onclick="window.location.href='/service/serviceCenter.act'" /></td>
       </tr>
    </table>
    </form>
  </body>
</html>
