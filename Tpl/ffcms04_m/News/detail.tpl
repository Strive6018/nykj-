<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$news_name}_{$site_name}</title>
    <meta name="keywords" content="{$list_keywords}">
    <meta name="description" content="{$list_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<!--正文-->
<section class="mod aui-margin-t-0">
	<div class="article-box">
		<h1 class="title">{$news_name}</h1>
		<div class="info">
            <span>{$news_addtime|date='Y-m-d H:i:s',###}</span>
            <span><em class="show_hits">{$news_hits}</em>阅</span>
            <span></span>
        </div>
        <article class="content">{$news_content}</article>
	</div>
    </div>
</section>

<section class="mod aui-margin-t-0">
	<div class="mod-head" mod-skin="line">
		<div class="mod-head-title">
			<span class="mod-head-name">相关推荐</span>
		</div>
	</div>
	<div class="mod-main clearfix">
		<div class="m-a-list">
		<volist name=":ff_mysql_news('limit:5;order:news_addtime desc')" id="feifei">
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
{$news_hits_insert}
<include file="Home:footer" />
</body>
</html>