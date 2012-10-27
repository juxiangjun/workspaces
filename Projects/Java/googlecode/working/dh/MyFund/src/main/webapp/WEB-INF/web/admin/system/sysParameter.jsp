<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--[if IE]><script type="text/javascript" src="/script/admin/excanvas.js"></script><![endif]-->
<script type="text/javascript" src="/script/admin/jquery.js"></script>
<script type="text/javascript" src="/script/admin/jquery.date_input.pack.js"></script>
<script type="text/javascript" src="/script/admin/facebox.js"></script>
<script type="text/javascript" src="/script/admin/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/script/admin/ajaxupload.js"></script>
<script type="text/javascript" src="/script/admin/jquery.pngfix.js"></script>
<script type="text/javascript" src="/script/admin/custom.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/facebox.css" rel="stylesheet" type="text/css" />
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
					<h2>系统管理 » 系统参数</h2>
					<ul>
						<li class="nobg"><a href="http://enstyled.com/adminus/original/page.html#">Edit pages</a></li>
						<li><a href="http://enstyled.com/adminus/original/page.html#">Add page</a></li>
					</ul>
				</div>
				<!-- .block_head ends -->
				<div class="block_content">
					<form action="" method="post">
						<table cellpadding="0" cellspacing="0" width="100%" class="sortable">
							<thead>
								<tr>
									<th width="10"><input type="checkbox" class="check_all" /></th>
									<th class="header" style="cursor: pointer; ">Page title</th>
									<th class="header" style="cursor: pointer; ">Status</th>
									<th class="header" style="cursor: pointer; ">Date created</th>
									<th class="header" style="cursor: pointer; ">Author</th>
									<td>&nbsp;</td>
								</tr>
							</thead>
							<tbody>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Aorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Zn ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Borem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Aaa In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Lorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>18.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="even">
									<td><input type="checkbox" /></td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">Lorem ipsum dolor</a></td>
									<td>Published</td>
									<td>20.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
								<tr class="odd">
									<td><input type="checkbox" />
									</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">In ac libero nunc, vel congue neque</a></td>
									<td>Published</td>
									<td>08.03.2010</td>
									<td><a href="http://enstyled.com/adminus/original/page.html#">John Doe</a></td>
									<td class="delete"><a href="http://enstyled.com/adminus/original/page.html#">Delete</a></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- .block_content ends -->
				<div class="bendl"></div>
				<div class="bendr"></div>
			</div>
			<!-- .block ends -->
			
		</div>
	</div>
</body>
</html>