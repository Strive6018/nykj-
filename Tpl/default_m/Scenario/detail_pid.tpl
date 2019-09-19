<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail_pid" />
</head>
<body class="scenario-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2>
  	<span class="glyphicon glyphicon-list-alt ff-text"></span>
    {$vod_name}第{$scenario_pid}集剧情介绍
  </h2>
</div>
<div class="row ff-row">
  <div class="col-xs-12 ff-col">
    <p class="info">
    	{:ff_url_tags_content(strip_tags($vod_scenario['info'][$scenario_pid-1],'<a>'),$Tag)}
    </p>
  </div>
</div>
<notempty name="vod_scenario.info">
<include file="BlockBase:vod_playurl" />
<div class="page-header">
  <h2 class="text-nowrap"><span class="glyphicon glyphicon-list-alt ff-text"></span> {$vod_name}剧情列表</h2>
</div>
<ul class="ff-row item">
  <volist name="vod_scenario.info" id="feifei">
  <li class="ff-col">
  <a href="{:ff_url('scenario/detail', array('id'=>$vod_id,pid=>$i), true)}" title="{$vod_name}第{$i}集剧情介绍">{$vod_name} 第{$i}集 剧情介绍</a>
  </li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2 class="text-nowrap"><span class="glyphicon glyphicon-play ff-text"></span> {$vod_name}在线观看</h2>
</div>
<ul class="ff-row item">
  <volist name="vod_scenario.info" id="feifei">
  <li class="ff-col">
  <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line[0]['player_sid'],$i)}">{$vod_name} 第{$i}集 在线观看</a>
  </li>
  </volist>
</ul>
</notempty>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-film ff-text"></span>
  <a href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}">{$vod_name}剧情介绍</a>
  <small><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a></small>
  </h2>
</div>
<include file="BlockTheme:vod_inc_info" />
<include file="BlockBase:forum_ajax_vod" />
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>