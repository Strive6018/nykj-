<php>$item_list = ff_mysql_forum('status:1;sid:3;pid:0;cid:'.$forum_cid.';limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_addtime;sort:desc');
if(!$special = $item_list[0]){
	$special = ff_array(ff_mysql_special(array('ids'=>''.$forum_cid.'','limit'=>'1','field'=>'special_id,special_name','cache_name'=>'default','cache_time'=>'default')));
}
if(!$special){
	exit('该专题已删除！');
}
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/special', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
$forum_sid = 3;
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_special" />
</head>
<body class="bg-light">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('forum/index',array('sid'=>3),true)}">专题评论</a></li>
  <li class="breadcrumb-item active">{$special.special_name}</li>
</ul>
<div class="card mt-3 mb-0">
  <div class="card-body pb-0">
		<h5 class="card-title">{$special.special_name}</h5>
		<div class="card-text">{$special.special_content}</div>
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