/*主题JS库*/
var feifei_theme = {
	'm':{
		'user_login':function(){//静态登录处理
			if($('.ff-user').length && (cms.urlhtml == 1)){
				$('.ff-user').html($('.ff-user').html().replace('登录','我的'));
			}
		}
	}
}
$(document).ready(function(){
	feifei_theme.m.user_login();
});