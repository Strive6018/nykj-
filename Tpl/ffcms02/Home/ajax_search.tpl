<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:ajax_search" />
</head>
<body class="bg-light ajax-search">
<include file="BlockTheme:header" />
<main class="container">
<div class="card mt-3">
	<div class="card-header">
		<strong>热门搜索</strong>
	</div>
	<div class="card-body pb-0">
		<form class="ff-search mt-3" data-sid="{$site_sid}" data-limit="{:C('ui_search_limit')}" action="{$root}index.php?s=vod-search-name" method="post" data-action="{:ff_url('vod/search',array('wd'=>'FFWD'), true)}" data-action-news="{:ff_url('news/search',array('wd'=>'FFWD'), true)}">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="title">视频</span></button>
				<div class="dropdown-menu">
					<li><a class="dropdown-item" href="#" data-action="{:ff_url('news/search',array('name'=>'FFWD'), true)}">新闻</a></li>
					<li><a class="dropdown-item" href="#" data-action="{:ff_url('vod/search',array('name'=>'FFWD'), true)}">视频</a></li>
				</div>
			</div>
			<input type="text" class="form-control ff-wd" name="wd" required>
			<div class="input-group-append">
				<button class="btn btn-secondary" type="submit">搜 索</button>
			</div>
		</div>
		</form>	
		<dl class="mt-5">
			<dt>大家都在看：</dt>
			<dd class="mt-3 d-flex flex-wrap justify-content-between">
			<volist name=":ff_mysql_vod('cid:1,2,3,4;limit:150;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits_lasttime;sort:desc')" id="feifei" mod="4">
			<eq name="mod" value="2">
			<a class="btn btn-outline-danger btn-sm mb-3" href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,12,true}</a>
			<else/>
			<a class="btn btn-outline-secondary btn-sm mb-3" href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,12,true}</a>
			</eq>
			</volist>
			</dd>
		</dl>
	</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>