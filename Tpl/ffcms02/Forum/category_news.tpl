<php>$item_list = ff_mysql_forum('cid:'.$forum_cid.';status:1;sid:2;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if(!$news = $item_list[0]){
	$news = ff_array(ff_mysql_news(array('ids'=>''.$forum_cid.'','limit'=>1,'cache_name'=>'default','cache_time'=>'default')));
}
if(!$news){
	exit('该资讯已删除！');
}
$page_info = ff_url_page('forum/news', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
$page_this = ff_url('forum/news', array('cid'=>$forum_cid), true);
$page_last = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
$page_next = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
$forum_sid = 2;
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_news" />
</head>
<body class="bg-light forum-news">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('forum/index',array('sid'=>2),true)}">评论</a></li>
  <li class="breadcrumb-item active">{$news.news_name}</li>
</ul>
<div class="card mt-3 mb-0">
  <div class="card-body mt-2 mb-0 pt-0 pb-2">
		{$news.news_remark|strip_tags|nb}
		@<a href="{:ff_url_news_read($news['list_id'],$news['list_dir'],$news['news_id'],$news['news_name'],$news['news_jumpurl'])}">{$news.news_name}</a>
	</div>
</div>
<!-- -->
<div class="ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
<div class="mt-3 pagination d-flex flex-wrap justify-content-end">
	{$page_info}
</div>
<div class="ff-forum" data-type="{$Think.config.forum_type}">
	<div class="ff-forum-reload"><include file="BlockBase:forum_post" /></div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>