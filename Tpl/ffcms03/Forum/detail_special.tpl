<php>$item_list = ff_mysql_forum('pid:'.$forum_id.';limit:10;status:1;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/detail',array('id'=>$forum_id,'p'=>'FFLINK'), true, 'forum', 4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_detail_special" />
</head>
<body class="forum-gusetbook-detail">
<include file="BlockTheme:header" />
<div class="container ff-forum" data-type="{$Think.config.forum_type}">
<div class="page-header">
  <h2>
    <a class="ff-text" href="{:ff_url('forum/special', array('cid'=>$forum_cid), true)}">专题评论</a>
    <a href="{:ff_url('forum/detail', array('id'=>$forum_id), true)}">评论主题</a>
  </h2>
</div>
<!-- -->
<p class="content">
  {$forum_content|htmlspecialchars|nb}<br>
</p>
<p class="text-right design">
	<small class="text-muted">
  <a class="ff-text" href="{:ff_url('user/index',array('id'=>$user_id),true)}" target="_blank">{$user_name|htmlspecialchars|nb}</a>
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
  <h2><span class="glyphicon glyphicon-comment ff-text"></span> 发表您对此评论的看法</h2>
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
  <div class="clear"></div>
  <div class="text-center">
    <ul class="pagination pagination-lg hidden-xs hidden-sm">
      {$page_info}
    </ul>
    <ul class="pager visible-xs visible-sm">
      <gt name="forum_page" value="1">
        <li><a id="ff-prev" href="{:ff_url('forum/detail', array('id'=>$forum_id,'p'=>($forum_page-1)), true)}">上一页</a></li>
      </gt>
      <lt name="forum_page" value="$page_array['totalpages']">
        <li><a id="ff-next" href="{:ff_url('forum/detail', array('id'=>$forum_id,'p'=>($forum_page+1)), true)}">下一页</a></li>
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