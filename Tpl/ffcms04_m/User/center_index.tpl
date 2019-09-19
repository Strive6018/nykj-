<!DOCTYPE html>
<html lang="zh-cn">
<head>

<title>用户中心_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
<include file="User:header" />
</head>
<body class="user-center">
<include file="User:center_nav" />
<!--用户信息-->
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'accunt'))}">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">帐号设置</div>
	            </div>
	        </a>
	        <a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'accunc'))}">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">影币充值</div>
	            </div>
	        </a>
	        <a class="aui-list-item user-score-upvip" href="javascript:;">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">VIP权限</div>
					<div class="aui-list-item-right">您的VIP到期时间为:{$user_deadtime|date='Y/m/d',###}</div>
	            </div>
	        </a>
	</div>
</section>
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'history'))}">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">观看记录</div>
	            </div>
	        </a>
	        <a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'orders'))}">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">订单管理</div>
	            </div>
	        </a>
	        <a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'buy'))}">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">影币记录</div>
	            </div>
	        </a>
      		<a class="aui-list-item" href="{:ff_url('user/center',array('action'=>'forum'))}">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">我的话题</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>

<include file="User:footer" />
</body>
</html>