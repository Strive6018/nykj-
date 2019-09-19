<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_channel" />
</head>
<body class="news-list">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<volist name=":explode(',',$list_extend['type'])" id="feifeitype" offset="0" length="12">
<php>$item_news = ff_mysql_news('cid:'.$list_id.';tag_name:'.$feifeitype.';tag_list:news_type;limit:10;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<notempty name="item_news">
<div class="page-header">
  <h2>
    <span class="glyphicon glyphicon-list-alt ff-text"></span>
    <a href="{:ff_url('news/type',array('type'=>urlencode($feifeitype),'id'=>$list_id,'p'=>1),true)}">{$feifeitype}</a>
  </h2>
</div>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <include file="BlockTheme:news_item_hot" />
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="row">
  <div class="col-xs-6 col-xs-offset-3">
  	<a href="{:ff_url('news/type',array('type'=>urlencode($feifeitype),'id'=>$list_id,'p'=>1),true)}" class="btn btn-block ff-btn">更多{$feifeitype}...</a>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>
</notempty>
</volist>
</div><!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>