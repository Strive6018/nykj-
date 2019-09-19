<php>
$forum_sid = 2;
$item_list = ff_mysql_forum('cid:'.$forum_cid.';status:1;sid:2;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if($forum_cid){
	$news = $item_list[0];
	if(!$news){
		$news = ff_array(ff_mysql_news(array('ids'=>''.$forum_cid.'','limit'=>1,'cache_name'=>'default','cache_time'=>'default')));
	}
	if(!$news){
		exit('该文章已删除！');
	}	
	$page_info = ff_url_page('forum/news', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/news', array('cid'=>$forum_cid), true);
  $page_last = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/news', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
}else{
	$page_info = ff_url_page('forum/news', array('p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/news', '', true);
  $page_last = ff_url('forum/news', array('p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/news', array('p'=>($forum_page+1)), true);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_news" />
</head>
<body class="forum-vod">
<include file="BlockTheme:header" />
<div class="container ff-bg ff-forum" data-type="{$Think.config.forum_type}">
<div class="page-header">
  <h2><span class="glyphicon glyphicon-heart-empty ff-text"></span> 
  <a href="{$page_this}">{$news['news_name']} 精彩评论</a></h2>
</div>
<!-- -->
<div class="hidden">
	<include file="BlockBase:forum_post" />
</div>
<!-- -->
<notempty name="forum_cid">
<div class="media news-item-medial">
  <a class="media-left" href="{:ff_url_news_read($news['list_id'],$news['list_dir'],$news['news_id'],$news['news_name'],$news['news_jumpurl'],1)}">
  <img class="media-object img-thumbnail img-responsive ff-img" data-original="{:ff_url_img($news['news_pic'],$news['news_content'])}" title="{$news.news_name}">
  </a>
  <div class="media-body">
    <h4 class="media-heading">
      <a href="{:ff_url_news_read($news['list_id'],$news['list_dir'],$news['news_id'],$news['news_name'],$news['news_jumpurl'])}">
      {$news.news_name|msubstr=0,36,true}
      </a>
    </h4>
    <p class="text-muted news-remark hidden-xs hidden-sm">
      {$news.news_remark|strip_tags}
    </p>
  </div>
</div>
</notempty>
<!-- -->
<div class="clearfix ff-clearfix"></div>
<div class="ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
</div><!--container end -->
<gt name="page_array.totalpages" value="1">
  <div class="clearfix ff-clearfix"></div>
  <div class="container ff-bg text-center" id="ff-forum-page">
    <ul class="pager">
      <gt name="forum_page" value="1">
        <li><a id="ff-prev" href="{$page_last}">上一页</a></li>
      </gt>
      <lt name="forum_page" value="$page_array['totalpages']">
        <li><a id="ff-next" href="{$page_next}">下一页</a></li>
      </lt>
    </ul>
  </div>
</gt>
<!-- -->
<include file="BlockTheme:footer" />
</body>
</html>