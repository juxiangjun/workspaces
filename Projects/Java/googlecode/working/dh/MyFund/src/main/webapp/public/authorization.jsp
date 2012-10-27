<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="/script/admin/jquery.js"></script>
<script type="text/javascript" src="/script/admin/jquery.checkboxtree.js"></script>
<link href="/css/admin/style.css" rel="stylesheet" type="text/css" />
<link href="/css/admin/jquery.checkboxtree.css" rel="stylesheet" type="text/css" />
<script>
$(document).ready(function() {
	$('#tree9').checkboxTree({});

    $('#tree9').bind('checkboxtreecollapse', function() {
        alert('collapse event triggered (externally binded)');
    });

    $('#tree9').bind('checkboxtreeexpand', function() {
        alert('expand event triggered (externally binded)');
    });
    alert();
});
</script>
</head>
<body>
	<div id="hld">
		<div class="wrapper">
			
	<div id="tabs-9">
    <p>This example show default script behaviour.</p>

    <ul id="tree9">
        <li><input type="checkbox"/><label>Node 1</label></li>
            <ul>
                <li><input type="checkbox"/><label>Node 1.1</label></li>
                    <ul>
                        <li><input type="checkbox"/><label>Node 1.1.1</label></li>
                    </ul>
                <li><input type="checkbox"/><label>Node 1.2</label></li>
                    <ul>
                        <li><input type="checkbox"/><label>Node 1.2.1</label></li>
                        <li><input type="checkbox"/><label>Node 1.2.2</label></li>
                        <li><input type="checkbox"/><label>Node 1.2.3</label></li>
                            <ul>
                                <li><input type="checkbox"/><label>Node 1.2.3.1</label></li>
                                <li><input type="checkbox"/><label>Node 1.2.3.2</label></li>
                            </ul>
                        <li><input type="checkbox"/><label>Node 1.2.4</label></li>
                        <li><input type="checkbox"/><label>Node 1.2.5</label></li>
                        <li><input type="checkbox"/><label>Node 1.2.6</label></li>
                    </ul>
            </ul>
        <li><input type="checkbox"/><label>Node 2</label></li>
            <ul>
                <li><input type="checkbox"/><label>Node 2.1</label></li>
                    <ul>
                        <li><input type="checkbox"/><label>Node 2.1.1</label></li>
                    </ul>
                <li><input type="checkbox"/><label>Node 2.2</label></li>
                    <ul>
                        <li><input type="checkbox"/><label>Node 2.2.1</label></li>
                        <li><input type="checkbox"/><label>Node 2.2.2</label></li>
                        <li><input type="checkbox"/><label>Node 2.2.3</label></li>
                            <ul>
                                <li><input type="checkbox"/><label>Node 2.2.3.1</label></li>
                                <li><input type="checkbox"/><label>Node 2.2.3.2</label></li>
                            </ul>
                        <li><input type="checkbox"/><label>Node 2.2.4</label></li>
                        <li><input type="checkbox"/><label>Node 2.2.5</label></li>
                        <li><input type="checkbox"/><label>Node 2.2.6</label></li>
                    </ul>
            </ul>
    </ul>
</div>
			
		</div>
	</div>
</body>
</html>