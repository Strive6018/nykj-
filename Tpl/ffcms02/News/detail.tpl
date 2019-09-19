<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:news_detail" />
</head>
<body class="news-detail">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item"><a href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a></li>
	<li class="breadcrumb-item active">正文</li>
</ul>
<div class="card mt-3">
	<div class="card-body px-3">
		<h3 class="card-title text-md-center">
			{$news_name}
		</h3>
		<h6 class="card-title text-muted text-md-center">
			来源：{$news_inputer|default='佚名'}
			人气：{$news_hits}
			更新：{$news_addtime|date='Y-m-d H:i:s',###}
		</h6>
		<div class="card-text news-content">
			{:ff_url_tags_content(nb($news_content),$Tag)}
		</div>
		<!-- -->
		<div class="card-text mt-3 text-right">
			<include file="BlockBase:news_type" />
			<include file="BlockBase:news_tags" />
			<include file="BlockBase:news_page" />
		</div>
		<!-- -->
		<include file="BlockBase:news_next" />
		<!-- -->
		<div class="card-text mt-5 text-center">
			<a class="btn btn-outline-primary btn-lg ff-updown-set" href="javascript:;" data-id="{$news_id}" data-module="news" data-type="up" data-toggle="tooltip" data-placement="top" title="支持"><i class="fa fa-thumbs-o-up"></i> 有用 (<span class="ff-updown-val">{$news_up}</span>)</a>   
		</div>
	</div>
</div>
<!-- -->
<php>$tag_like = end($Tag);
$item_news = ff_mysql_news('cid:'.$list_id.';tag_name:'.$tag_like['tag_name'].';tag_list:news_type;limit:12;cache_name:default;cache_time:default;order:news_up;sort:desc');
if(!$item_news){
	$item_news = ff_mysql_news('cid:'.$list_id.';limit:12;cache_name:default;cache_time:default;order:news_up desc,news_id;sort:desc');
}</php>
<notempty name="item_news">
<div class="alert bg-theme border-0 mt-3 mb-0">
	<a class="h6" href="javascript:;">猜您喜欢</a>
</div>
<div class="row">
<volist name="item_news" id="feifei">
  <include file="BlockTheme:news_card_item" />
</volist>
</div>
</notempty>
{$news_hits_insert}
<include file="BlockBase:forum_ajax_news" />
</main>
<include file="BlockTheme:footer" />
</body>
</html>