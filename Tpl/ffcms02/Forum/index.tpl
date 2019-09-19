<php>$item_list = ff_mysql_forum('status:1;pid:0;limit:50;sid:'.$forum_sid.';page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if($forum_sid){
	$page_info = ff_url_page('forum/index', array('sid'=>$forum_sid,'p'=>'FFLINK'), true, 'forum', 4);
}else{
	$page_info = ff_url_page('forum/index', array('p'=>'FFLINK'), true, 'forum', 4);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_index" />
</head>
<body class="bg-light forum-index ff-forum-reload">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
  <li class="breadcrumb-item active mr-auto">评论</li>
	<li class="float-right d-none d-sm-block">共有<stong>{:ff_page_count('forum', 'records')}</strong>个评论 第<strong>{$forum_page}</strong>页</li>
</ul>
<div class="card mt-3">
  <div class="card-header bg-white px-3 py-3">
		<eq name="forum_sid" value="0">
		<a class="btn btn-sm btn-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index','',true)}">评论首页</a>
		<else/>
		<a class="btn btn-sm btn-outline-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index','',true)}">评论首页</a>
		</eq>
		<eq name="forum_sid" value="1">
		<a class="btn btn-sm btn-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>1,'p'=>1),true)}">影视评论</a>
		<else/>
		<a class="btn btn-sm btn-outline-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>1,'p'=>1),true)}">影视评论</a>
		</eq>
		<eq name="forum_sid" value="2">
		<a class="btn btn-sm btn-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>2,'p'=>1),true)}">资讯评论</a>
		<else/>
		<a class="btn btn-sm btn-outline-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>2,'p'=>1),true)}">资讯评论</a>
		</eq>
		<eq name="forum_sid" value="3">
		<a class="btn btn-sm btn-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>3,'p'=>1),true)}">专题评论</a>
		<else/>
		<a class="btn btn-sm btn-outline-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>3,'p'=>1),true)}">专题评论</a>
		</eq>
		<eq name="forum_sid" value="5">
		<a class="btn btn-sm btn-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>5,'p'=>1),true)}">网站留言</a>
		<else/>
		<a class="btn btn-sm btn-outline-secondary mr-3 mb-2 mb-sm-0" href="{:ff_url('forum/index',array('sid'=>5,'p'=>1),true)}">网站留言</a>
		</eq>
	</div>
  <div class="card-body px-3 py-0">
		<eq name="forum_sid" value="5">
			<div class="ff-forum" data-type="{$Think.config.forum_type}">
				<include file="BlockBase:forum_post" />
			</div>
		</eq>
		<volist name="item_list" id="feifei">
			<include file="BlockTheme:forum_card_item" />
		</volist>
	</div> 
  <div class="card-footer pagination d-flex flex-wrap justify-content-center border-top-0">
		{$page_info}
	</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>