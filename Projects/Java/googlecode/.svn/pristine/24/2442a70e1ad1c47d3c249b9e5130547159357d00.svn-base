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
    <a href="">增加信息类型页</a><br/>
    <hr/>
    增加信息<br/>
    <form action="/service/serviceCenter!saveType.act" method="post">
    <table border="1">
       <tr>
          <td>类型名称：</td>
          <td><input type="text" name="sinType.name" /></td>
       </tr>
       <tr>
          <td>创建人：</td>
          <td><input type="text" name="sinType.createdBy" value="${session._user.username }" readonly="readonly" /></td>
       </tr>
       <tr>
          <td>是否停用：</td>
          <td><select name="sinType.isCancelled">
          	<option value="1">不停用</option>
          	<option value="0">停用</option>
          </select></td>
       </tr>
       <tr>
          <td colspan="1"><input type="submit" value="提交" /></td>
       </tr>
    </table>
    </form>
  </body>
</html>
