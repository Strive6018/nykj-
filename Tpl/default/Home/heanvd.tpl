
<in name="model" value="index,vod" >
<if condition="$action eq show"><eq name="list_id" value="5"><div class="top-main channel-top-main" id="main-bg"><else/><div class="top-main channel-top-main"></eq>
<elseif condition="$action eq index" /><div class="top-main channel-top-main">
<else /><div class="top-main channel-top-main" id="main-bg">
</if>
<else /><div class="top-main channel-top-main" id="main-bg">
</in>

	<div class="test"></div>
        <div class="newhead">
          <div class="newhead-main">
            <div class="hd-logo"><a title="{$site_name}" href="<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="0" length="1">{$feifei.nav_link}</volist>" target="_self" rel="nofollow"></a></div>
            <div class="newhead-small-nav">
				<volist name=":ff_mysql_nav('field:*;limit:10;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="0" length="5">
				<li id="nav-{$feifei.nav_tips}"><a href="{$feifei.nav_link}" target="_self">{$feifei.nav_title}</a></li>
				</volist>
				<li class="top-nav-more-large"><a href="javascript:void(0);" class="ico-list"></a>
					<ul>
                    <li class="arrow"></li>
					<li><div class="top-nav-more-content">
                            <dl class="top-nav-channel">
                                <dt>其他</dt>
                                <dd>
				<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="5" length="3">
				<a href="{$feifei.nav_link}" target="_self" id="nav-{$feifei.nav_tips}">{$feifei.nav_title}</a>
				</volist>	
	                             </dd>
							</dl>
				    </div>
				</ul>
				</li>
			</li>
            </div>
			<eq name="list_dir" value="index"><else/><script>$("#nav-{$list_dir}").addClass("cur");</script></eq>
			<div id="searchPane" class="search-main" areacode="search">
              <div class="head-search pull-left">
			   		<div id="_js_search_form" class="head-search-box">
	<form class="search-form ff-search" id="ff-search" data-limit="{:C('ui_search_limit')}" data-sid="{$site_sid}" role="search" action="{$root}index.php?s=vod-search-name" method="post">
			<input type="text" value="{$search_name}{$search_actor}{$search_director}{$search_wd}" class="form-control ff-wd" id="ff-wd" autocomplete="off" name="wd" placeholder="请输入影片名称">
				<a class="head-search-top" href="{:ff_url('ajax/top', '', true)}" target="_blank"></a>
				<button type="submit" data-action="{:ff_url('vod/search',array('wd'=>'FFWD'), true)}">搜剧</button>
								</form>
			   		</div>
			   	</div>
				</div>
			<div class="g-ucenter" id="uerCenter">
                 <div class="u-vip"><div class="handle"><a href="javascript"class="user-score-payment"> <target="_blank"><i class="ico-vip"></i>VIP</a></div></div>

                <div class="u-sub"><div class="handle"><a href="javascript:;" onclick="addFavorite(this);"><i class="ico-sub"></i>订阅</a></div></div>
                <div class="u-record">
                    <div class="dropdown" id="u-record">
                        <div class="handle"><a class="ff-record-get" href="javascript:;" data-toggle="popover" data-container="body" data-html="true" data-trigger="manual" data-placement="bottom" data-content="loading..."><i class="ico-urecord"></i>记录</a></div>
                        <div class="panel"> <i class="arrow"></i>
                            <div class="content">
								<dl class="rec-list">
								<dt>最近</dt>
								<i id="bplayer"></i>
							</dl>
							</div>
                        </div>
                    </div>
                </div>
                <div class="u-upload">
                    <div class="dropdown">
                        <div class="handle"><a href="{:ff_url('user/center')}" target="_blank"><i class="ico-upload"></i>上传</a></div>
                    </div>
                </div>
                <div class="u-app">
                  <div class="dropdown" id="u-app">
                      <div class="handle"><a href="javascript:;" target="_blank"><i class="ico-app"></i>客户端</a> </div>
					  <div class="panel"><i class="arrow"></i>
                          <div class="content"><div class="g-nav-app-intro">
						<a href="javascript:;" target="_blank" class="g-nav-iku">
						<img src="{$public_path}ffcms/images/xiazai1.png" width="64">
						<h3>{$site_name|msubstr=0,2}客户端</h3>
						<span>快速·稳定的观看体验</span>
						</a><a href="javascript:;" target="_blank" class="g-nav-app">
						<img src="{$public_path}ffcms/images/xiazai2.jpg" width="64">
						<h3>{$site_name|msubstr=0,2}移动APP</h3>
						<span>全网独播尽在手中</span>
						</a>

						</div>
					   </div>
                     </div>
                  </div>
                </div>
			<div class="u-login">
                  <div class="login-after dropdown" id="u-login">
					<gt name="site_user_id" value="0">
			<a class="text-muted" href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom">
                     <img src="<volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei"><empty name="feifei.user_face">{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}<else />/Uploads/{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}</empty></volist>" title="{$site_user_name|msubstr=0,12,true}">
					 <span class="vip-level-icon level-svip level-vip<include file="Base:vod_svip" />"></span></a>
				  <else/>
                      <a class="text-muted ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom">
                          <img src="{$public_path}ffcms/images/user.png" title="未登录"> </a>
						  </gt>
			<gt name="site_user_id" value="0">
           <div class="panel u-panel"><i class="arrow"></i>
           <div class="content"> 
				<div class="u-content">                 
					<div class="u-info">
							<div class="u-avatar">
				<a href="{:ff_url('user/center')}" target="_blank">
<img src="<volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei"><empty name="feifei.user_face">{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}<else />/Uploads/{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}</empty></volist>"></a></div>
							<div class="u-profile">
						<div class="u-name">
				<a href="{:ff_url('user/center')}" class="u-link" target="_blank" title="{$site_user_name|msubstr=0,12,true}">{$site_user_name|msubstr=0,12,true}</a></div>
				<div class="u-credit">
				<a href="{:ff_url('user/center')}" target="_blank"><span class="vip-level-icon level-vip<include file="Base:vod_svip" />" title="{$site_name|msubstr=0,2}VIP会员：VIP<include file="Base:vod_svip" />"></span></a>
				<a href="{:ff_url('user/center')}" target="_blank" class="user-grade"><span class="user-grade-icon user-grade-lv<include file="Base:vod_vipdj" />" title="{$site_name|msubstr=0,2}用户等级：Lv<include file="Base:vod_vipdj" />" ></span></a>
				<a class="ico-valid-email " href="{:ff_url('user/center')}" title="我的消息"></a></div>
				<div class="u-point">
				<i class="arrow"></i>
				<a href="{:ff_url('user/center')}" target="_blank">我的{$site_name|msubstr=0,2}影币：<em><volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei">{$feifei.user_score}</volist></em><span>立即充值</span></a>
				</div></div></div> 
				<ul class="u-list">
				<li><a href="{:ff_url('user/center',array('action'=>'history'))}" target="_blank" class="u-watch"><em></em>我的追剧</a></li>                            
				<li><a href="{:ff_url('user/center',array('action'=>'likes'))}" target="_blank" class="u-collect"><em></em>我的收藏</a></li>
				<li><a href="{:ff_url('user/center',array('action'=>'forums'))}" target="_blank" class="u-zpd"><em></em>我的话题</a></li>
				<li><a href="{:ff_url('user/center',array('action'=>'orders'))}" target="_blank" class="u-center"><em></em>订单管理</a></li>
				</ul> 
				</div> 
					</div>
                      <div class="u-bottom">
                        <a href="{:ff_url('user/logout')}" class="singout">退出登录</a>
                        <a href="{:ff_url('user/center')}" target="_blank">账户设置</a>
                      </div>
                    </div>
					</gt>
                  </div>
                </div>	
		     </div>
			</div>
        </div>
      </div>
<!--顶部结束--> 
