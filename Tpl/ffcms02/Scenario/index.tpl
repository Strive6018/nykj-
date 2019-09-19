<php>$item_vod = ff_mysql_vod('cid:1,2,3;scenario:true;limit:20;page_is:true;page_id:list;page_p:'.$scenario_page.';cache_name:default;cache_time:default;order:vod_addtime;sort:desc');
$page = ff_url_page('scenario/index',array('p'=>'FFLINK'),true,'list',4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:scenario_index" />
</head>
<body class="scenario-index">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">剧情</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('list', 'records')}</strong>篇剧情 第<strong>{$scenario_page}</strong>页</li>
</ul>
<volist name="item_vod" id="feifei">
  <include file="BlockTheme:scenario_card_item" />
</volist>
<ul class="mt-3 pagination d-flex flex-wrap justify-content-end">
{$page}
</ul>
<include file="BlockTheme:footer" />
</main>
</body>
</html>