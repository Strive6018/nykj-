<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_down" />
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
    	<a href="{:ff_url('vod/down',array('id'=>$vod_id),true)}" class="btn btn-primary btn-lg">
      <span class="glyphicon glyphicon-circle-arrow-down"></span> 下载观看</a>
      <notempty name="playurl_yugao">
      <a href="{:ff_url('vod/yugao',array('id'=>$vod_id,'pid'=>$playurl_yugao['player_count']),true)}" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-play-circle"></span> 预告片</a>
      </notempty>
      <notempty name="playurl_line">
      <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$playurl_line['player_sid'],$playurl_line['player_count'])}" class="btn btn-play btn-lg"><span class="glyphicon glyphicon-play-circle"></span> 播放正片</a>
      </notempty>
    </dd>
  </dl>
</div>
<div class="col-xs-4 ff-col text-center">
	<div class="ff-ads">{:ff_url_ads('300_250')}</div>
</div>
<!-- -->
</div><!--row end -->
<div class="page-header ff-playurl-down">
  <h2>
    <span class="glyphicon glyphicon-cloud-download ff-text"></span>
    下载观看 <small>友情提示：未安装工具时，会自动提示安装，安装完毕后即可高速下载。</small>
  </h2>
</div>
<div class="table-responsive ff-playurl-down">
<table class="table table-bordered">
<thead>
<tr>
  <th>全集{$playurl_down.player_name_zh}</th>
  <th><a class="thunder_down_all" href="javascript:;">迅雷下载</a></th>
  <th><a class="xf_down_all" href="javascript:void(0);">旋风下载</a></th></tr>
</thead>
<tbody>
<volist name="playurl_down.son" id="feifeison" key="pid">
<tr>
  <td><div class="input-group">
  <span class="input-group-addon">
  <input class="down_url" name="down_url_list_0" type="checkbox" value="{$feifeison.url|ff_ThunderEncode}" file_name="{$feifeison.title}" checked="checked">
  </span>
  <input class="form-control" type="text" value="{$feifeison.title} {$feifeison.url|ff_ThunderEncode}">
  </div>
  </td>
  <td><button type="button" class="btn btn-success btn-sm thunder_down">迅雷下载</button></td>
  <td><button type="button" class="btn btn-warning btn-sm qqdl">旋风下载</button></td></tr>
<tr>
</volist>
</tbody>
</table>
</div>
<div class="clearfix"></div>
<div class="page-header">
  <h2 class="ff-text">影片评论</h2>
</div>
<div class="ff-forum" id="tab-forum" data-type="{$Think.config.forum_type}">
  <include file="BlockTheme:vod_item_forum" />
</div>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div>
</body>
</html>