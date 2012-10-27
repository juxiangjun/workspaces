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
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
	<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
	<script type="text/javascript">
		$(function(){
			$("#frmSinItem").validate();
		});
		
		function checkSinItemDefaultValue(){
			var typeName = $("#typeName").attr("value");
			if (typeName=="") {
				getSelectorValue('#serviceTypeSelector','#typeName');
				getSelectorValue('#regionSelector','#regionName');
				getSelectorValue('#targetSelector','#targetName');
			}
		}
	
		function getSelectorValue(tagName, inputName) {
			var value = $(tagName).find("option:selected").text();
			$(inputName).attr("value", value);
		}
	</script>
  </head>
  <body>
     <a href="/service/serviceCenter!addInfo.act">增加服务信息页</a><br/>
     <a href="/service/serviceCenter.act">返回信息类型页</a><br/>
    <hr/>
    增加信息<br/>
    <form id="frmSinItem" action="/service/serviceCenter!saveInfo.act" method="post">
    <s:hidden id="typeName" name="sinItem.typeName"></s:hidden>
    <s:hidden name="sinItem.id"></s:hidden>
    <s:hidden name="sinItem.contactId"></s:hidden>
    <s:hidden name="sinItem.contactName"></s:hidden>
    <s:hidden name="sinItem.companyId"></s:hidden>
    <s:hidden name="sinItem.companyName"></s:hidden>
    <s:hidden id="regionName" name="sinItem.regionName"></s:hidden>
    <s:hidden id="targetName" name="sinItem.targetName"></s:hidden>
    <table border="1">
       <tr>
          <td>发布人：</td>
          <td> ${sinItem.contactName} </td>
       </tr>
       <tr>
          <td>服务组织机构：</td>
          <td> ${sinItem.companyName} </td>
       </tr>
       <tr>
          <td>服务类型：</td>
          <td>
           <s:select id="serviceTypeSelector" 
           	list="sinTypeList" name="sinItem.typeId" 
           	listKey="id" listValue="name" onchange="getSelectorValue('#serviceTypeSelector','#typeName');"/>
           </td>
       </tr>
       <tr>
          <td>服务标题：</td>
          <td>
          	<s:textfield name="sinItem.title" cssClass="required" ></s:textfield>
       </tr>
       <tr>
          <td>服务介绍：</td>
          <td>
          	<s:textfield name="sinItem.serviceInfo" cssClass="required"></s:textfield>
       </tr>
       <tr>
          <td>服务区域：</td>
          <td>
          	<s:select id="regionSelector" list="dataMap['area']" 
          		name="sinItem.regionId" listKey="id" listValue="name" onchange="getSelectorValue('#regionSelector','#regionName');"/>
          </td>
       </tr>
       <tr>
          <td>服务对象：</td>
          <td>
          		<s:select id="targetSelector" name="sinItem.targetId" list="dataMap['obj']" 
          			listKey="id" listValue="name" onchange="getSelectorValue('#targetSelector','#targetName');"/>
          </td>
       </tr>
       <tr>
          <td>收费范围：</td>
          <td>
          	<s:textfield name="sinItem.chargeRange" cssClass="required"></s:textfield></td>
       </tr>
       <tr>
          <td>服务时间：</td>
          <td>
          	<s:textfield name="sinItem.issuedDate"></s:textfield>
          	至
          	<s:textfield  name="sinItem.expiredDate"></s:textfield>
          </td>
       </tr>
       <tr>
          <td colspan="2"><input type="submit" value="确认发布" /></td>
       </tr>
    </table>
    </form>
    
    <script language="javascript">
		checkSinItemDefaultValue();
    </script>
  </body>
</html>
