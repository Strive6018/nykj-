<php>$item_forum = ff_mysql_forum('uid:'.$user_id.';limit:20;page_is:true;page_id:forum;page_p:'.$user_page.';order:forum_id;sort:desc');
$page_info = ff_url_page('user/center',array('action'=>'forum','p'=>'FFLINK'),true,'forum',4);
$totalpages = ff_page_count('forum', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_center_forum" />
</head>
<body class="bg-light user-center">
<include file="BlockTheme:header" />
<main class="container">
<div class="row mt-3">
<div class="col-md-2 order-2 order-md-1 mb-3">
	<include file="BlockBase:user_center_nav" />
</div>
<div class="col-md-10 order-1 order-md-2 mb-3">
	<div class="card">
		<div class="card-header">我发表的话题</div>
		<div class="card-body pt-0 ff-forum" data-type="{$Think.config.forum_type}">
			<volist name="item_forum" id="feifei">
				<include file="BlockTheme:forum_card_item" />
			</volist>
		</div>
		<div class="card-footer pagination d-flex flex-wrap justify-content-center border-top-0">
			{$page_info}
		</div>
	</div><!--card end -->
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>