<php>
if($search_wd){
	$item_vod = ff_mysql_vod('cid:1,2,3,4;wd:'.$search_wd.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('wd'=>urlencode($search_wd),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_actor){
	$item_vod = ff_mysql_vod('actor:'.$search_actor.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('actor'=>urlencode($search_actor),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_director){
	$item_vod = ff_mysql_vod('cid:1,2,3,4;director:'.$search_director.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('director'=>urlencode($search_director),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_name){
	$item_vod = ff_mysql_vod('cid:1,2,3,4;name:'.$search_name.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('name'=>urlencode($search_name),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_title){
	$item_vod = ff_mysql_vod('cid:1,2,3,4;title:'.$search_title.';limit:30;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('title'=>urlencode($search_title),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}
$totalpages = ff_page_count('search', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_search" />
</head>
<body class="vod-search vod-list">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2>搜索结果：<span class="ff-text">{$search_name}{$search_actor}{$search_director}{$search_wd}</span> <small>共有<span class="ff-text">{:ff_page_count('search', 'records')}</span>个视频 第<span class="ff-text">{$search_page}</span>页</small></h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-215">
  <volist name="item_vod" id="feifei">
  	<li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
  </volist>
</ul>
<div class="row">
<div class="col-xs-12 text-center">
  <ul class="pagination pagination-lg hidden-xs">
    {$page}
  </ul>
   <ul class="pager visible-xs">
      <gt name="search_page" value="1">
        <php>$params['p'] = $search_page-1</php>
        <li><a id="ff-prev" href="{:ff_url('vod/search', $params, true)}">上一页</a></li>
      </gt>
      <lt name="search_page" value="$totalpages">
        <php>$params['p'] = $search_page+1</php>
        <li><a id="ff-next" href="{:ff_url('vod/search', $params, true)}">下一页</a></li>
      </lt>
   </ul> 
</div>
<!-- -->
</div><!--row end -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>