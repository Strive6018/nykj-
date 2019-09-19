<php>if($search_wd){
	$item_news = ff_mysql_news('wd:'.$search_wd.';limit:10;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:news_'.$search_order.';sort:desc');
  $params = array('wd'=>urlencode($search_wd),'p'=>'FFLINK');
  $page = ff_url_page('news/search', $params, true, 'search', 4);
}else if($search_remark){
	$item_news = ff_mysql_vod('remark:'.$search_remark.';limit:10;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:news_'.$search_order.';sort:desc');
  $params = array('remark'=>urlencode($search_remark),'p'=>'FFLINK');
  $page = ff_url_page('news/search', $params, true, 'search', 4);
}else if($search_name){
	$item_news = ff_mysql_news('name:'.$search_name.';limit:10;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:news_'.$search_order.';sort:desc');
  $params = array('name'=>urlencode($search_name),'p'=>'FFLINK');
  $page = ff_url_page('news/search', $params, true, 'search', 4);
}else if($search_title){
	$item_news = ff_mysql_news('title:'.$search_title.';limit:10;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:news_'.$search_order.';sort:desc');
  $params = array('title'=>urlencode($search_title),'p'=>'FFLINK');
  $page = ff_url_page('news/search', $params, true, 'search', 4);
}
$totalpages = ff_page_count('search', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_search" />
</head>
<body class="bg-light news-search">
<include file="BlockTheme:header" />
<main>
<div class="container">	
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item active mr-auto">{$search_name}{$search_wd}</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('search', 'records')}</strong>篇 第<strong>{$search_page}</strong>页</li>
</ul>
<!-- -->
<div class="row">
<volist name="item_news" id="feifei">
  <include file="BlockTheme:news_card_item" />
</volist>
</div>
<!-- -->
<ul class="mt-3 pagination d-flex flex-wrap justify-content-end">
{$page}
</ul>
</main>
<include file="BlockTheme:footer" />
</body>
</html>