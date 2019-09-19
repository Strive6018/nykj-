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
<div class="container">
<div class="page-header">
  <h2><a class="ff-text" href="{:ff_url('special/read', array('id'=>$special_id), true)}">{$special_name}</a></h2>
  <div class="share"><include file="BlockBase:vod_share" /></div>
</div>
<h4 class="content">
	{$special_content}
</h4>
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-film ff-text"></span> 相关影片</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-215">
  <volist name="item_vod" id="feifei">
  	<li class="col-xs-2 ff-col"><include file="BlockTheme:vod_item_img" /></li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
<notempty name="item_news">
<div class="clearfix ff-clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-list-alt ff-text"></span> 相关资讯</h2>
</div>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
  	<li class="col-xs-6 ff-col"><include file="BlockTheme:news_item_hot" /></li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
</notempty>
<!-- -->
<include file="BlockBase:forum_ajax_special" />
{$special_hits_insert}
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>