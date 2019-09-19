<php>
$item_score = ff_mysql_score('uid:'.$user_id.';limit:30;page_is:true;page_id:score;page_p:'.$user_page.';order:score_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'buy','p'=>'FFLINK'),true,'score',4);
$totalpages = ff_page_count('score', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>消费记录_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
</head>
<body>
<body class="user-center">
<include file="User:center_nav" />
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <div class="aui-list-item">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">消费记录</div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<section class="aui-grid">
    <div class="aui-row">
	<li class="aui-list-iteme">
        <div class="aui-col-xs-3"><div class="aui-grid-label">频道</div></div>
        <div class="aui-col-xs-3"><div class="aui-grid-label">类型</div></div>
        <div class="aui-col-xs-2"><div class="aui-grid-label">变化值</div></div>
		<div class="aui-col-xs-4"><div class="aui-grid-label">操作时间</div></div>	
		</li>
<volist name="item_score" id="feifei">
<li class="aui-list-iteme">
        <div class="aui-col-xs-3"><div class="aui-grid-label"><switch name="feifei.score_sid"><case value="1">视频</case><case value="2">文章</case><case value="3">专题</case><default/>用户</switch></div></div>
        <div class="aui-col-xs-3"><div class="aui-grid-label"><switch name="feifei.score_type"><case value="1">影币充值</case><case value="2">注册赠送</case><case value="3">管理员操作</case><case value="4">推广奖励</case><case value="5">退货返还</case><case value="6">卡密充值</case><case value="21">升级VIP</case><case value="22"><a href="{:ff_url('vod/read',array('id'=>$feifei['score_did']),true)}" target="_blank">付费点播</case><default/>未知</switch></div></div>
        <div class="aui-col-xs-2"><div class="aui-grid-label">{$feifei.score_ext}</div></div>
		<div class="aui-col-xs-4"><div class="aui-grid-label">{$feifei.score_addtime|date='Y-m-d H:i',###}</div></div>
</li>
</volist>

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