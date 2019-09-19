<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:24;tag_name:'.$type_type.';tag_list:news_type;page_is:true;page_id:list;page_p:'.$type_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/type',array('type'=>urlencode($type_type),'id'=>$list_id,'p'=>'FFLINK'), true, 'list', 4);
$totalpages = ff_page_count('list', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_type" />
</head>
<body class="bg-light news-type">
<include file="BlockTheme:header" />
<main>
<div class="container">	
<ul class="breadcrumb mt-3">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item"><a href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a></li>
	<li class="breadcrumb-item active mr-auto">{$type_type}</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('list', 'records')}</strong>篇 第<strong>{$type_page}</strong>页</li>
</ul>
<!-- -->
<div class="border rounded mt-3 mb-0 p-3 bg-white">
	<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="10">
	<eq name="feifei" value="$type_type">
	<a class="mr-2 text-primary" href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a>
	<else/>
	<a class="mr-2 text-dark" href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id,'p'=>1),true)}">{$feifei}</a>
	</eq>
	</volist>
</div>
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