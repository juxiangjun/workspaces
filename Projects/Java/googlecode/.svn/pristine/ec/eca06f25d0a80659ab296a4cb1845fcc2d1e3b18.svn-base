
var js_file_jquery = "/script/jquery-1.7.2.min.js"
var js_file_test = "/script/test.js"

head = document.getElementsByTagName('head').item(0);
createScript(js_file_test);

function createScript(file) {
	scriptTag = document.createElement("script");
	scriptTag.setAttribute("type","text/javascript");
	scriptTag.setAttribute("src",file);
	head.appendChild(scriptTag);
	return true
}

var isLoadedJQuery = createScript(js_file_jquery);

if (isLoadedJQuery) {
	eval("sayHello();");
} else {
	alert('failed to load JQuery');
}
/*
function toggleFocus() {
	$(".input-text").focus(function() {
	    $(this).addClass("input-focus");
	}).blur(function() {
	    $(this).removeClass("input-focus");
	});
}

function setFade() {
	$(".close").click(function() {
	    $(this).parent().fadeTo(400, 0,
	    function() { // Links with the class "close" will close parent
	        $(this).slideUp(400);
	    });
	    return false;
	});
}
*/
