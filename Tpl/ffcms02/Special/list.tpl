<php>$item_special = ff_mysql_special('limit:30;tag_name:'.$special_type.';tag_list:special_type;page_is:true;page_id:special;page_p:'.$special_page.';cache_name:default;cache_time:default;order:special_stars;sort:desc');
$page = ff_url_page('special/show',array('type'=>urlencode($special_type),'p'=>'FFLINK'),true,'special',4);
$totalpages = ff_page_count('special', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:special_list" />
</head>
<body class="special-list">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">专题</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('special', 'records')}</strong>个专题 第<strong>{$special_page}</strong>页</li>
</ul>
<div class="row">
<volist name="item_special" id="feifei">
  <include file="BlockTheme:special_card_item" />
</volist>
</div>
<ul class="mt-3 pagination d-flex flex-wrap justify-content-end">
{$page}
</ul>
</main>
<include file="BlockTheme:footer" />
</body>
</html>