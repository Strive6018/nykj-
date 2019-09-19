<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail_pid" />
</head>
<body class="scenario-detail bg-light">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('scenario/index','',true)}">剧情</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}">{$vod_name}</a></li>
  <li class="breadcrumb-item active mr-auto">第{$scenario_pid}集</li>
	<li class="float-right d-none d-sm-block">共<strong>{$vod_total}</strong>集 更新至<strong>{:count($vod_scenario['info'])}</strong>集</li>
</ul>
<div class="card mt-3 mb-0">
	<div class="card-header border-0 bg-white pb-0">
		<h5>{$vod_name} 第{$scenario_pid}集剧情介绍</h5>
		<ul class="list-inline mb-0 d-flex flex-wrap flex-row">
			<li class="list-inline-item">类型：<include file="BlockBase:vod_type" /></li>
			<li class="list-inline-item">主演：<include file="BlockBase:vod_actor" /></li>
			<li class="list-inline-item">导演：<include file="BlockBase:vod_director" /></li>
			<li class="list-inline-item">地区：<include file="BlockBase:vod_area" /></li>
			<li class="list-inline-item">年份：<a class="mr-1" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2018'}</a></li>
		</ul>
	</div>
  <div class="card-body mt-2 mb-0 pt-0 pb-2 scenario-content">
		<a class="border p-1 float-left mt-1 mr-2" href="{:ff_url('scenario/detail', array('id'=>$vod_id), true)}"><img class="ff-img" data-original="{$vod_pic|ff_url_img}" alt="{$vod_name}剧情介绍"></a>
		{$vod_content|strip_tags|nb}
		<gt name="scenario_pid" value="1"><a class="mr-1" id="ff-prev" href="{:ff_url('scenario/detail', array('id'=>$vod_id, pid=>$scenario_pid-1), true)}">上一集</a></gt><php>$totalpages = count($vod_scenario['info']);</php><lt name="scenario_pid" value="$totalpages"><a id="ff-next" href="{:ff_url('scenario/detail', array('id'=>$vod_id, pid=>$scenario_pid+1), true)}">下一集</a></lt>
	</div>
	<div class="card-footer d-flex flex-wrap">
		<volist name="vod_scenario.info" id="feifei"><a class="mr-2" href="{:ff_url('scenario/detail', array('id'=>$vod_id,pid=>$i), true)}" title="{$vod_name}第{$i}集剧情介绍">第<lt name="i" value="10">0</lt>{$i}集</a></volist>
	</div>
</div>
<include file="BlockTheme:vod_detail_like" />
<include file="BlockTheme:footer" />
</main>
</body>
</html>