<php>$item_list = ff_mysql_forum('pid:'.$forum_id.';limit:10;status:1;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/detail',array('id'=>$forum_id,'p'=>'FFLINK'), true, 'forum', 4);
if($forum_cid){
	$vod = D('Vod')->ff_find('vod_id,vod_cid,vod_name,vod_ename,vod_jumpurl', array('vod_id'=>array('eq',$forum_cid)), 'cache_page_vod_'.$forum_cid, true);
}
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_detail_vod" />
</head>
<body class="forum-detail-vod">
<include file="BlockTheme:header" />
<div class="container ff-bg ff-forum" data-type="{$Think.config.forum_type}">
<div class="page-header">
  <h2>
    <span class="glyphicon glyphicon-comment ff-text"></span>
    <a href="{:ff_url('forum/vod', array('cid'=>$forum_cid), true)}" title="{$feifei.vod_name}的精彩影评">{$vod.vod_name|msubstr=0,16,true}的影评</a>
    <sup><a class="ff-text" href="{:ff_url_vod_read($vod['list_id'],$vod['list_dir'],$vod['vod_id'],$vod['vod_ename'],$vod['vod_jumpurl'])}" title="{$vod.vod_name}在线观看">在线观看</a></sup>
  </h2>
</div>
<!-- -->
<p class="content">
  {$forum_content|htmlspecialchars}<br>
</p>
<p class="text-right design">
	<small class="text-muted">
  <a class="ff-text" href="{:ff_url('user/index',array('id'=>$user_id),true)}" target="_blank">{$user_name|htmlspecialchars}</a>
  {$forum_addtime|date='Y-m-d',###}
  </small>
</p>
<p class="text-center">
  <a class="btn btn-default ff-updown-set" href="javascript:;" data-id="{$forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="有用">
    <span class="glyphicon glyphicon-thumbs-up"></span> 赞（<span class="ff-updown-val">{$forum_up}</span>）
  </a>
  <a class="btn btn-default ff-updown-set" href="javascript:;" data-id="{$forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对">
    <span class="glyphicon glyphicon-thumbs-up"></span> 踩（<span class="ff-updown-val">{$forum_down}</span>）
  </a>
</p>
<!-- -->
<div class="page-header">
  <h2><span class="glyphicon glyphicon-comment ff-text"></span> 发表您对此影评的看法</h2>
</div>
<!--发表评论后刷新网页 -->
<div class="ff-forum-reload">
	<include file="BlockBase:forum_post" />
</div>
<div class="ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
</div><!--container end -->
<!-- -->
<gt name="page_array.totalpages" value="1">
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg text-center" id="ff-forum-page">
  <ul class="pager">
    <gt name="forum_page" value="1">
      <li><a id="ff-prev" href="{:ff_url('forum/detail', array('id'=>$forum_id,'p'=>($forum_page-1)), true)}">上一页</a></li>
    </gt>
    <lt name="forum_page" value="$page_array['totalpages']">
      <li><a id="ff-next" href="{:ff_url('forum/detail', array('id'=>$forum_id,'p'=>($forum_page+1)), true)}">下一页</a></li>
    </lt>
  </ul>
</div>
</gt>
<!-- -->
<include file="BlockTheme:footer" />
</body>
</html>