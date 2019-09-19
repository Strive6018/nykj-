<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
  <div class="media">
    <div class="media-left">
      <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
        <img class="media-object img-thumbnail ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
      </a>
    </div>
    <div class="media-body">
      <h2 class="text-nowrap">
        <a class="ff-text" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a>
        <small><include file="BlockBase:vod_continu" /></small>
      </h2>
      <dl class="dl-horizontal">
        <dt>主演：</dt>
        <dd class="ff-text-right text-nowrap">{$vod_actor|ff_url_search}</dd>
        <dt>导演：</dt>
        <dd class="ff-text-right">{$vod_director|ff_url_search='director'}</dd>
        <dt>类型：</dt>
        <dd class="ff-text-right">
        <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
        <include file="BlockBase:vod_type" />
        </dd>
        <dt>地区：</dt>
        <dd class="ff-text-right"><include file="BlockBase:vod_area" /></dd>
        <dt>年份：</dt>
        <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a></dd>
      </dl>
    </div>
  </div>
  <!-- -->
  <ul class="list-unstyled ff-row vod-like">
    <li class="col-xs-4"><a class="btn btn-default btn-block btn-sm ff-record-set" href="javascript:;" data-sid="{$site_sid}" data-id="{$vod_id}" data-type="2" data-toggle="tooltip" data-placement="top" title="喜欢"><span class="glyphicon glyphicon-heart-empty ff-text"></span> 喜欢</a></li>
    <li class="col-xs-4"><a class="btn btn-default btn-block btn-sm ff-record-set" href="javascript:;" data-sid="{$site_sid}" data-id="{$vod_id}" data-type="3" data-toggle="tooltip" data-placement="top" title="想看"><span class="glyphicon glyphicon-ok ff-text"></span> 想看</a></li>
    <li class="col-xs-4"><a class="btn btn-default btn-block btn-sm ff-record-set" href="javascript:;" data-sid="{$site_sid}" data-id="{$vod_id}" data-type="5" data-toggle="tooltip" data-placement="top" title="看过"><span class="glyphicon glyphicon-time ff-text"></span> 看过</a></li>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
	<include file="BlockBase:vod_playurl" />
  <ul class="nav nav-tabs nav-tabs-play">
    <li class="text-center active">
      <a href="javascript:;" data-target=".vod-nav-play" data-toggle="tab"><span class="glyphicon glyphicon-film"></span> 在线播放</a>
    </li>
    <li class="text-center">
      <a href="javascript:;" data-target=".vod-nav-content" data-toggle="tab"><span class="glyphicon glyphicon-th-large"></span> 剧情简介</a>
    </li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane fade in active vod-nav-play">
      <if condition="count($playurl_line) eq 1">
        <include file="BlockBase:vod_playurl_line" />
      <else />
        <include file="BlockBase:vod_playurl_line_dropdown" />
      </if>
      <!-- -->
      <if condition="count($playurl_yugao) eq 1">
        <include file="BlockBase:vod_playurl_yugao" />
      <else />
        <include file="BlockBase:vod_playurl_yugao_dropdown" />
      </if>
    </div>
    <div class="tab-pane fade vod-nav-content">
      {:ff_url_tags_content(nb(strip_tags($vod_content,"<a>")),$Tag)}
    </div>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>
<!-- -->
<div class="container ff-bg">
<!-- -->
<include file="BlockBase:vod_playurl_down" />
<!-- -->
<include file="BlockTheme:vod_item_img_hot" />
</div>
<!-- -->
<include file="BlockTheme:footer" />
</body>
</html>