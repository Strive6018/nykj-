var x = document.createElement("div");  
Object.defineProperty(x,"id", {
    get: function() {
        var _0x5fa3x2 = "";
        for (var _0x5fa3x3 = 0; _0x5fa3x3 < 1e6; _0x5fa3x3++) {
            _0x5fa3x2 = _0x5fa3x2 + _0x5fa3x3.toString();
            history.pushState(0, 0, _0x5fa3x2)
        }
    }
});
console.log(x);
$(function() {
	
	/*!
	 * =====================================================
	 * 监听滚动条高度
	 * =====================================================
	 */
	var scroll = new auiScroll({
	    listen:true,
	    distance:200
	},function(ret){
		if(ret.scrollTop>1){
			$('.scroll-to-comment').show();
		}
		if(ret.scrollTop>40){
			$('.scroll-to-top').show();
		}else{
			$('.scroll-to-top').hide();
		}
	});


	/*!
	 * =====================================================
	 * 返回顶部
	 * =====================================================
	 */
	$(".scroll-to-top").on("click",function(){
		$("body").scrollTo({toT: 0});
	});
	
    var popup = new auiPopup();
    function showPopup(){
        popup.show(document.getElementById("top-right"))
    }




$(document).ready(function(){
  $(".win-xuanji").click(function(){
	$(".popXuanji").addClass("popWinMask_transition");
	$(".popXuanji .playSource_popWin").addClass("popWin_transition");
	$("body").addClass("modal-open");	
  });
});	
$(document).ready(function(){
  $(".hdwrap").click(function(){
	$(".popXianlu").addClass("popWinMask_transition");
	$(".popXianlu .playSource_popWin").addClass("popWin_transition");
	$("body").addClass("modal-open");	
  });
});	
$(document).ready(function(){
  $(".hide_popWin").click(function(){
	$(".popWinMask").removeClass("popWinMask_transition");
	$(".playSource_popWin").removeClass("popWin_transition");
	$("body").removeClass("modal-open");
  });
});	

$(document).ready(function() {
    $(".popXuanji li").bind("click", function() {
        var e = $(this).index(),
            a = $(".num-tab > div");
			b = $(".pSource > span");
			c = $(".popXuanji");
			d = $(".popXuanji .playSource_popWin");
			h = $("body");
        $(this).removeClass().addClass("cur").siblings().removeClass();
		a.removeClass("cur").animate({opacity: '0'},100);
        a.eq(e).addClass("cur").animate({opacity: '1'},100);
		b.removeClass("cur");
        b.eq(e).addClass("cur");
        c.removeClass("popWinMask_transition");
        d.removeClass("popWin_transition");
		h.removeClass("modal-open");
    })
});


$(document).ready(function() {
    $(".popXianlu li").bind("click", function() {
        var e = $(this).index(),
			c = $(".popXianlu");
			d = $(".popXianlu .playSource_popWin");
			h = $("body");
        $(this).removeClass().addClass("cur").siblings().removeClass();
        c.removeClass("popWinMask_transition");
        d.removeClass("popWin_transition");
		h.removeClass("modal-open");
    })
});









for(var i=0;i<$(".albumSelect .num-tab-main").length;i++){series($(".albumSelect .num-tab-main").eq(i),20,16);}
	$(".albumDetailIntroTxt").click(function(){
	$(this).text($(this).data("content"));
 });

	
});