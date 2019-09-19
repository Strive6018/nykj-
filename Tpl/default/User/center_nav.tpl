			<div class="wrapper-content-header">
			<div class="header-left">
				<div class="u-info">
					<div class="u-avatar">
				<a href="{:ff_url('user/center')}" target="_blank">
<img class="face" src="<volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei"><empty name="feifei.user_face">{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}<else />/Uploads/{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}</empty></volist>"></a></div>
							<div class="u-profile">
						<div class="u-name">
				<a href="{:ff_url('user/center')}" class="u-link" target="_blank" title="{$site_user_name|msubstr=0,12,true}">{$site_user_name|msubstr=0,12,true}</a></div>
				<div class="u-credit">
				<a href="{:ff_url('user/center')}" target="_blank"><span class="vip-level-icon level-vip<include file="Base:vod_svip" />" title="{$site_name|msubstr=0,2}VIP会员：VIP<include file="Base:vod_svip" />"></span></a>
				<a href="{:ff_url('user/center')}" target="_blank" class="user-grade"><span class="user-grade-icon user-grade-lv<include file="Base:vod_vipdj" />" title="{$site_name|msubstr=0,2}用户等级：Lv<include file="Base:vod_vipdj" />" ></span></a>
				<a class="ico-valid-email " href="{:ff_url('user/center')}" title="我的消息"></a></div>
				<div class="user-desc"><div class="entry"><span class="desc">暂无简介</span></div></div>
				<div class="u-point">
				<i class="arrow"></i>
				<a href="{:ff_url('user/center')}" target="_blank">我的{$site_name|msubstr=0,2}影币：<em><volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei">{$feifei.user_score}</volist></em><span>影币</span></a>
				</div>
				</div>
				</div>
				</div>
                <div class="header-right">
           <div class="share-link"><a href="{$site_url}{:ff_url('user/index',array('id'=>$user_id))}" target="_blank">{$site_url}{:ff_url('user/index',array('id'=>$user_id))}</a><div class="overlay"></div></div>
            </div>
			</div>
		<div class="User-main">
        <div class="ucenter-slider">
            <ul class="slider-nav scroll">
                <li <eq name="user_action" value="index">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'index'))}">我的主页</a></li>
                <li <eq name="user_action" value="orders">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'orders'))}">订单管理</a></li>
                <li <eq name="user_action" value="buy">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'buy'))}">消费记录</a></li>
                <li <eq name="user_action" value="history">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'history'))}">观看记录</a></li>
				<li <eq name="user_action" value="forums">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'forums'))}">我的话题</a></li>
                <li <eq name="user_action" value="likes">class="cur"</eq>><a href="{:ff_url('user/center',array('action'=>'likes'))}">我的收藏</a></li>
                <li><a class="ff-text" href="{:ff_url('user/logout')}">注销登陆</a></li>
            </ul>
        </div>