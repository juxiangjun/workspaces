<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>资料管理</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<script type="text/javascript" src="/script/jquery.form.js" > </script>

<script language="javascript">
	$(function(){
    	$('#ufile').bind('click',function(){  
    		$('#ufile').val(''); 
    		$('#message').html('');
        });
    })
    function downloadAttach(prdId){
    	var url = "/user/loan/supplyAttach!getDataTemplates.act";
    	var param = {'dataId':prdId};
    	$.post(url,param, function(data){
    		var da = $('#downloadform');
    		if(da.length == 0){
    			da = $("<div id='downloadform'></div>");
    		}else{
    			da.remove();
    			da = $("<div id='downloadform'></div>");
    		}
    		da.append(data);
    		$('#download_attach').append(da);
    		$('#download_attach').dialog({width:500,modal:true});
    	}, 'html');
    }
    function uploadFile(prdId){
    	var url = "/user/loan/supplyAttach!getDataTemplates.act";
    	var param = {'dataId':prdId};
    	$.post(url,param, function(data){
    		$('#fileList').html(data);
    	}, 'html');
    	$('#prd_id').val(prdId);
    	$('#uload').show();
    	
    	$('#uploadFileObj').html($('<input type="file" name="upload" id="ufile"/>'));
    	
    	$("#upload_file").dialog({
    		width:500,
    		modal:true,
    		close: function(event, ui) {
    		}
    		
    	});
    	$('#ufile').val('');
    	$('#message').html('');
    }
    
	function uploadsubmit() {
    	if($('#ufile').val()=='' || $('#ufile').val()==null){
    		$('#message').html("请选择上传文件！");
    		return false;
    	}
    	
		var uploadfile = $('#ufile').val();
		if (uploadfile != "") {
			var types = [ "png", "jpg", "jpeg", "bmp", "doc", "docx", "xls","xlsx", "pdf","rar","zip" ];
			var ext = uploadfile.substring(uploadfile.lastIndexOf(".") + 1).toLowerCase();
			
			var sing = false;
			for ( var i = 0; i < types.length; i++) {
				if (ext == types[i]) {
					sing = true;
				}
			}
			if (!sing) {
				$('#message').html("您选择的文件类型不符合要求!");
				return false;
			}
		}
		$('#message').html("正在上传文件,请稍候...");
		$('#uploadForm').ajaxSubmit({
			datatype : "html",
			success : function(data) {
				if(data.indexOf('error') >= 0){
					$('#uload').hide();
					$('#message').html("上传失败，只支持上传小于3M的png、jpg、jpeg、bmp、word、excel、pdf、rar、zip文件！");
				}else{
					var attid= $('#prd_id').val();
					$('#attCount' + attid).html($('<span>已上传</span>'));
					$("#upload_file").dialog("close");
				}
			}
		});
	}
    

</script>
<style>
#t_border{width:100%; border-top: 1px solid #ddd; border-right: 1px solid #ddd;}
#t_border td{border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; padding:8px;}
</style>
</head>

<body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
     		<tr class="top_color">
	            <td style="padding-left:25px; width:350px;">资料名称</td>
	            <td style="width:160px;">是否上传模版</td>
	            <td align="center">模版上传</td>
            </tr>
          <tbody>
		 	<s:iterator value="applySupplyAttachList">
			<tr class="top_color01">
				<td style="padding:5px 25px 5px 20px;">
						${supplyName }
				</td>
				<td>
					<span id="attCount${id }">
						<s:if test="haveTemplate == 1">
							已上传
						</s:if>
						<s:else>
							未上传
						</s:else>
					</span>
				</td>
	   			<td align="right" style="padding-right:5px;" >
		   			<input type="button" class="bgray hid" value="上传" onclick="uploadFile('${id}');"/>
		   			<input type="button" class="bgray hid" value="查看" onclick="downloadAttach('${id}');"/>
	   			</td>
			</tr>
			</s:iterator>
			</tbody>
        </table>
   <div class="hr_10"> &nbsp;</div>
	<div align="center">
		<input id="over" class="btnsub blue1 hid" type="button" value="完成" onclick='$("#prdTemplateList").dialog("close");'/>
	</div>
<!--弹出框内容登录页面-->
<div id="upload_file" style="display:none;" title="文件上传">
<div id="fileList">
</div>
   <div class="hr_10"> &nbsp;</div>
	<s:form id="uploadForm" action="supplyAttach!uploadTemplate.act" namespace="/user/loan" method="post" enctype="multipart/form-data">
	<s:hidden name="dataId" id="prd_id"></s:hidden>
	<table id="t_border">
		<tr>
			<td><h6>选择资料 &nbsp;&nbsp; <span id="message" style="color: red"></span></h6></td>
		</tr>
		<tr id="uload">	
			<td>
			<span id="uploadFileObj"><s:file name="upload" theme="simple" id="ufile" ></s:file></span>
			<input type="button" value="上传"  onclick="uploadsubmit();"/></td> 
		</tr>
		<tr>	
			<td>说明：支持png、jpg、jpeg、bmp、doc、xls、pdf、rar、zip格式 文件小于3M</td>
		</tr>
	</table>
	</s:form>
</div>   
<div id="download_attach" style="display:none;" title="文件下载"></div>  
</body>
</html>
