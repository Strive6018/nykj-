var feifei_plus = {
	'play':function(url,iWidth,iHeight){
		var url;                            //转向网页的地址;
		var iWidth;                         //弹出窗口的宽度;
		var iHeight;                        //弹出窗口的高度;
		//window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽
		var iTop = ($(window).height()-iHeight)/2;
		var iLeft = ($(window).width()-iWidth)/2;
		window.open(url,'feifei_player','height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizeable=no,location=no,status=no');
		//window.showModalDialog(url);
	}
}
$(document).ready(function(){
	feifei.language.s2t();
	//
	$("[data-toggle='tooltip']").tooltip();
	//
	$('.carousel-indicators').on('click','li',function(){
		$("img").lazyload({ threshold : 200 });
	});	
	//
	if($(".nav-sub ul.text-right").length > 0){
		$id = $(".nav-sub ul.text-right").attr('data-id');
		$('#'+$id).addClass('active');
		$('#'+$id+' a').append('<span class="ico-arr"></span>');
	}
	//
	$(".vod-type dl dt").each(function(i){
		$id = $(".vod-type dl dt").eq(i).attr('data-id');
		$('#'+$id).addClass('active');
	});
	//
	$('.vod-detail a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		$('.vod-detail .tab-content .page-header').hide();
	});
	//
	if($('.vod-view').length){
		$(window).keydown(function(event){
			 if(event.keyCode==13) {
				 feifei_plus.play($('.btn-play').eq(0).attr('href'),640,480);
			 }
		});
		$('a.btn-play[target=feifei_plus]').on('click', function(){
			feifei_plus.play($(this).attr('href'),640,480);
			return false;
		});
	}
});