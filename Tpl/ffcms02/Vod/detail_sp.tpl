<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail-sp">
<include file="BlockTheme:header" />
<main class="container">
<div class="d-none d-sm-block">
	<ul class="breadcrumb mt-3 mb-0">
		<li class="breadcrumb-item"><a href="{$root}">首页</a></li>
		<li class="breadcrumb-item"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a></li>
		<li class="breadcrumb-item active">{$vod_name}</li>
	</ul>
</div>
<div class="border bg-white mt-1 p-2 text-center d-sm-none">
	{:ff_url_ads('90_m')}
</div>
<div class="card rounded-0 mt-1">
  <div class="card-body p-0">
		<div class="embed-responsive embed-responsive-16by9" id="cms_player">
			<div id="cms-player-vip">
				<div class="cms-player-box"></div>
				<iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe>
			</div>
		</div>
	</div>
  <div class="card-footer p-2 bg-light d-flex align-items-center justify-content-between">
		<include file="BlockBase:vod_updown" />
		<include file="BlockBase:vod_score" />
		<include file="BlockBase:vod_playurl_share" />
		<include file="BlockBase:vod_playurl_next" />
	</div>
</div>
<div class="border border-top-0 bg-white mt-0 p-2 text-center d-none d-sm-block">
	{:ff_url_ads('960_90')}
</div>
<include file="BlockTheme:vod_detail_sp_like" />
</main>
{$vod_hits_insert}
<include file="BlockTheme:footer" />
</body>
</html>