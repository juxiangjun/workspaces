<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="/script/admin/jquery.js"></script>
<script type="text/javascript" src="/script/jquery.validate.min.js"></script>
<script type="text/javascript" src="/script/admin/jquery.filestyle.mini.js"></script>
<script type="text/javascript" src="/script/admin/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="/script/admin/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="/script/admin/facebox.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/script/admin/ajaxupload.js"></script>
<script type="text/javascript" src="/script/admin/jquery.pngfix.js"></script>
<script type="text/javascript" src="/script/admin/custom.js"></script>
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery.wysiwyg.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/facebox.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/visualize.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/date_input.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	$(function(){
		$("#frmKnwType").validate();
	});
</script>
<!--[if lt IE 8]><style type="text/css" media="all">@import url("/css/admin/ie.css");</style><![endif]-->
</head>
<body>
	<div id="hld">
		<div class="wrapper">
		<s:include value="/WEB-INF/web/admin/head.jsp"></s:include>
	 	<div class="block">
				<div class="block_head">
					<div class="bheadl"></div>
					<div class="bheadr"></div>
					<h2>新闻类型维护</h2>
					<ul>
						<li class="nobg"><a href="/admin/knwType!edit.act?typeId=">增加新类别</a></li>
						<li></li>
					</ul>
				</div>
			<!-- .block_head ends -->
				<div class="block_content">
					<p class="breadcrumb">
						<a href="/admin/">管理主页</a> « 
						<a href="/admin/knwType!showHome.act">新闻类型主页</a>
					</p>
					<div class="message errormsg" style="display: none; ">
						<p>An error message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message success" style="display: none; ">
						<p>A success message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message info" style="display: none; ">
						<p>An informative message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<div class="message warning" style="display: none; ">
						<p>A warning message goes here</p>
						<span class="close" title="Dismiss"></span>
					</div>
					<s:form id="frmKnwType" action="/admin/knwType!save.act">
						<s:hidden  id="typeId" name="knwType.id"></s:hidden>
   	  					<s:hidden  id="parentId" name="knwType.parentId" readonly="true"></s:hidden>
						<p>
							<label>类别:</label><br /><s:textfield  id="name" name="knwType.name" cssClass="required text small"></s:textfield> 
						</p>
						<p>
							<label>显示位置</label> 
							<s:select  cssClass="text small"
									name="knwType.showOnPage" list="showOnPageList" listKey="name" listValue="name" id="showOnPage"/>
						</p>
						<p>
							<label>停用标记</label> 
							<s:radio list="#{'1':'停用','0':'启用'}" name="knwType.isCancelled" cssClass="required"> </s:radio>
						</p>
						<hr/>
							<p>
								<input type="submit" class="submit small" value="提交"/>
								<input type="reset" class="submit small" value="重置"/>
							</p>
					</s:form>
				</div>
				
   	 </div>
   	 </div>
   	 </body>
   	 </html>
   	 
