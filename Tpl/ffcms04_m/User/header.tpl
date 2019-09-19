<link href="{$public_path}ffcms_m/css/aui.css?{%feifeicms_version}" rel="stylesheet"/>
<link href="{$public_path}ffcms_m/css/main.css?{%feifeicms_version}" rel="stylesheet"/>
<script type="text/javascript">var cms = {
root:"{$root}",urlhtml:"{$Think.config.url_html}",sid:"{$site_sid}",id:"{$vod_id}{$news_id}{$special_id}",userid:"{$site_user_id}",username:"{$site_user_name}",userforum:"{$Think.config.user_forum}",page:"{$list_page|default=1}",domain_m:"{$site_domain_m}"
};</script>
<script type="text/javascript" src="{$public_path}jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="{$public_path}ffcms_m/js/common.js?{%feifeicms_version}" ></script>
<script type="text/javascript" src="{$public_path}ffcms_m/js/main.js?{%feifeicms_version}"></script>
<script type="text/javascript" src="{$public_path}ffcms_m/js/aui-popup.js?{%feifeicms_version}"></script>
<script type="text/javascript" src="{$public_path}ffcms_m/js/ffcms.js"></script>
<script type="text/javascript" src="{$public_path}ffcms_m/js/system.js?{%feifeicms_version}"></script>
<script type="text/javascript" src="{$public_path}bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
	(function (designW) {
		var docEl = document.documentElement,
			resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
			recalc = function () {
				var clientWidth = docEl.clientWidth;
				if (!clientWidth) return;
				docEl.style.fontSize = 40 * (clientWidth / designW) + 'px';
			};
		if (!document.addEventListener) return;
	        recalc();
		window.addEventListener(resizeEvt, recalc, false);
		document.addEventListener('DOMContentLoaded', recalc, false);
	})(750);
</script>
<!--[if lt IE 9]>
<script src="{$public_path}html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="{$public_path}respond/1.4.2/respond.min.js"></script>
<![endif]-->