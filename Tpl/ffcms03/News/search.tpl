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
<body class="news-search">
<include file="BlockTheme:header" />
<div class="container">
<div class="page-header">
  <h2>
   搜索结果：<span class="ff-text">{$search_name}{$search_wd}</span>
   <small>共有<span class="ff-text">{:ff_page_count('search', 'records')}</span>篇内容 第<span class="ff-text">{$search_page}</span>页</small>
  </h2>
</div>
<!-- -->
<volist name="item_news" id="feifei">
	<include file="BlockTheme:news_item_medial" />
</volist>
<!-- -->
<gt name="totalpages" value="1">
  <div class="clearfix"></div>
  <div class="text-center">
    <ul class="pagination pagination-lg hidden-xs">
      {$page}
    </ul>
    <ul class="pager visible-xs">
      <gt name="search_page" value="1">
        <php>$params['p'] = $search_page-1</php>
        <li><a id="ff-prev" href="{:ff_url('news/search', $params, true)}">上一页</a></li>
      </gt>
      <lt name="search_page" value="$totalpages">
        <php>$params['p'] = $search_page+1</php>
        <li><a id="ff-next" href="{:ff_url('news/search', $params, true)}">下一页</a></li>
      </lt>
     </ul>
  </div>
</gt>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-signal ff-text"></span> 最近更新</h2>
</div>
<php>$item_news = ff_mysql_news('limit:20;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <li class="col-xs-6 ff-col"><include file="BlockTheme:news_item_hot" /></li>
  </volist>
</ul>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>