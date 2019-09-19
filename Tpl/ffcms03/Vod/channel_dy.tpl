<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="vod-channel">
<include file="BlockTheme:header" />
<div class="container">
<div class="row">
  <div class="col-xs-9">
  	<div class="page-header">
      <h2>院线热映 <a class="btn btn-xs btn-default pull-right" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','ispay'=>'','order'=>'hits','p'=>1),true)}">更多 <span class="glyphicon glyphicon-chevron-right"></span></a></h2>
    </div>
  	<php>$item_list=ff_mysql_vod('cid:'.$list_id.';limit:9;filmday:60;cache_name:default;cache_time:default;order:vod_stars desc,vod_id;sort:desc');</php>
    <div class="row ff-row">
    	<div class="col-xs-4 ff-col">
      	<ul class="list-unstyled vod-item-img ff-img-310">
        <volist name="item_list" id="feifei" offset="0" length="1">
        <li class="col-xs-12"><include file="BlockTheme:vod_channel_img" /></li>
        </volist>
        </ul>
      </div>
      <div class="col-xs-8 ff-col">
      	<ul class="list-unstyled vod-item-img ff-img-140">
        <volist name="item_list" id="feifei" offset="1" length="8">
        <li class="col-xs-3"><include file="BlockTheme:vod_item_img" /></li>
        </volist>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-xs-3">
  	<div class="page-header">
    	<h2>票房&nbsp;•&nbsp;热播榜</h2>
    </div>
    <php>$item_list=ff_mysql_vod('cid:'.$list_id.';limit:10;filmday:60;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits;sort:desc');</php>
    <include file="BlockTheme:vod_channel_hot" />
  </div>
</div><!--row end -->
<!-- -->
<div class="sort">
  <dl class="dl-horizontal area">
    <dt>地<br>区</dt>
    <dd><volist name=":explode(',',$list_extend['area'])" id="feifeilist" offset="0" length="7"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifeilist),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="{$feifeilist}">{$feifeilist|msubstr=0,3}</a></volist><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="全部">全部&gt;</a></dd>
  </dl>
  <dl class="dl-horizontal type">
    <dt>类<br>型</dt>
    <dd><volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="9"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="{$feifeilist}">{$feifeilist|msubstr=0,3}</a></volist><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="全部">全部&gt;</a></dd>
  </dl>
  <dl class="dl-horizontal star">
    <dt>明<br>星</dt>
    <dd><volist name=":explode(',',$list_extend['star'])" id="feifeilist" offset="0" length="8"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>urlencode($feifeilist),'state'=>'','order'=>'addtime','p'=>1),true)}" title="{$feifeilist}">{$feifeilist|msubstr=0,3}</a></volist></dd>
  </dl>
</div>
<!-- -->
<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="6">
<php>$item_list=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:9;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');</php>
<notempty name="item_list">
<div class="row">
  <div class="col-xs-9">
  	<div class="page-header">
      <h2>{:str_replace('片','',$feifeilist)} <a class="btn btn-xs btn-default pull-right" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多 <span class="glyphicon glyphicon-chevron-right"></span></a></h2>
    </div>
    <div class="row ff-row">

    	<div class="col-xs-4 ff-col">
      	<ul class="list-unstyled vod-item-img ff-img-310">
        <volist name="item_list" id="feifei" offset="0" length="1">
        <li class="col-xs-12"><include file="BlockTheme:vod_channel_img" /></li>
        </volist>
        </ul>
      </div>
      <div class="col-xs-8 ff-col">
      	<ul class="list-unstyled vod-item-img ff-img-140">
        <volist name="item_list" id="feifei" offset="1" length="8">
        <li class="col-xs-3"><include file="BlockTheme:vod_item_img" /></li>
        </volist>
        </ul>
      </div>
    </div>
  </div>
  <div class="col-xs-3">
  	<div class="page-header">
    	<h2>{:str_replace('片','',$feifeilist)}&nbsp;•&nbsp;排行榜</h2>
    </div>
    <php>$item_list=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:10;cache_name:default;cache_time:default;order:vod_gold;sort:desc');</php>
    <include file="BlockTheme:vod_channel_gold" />
  </div>
</div><!--row end -->
<div class="clear ff-clearfix"></div>
</notempty>
</volist>
<!-- -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>