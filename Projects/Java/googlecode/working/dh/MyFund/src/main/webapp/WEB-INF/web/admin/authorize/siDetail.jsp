<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>理财服务详情页_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/index.js"> </script>
	<script language="javascript">
		function authorize(itemId, authenticated) {
			var url = '/admin/serviceInfoAuthorize!authorizeServiceInfo.act?itemId='+itemId+'&isAuthenticated='+authenticated;
			$.ajax({
				url: url
			}).done(
				function(data, status, response) {
					var text = jQuery.parseJSON(response['responseText']);
					if (text.status =='success') {
						window.location.href = "/admin/serviceInfoAuthorize!showUnauthorizedServiceInfo.act";
					} else {
						alert('操作失败');
					}
				}		
			);	
		}
	</script>
<style>
.focus { position:relative; width:708px; height:293px; overflow:hidden; }
.focus img.img { width:708px; height:293px; display:none; }
.focus img.img a { position:absolute; top:0; display:block; }
.focus .btn { position:absolute; z-index:100; bottom:5px; right:5px; }
.focus .btn span { float:left; text-align:center; background:#fff; cursor:pointer; width:16px; height:16px; line-height:16px; margin:3px 2px 0 2px; border:1px solid #fff; color:#9b0583; font-family:Arial; font-size:0.9em; }
.focus .btn span.hov { width:21px; height:21px; margin:0 2px; font-weight:bold; font-size:1.4em; background:#97181d; line-height:21px; border:1px solid #fff; color:#fff; }
</style>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
<div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务详情页面开始-->
  <div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">理财产品</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">银行理财产品列表</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">产品详情</a>
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  	<div class="M_out_L">
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
          <tr>
            <td class="Search_t_connect">服务标题</td>
            <td colspan="3" style="padding-left:10px;">${sinItem.title}</td>
          </tr>
          <tr>
				<td class="Search_t_connect">服务类别</td>
				<td class="Search_t_connect01">${sinItem.typeName}</td>
				<td  class="Search_t_connect">收费标准</td>
				<td class="Search_t_connect01">${sinItem.chargeRange}</td>
			</tr>
			<tr>
				<td  class="Search_t_connect">面向区域</td>
				<td class="Search_t_connect01">${sinItem.regionName}</td>
				<td  class="Search_t_connect">面向区域</td>
				<td class="Search_t_connect01">${sinItem.targetName}</td>
			</tr>
			<tr>
				<td class="Search_t_connect">服务内容</td>
				<td colspan="3" class="Search_t_connect01">${sinItem.serviceInfo}</td>
			</tr>
			<tr>
				<td class="Search_t_connect">服务评价</td>
				<td colspan="3" class="Search_t_connect01">${sinItem.assessment}</td>
			</tr>
			
        </table>
        <div class="hr_10"> &nbsp; </div>
       	<div align="center">
       		<input type="button" onclick="javascript:authorize(${sinItem.id},'1')" value="通过"/> 
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="javascript:authorize(${sinItem.id},'2')" value="驳回"/> 
       	</div>
        <!--表格部分结束-->
      <div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
  	<div class="M_out_right fr">
    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
    </div>
    <div class="M_out_right_text fr">
    	<h1>热销银行理财产品</h1>
        <div class="box_3">
          <ul class="new_li">
            <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
            <li><a href="">样式边框使用灰色；</a></li>
            <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
            <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
          </ul>
        </div>
    </div>
  </div>
  <!--理财服务详情页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
