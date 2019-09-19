<include file="BlockTheme:vod_playurl" />
<php>
$play_pid = intval($_GET['pid']);
$play_sid = $playurl_yugao['player_sid'];
$play_count = $playurl_yugao['player_count'];
if($play_count>1){
	$play_title = '第'.$play_pid .'集预告';
}else{
	$play_title = '预告片';
}
$item_list=ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:18;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
if(!$item_list){
	$item_list=$item_list = ff_mysql_vod('cid:'.$vod_cid.';tag_name:'.$Tag[1]['tag_name'].';tag_list:vod_type;limit:18;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_yugao" />
</head>
<body class="vod-yugao vod-play">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h4>
  <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name|msubstr=0,10}</a>
  <a href="{:ff_url('vod/yugao',array('id'=>$vod_id,'pid'=>$play_pid),true)}">{$play_title}</a>
  <small class="ff-text-right"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a><include file="BlockBase:vod_type" /></small>
  </h4>
</div>
<div class="row ff-row">
<div class="col-xs-8 ff-col">
  <div class="embed-responsive embed-responsive-4by3" id="cms_player">
    <div id="cms-player-vip">
      <div class="cms-player-box"></div>
      <iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>$play_sid,'pid'=>$play_pid))}" width="100%" height="100%" frameborder="0"></iframe>
    </div>
  </div>
</div>
<div class="col-xs-4 ff-col">
	<ul class="list-unstyled text-center ff-ads">
    {:ff_url_ads('300_300')}
  </ul>
	<div class="media">
    <a class="media-left" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
      <img class="media-object img-thumbnail img-responsive ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
    </a>
    <div class="media-body">
      <h5>
        <a class="ff-text" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name|msubstr=0,12,true}</a>
      </h5>
      <dl class="dl-horizontal">
        <dt>主演：</dt>
        <dd class="ff-text-hidden ff-text-right">{$vod_actor|ff_url_search}</dd>
        <dt>导演：</dt>
        <dd class="ff-text-hidden ff-text-right">{$vod_director|ff_url_search='director'}</dd>
        <dt>类型：</dt>
        <dd class="ff-text-hidden ff-text-right">
          <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
          <include file="BlockBase:vod_type" />
        </dd>
        <dt>地区：</dt>
        <dd class="ff-text-hidden"><include file="BlockBase:vod_area" /></dd>
        <dt>年份：</dt>
        <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a></dd>
      </dl>
    </div>
   </div>
</div>
<notempty name="playurl_yugao"> 
<div class="clearfix ff-clearfix"></div>
  <div class="col-xs-12 ff-col">
  <div class="page-header ff-border-none">
    <h4 class="ff-text">预告片列表</h4>
  </div>
  <ul class="list-unstyled ff-playurl ff-playurl-yugao" data-active="{$vod_id}-{$play_pid}" data-more="{$Think.config.ui_playurl|intval}">
  <volist name="playurl_yugao.son" id="feifeison" key="pid">
  <li class="col-xs-1" data-id="{$vod_id}-{$pid}">
  <a href="{:ff_url('vod/yugao',array('id'=>$vod_id,'pid'=>$pid),true)}" class="btn btn-default btn-block">{$feifeison.title|h|msubstr=0,4}</a>
  </li>
  </volist>
  </ul>
</div>
</notempty>
<notempty name="playurl_line"> 
<div class="clearfix ff-clearfix"></div>
  <div class="col-xs-12 ff-col">
  <div class="page-header ff-border-none">
    <h4 class="ff-text">正片列表</h4>
  </div>
  <ul class="list-unstyled ff-playurl" data-more="{$Think.config.ui_playurl|intval}">
  <volist name="playurl_line.son" id="feifeison" key="pid">
  <li class="col-xs-1">
  <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line['player_sid'],$playurl_line['player_count'])}" class="btn btn-default btn-block">{$feifeison.title|h|msubstr=0,4}</a>
  </li>
  </volist>
  </ul>
</div>
</notempty>
<div class="clearfix ff-clearfix"></div>
<div class="col-xs-12 ff-col">
	<div class="page-header ff-border-none">
    <h4 class="ff-text">你可能喜欢</h4>
  </div>
  <include file="BlockTheme:vod_item_img_hot" />
</div>
</div><!--row end -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>