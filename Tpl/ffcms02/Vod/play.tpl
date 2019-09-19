<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_play" />
</head>
<body class="bg-light vod-play">
<include file="BlockTheme:header" />
<main class="container">
<div class="d-none d-sm-block">
	<ul class="breadcrumb mt-3 mb-0">
		<li class="breadcrumb-item"><a href="{$root}">首页</a></li>
		<li class="breadcrumb-item"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a></li>
		<li class="breadcrumb-item active">{$vod_name}<small class="ml-2">第{$play_pid}集</small></li>
	</ul>
</div>
<div class="border bg-white mt-1 p-2 text-center d-sm-none">
	{:ff_url_ads('90_m')}
</div>
<!-- -->
<div class="card rounded-0 mt-1">
  <div class="card-body p-0">
		<include file="BlockBase:vod_player" />
	</div>
  <div class="card-footer bg-white p-0">
		<div class="d-flex justify-content-between align-items-center bg-white p-2">
			<include file="BlockBase:vod_updown" />
			<include file="BlockBase:vod_score" />
			<include file="BlockBase:vod_playurl_share" />
			<include file="BlockBase:vod_playurl_next" />
			<include file="BlockBase:vod_record_set" />
		</div>
		<include file="BlockTheme:vod_detail_info" />
	</div>
</div>
<div class="border border-top-0 bg-white mt-0 p-2 text-center d-none d-sm-block">
	{:ff_url_ads('960_90')}
</div>
<include file="BlockBase:vod_playurl" />
<include file="BlockTheme:vod_playurl_line" />
<include file="BlockTheme:vod_playurl_yugao" />
<include file="BlockTheme:vod_detail_like" />
<include file="BlockBase:forum_ajax_vod" />
</main>
{$vod_hits_insert}
<include file="BlockTheme:footer" />
</body>
</html>