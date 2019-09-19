<php>$item_vod = ff_mysql_vod('limit:24;tag_name:'.$tag_name.';tag_list:vod_tag;page_is:true;page_id:tags;page_p:'.$tag_page.';cache_name:default;cache_time:default;order:vod_cid asc,vod_addtime;sort:desc');
$page = ff_url_page('vod/tags',array('name'=>urlencode($tag_name),'p'=>'FFLINK'), true, 'tags', 4);
$totalpages = ff_page_count('tags', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_tags" />
</head>
<body class="vod-tags">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">{$tag_type}{$tag_tag}{$tag_name}</li>
	<li class="float-right d-none d-sm-block">共有<strong>{:ff_page_count('tags', 'records')}</strong>个影片  第<strong>{$tag_page}</strong>页</li>
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