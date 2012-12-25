<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${ctx }/script/proinvce_city_area/css/cityLayout.css" type="text/css" rel="stylesheet"/>
	<style type="text/css">
		html,body,p,th,td,input,select,textarea,button,div {
			padding: 0;
			margin: 0;
			font-family: "microsoft yahei", Tahoma, sans-serif;
			font-size: 12px;
			line-height: 180%;
		}
		
		html,body {
			background: #F6F6F6;
		}
		
		dl,ol,dt,dd,ul,li,form,h1,h2,h3,h4,h5,h6 {
			margin: 0;
			padding: 0;
			list-style: none;
		}
		
		input,select,textarea,button {
			vertical-align: middle;
			resize: none;
		}
		
		.clear {
			clear: both;
			overflow: hidden;
			height: 1px;
		}
		
		.clearfix {
			overflow: auto;
			height: 1%
		}
		
		img {
			border: 0;
			vertical-align: middle
		}
		
		body,a,a:visited {
			font-size: 12px;
			color: #000;
			text-decoration: none;
		}
		
		a:hover {
			text-decoration: underline;
			color: #333
		}
		
		.city_input {
			border: 1px solid #d6d6d6;
			width: 180px;
			height: 30px;
			background: url(${ctx }/script/proinvce_city_area/css/images/ts-indexcity.png) no-repeat;
			line-height: 30px;
			margin-top: 5px;
			text-indent: 5px;
		}
		
		.cityinput {
			background: url(${ctx }/script/proinvce_city_area/css/images/ts-city.png);
			width: 180px;
			height: 30px;
			border: #d6d6d6 1px solid;
			margin-top: 5px;
			text-indent: 5px;
			line-height: 30px;
			text-indent: 5px;
		}
		
		.cityzinput {
			background: url(${ctx }/script/proinvce_city_area/css/images/ts-zcity.png);
			width: 180px;
			height: 30px;
			border: #d6d6d6 1px solid;
			margin-top: 15px;
			text-indent: 5px;
			line-height: 30px;
			text-indent: 5px;
		}
		
		a,a:hover {
			text-decoration: none
		}
		
		img {
			border: 0
		}
		
		ul {
			list-style: none;
			margin: 0;
		}
		
		label {
			color: #6CBD45;
			font-size: 14px;
			font-weight: bold;
			padding-bottom: 0.5em;
			margin: 0;
		}
		
		.h3 {
			font-size: 13px;
			font-weight: bold;
		}
		
		
		#submeun {
			margin-left: 70px;
			float: left;
		}
		
		#submeun span {
			text-align: center;
			margin-right: 10px;
			float: left;
			display: inline;
		}
		
		#submeun span a {
			color: #fff;
			height: 50px;
			line-height: 50px;
			font-size: 14px;
			font-weight: bold;
			text-align: center;
			padding-left: 15px;
			padding-right: 15px;
			display: block;
		}
		
		#submeun span.cur {
			text-align: center;
			background: #82ce18;
			margin-right: 10px;
			float: left;
			display: inline;
		}
		
		
		label.subtitle {
			font-size: 13px;
			float: right;
			color: #6CBD45;
			margin: 0 10px;
			text-align: right;
		}
		
		h1.title {
			height: 50px;
			font-size: 12px;
			background: url(logo.png) no-repeat;
		}
		
		h1.title a:link,h1.title a:visited,h1.title a:hover {
			color: #000;
			text-decoration: none;
		}
	</style>
</head>
<body>
<form action="${ctx }/common/index" method="post">
	<center>
		<input name="" id="start1" autocomplete="off" type="text"
			value="请选择/输入城市名称"
			class="city_input  inputFocus proCityQueryAll proCitySelAll"
			ov="请选择/输入城市名称"/>
		<input name="con1" type="hidden" id="star"/>
	</center>

	<!--弹出省省市-->
	<div class="provinceCityAll">
		<div class="tabs clearfix">
			<ul class="">
				<li><a href="javascript:" class="current" tb="provinceAll">省份</a>
				</li>
				<li><a href="javascript:" tb="cityAll" id="cityAll">城市</a>
				</li>
				<li><a href="javascript:" tb="countyAll" id="countyAll">区县</a>
				</li>
			</ul>
		</div>
		<div class="con">
			<div class="provinceAll invis">
				<div class="pre">
					<a></a>
				</div>
				<div class="list">
					<ul>
					</ul>
				</div>
				<div class="next">
					<a class="can"></a>
				</div>
			</div>
			<div class="cityAll invis">
				<div class="pre">
					<a></a>
				</div>
				<div class="list">
					<ul>
					</ul>
				</div>
				<div class="next">
					<a class="can"></a>
				</div>
			</div>
			<div class="countyAll invis">
				<div class="pre">
					<a></a>
				</div>
				<div class="list">
					<ul>
					</ul>
				</div>
				<div class="next">
					<a class="can"></a>
				</div>
			</div>
		</div>
	</div>
	<input type="submit" value="submit"/>
</form>
	<script src="${ctx }/script/proinvce_city_area/js/jquery-1.6.2.min.js"></script>
	<script src="${ctx }/script/proinvce_city_area/js/public.js"></script>
</body>
</html>
<script type="text/javascript">

	function sendAllProvinceAjax() {
		$.ajax({
			type : "get",
			url : '${ctx}/script/proinvce_city_area/js/province.js',
			async : false,
			dataType : "json",
			success : function(data) {
				allProvinces = data.provinces;
				$("body").data("allProvinces", allProvinces);
				viewAllProvince(1);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus);
			}
		});
	}
	function sendAllCitiesAjax() {
		$.ajax({
			type : "get",
			url : '${ctx}/script/proinvce_city_area/js/city.js',
			async : false,
			dataType : "json",
			success : function(data) {
				allCities = data.cities;
				$("body").data("CitysAll", data);
				viewAllHotCities();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus);
			}
		});
	}

	function sendAllCountiesAjax() {
		$.ajax({
			type : "get",
			url : '${ctx}/script/proinvce_city_area/js/area.js',
			async : false,
			dataType : "json",
			success : function(data) {
				allAreas = data.areas;
				$("body").data("allCountys", data.areas);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(textStatus);
			}
		});
	}
</script>