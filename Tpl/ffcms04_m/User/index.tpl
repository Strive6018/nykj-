<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>{$user_name|htmlspecialchars|nb}的个人主页_{$site_name}</title>
<meta name="keywords" content="{$user_name|htmlspecialchars|nb}喜欢的电影">
<meta name="description" content="欢迎来到{$user_name|htmlspecialchars|nb}的个人主页，在这里与您一起分享{$user_name|htmlspecialchars|nb}喜欢的影片。">
</head>
<body class="user-center user-index">
<!--用户信息-->
<section class="mod">
    <div class="aui-list aui-media-list">
        <a class="aui-list-item aui-list-item-middle" href="/member/account">
            <div class="aui-media-list-item-inner">
                <div class="aui-list-item-media" style="width:3.5rem;">
                    <img src="/Public/ffcms_m/images/ffcms.jpg" class="aui-img-round">
                </div>
                <div class="aui-list-item-inner aui-list-item-arrow">
                    <div class="aui-list-item-text">
                        <div class="aui-list-item-title aui-font-size-14"></div>
                    </div>
                    <div class="aui-list-item-text">hanjutv_102095</div>
                </div>
            </div>
        </a>
    </div>
</section>
<section class="mod aui-margin-t-15">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="/member/favorite/video">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">收藏夹</div>
	            </div>
	        </a>
	       	<a class="aui-list-item" href="/member/account/upgrade">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">大会员</div>
	                <div class="aui-list-item-right">
	                		                    <div class="aui-label aui-label-info">尚未开通</div>
	                    	                </div>
	            </div>
	        </a>
	        <a class="aui-list-item" href="/member/usuhyzkm">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">兑换会员</div>
	            </div>
	        </a>
      		<a class="aui-list-item" href="/vip/">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">免费领取大会员</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>
<section class="mod aui-margin-t-15">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="/index.php?s=/forum-guestbook.html">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">在线反馈</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>
<section class="mod aui-margin-t-15">
	<div class="aui-content">
	    <div class="aui-list aui-list-in">
	        <a class="aui-list-item" href="/member/account">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">帐号设置</div>
	            </div>
	        </a>
	         <a class="aui-list-item" href="/index.php?s=member&c=login&m=out">
	            <div class="aui-list-item-inner aui-list-item-arrow">
	                <div class="aui-list-item-title">退出登录</div>
	            </div>
	        </a>
	    </div>
	</div>
</section>
<include file="User:footer" />
</body>
</html>