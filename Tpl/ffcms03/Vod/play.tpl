<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_play" />
</head>
<include file="BlockBase:vod_playurl" />
<body class="vod-play">
<div class="container">
<include file="BlockTheme:header" />
<div class="row ff-row">
  <div class="col-md-8 ff-col">
    <include file="BlockBase:vod_player" />
  </div>
  <div class="col-md-4 ff-col">
    <div class="media">
      <a class="media-left" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
        <img class="media-object img-thumbnail img-responsive ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
      </a>
      <div class="media-body">
        <h5 class="ff-text-hidden">
          <a class="ff-text" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a>
          <small>第{$play_pid}集</small>
        </h5>
        <dl class="dl-horizontal">
          <dt>主演：</dt>
          <dd class="text-nowrap ff-text-right">{$vod_actor|ff_url_search}</dd>
          <dt>导演：</dt>
          <dd class="text-nowrap ff-text-right">{$vod_director|ff_url_search='director'}</dd>
          <dt>类型：</dt>
          <dd class="text-nowrap ff-text-right">
            <a class="ff-text" href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
            <include file="BlockBase:vod_type" />
          </dd>
          <dt>地区：</dt>
          <dd class="text-nowrap"><include file="BlockBase:vod_area" /></dd>
          <dt>年份：</dt>
          <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a></dd>
        </dl>
      </div>
    </div>
    <div class="clearfix"></div>
    <div class="text-center ff-ads">
      {:ff_url_ads('300_300')}
    </div>
  </div>
</div>
<div class="clearfix"></div>
<ul class="list-unstyled ff-row ff-player-tool ff-bg">
  <li class="col-sm-3 ff-col"><include file="BlockBase:vod_updown" /></li>
  <li class="col-sm-3 ff-col"><include file="BlockBase:vod_score" /></li>
  <li class="col-sm-2 ff-col text-right"><include file="BlockBase:vod_playurl_next" /></li>
  <li class="col-sm-4 ff-col"><include file="BlockBase:vod_share" /></li>
</ul>
<!-- -->
<eq name="play_name_en" value="yugao">
	<include file="BlockBase:vod_playurl_yugao_tab" />
<else/>
	<include file="BlockBase:vod_playurl_line_tab" />
</eq>
<div class="clearfix"></div>
<!-- -->
<ul class="nav nav-tabs">
  <li class="active"><a href="#tab-like" data-toggle="tab">你可能喜欢</a></li>
 	<notempty name="vod_series"> 
    <li><a href="#tab-series" data-toggle="tab">影片系列</a></li>
  </notempty>  
  <li><a href="#tab-actor" data-toggle="tab">同主演作品</a></li>
  <li><a href="#tab-director" data-toggle="tab">同导演作品</a></li> 
</ul>
<div class="tab-content">
  <div class="tab-pane fade in active" id="tab-like">
  	<include file="BlockTheme:vod_item_img_hot" />
  </div>
  <div class="tab-pane fade" id="tab-series">
  	<include file="BlockTheme:vod_item_img_series" />
  </div>
  <div class="tab-pane fade" id="tab-actor">
  	<include file="BlockTheme:vod_item_img_actor" />
  </div>
  <div class="tab-pane fade" id="tab-director">
  	<include file="BlockTheme:vod_item_img_director" />
  </div>
</div>
<!-- -->
<div class="clearfix"></div>
<div class="page-header">
  <h2 class="ff-text">影片评论</h2>
</div>
<div class="ff-forum" id="tab-forum" data-type="{$Think.config.forum_type}">
  <include file="BlockTheme:vod_item_forum" />
</div>
<!-- -->
<include file="BlockBase:vod_record_set" />
{$vod_hits_insert}
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>