<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail-sp">
<include file="BlockTheme:header" />
<div class="container ff-bg">
  <ul class="list-unstyled ff-row">
    <div class="embed-responsive embed-responsive-4by3" id="cms_player">
      <div id="cms-player-vip">
        <div class="cms-player-box"></div>
        <iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe>
      </div>
    </div>
  </ul>
  <ul class="list-unstyled ff-row ff-player-tool">
    <li class="col-xs-7 ff-col"><include file="BlockBase:vod_updown" /></li>
    <li class="col-xs-5 ff-col text-nowrap"><include file="BlockBase:vod_score" /></li>
  </ul>
</div>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg text-center">
	<div class="ff-ads-90">{:ff_url_ads('90_m')}</div>
</div>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-heart-empty ff-text"></span> 猜你喜欢</h2>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-90">
    <volist name=":ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:24;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc')" id="feifei">
    <include file="BlockTheme:vod_item_img_sp" />
    </volist>
  </ul>
</div>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
	<include file="BlockBase:forum_ajax_vod" />
</div>
{$vod_hits_insert}
<include file="BlockTheme:footer" />
</body>
</html>