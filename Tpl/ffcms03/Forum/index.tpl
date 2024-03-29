<php>$item_list = ff_mysql_forum('pid:0;limit:50;status:1;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_addtime;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/index', array('p'=>'FFLINK'), true, 'forum', 4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:forum_index" />
</head>
<body class="forum-index">
<include file="BlockTheme:header" />
<div class="container ff-forum">
<eq name="forum_page" value="1">
<div class="page-header">
  <h2><a class="ff-text" href="{:ff_url('forum/index', array('p'=>1), true)}">评论类型</a></h2>
</div>
<ul class="list-unstyled">
  <li>
    <h5><a class="ff-text" href="{:ff_url('forum/guestbook',array('p'=>1),true)}">网站留言</a></h5>
  	<p class="text-muted">这里是{$site_name}交流平台，通过此窗口将您的建议与反馈告诉我们吧，当然也可以通过此版块给我们投稿，小编随时恭候您的调侃。</p>
  </li>
	<li>
    <h5><a class="ff-text" href="{:ff_url('forum/vod',array('p'=>1),true)}">精彩影评</a></h5>
    <p class="text-muted">影片的主题是电影作品中的灵魂和精华，也是我们为之迷恋的"精神家园"；更是我们在看了一部影片以后，力图总结分析出来东西。</p>
  </li>
  <li>
    <h5><a class="ff-text" href="{:ff_url('forum/news',array('p'=>1),true)}">资讯评论</a></h5>
  	<p class="text-muted">此版块展示的是用户对本站所有资讯的评论，文字多少无所谓，欢迎您留下你的痕迹。</p>
  </li>
  <li>
    <h5><a class="ff-text" href="{:ff_url('forum/special',array('p'=>1),true)}">专题评论</a></h5>
  	<p class="text-muted">此版块展示的是用户对本站所有专题的评论，文字多少无所谓，欢迎您留下你的痕迹。</p>
  </li>	
</ul>
<div class="clearfix ff-clearfix"></div>
<div class="clearfix ff-clearfix"></div>
</eq>
<!-- -->
<div class="page-header">
  <h2>
	<a class="ff-text" href="{:ff_url('forum/index', array('p'=>1), true)}">网站评论</a>
	<small>共<span class="ff-text">{:ff_page_count('forum', 'records')}</span>篇、第<span class="ff-text">{$forum_page}</span>页</small>
	</h2>
</div>
<div class="ff-forum-item">
<volist name="item_list" id="feifei">
<div class="media">
  <a class="media-left" href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">
    <img src="{$feifei.user_face|ff_url_img|default=$root.'Public/images/face/default.png'}" class="img-circle user-face">
  </a>
  <div class="media-body">
    <h5 class="media-heading user-name">
      <a href="{:ff_url('user/index',array('id'=>$feifei['user_id']),true)}" target="_blank">{$feifei.user_name|htmlspecialchars|nb}</a>
      <small>
      <a class="ff-text" href="{:ff_url('forum/'.ff_sid2module($feifei['forum_sid']), array('cid'=>$feifei['forum_cid']), true)}">
      <if condition="$feifei['forum_sid'] eq 1">发表影评
      <elseif condition="$feifei['forum_sid'] eq 2"/>发表评论
      <elseif condition="$feifei['forum_sid'] eq 5"/>发表留言
      <else/>发表看法</if></a>
      {$feifei.forum_addtime|date='Y/m/d',###}
      </small>
    </h5>
    <p class="forum-content">
      {$feifei.forum_content|htmlspecialchars|nb|msubstr=0,300}
      <a class="forum-report" href="javascript:;" data-id="{$feifei.forum_id}" title="举报"><small>举报</small></a>
    </p>
    <p class="forum-btn">
      <a class="btn btn-default btn-xs ff-updown-set" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="up" data-toggle="tooltip" data-placement="top" title="支持"><span class="glyphicon glyphicon-thumbs-up"></span> <span class="ff-updown-val">{$feifei.forum_up}</span></a>
      <a class="btn btn-default btn-xs ff-updown-set" href="javascript:;" data-id="{$feifei.forum_id}" data-module="forum" data-type="down" data-toggle="tooltip" data-placement="top" title="反对"><span class="glyphicon glyphicon-thumbs-down"></span> <span class="ff-updown-val">{$feifei.forum_down}</span></a>
      <a class="btn btn-default btn-xs forum-reply-set" href="javascript:;" data-id="{$feifei.forum_id}" data-toggle="collapse" title="回复"><span class="glyphicon glyphicon-comment"></span> <span class="forum-reply-val">{$feifei.forum_reply}</span></a>
      <a class="btn btn-default btn-xs forum-reply-get forum-reply-get-{$feifei.forum_reply}" data-id="{$feifei.forum_id}" href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}" target="_blank" title="评论详情"><span class="glyphicon glyphicon-align-right"></span> 详情</a>
    </p>
    <p class="collapse forum-reply" data-id="{$feifei.forum_id}">
    </p>
  </div>
</div>
</volist>
</div>
<div class="clearfix ff-clearfix"></div>
<gt name="page_array.totalpages" value="1">
	<div class="text-center">
  <ul class="pagination pagination-lg hidden-xs hidden-sm">
    {$page_info}
  </ul>
  <ul class="pager visible-xs visible-sm">
    <gt name="forum_page" value="1">
      <li><a id="ff-prev" href="{:ff_url('forum/index', array('p'=>($forum_page-1)), true)}">上一页</a></li>
    </gt>
    <lt name="forum_page" value="$page_array['totalpages']">
      <li><a id="ff-next" href="{:ff_url('forum/index', array('p'=>($forum_page+1)), true)}">下一页</a></li>
    </lt>
  </ul>
  </div>
</gt>
<!-- -->
<div class="row ff-row">
  <include file="BlockTheme:footer" />
</div>
</div><!--container end -->
</body>
</html>