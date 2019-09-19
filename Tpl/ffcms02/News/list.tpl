<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:24;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/'.$action,array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_list" />
</head>
<body class="news-list">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">{$list_name}</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('list', 'records')}</strong>篇{$list_name} 第<strong>{$list_page}</strong>页</li>
</ul>
<div class="row">
<volist name="item_news" id="feifei">
  <include file="BlockTheme:news_card_item" />
</volist>
</div>
<ul class="mt-3 pagination d-flex flex-wrap justify-content-end">
{$page}
</ul>
</main>
<include file="BlockTheme:footer" />
</body>
</html>