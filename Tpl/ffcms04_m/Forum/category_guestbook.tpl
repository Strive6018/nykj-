<php>$item_list = ff_mysql_forum('status:1;sid:5;pid:0;limit:50;page_is:true;page_id:forum;page_p:'.$forum_page.';cache_name:default;cache_time:default;order:forum_istop desc,forum_id;sort:desc');
$page_array = $_GET['ff_page_forum'];
$page_info = ff_url_page('forum/guestbook',array('p'=>'FFLINK'), true, 'forum', 4);
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>网站留言-{$site_name}</title>
    <meta name="keywords" content="网站留言">
    <meta name="description" content="网站留言">
<include file="Home:header_meta" />
</head>
<body class="bg-default book">
<include file="Home:header" />

<section class="mod aui-margin-t-0 ff-forum" data-type="{$Think.config.forum_type}">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">网站留言</span>
		</div>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
<div class="ff-forum-reload">
	<include file="Base:forum_post" />
</div>
</div>
	<div class="mod-main clearfix">
<div class="ff-forum-item">
	<include file="Base:forum_item" />
</div>
	</div>
</section>

<gt name="totalpages" value="1">
<div class="navigation">
<ul class="clearfix">{$page}</ul>
</div>
</gt>
<include file="Home:footer" />
</body>
</html>