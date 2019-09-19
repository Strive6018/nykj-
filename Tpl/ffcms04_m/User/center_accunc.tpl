<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>用户中心_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
<include file="User:header" />
</head>
<body class="user-cente">
<include file="User:center_nav" />
<!--用户信息-->
<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
		<if condition="ff_PaymentItem">
	        <a class="aui-list-item user-score-payment" href="javascript:;">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">在线充值</div>
					<div class="aui-list-item-right"></div>
	            </div>
	        </a></if>
			<if condition="('pay_card_sell')">
	        <a class="aui-list-item user-score-card" href="javascript:;">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">卡密充值</div>
					<div class="aui-list-item-right"></div>
	            </div>
	        </a>
	    </div></if>
	</div>
</section>

<section class="mod aui-margin-t-0">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="javascript:;">
	            <div class="aui-list-item-inner">
	                <div class="aui-list-item-title">推广活动</div>
					<div class="aui-list-item-right">邀请用户成功注册可获{:C("user_register_score_pid")}影币奖励</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>
<section class="aui-grid aui-margin-t-0">
	<div class="aui-row">
	    <div class="aui-col-xs-12">
    <dl class="safe">

      <dd>　上次登陆时间：{$user_logtime|date='Y/m/d H:i:s',###}</dd>      
    </dl>
  </div>  
	</div>
</section>

<include file="User:footer" />
</body>
</html>