<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail_pid" />
</head>
<body class="scenario-detail">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2>
  	<span class="ff-text">{$vod_name}</span>
    <span class="ff-text">第{$scenario_pid}集</span> 剧情介绍
  </h2>
</div>
<div class="row ff-row">
  <div class="col-xs-12 ff-col">
    <p class="info">
    	{:ff_url_tags_content(strip_tags($vod_scenario['info'][$scenario_pid-1],'<a>'),$Tag)}
    </p>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-film ff-text"></span>
  <a href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}">{$vod_name} 影片资料</a>
  </h2>
</div>
<div class="media vod-inc-info">
  <div class="media-left">
    <a class="vod-pic" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
      <img class="media-object img-thumbnail ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
    </a>
  </div>
  <div class="media-body">
    <dl class="dl-horizontal">
      <dt>主演：</dt>
      <dd class="text-nowrap ff-text-right">
      	{$vod_actor|ff_url_search}
      </dd>
      <dt>导演：</dt>
      <dd class="text-nowrap ff-text-right">
      	{$vod_director|ff_url_search='director'}
      </dd>
      <dt>地区：</dt>
      <dd class="text-nowrap ff-text-right">
      	<include file="BlockBase:vod_area" />
      </dd>
      <dt>年份：</dt>
      <dd class="text-nowrap ff-text-right">
      	<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a>
      </dd>
      <dt>链接：</dt>
      <dd class="text-nowrap ff-text-right">
      <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}免费观看</a>
      <a href="{:ff_url('forum/vod',array('cid'=>$vod_id),true)}">{$vod_name}影评</a>
      </dd>
    </dl>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>
<notempty name="vod_scenario.info">
<include file="BlockBase:vod_playurl" />
<div class="page-header">
  <h2><span class="glyphicon glyphicon-list-alt ff-text"></span> {$vod_name} 剧情列表</h2>
</div>
<ul class="ff-row item">
  <volist name="vod_scenario.info" id="feifei">
  <li class="col-md-4 ff-col">
  <a href="{:ff_url('scenario/detail', array('id'=>$vod_id,pid=>$i), true)}" title="{$vod_name}第{$i}集剧情介绍">{$vod_name} 第{$i}集 剧情介绍</a>
  </li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-play ff-text"></span> {$vod_name} 在线观看</h2>
</div>
<ul class="ff-row item">
  <volist name="vod_scenario.info" id="feifei">
  <li class="col-md-4 ff-col">
  <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line[0]['player_sid'],$i)}">{$vod_name} 第{$i}集 在线观看</a>
  </li>
  </volist>
</ul>
</notempty>
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>