<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="bg-light vod-detail">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 d-none">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a></li>
  <li class="breadcrumb-item active">{$vod_name}</li>
</ul>
<div class="media mt-3 mb-0">
  <img class="img-thumbnail rounded-0 mr-2 mr-sm-3 d-none- d-md-block- ff-img vod-pic" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
  <div class="media-body">
    <h5 class="mt-0">{$vod_name} <small class="text-muted d-none d-sm-inline-block"><include file="BlockBase:vod_continu" /></small></h5>
    <p class="mb-1 d-none d-lg-block"><include file="BlockBase:vod_content" /></p>
		<div class="float-right pt-4 text-center d-none d-xl-block">
			<p class="vod-detail-qrcode mb-2"></p>
			<h6>手机扫码浏览</h6>
		</div>
		<ul class="list-unstyled mb-0">
			<li class="mb-2"><strong>主演：</strong><include file="BlockBase:vod_actor" /></li>
			<li class="mb-2"><strong>导演：</strong><include file="BlockBase:vod_director" /></li>
			<li class="mb-2"><strong>类型：</strong><include file="BlockBase:vod_type" /></li>
			<li class="mb-2"><strong>地区：</strong><include file="BlockBase:vod_area" /></li>
			<li class="mb-2 d-none d-lg-block"><strong>年份：</strong><a class="mr-1" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2018'}</a></li>
			<li class="mb-2 d-none d-lg-block"><strong>链接：</strong><a class="mr-1" href="{:ff_url('forum/vod',array('cid'=>$vod_id,'p'=>1),true)}">精彩影评</a><a class="mr-1" href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}" title="{$vod_name}分集剧情">分集剧情</a></li>
			<li class="mb-0 d-none d-xl-block"><include file="BlockBase:vod_share" /></li>
		</ul>
  </div>
</div>
<!-- -->
<div class="border bg-white rounded mt-2 mb-0 p-2 d-none d-lg-block text-center">
	{:ff_url_ads('960_90')}
</div>
<!-- -->
<include file="BlockBase:vod_playurl" />
<include file="BlockTheme:vod_playurl_line" />
<include file="BlockTheme:vod_playurl_yugao" />
<include file="BlockTheme:vod_detail_like" />
</main>
<include file="BlockTheme:footer" />
</body>
</html>