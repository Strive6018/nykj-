<php>
$item_forum = ff_mysql_forum('uid:'.$user_id.';limit:20;page_is:true;page_id:forum;page_p:'.$user_page.';order:forum_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'forum','p'=>'FFLINK'),true,'forum',4);
$totalpages = ff_page_count('forum', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>我的评论_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
</head>
<body class="user-center">
<include file="User:center_nav" />
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <div class="aui-list-item">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">我的评论</div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<section class="aui-grid">
    <ul class="aui-list aui-media-list ff-forum" data-type="{$Think.config.forum_type}">
	

<volist name="item_forum" id="feifei">

<li class="aui-list-item">
                <div class="aui-media-list-item-inner">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-text">
                            <div class="aui-list-item-title"><a href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}" target="_blank">查看详情</a></div>
                            <div class="aui-list-item-right">{$feifei.forum_addtime|date='Y-m-d H:i:s',###}</div>
                        </div>
                        <div class="aui-list-item-text aui-ellipsis-2">
                            {$feifei.forum_content|htmlspecialchars|nb|msubstr=0,40}
                        </div>
                    </div>
					 </div>
                </li>
			

</volist>
 </ul>
</section>

  <!-- -->
<gt name="totalpages" value="1">
<div class="navigation">
<ul class="clearfix">{$page}</ul>
</div>
</gt>
<include file="User:footer" />
</body>
</html>