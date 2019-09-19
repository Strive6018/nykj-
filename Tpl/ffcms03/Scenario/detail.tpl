<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail" />
</head>
<body class="scenario-detail">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2><a class="ff-text" href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}">{$vod_name} 剧情介绍</a></h2>
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
  <h2>
    <span class="glyphicon glyphicon-th-list ff-text"></span> 
    <a href="{:ff_url('vod/scenario', array('id'=>$vod_id), true)}" title="{$vod_name}分集剧情">{$vod_name} 分集剧情</a>
  </h2>
</div>
<volist name="vod_scenario.info" id="feifei">
<dl class="contents">
  <dt><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line[0]['player_sid'],$i)}">{$vod_name} 第{$i}集</a></dt>
  <dd>{$feifei} <a href="{:ff_url('scenario/detail', array('id'=>$vod_id, pid=>$i), true)}" class="ff-text">详情...</a></dd>
</dl>
</volist>
</notempty>
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
<!-- -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
<!-- -->
</div><!--container end -->
</body>
</html>