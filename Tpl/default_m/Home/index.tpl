<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:index" />
</head>
<body class="index">
<include file="BlockTheme:header" />
<!-- -->
<div class="container ff-bg">
  <div class="row ff-row slide">
    <div class="col-xs-12 ff-col">
    <include file="Slide:index" />
    </div>
  </div>
</div>
<!-- -->
<volist name="item_list" id="feifeilist" offset="0" length="4">
<div class="container ff-bg">
<div class="page-header">
  <h2 class="ff-text-right">
    <span class="glyphicon glyphicon-film ff-text"></span>
    <a href="{:ff_url_vod_show($feifeilist['list_id'],$feifeilist['list_dir'],1)}">{$feifeilist.list_name}</a>
    <span class="hidden-xs pull-right">
    <a class="ff-text" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
    </span>
    <small class="visible-xs pull-right">
    <a class="btn btn-success btn-xs" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
    </small>
  </h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-140">
  <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:9;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc')" id="feifei">
  <include file="BlockTheme:vod_item_img" />
  </volist>
</ul>
<div class="clearfix"></div>
<ul class="list-unstyled ff-row vod-type">
  <volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" offset="0" length="12">
  <li class="col-xs-3 ff-col"><a class="btn btn-default btn-block" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifeitype}</a></li>
  </volist>
</ul>
</div><!--container end-->
<div class="clearfix ff-clearfix"></div>
</volist>
</div>
</div>
<!-- 短视频 样式-->
<volist name="item_list" id="feifeilist" offset="4" length='1'>
<div class="container ff-bg">
  <div class="page-header">
    <h2 class="ff-text-right">
      <span class="glyphicon glyphicon-film ff-text"></span>
      <a href="{:ff_url_vod_show($feifeilist['list_id'],$feifeilist['list_dir'],1)}">{$feifeilist.list_name}</a>
      <span class="hidden-xs pull-right">
      <a class="ff-text" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
      </span>
      <small class="visible-xs pull-right">
      <a class="btn btn-success btn-xs" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
      </small>
    </h2>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-90">
    <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:10;cache_name:default;cache_time:default;order:vod_addtime;sort:desc')" id="feifei">
    <include file="BlockTheme:vod_item_img_sp" />
    </volist>
  </ul>
  <div class="clearfix"></div>
  <ul class="list-unstyled ff-row vod-type">
    <volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" offset="0" length="12">
    <li class="col-xs-3 ff-col"><a class="btn btn-default btn-block" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifeitype}</a></li>
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div>
</volist>
<!-- 文章最新 -->
<php>$item_news = ff_mysql_news('limit:15;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<notempty name="item_news">
<div class="container ff-bg">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-list-alt ff-text"></span> 最新资讯</h2>
  </div>
  <ul class="news-item-ul ff-row">
    <volist name="item_news" id="feifei">
      <include file="BlockTheme:news_item_hot" />
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div>
</notempty>
<include file="BlockTheme:footer" />
</body>
</html>