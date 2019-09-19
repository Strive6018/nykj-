<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail-sp">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h4>
  <span class="ff-text-right ff-text">{$vod_actor|ff_url_search}</span>
  {$vod_name|msubstr=0,30}
  <small class="ff-text-right"><a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a><include file="BlockTheme:vod_type" /></small>
  </h4>
</div>
<div class="row ff-row">
<div class="col-xs-8 ff-col">
	<div class="embed-responsive embed-responsive-4by3" id="cms_player">
    <div id="cms-player-vip">
      <div class="cms-player-box"></div>
      <iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe>
    </div>
  </div>
  <div class="clearfix"></div>
  <ul class="list-unstyled row vod-tool">
    <li class="col-sm-6 col-xs-12"><include file="BlockBase:vod_updown" /></li>
    <li class="col-sm-6 hidden-xs"><include file="BlockBase:vod_score" /></li>
  </ul>
</div>
<div class="col-xs-4 ff-col">
  <ul class="list-unstyled text-center ff-ads">
    {:ff_url_ads('300_250')}
  </ul>
  <ul class="list-unstyled text-center ff-ads">
    {:ff_url_ads('300_250')}
  </ul>
</div>
<php>
$item_list=ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:30;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
if(!$item_list){
	$item_list=$item_list = ff_mysql_vod('cid:'.$vod_cid.';tag_name:'.$Tag[1]['tag_name'].';tag_list:vod_type;limit:30;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}</php>
<div class="clearfix ff-clearfix"></div>
<div class="col-xs-12 ff-col">
  <div class="page-header ff-border-none">
    <h4 class="ff-text">你可能喜欢</h4>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-90">
    <volist name="item_list" id="feifei">
		<li class="col-xs-2">
    	<include file="BlockTheme:vod_item_img_sp" />
		</li>
    </volist>
  </ul>
</div>
</div><!--row end -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>