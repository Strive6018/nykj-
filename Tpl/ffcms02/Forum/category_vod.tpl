<php>$item_list = ff_mysql_forum('status:1;sid:1;pid:0;cid:'.$forum_cid.';limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if(!$vod = $item_list[0]){
	$vod = ff_array(ff_mysql_vod(array('ids'=>''.$forum_cid.'','limit'=>1,'field'=>'list_id,list_dir,vod_id,vod_name,vod_pic,vod_type,vod_actor,vod_director,vod_area,vod_year','cache_name'=>'default','cache_time'=>'default')));
}
if(!$vod){
	exit('该视频已删除！');
}
$page_info = ff_url_page('forum/vod', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
$page_this = ff_url('forum/vod', array('cid'=>$forum_cid), true);
$page_last = ff_url('forum/vod', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
$page_next = ff_url('forum/vod', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
$forum_sid = 1;
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_vod" />
</head>
<body class="bg-light forum-vod">
<include file="BlockTheme:header" />
<main class="container">
<ul class="breadcrumb mt-3 mb-0">
  <li class="breadcrumb-item"><a href="{$root}">首页</a></li>
	<li class="breadcrumb-item"><a href="{:ff_url('forum/index',array('sid'=>1),true)}">影视评论</a></li>
  <li class="breadcrumb-item active">{$vod.vod_name}</li>
</ul>
<div class="card mt-3 mb-0">
  <div class="card-body card-body-content">
		<h5 class="card-title">{$vod.vod_name} 评论</h5>
		<php>$feifei = $vod;</php>
		<ul class="card-text list-inline mb-0 d-flex flex-wrap flex-row">
			<li class="list-inline-item">类型：<include file="BlockBase:vod_type_foreach" /></li>
			<li class="list-inline-item">主演：<include file="BlockBase:vod_actor_foreach" /></li>
			<li class="list-inline-item">导演：<include file="BlockBase:vod_director_foreach" /></li>
			<li class="list-inline-item">地区：<include file="BlockBase:vod_area_foreach" /></li>
			<li class="list-inline-item">年份：<a class="mr-1" href="{:ff_url('vod/type',array('id'=>$vod['vod_cid'],'type'=>'','area'=>'','year'=>$vod['vod_year'],'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod['vod_year']|default='2018'}</a></li>
		</ul>
		<div class="card-text mt-2">
			<a class="border p-1 float-left mt-1 mr-2" href="{:ff_url('forum/vod',array('cid'=>$forum_cid),true)}"><img class="ff-img" data-original="{$vod.vod_pic|ff_url_img}" alt="{$vod.vod_name}剧情介绍"></a>
			{$vod.vod_content|strip_tags|nb}
			<a href="{:ff_url_vod_read($vod['list_id'],$vod['list_dir'],$vod['vod_id'],$vod['vod_ename'],$vod['vod_jumpurl'])}">在线观看</a>
			<a href="{:ff_url('scenario/detail',array('id'=>$forum_cid),true)}">分集剧情</a>
		</div>
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