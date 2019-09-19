<php>$item_list = ff_mysql_forum('status:1;sid:5;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_istop desc,forum_id;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/guestbook',array('p'=>'FFLINK'), true, 'forum', 4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<php>$list_dir = 'forum';</php>
<title>{$user_name|htmlspecialchars|nb}发表的留言_{$site_name}</title>
<meta name="keywords" content="{$user_name}的留言">
<meta name="description" content="{$forum_content|msubstr=0,100}">
<include file="Home:header" />
</head>
<body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="ffcms-wrap ff-forum" data-type="{$Think.config.forum_type}">
<div class="ffcms-header">
  <h2>
  <span>网站留言</span><small>共<span class="ff-text">{:ff_page_count('forum', 'records')}</span>篇</small>
  </h2>
</div>
<!--发表评论后刷新网页 -->
<div class="ff-forum-reload">
	<include file="Base:forum_post" />
</div>
<div class="ff-forum-item">
	<include file="Base:forum_item" />
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
</div>
<div class="menu-box"></div>
<include file="Home:forum" />
</body>
</html>