<php>$item_list = ff_mysql_forum('status:1;sid:5;pid:'.$forum_cid.';limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
$forum = D('Forum')->ff_find('forum_content', array('forum_id'=>array('eq',$forum_cid)), 'cache_page_forum_'.$forum_cid, true);
if(!$forum){
	exit('该留言已删除！');
}
$page_info = ff_url_page('forum/guestbook', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
$forum_sid = 5;
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_guestbook" />
</head>
<body class="bg-light">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('forum/index',array('sid'=>1),true)}">网站留言</a></li>
  <li class="breadcrumb-item active">主题</li>
</ul>
<!-- -->
<div class="card mt-3 mb-0">
  <div class="card-body">
		<h5 class="card-title">留言主题</h5>
		<div class="card-text">{$forum.forum_content|htmlspecialchars|nb}</div>
	</div>
</div>
<!-- -->
<div class="alert bg-theme border-0 mt-3">
	<a class="h6" href="javascript:;">评论列表</a>
</div>
<notempty name="item_list">
<div class="rounded border bg-white mt-3 px-3 ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
<div class="mt-3 pagination d-flex flex-wrap justify-content-end">
	{$page_info}
</div>
</notempty>
<div class="ff-forum" data-type="{$Think.config.forum_type}">
	<div class="ff-forum-reload">
		<include file="BlockBase:forum_post" />
	</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>