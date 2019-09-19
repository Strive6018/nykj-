//主题自定义JS库
var feifei_theme = {
	'user_login':function(){//静态登录处理
		if($('.ff-user').length && (cms.urlhtml == 1)){
			$('.ff-user').html($('.ff-user').html().replace('登录','我的'));
		}
	},
	'vod_type_flickity':function(){//筛选页
		if(!feifei.browser.useragent.mobile){
			feifei.mobile.flickity();
		}
	},
	'vod_detail_qrcode':function(){//生成二维码
		if(!feifei.browser.useragent.mobile){
			$(".vod-detail-qrcode").html('<img class="ff-qrcode" src="/Tpl/ffcms02/app.png"/>');
		}
	},
	'vod_detail_collapse':function(){//影片资料折叠
		$('#vod_detail_collapse').on('show.bs.collapse', function () {
			$('.vod_detail_collapse').html('<i class="fa fa-chevron-up"></i>');
		});
		$('#vod_detail_collapse').on('hidden.bs.collapse', function () {
			$('.vod_detail_collapse').html('<i class="fa fa-chevron-down"></i>');
		});
	},
	'news_detail_img':function(){
		$('.news-detail .news-content img').addClass("img-fluid text-center");
	},
	'fixed_ads':function(){//悬浮广告
		$(".ff-fixed").each(function(i){
			feifei.scroll.fixed($(this).attr('id'));
		});
	}
}
$(document).ready(function(){
	feifei_theme.user_login();
	feifei_theme.vod_type_flickity();
	feifei_theme.vod_detail_qrcode();
	feifei_theme.vod_detail_collapse();
	feifei_theme.news_detail_img();
	feifei_theme.fixed_ads();
});