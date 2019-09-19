<php>$item_news = ff_mysql_news('limit:24;tag_name:'.$tag_name.';tag_list:news_tag;page_is:true;page_id:list;page_p:'.$tag_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/tags',array('name'=>urlencode($tag_name),'p'=>'FFLINK'), true, 'list', 4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_tags" />
</head>
<body class="bg-light news-tags">
<include file="BlockTheme:header" />
<main>
<div class="container">	
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item active mr-auto">{$tag_type}{$tag_tag}{$tag_name}</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('list', 'records')}</strong>篇 第<strong>{$tag_page}</strong>页</li>
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