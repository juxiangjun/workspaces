<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="/script/admin/jquery.js"></script>
<script type="text/javascript" src="/script/admin/jquery.filestyle.mini.js"></script>
<script type="text/javascript" src="/script/admin/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="/script/admin/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="/script/admin/facebox.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/script/admin/ajaxupload.js"></script>
<script type="text/javascript" src="/script/admin/jquery.pngfix.js"></script>
<script type="text/javascript" src="/script/admin/custom.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery.wysiwyg.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/facebox.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/visualize.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/date_input.css" rel="stylesheet" type="text/css" />
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
				<h2>编辑信息</h2>
				<ul>
					<li class="nobg"><a href="/admin/knwTitle!edit.act">增加新信息</a></li>
					<li></li>
				</ul>
			</div>
			<!-- .block_head ends -->
			<div class="block_content">
				<p class="breadcrumb">
					<a href="/admin/">管理主页</a> « 
					<a href="/admin/knwType!showHome.act">新闻类型主页</a>«
					<a href="/admin/knwType!showHome.act">信息内容主页</a>
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
				&nbsp;&nbsp;&nbsp;<a>编辑内容</a>
				<s:form action="/admin/knwContent!save.act">
				<div id="u82_rtf"><p style="text-align:center;">
					<span style="font-family:微软雅黑;font-size:20px;font-weight:bold;font-style:normal;text-decoration:none;color:#333333;">${title.title}</span></p><p style="text-align:center;">
					<span style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;text-decoration:none;">&nbsp;</span></p>
					<p style="text-align:center;">
					<span style="font-family:微软雅黑;font-size:14px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">${title.source} &nbsp; &nbsp;&nbsp; ${title.author} &nbsp; &nbsp;&nbsp; ${title.issuedDate} </span></p>
				</div>
				<div id="u81_rtf" class="M_box"><p style="text-align:center;"><span style="font-family:微软雅黑;font-size:12px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">
				<s:hidden name="titleId" value="%{title.id}"></s:hidden>
				<s:hidden name="content.titleid" value="%{title.id}"></s:hidden>
				<textarea name="content.contents" cols="100" rows="10">${content.contents }</textarea>
				<input type="submit" class="submit small" value="提交"/>
				</s:form>
				</div>
			</div>
		</div>
</div>
</body>
</html>