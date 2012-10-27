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
     <a href="">增加服务信息页</a><br/>
    <hr/>
    增加信息<br/>
    <form action="/service/serviceCenter!saveInfo.act" method="post">
    <table border="1">
       <tr>
          <td>信息组织名称：</td>
          <td><input type="text" name="sinItem.typeName" /></td>
       </tr>
       <tr>
       <tr>
          <td>创建人：</td>
          <td><input type="text" name="sinItem.companyName" value="${session._user.username }" readonly="readonly" /></td>
       <tr>
          <td>信息标题：</td>
          <td><input type="text" name="sinItem.title" /></td>
       </tr>
       <tr>
          <td>信息信息内容：</td>
          <td><input type="text" name="sinItem.serviceInfo" /></td>
       </tr>
       <tr>
          <td colspan="2"><input type="submit" value="提交" /></td>
       </tr>
    </table>
    </form>
  </body>
</html>
