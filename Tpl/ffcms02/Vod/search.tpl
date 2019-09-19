<php>
if($search_wd){
	$item_vod = ff_mysql_vod('wd:'.$search_wd.';limit:40;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_'.$search_order.';sort:desc');
  $params = array('wd'=>urlencode($search_wd),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_actor){
	$item_vod = ff_mysql_vod('actor:'.$search_actor.';limit:40;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_'.$search_order.';sort:desc');
  $params = array('actor'=>urlencode($search_actor),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_director){
	$item_vod = ff_mysql_vod('director:'.$search_director.';limit:40;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_'.$search_order.';sort:desc');
  $params = array('director'=>urlencode($search_director),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_name){
	$item_vod = ff_mysql_vod('name:'.$search_name.';limit:40;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_'.$search_order.';sort:desc');
  $params = array('name'=>urlencode($search_name),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_title){
	$item_vod = ff_mysql_vod('title:'.$search_title.';limit:40;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_'.$search_order.';sort:desc');
  $params = array('title'=>urlencode($search_title),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}
$totalpages = ff_page_count('search', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_search" />
</head>
<body class="vod-tags">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item">搜索</li>
  <li class="breadcrumb-item active mr-auto">{$search_name}{$search_actor}{$search_director}{$search_wd}</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('search', 'records')}</strong>个影片  第<strong>{$search_page}</strong>页</li>
</ul>
<div class="row">
<volist name="item_vod" id="feifei">
	<include file="BlockTheme:vod_card_item" />
</volist>
</div>
<ul class="mt-3 pagination d-flex flex-wrap justify-content-end">
{$page}
</ul>
</main>
<include file="BlockTheme:footer" />
</body>
</html>