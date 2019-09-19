<header class="header">
	<div class="aui-bar aui-bar-nav">
		<a href="/" class="logo aui-pull-left"></a>
		<div class="search">
			<div class="text" onclick="openSearch()"><eq name="action" value="search">{$search_name}{$search_actor}{$search_director}{$search_wd}<else/>请输入影片名称</eq></div>
			<div class="icon"><i class="aui-iconfont aui-icon-search"></i></div>
		</div>
	    <div id="member_info">
		<gt name="site_user_id" value="0">

		<a class="aui-pull-right aui-btn ff-user" href="{:ff_url('user/center')}">
		    <span class="aui-iconfont aui-icon-my" style="background-image: url(<volist name=":ff_mysql_user('limit:1;ids:'.$site_user_id.';order:user_id;sort:desc')" id="feifei"><empty name="feifei.user_face">{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}<else />/Uploads/{$feifei.user_face|default=$public_path.'ffcms/user/user.png'}</empty></volist>);"></span>
			<else/>
			<a class="aui-pull-right aui-btn ff-user" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom">
		 <span class="aui-iconfont aui-icon-my" style="background-image: url(/Public/ffcms_m/images/usre.png);"></span>
		</gt>

	</a>
</div>
</div>
</header>

<section class="headerTopNav">
	<div class="navWrap">
		<div class="shadow-le"></div>
		<div class="shadow-ri"></div>
		<div id="headerTopNav" class="warp">
			<ul class="swiper-wrapper">
			<volist name=":ff_mysql_nav('field:*;limit:10;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="0" length="8">
				<li class="swiper-slide" id="nav-{$feifei.nav_tips}"><a class="item" href="{$feifei.nav_link}" title="{$feifei.nav_title}">{$feifei.nav_title}</a></li>
		</volist>
			</ul>
		</div>
	</div>
</section>
<!--搜索框-->
<section class="searchPop">
	<div class="searchCon">
		<div class="sSearchInput">
			<form class="search-form" data-sid="{$site_sid}" data-limit="{:C('ui_search_limit')}" role="search" action="{$root}index.php?s=vod-search-name" method="post">
				<input class="searchInput ff-wd" name="wd" type="search" autocomplete="off" placeholder="请输入影片名称">
	      	</form>
		</div>
		<a href="javascript:;" onclick="closeSearch()" class="cancelInput">取消</a>
	</div>
	<div class="aui-search"></div>

<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">热门搜索</span>
		</div>
		
	</div>
	<div class="mod-main clearfix">
				<div class="mod-row">
			<ul class="search-list clearfix">
					 <volist name=":ff_mysql_vod('limit:20;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits_lasttime;sort:desc')" id="feifei" key="k" offset="1" length="17">
    <li class="aui-ellipsis-1"><in name="k" value="1,2,3" ><span class="colred{$k}"><else/><span></in>{$k}</span><a href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,15,'utf-8',true}</a>
	<switch name="k" ><case value="1"><em class="top"></em></case><case value="2"><em class="up"></em></case><case value="3"><em class="up"></em></case><default  /><em class="down"></em></switch></li>
    </volist>
							</ul>
		</div>
			</div>
</section>  
</section>
<eq name="list_dir" value="index"><else/><script>$("#nav-{$list_dir}").addClass("active");</script></eq>
<script type="text/javascript">
	$("#headerTopNav li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#headerTopNav',{freeMode : true,slidesPerView : 'auto',initialSlide:index});
       	}else{
       		var videoSelectWrap = new Swiper('#headerTopNav',{freeMode : true,slidesPerView : 'auto'});
       	}
	});

</script>	