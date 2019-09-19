<php>if($special_tag_name){
	$item_vod = ff_mysql_vod('limit:24;tag_name:'.$special_tag_name.';tag_list:vod_tag;cache_name:default;cache_time:default;order:vod_hits desc');
  $item_news = ff_mysql_news('limit:30;tag_name:'.$special_tag_name.';tag_list:news_tag;cache_name:default;cache_time:default;order:news_hits desc');
}else{
	$item_vod = ff_mysql_vod('limit:24;ids:'.$special_ids_vod.';cache_name:default;cache_time:default;order:vod_hits desc');
  $item_news = ff_mysql_news('limit:30;ids:'.$special_ids_news.';cache_name:default;cache_time:default;order:news_hits desc');
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:special_detail" />
</head>
<body class="special-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-calendar ff-text"></span>
  <span class="ff-text">专题：{$special_name}</span>
  </h2> 
</div>
<p><img class="img-thumbnail img-responsive ff-img" data-original="{$special_banner|ff_url_img}"></p>
<p>{$special_content}</p>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-film ff-text"></span> 相关影片</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-140">
<volist name="item_vod" id="feifei">
<include file="BlockTheme:vod_item_img" />
</volist>
</ul>
<notempty name="item_news">
<div class="clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-list-alt ff-text"></span> 相关资讯</h2>
</div>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <include file="BlockTheme:news_item_hot" />
  </volist>
</ul>
</notempty>
<!-- -->
<include file="BlockBase:forum_ajax_special" />
{$special_hits_insert}
</div><!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>