<php>
$forum_sid = 1;
$item_list = ff_mysql_forum('cid:'.$forum_cid.';status:1;sid:1;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if($forum_cid){
	$vod = $item_list[0];
	if(!$vod){
		$vod = ff_array(ff_mysql_vod(array('ids'=>''.$forum_cid.'','limit'=>1,'field'=>'list_id,list_dir,vod_id,vod_name,vod_pic,vod_actor,vod_director,vod_area,vod_year','cache_name'=>'default','cache_time'=>'default')));
	}
	if(!$vod){
		exit('该视频已删除！');
	}	
	$page_info = ff_url_page('forum/vod', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/vod', array('cid'=>$forum_cid), true);
  $page_last = ff_url('forum/vod', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/vod', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
}else{
	$page_info = ff_url_page('forum/vod', array('p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/vod', '', true);
  $page_last = ff_url('forum/vod', array('p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/vod', array('p'=>($forum_page+1)), true);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_vod" />
</head>
<body class="forum-vod">
<include file="BlockTheme:header" />
<div class="container ff-bg ff-forum" data-type="{$Think.config.forum_type}">
<!-- -->
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-comment ff-text"></span>
  <a href="{$page_this}">{$vod.vod_name}精彩影评</a>
  </h2>
</div>
<!-- -->
<div class="hidden">
	<include file="BlockBase:forum_post" />
</div>
<!-- -->
<notempty name="forum_cid">
<div class="media vod-inc-info">
  <a class="media-left" href="{:ff_url_vod_read($vod['list_id'],$vod['list_dir'],$vod['vod_id'],$vod['vod_ename'],$vod['vod_jumpurl'])}">
    <img class="media-object img-thumbnail ff-img" data-original="{$vod.vod_pic|ff_url_img}" alt="{$vod.vod_name}">
  </a>
  <div class="media-body">
    <dl class="dl-horizontal">
      <dt>主演：</dt>
      <dd class="text-nowrap ff-text-right">{$vod.vod_actor|ff_url_search}</dd>
      <dt>导演：</dt>
      <dd class="text-nowrap ff-text-right">{$vod.vod_director|ff_url_search='director'}</dd>
      <dt>地区：</dt>
      <dd class="text-nowrap ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($vod_area),'year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">{$vod.vod_area|default='未录入'}</a></dd>
      <dt>年份：</dt>
      <dd class="text-nowrap ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod.vod_year|default='2017'}</a></dd>
      <dt>链接：</dt>
      <dd class="text-nowrap ff-text-right"><a href="{:ff_url_vod_read($vod['list_id'],$vod['list_dir'],$vod['vod_id'],$vod['vod_ename'],$vod['vod_jumpurl'])}">{$vod.vod_name}免费观看</a><a href="{:ff_url('scenario/detail',array('id'=>$vod['vod_id']),true)}">{$vod.vod_name}剧情介绍</a></dd>
    </dl>
  </div>
</div>
<div class="clearfix ff-clearfix"></div>
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