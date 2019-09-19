<php>$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:1;group:record_did;limit:10;page_is:true;page_id:record;page_p:'.$user_page.';order:record_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'history','p'=>'FFLINK'),true,'record',4);
$totalpages = ff_page_count('record', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>观看记录_{$site_name}</title>
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
	                <div class="aui-list-item-title">观看记录</div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<section class="mod">
		<div class="mod-main clearfix">
			<div class="m-a-list mod-vod-list">
<include file="User:inc_item_record" />
			</div>
		</div>
	</section>	

<gt name="totalpages" value="1">
<div class="navigation">
<ul class="clearfix">{$page}</ul>
</div>
</gt>
<include file="User:footer" />
</body>
</html>