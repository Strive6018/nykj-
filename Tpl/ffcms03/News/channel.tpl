<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_channel" />
</head>
<body class="news-list">
<include file="BlockTheme:header" />
<div class="container">
<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="12">
<php>$item_news = ff_mysql_news('cid:'.$list_id.';tag_name:'.$feifei.';tag_list:news_type;limit:30;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<notempty name="item_news">
<div class="page-header">
  <h2><a class="ff-text" href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a></h2>
</div>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <li class="col-xs-6 ff-col"><include file="BlockTheme:news_item_hot" /></li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
</notempty>
</volist>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>