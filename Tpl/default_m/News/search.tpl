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
<div class="container ff-bg">
<div class="page-header">
  <h2>
   <span class="glyphicon glyphicon-list-alt ff-text"></span> 搜索结果：{$search_name}{$search_wd}
   <small>共有<span class="ff-text">{:ff_page_count('search', 'records')}</span>篇内容 第<span class="ff-text">{$search_page}</span>页</small>
  </h2>
</div>
<!-- -->
<volist name="item_news" id="feifei">
	<include file="BlockTheme:news_item_medial" />
</volist>
</div>
<!-- -->
<gt name="totalpages" value="1">
  <div class="clearfix ff-clearfix"></div>
  <div class="container ff-bg text-center">
    <ul class="pager">
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
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
<div class="page-header">
  <h2><span class="glyphicon glyphicon-signal ff-text"></span> 最近更新</h2>
</div>
<php>$item_news = ff_mysql_news('limit:20;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<ul class="news-item-ul ff-row">
  <volist name="item_news" id="feifei">
    <include file="BlockTheme:news_item_hot" />
  </volist>
</ul>
</div>
<!--container end -->
<include file="BlockTheme:footer" />
</body>
</html>