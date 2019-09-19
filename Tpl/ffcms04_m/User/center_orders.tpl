<php>$item_orders = ff_mysql_orders('uid:'.$user_id.';limit:30;page_is:true;page_id:orders;page_p:'.$user_page.';order:order_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'orders','p'=>'FFLINK'),true,'orders',4);
$totalpages = ff_page_count('orders', 'totalpages');
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>订单管理_{$site_name}</title>
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
	                <div class="aui-list-item-title">订单管理</div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
<section class="aui-grid">
    <div class="aui-row">
	<li class="aui-list-iteme">
        <div class="aui-col-xs-7"><div class="aui-grid-label">订单号</div></div>
        <div class="aui-col-xs-2"><div class="aui-grid-label">支付</div></div>
        <div class="aui-col-xs-3"><div class="aui-grid-label">状态</div></div>
		</li>
<volist name="item_orders" id="feifei">
<li class="aui-list-iteme">
        <div class="aui-col-xs-7"><div class="aui-grid-label">{$feifei.order_sign}</div></div>
        <div class="aui-col-xs-2"><div class="aui-grid-label"><switch name="feifei.order_ispay"><case value="1">付款中</case><case value="2"><font color="green">已付款</font></case><default/>未付款</switch></div></div>
        <div class="aui-col-xs-3"><div class="aui-grid-label"><switch name="feifei.order_status"><case value="1">已确认</case><case value="2">已取消</case><case value="3">无效</case><case value="4">退货</case><default/>未确认</switch></div></div>
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