<php>
$forum_sid = 1;
$item_list = ff_mysql_forum('cid:'.$forum_cid.';status:1;sid:3;pid:0;limit:20;page_is:true;page_id:forum;page_p:'.$forum_page.';order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
if($forum_cid){
	$special = $item_list[0];
	if(!$special){
		$special = ff_array(ff_mysql_special(array('ids'=>''.$forum_cid.'','limit'=>1,'cache_name'=>'default','cache_time'=>'default')));
	}
	if(!$special){
		exit('该专题已删除！');
	}	
	$page_info = ff_url_page('forum/special', array('cid'=>$forum_cid,'p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/special', array('cid'=>$forum_cid), true);
  $page_last = ff_url('forum/special', array('cid'=>$forum_cid,'p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/special', array('cid'=>$forum_cid,'p'=>($forum_page+1)), true);
}else{
	$page_info = ff_url_page('forum/special', array('p'=>'FFLINK'), true, 'forum', 4);
  $page_this = ff_url('forum/special', '', true);
  $page_last = ff_url('forum/special', array('p'=>($forum_page-1)), true);
  $page_next = ff_url('forum/special', array('p'=>($forum_page+1)), true);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_category_special" />
</head>
<body class="forum-vod">
<include file="BlockTheme:header" />
<div class="container ff-bg ff-forum" data-type="{$Think.config.forum_type}">
<!-- -->
<div class="page-header">
  <h2>
  <span class="glyphicon glyphicon-comment ff-text"></span>
  <a href="{$page_this}">专题评论</a> 
  <span class="text-muted">{$special.special_name}</span>
  </h2>
</div>
<!-- -->
<div class="hidden">
	<include file="BlockBase:forum_post" />
</div>
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