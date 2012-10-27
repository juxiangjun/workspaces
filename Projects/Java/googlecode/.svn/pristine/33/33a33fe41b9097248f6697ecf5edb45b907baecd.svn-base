//用户名、证书登录切换
$(function() {
    $(".user_login_menu li").click(function() {
        $(this).addClass("selected").siblings().removeClass("selected");
		var num = $(this).index();
        $(".user_login_content>div").eq(num).attr("class", "on").siblings().attr("class", "off");
    });
});
//输入框焦点效果
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
    $(".close").click(function() {
        $(this).parent().fadeTo(400, 0,
        function() { // Links with the class "close" will close parent
            $(this).slideUp(400);
        });
        return false;
    });
});
//隔行变色
$(function() {
    $("table.gold-table tr:nth-child(odd)").addClass("gold-table-altrow");
});
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
});
$(function() {
    var index = 0;
    showImg(index); //初始化
    $(".focus .btn span").mouseover(function() {
        index = $(".focus .btn span").index(this);
        showImg(index);
    });
    //滑入停止动画，滑出开始动画.
    $('.focus').hover(function() {
        if (MyTime) {
            clearInterval(MyTime);
        }
    },
    function() {
        MyTime = setInterval(function() {
            showImg(index);
            index++;
            if (index == 3) {
                index = 0;
            }
        },
        3000);
    });
    //自动开始
    var MyTime = setInterval(function() {
        showImg(index);
        index++;
        if (index == 3) {
            index = 0;
        }
    },
    3000);
});
//关键函数：通过控制i，来显示不同的幻灯片
function showImg(i) {
    $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
    $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
}
function Scroll(ul, delay, speed, lineHeight) {
    var slideBox = (typeof ul == 'string') ? document.getElementById(ul) : ul;
    var delay = delay || 1000;
    var speed = speed || 20;
    var lineHeight = lineHeight || 24;
    var tid = null,
    pause = false;
    var start = function() {
        tid = setInterval(slide, speed);
    };
    var slide = function() {
        if (pause) return;
        slideBox.scrollTop += 2;
        if (slideBox.scrollTop % lineHeight == 0) {
            clearInterval(tid);
            slideBox.appendChild(slideBox.getElementsByTagName('li')[0]);
            slideBox.scrollTop = 0;
            setTimeout(start, delay);
        }
    };
    slideBox.onmouseover = function() {
        pause = true;
    };
    slideBox.onmouseout = function() {
        pause = false;
    };
    setTimeout(start, 2000);
}