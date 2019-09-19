<php>$item_vod = ff_mysql_vod('cid:'.$list_id.';limit:40;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');
if($action == 'category'){
	$page = ff_url_page('vod/category',array('id'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}else{
  $page = ff_url_page('vod/show',array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
}
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="vod-list">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">{$list_name}</li>
	<li class="float-right d-none d-sm-block">共有<strong>{:ff_page_count('list', 'records')}</strong>个影片  第<strong>{$list_page}</strong>页</li>
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