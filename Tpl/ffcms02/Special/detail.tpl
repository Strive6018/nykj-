<php>if($special_tag_name){
	$item_vod = ff_mysql_vod('limit:48;tag_name:'.$special_tag_name.';tag_list:vod_tag;cache_name:default;cache_time:default;order:vod_hits desc');
  $item_news = ff_mysql_news('limit:30;tag_name:'.$special_tag_name.';tag_list:news_tag;cache_name:default;cache_time:default;order:news_hits desc');
}else{
	$item_vod = ff_mysql_vod('limit:48;ids:'.$special_ids_vod.';cache_name:default;cache_time:default;order:vod_hits desc');
  $item_news = ff_mysql_news('limit:30;ids:'.$special_ids_news.';cache_name:default;cache_time:default;order:news_hits desc');
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:special_detail" />
</head>
<body class="bg-light special-detail">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item"><a href="{:ff_url('special/show',array('p'=>1),true)}">专题</a></li>
	<li class="breadcrumb-item active">{$special_name}</li>
</ul>
<div class="rounded border bg-white mt-3 p-3 special-content">
	{$special_content}
</div>
<!-- -->
<notempty name="item_vod">
<div class="alert bg-theme border-0 mt-3 mb-0">
	<a class="h6" href="javascript:;">相关影片</a>
</div>
<div class="row">
<volist name="item_vod" id="feifei">
  <include file="BlockTheme:vod_card_item" />
</volist>
</div>
</notempty>
<!-- -->
<notempty name="item_news">
<div class="alert bg-theme border-0 mt-3 mb-0">
	<a class="h6" href="javascript:;">相关资讯</a>
</div>
<div class="row">
<volist name="item_news" id="feifei">
  <include file="BlockTheme:news_card_item" />
</volist>
</div>
</notempty>
<include file="BlockBase:forum_ajax_special" />
{$special_hits_insert}
<include file="BlockTheme:footer" />
</main>
</body>
</html>