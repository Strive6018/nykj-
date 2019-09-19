<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail" />
</head>
<body class="bg-light scenario-detail">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('scenario/index','',true)}">剧情</a></li>
  <li class="breadcrumb-item active mr-auto">{$vod_name}</li>
	<li class="float-right d-none d-sm-block">共<strong>{$vod_total}</strong>集 更新至<strong>{:count($vod_scenario['info'])}</strong>集</li>
</ul>
<div class="card mt-3 mb-0">
  <div class="card-body scenario-content">
		<h5 class="card-title">{$vod_name} 剧情</h5>
		<ul class="card-text mb-0 list-inline d-flex flex-wrap flex-row">
			<li class="list-inline-item">类型：<include file="BlockBase:vod_type" /></li>
			<li class="list-inline-item">主演：<include file="BlockBase:vod_actor" /></li>
			<li class="list-inline-item">导演：<include file="BlockBase:vod_director" /></li>
			<li class="list-inline-item">地区：<include file="BlockBase:vod_area" /></li>
			<li class="list-inline-item">年份：<a class="mr-1" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2018'}</a></li>
		</ul>
		<div class="card-text mt-2">
			<a class="border p-1 float-left mt-1 mr-2" href="{:ff_url('scenario/detail', array('id'=>$vod_id), true)}"><img class="ff-img" data-original="{$vod_pic|ff_url_img}" alt="{$vod_name}剧情介绍"></a>
			{$vod_content|strip_tags|nb}
			<a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">在线观看</a>
			<a href="{:ff_url('forum/vod',array('cid'=>$vod_id),true)}">相关影评</a>
		</div>
	</div>
</div>
<notempty name="vod_scenario.info">
<include file="BlockBase:vod_playurl" />
<volist name="vod_scenario.info" id="feifei">
<dl class="rounded border bg-white mt-3 p-3">
  <dt><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line[0]['player_sid'],$i)}">{$vod_name} 第{$i}集 在线观看</a></dt>
  <dd>{$feifei|htmlspecialchars|nb|msubstr=0,300,false} <a href="{:ff_url('scenario/detail', array('id'=>$vod_id, pid=>$i), true)}">详情...</a></dd>
</dl>
</volist>
</notempty>
</main>
<include file="BlockTheme:footer" />
</html>