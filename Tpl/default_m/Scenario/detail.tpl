<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_detail" />
</head>
<body class="scenario-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-film ff-text"></span>
  <a href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}">{$vod_name}剧情介绍</a>
  <small><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a></small>
  </h2>
</div>
<include file="BlockTheme:vod_inc_info" />
<notempty name="vod_scenario.info">
<include file="BlockBase:vod_playurl" />
<div class="page-header">
  <h2>
    <span class="glyphicon glyphicon-th-list ff-text"></span> 
    <a href="{:ff_url('vod/scenario', array('id'=>$vod_id), true)}" title="{$vod_name}分集剧情">{$vod_name}分集剧情</a>
  </h2>
</div>
<volist name="vod_scenario.info" id="feifei">
<dl>
  <dt class="ff-text"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line[0]['player_sid'],$i)}">{$vod_name} 第{$i}集</a></dt>
  <dd>{$feifei} <a href="{:ff_url('scenario/detail', array('id'=>$vod_id, pid=>$i), true)}" class="ff-text">详情...</a></dd>
</dl>
</volist>
</notempty>
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>