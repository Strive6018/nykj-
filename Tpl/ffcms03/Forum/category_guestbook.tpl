<php>$item_list = ff_mysql_forum('status:1;sid:5;pid:0;limit:30;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_istop desc,forum_id;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/guestbook',array('p'=>'FFLINK'), true, 'forum', 4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_guestbook" />
</head>
<body class="forum-gusetbook">
<include file="BlockTheme:header" />
<div class="container ff-forum" data-type="{$Think.config.forum_type}">
<div class="page-header">
  <h2>
  <a class="ff-text" href="{:ff_url('forum/guestbook', array('p'=>1), true)}">期待您的宝贵意见</a>
  <small>共<span class="ff-text">{:ff_page_count('forum', 'records')}</span>篇、第<span class="ff-text">{$forum_page}</span>页</small>
  </h2>
</div>
<!--发表评论后刷新网页 -->
<div class="ff-forum-reload">
	<include file="BlockBase:forum_post" />
</div>
<div class="ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
<!-- -->
<gt name="page_array.totalpages" value="1">
	<div class="text-center">
  <ul class="pagination pagination-lg hidden-xs hidden-sm">
    {$page_info}
  </ul>
  <ul class="pager visible-xs visible-sm">
    <gt name="forum_page" value="1">
      <li><a id="ff-prev" href="{:ff_url('forum/guestbook', array('p'=>($forum_page-1)), true)}">上一页</a></li>
    </gt>
    <lt name="forum_page" value="$page_array['totalpages']">
      <li><a id="ff-next" href="{:ff_url('forum/guestbook', array('p'=>($forum_page+1)), true)}">下一页</a></li>
    </lt>
  </ul> 
  </div>
</gt>
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>