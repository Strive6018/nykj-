<php>$item_news = ff_mysql_news('cid:'.$list_id.';limit:20;page_is:true;page_id:list;page_p:'.$list_page.';cache_name:default;cache_time:default;order:news_addtime;sort:desc');
$page = ff_url_page('news/'.$action,array('id'=>$list_id,'list_dir'=>$list_dir,'p'=>'FFLINK'),true,'list',4);
$totalpages = ff_page_count('list', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$type_year}{$type_area}{$type_type}{$type_star}{$type_state}{$list_name}大全-{$list_name}排行榜-{$site_name}</title>
    <meta name="keywords" content="{$list_keywords}">
    <meta name="description" content="{$list_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
	<section class="mod aui-margin-t-0">
		<div class="mod-head" mod-skin="line">
		<div class="mod-head-title">
			<span class="mod-head-name">{$list_name}</span>
		</div>
		<span class="change">共有“{:ff_page_count('list', 'records')}”篇文章</span>
	</div>
		<div class="mod-main clearfix">
			<div class="m-a-list">
				<volist name="item_news" id="feifei">
				<article class="news-card card-type-news">
					<a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" title="{$feifei.news_name}">
						<div class="news-pic">
							<img class="ff-img" data-original="{$feifei.news_pic|ff_url_img=$feifei['news_content']}">
						</div>
						<div class="news-info">
							<h3 class="title">{$feifei.news_name}</h3>
							<div class="detail">
								<span>{$feifei.news_addtime|date='Y-m-d H:i:s',###}</span>
								<span>{$feifei.news_hits}阅读</span>
							</div>
						</div>
					</a>
				</article>
			</volist>
			</div>
		</div>
	</section>


<div class="navigation">
<ul class="clearfix">{$page}</ul>
</div>

<include file="Home:footer" />
</body>
</html>