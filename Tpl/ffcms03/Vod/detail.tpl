<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<include file="BlockTheme:vod_playurl" />
<body class="vod-detail">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h1 class="ff-text-right">
    <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a> 
    <small>{$list_name} <include file="BlockBase:vod_continu" /></small>
  </h1>
</div>
<div class="row">
<div class="col-xs-8 ff-col ff-info">
  <div class="pic">
    <img class="ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}全集观看">
  </div>
  <dl class="dl-horizontal infos">
    <dt>主演：</dt>
    <dd class="ff-text-hidden ff-text-right">{$vod_actor|ff_url_search}</dd>
    <dt>导演：</dt>
    <dd class="ff-text-hidden ff-text-right">{$vod_director|ff_url_search='director'}</dd>
    <dt>类型：</dt>
    <dd class="ff-text-hidden">
      <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a><volist name="Tag" id="feifei"><notempty name="feifei.tag_name"><eq name="feifei.tag_list" value="vod_type">&nbsp;/&nbsp;<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei['tag_name']),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">{$feifei.tag_name}</a></eq></notempty></volist>
    </dd>
    <dt>地区：</dt>
    <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($vod_area),'year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_area|default='未录入'}</a></dd>
    <dt>年份：</dt>
    <dd class="ff-text-right">
      <a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'addtime'),true)}">{$vod_year|default='2017'}</a>
    </dd>
    <dt>人气：</dt>
    <dd>{$vod_hits|number_format}</dd>
    <dd><include file="BlockBase:vod_score" /></dd>
    <dd class="share"><include file="BlockBase:vod_share" /></dd>
    <dd class="play">
      <notempty name="playurl_yugao">
      <a href="{:ff_url('vod/yugao',array('id'=>$vod_id,'pid'=>$playurl_yugao['player_count']),true)}" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-play-circle"></span> 预告片</a>
      </notempty>
      <notempty name="playurl_line">
      <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line['player_sid'],$playurl_line['player_count'])}" class="btn btn-play btn-lg"><span class="glyphicon glyphicon-play-circle"></span> 播放正片</a>
      </notempty>
      <notempty name="playurl_down">
      <a href="{:ff_url('vod/down',array('id'=>$vod_id),true)}" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-circle-arrow-down"></span> 下载观看</a>
      </notempty>
    </dd>
  </dl>
</div>
<div class="col-xs-4 ff-col text-center">
	<div class="ff-ads">{:ff_url_ads('300_250')}</div>
</div>
<div class="clearfix ff-clearfix"></div>
<div class="col-xs-12">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab-home" data-toggle="tab">影片详情</a></li>
    <notempty name="playurl_yugao"> 
      <li><a href="#tab-yugao" data-toggle="tab">片花&预告</a></li>
    </notempty>
    <notempty name="vod_series"> 
      <li><a href="#tab-series" data-toggle="tab">影片系列</a></li>
    </notempty>
    <notempty name="vod_scenario.info">
    <li><a href="#tab-scenario" data-toggle="tab">分集剧情</a></li>
    </notempty>
    <li><a href="#tab-actor" data-toggle="tab">同主演作品</a></li>
    <li><a href="#tab-director" data-toggle="tab">同导演作品</a></li>
    <li><a href="#tab-like" data-toggle="tab">你可能喜欢</a></li>
    <li><a href="#tab-forum" data-toggle="tab">影片评论</a></li>  
  </ul>
  <!-- -->
 	<div class="tab-content">
  <div class="tab-pane fade in active" id="tab-home">
  <gt name="playurl_line.player_count" value="1">
    <ul class="list-unstyled ff-playurl" data-more="{$Think.config.ui_playurl|intval}">
    <volist name="playurl_line.son" id="feifeison" key="pid">
    <li class="col-xs-1">
    <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line['player_sid'],$pid)}" class="btn btn-default btn-block btn-sm ff-text-hidden"><if condition="(strlen($feifeison['title']) eq 8) and is_numeric($feifeison['title'])">{$feifeison.title|msubstr=2,5}<else/>{$feifeison.title|msubstr=0,6}</if></a>
    </li>
    </volist>
    </ul>
  </gt>
    <div class="clearfix"></div>
    <div class="content">{:ff_url_tags_content(strip_tags($vod_content,'<a>,<p>'),$Tag)}</div>
  </div>
  <!-- -->
  <notempty name="playurl_yugao"> 
  <div class="tab-pane fade" id="tab-yugao">
    <ul class="list-unstyled ff-playurl" data-more="{$Think.config.ui_playurl|intval}">
    <volist name="playurl_yugao.son" id="feifeison" key="pid">
    <li class="col-xs-1">
    <a href="{:ff_url('vod/yugao',array('id'=>$vod_id,'pid'=>$pid),true)}" class="btn btn-default btn-block btn-sm ff-text-hidden">{$feifeison.title|h|msubstr=0,4}</a>
    </li>
    </volist>
    </ul>
  </div>
  </notempty>
  <!-- -->
  <notempty name="vod_series"> 
  <div class="tab-pane fade" id="tab-series">
    <include file="BlockTheme:vod_item_img_series" />
  </div>
  </notempty> 
  <!-- -->
  <notempty name="vod_scenario">
  <div class="tab-pane fade in active" id="tab-scenario">
  	<div class="page-header">
      <h2 class="ff-text">分集剧情</h2>
    </div>
  	<include file="BlockTheme:vod_item_scenario" />
  </div>
  </notempty>
  <!-- -->
  <div class="tab-pane fade" id="tab-actor">
    <include file="BlockTheme:vod_item_img_actor" />
  </div>
  <!-- -->
  <div class="tab-pane fade" id="tab-director">
    <include file="BlockTheme:vod_item_img_director" />
  </div>
  <!-- -->
  <div class="tab-pane fade in active" id="tab-like">
  	<div class="page-header">
      <h2 class="ff-text">您可能喜欢</h2>
    </div>
    <include file="BlockTheme:vod_item_img_hot" />
  </div>
  <!-- -->
  <div class="tab-pane fade in active" id="tab-forum">
  	<div class="page-header">
      <h2><a class="ff-text" href="{:ff_url('forum/vod', array('cid'=>$vod_id), true)}">影片评论</a></h2>
    </div>
    <div class="ff-forum" data-type="{$Think.config.forum_type}">
    	<include file="BlockTheme:vod_item_forum" />
    </div>
  </div>  
  <!-- -->
  </div><!--tabs end -->
</div>
<!-- -->
</div><!--row end -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div>
</body>
</html>