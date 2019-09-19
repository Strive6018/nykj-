<php>$item_nav = ff_mysql_nav('field:*;limit:8;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc');</php><header>
<div class="navbar-collapse-s bg-theme py-2 mb-0 d-lg-none">
	<div class="container ff-gallery">
		<volist name="item_nav" id="feifei">
		<notempty name="feifei.nav_son">
			<volist name="feifei.nav_son" id="feifeison"><eq name="feifeison.nav_target" value="1"><a class="gallery-cell mr-4" href="{$feifeison.nav_link}">{$feifeison.nav_title|msubstr=0,3}</a><else/><a class="gallery-cell mr-4" href="{$feifeison.nav_link}">{$feifeison.nav_title|msubstr=0,3}</a></eq></volist>
		<else/>
			<eq name="feifei.nav_target" value="1"><a class="gallery-cell mr-4 text-nowrap" href="{$feifei.nav_link}">{$feifei.nav_title|msubstr=0,3}</a><else/><a class="gallery-cell mr-4 text-nowrap" href="{$feifei.nav_link}">{$feifei.nav_title|msubstr=0,3}</a></eq>
		</notempty>
		</volist>
	</div>
</div>
<nav class="navbar navbar-expand-sm navbar-dark bg-navbar fixed-top" data-dir="#nav-{$list_dir}">
<div class="container">
	<a class="navbar-brand" href="{$root}"><i class="fa fa-home mr-1"></i>{$site_name|msubstr=0,8}</a>
	<ul class="navbar-nav mr-auto">
		<volist name="item_nav" id="feifei">
		<notempty name="feifei.nav_son">
		<li class="nav-item dropdown d-none d-lg-block" id="nav-{$feifeison.nav_tips}">
		 <a class="dropdown-toggle" href="javascript:;" data-toggle="dropdown">{$feifei.nav_title|msubstr=0,3}<b class="caret"></b></a>
		 <div class="dropdown-menu">
			 <volist name="feifei.nav_son" id="feifeison">
				<eq name="feifeison.nav_target" value="1">
					<a class="dropdown-item nav-link" href="{$feifeison.nav_link}" target="_blank">{$feifeison.nav_title|msubstr=0,3}</a>
				 <else/>
					<a class="dropdown-item nav-link" href="{$feifeison.nav_link}">{$feifeison.nav_title|msubstr=0,3}</a>
				 </eq>
				</volist>
		 </div>
		 </li>
		<else/>
		 <eq name="feifei.nav_target" value="1">
			<li class="nav-item d-none d-lg-block" id="nav-{$feifei.nav_tips}"><a class="nav-link" href="{$feifei.nav_link}" target="_blank">{$feifei.nav_title|msubstr=0,3}</a></li>
		<else/>
			<li class="nav-item d-none d-lg-block" id="nav-{$feifei.nav_tips}"><a class="nav-link" href="{$feifei.nav_link}">{$feifei.nav_title|msubstr=0,3}</a></li>
		</eq>
		</notempty>
		</volist>
	</ul>
	<!-- -->
	<form class="mt-2 mt-md-0 ff-search d-none d-xl-block mx-auto" data-sid="{$site_sid}" data-limit="{:C('ui_search_limit')}" action="{$root}index.php?s=vod-search" method="post" data-action="{:ff_url('vod/search',array('wd'=>'FFWD'), true)}" data-action-news="{:ff_url('news/search',array('wd'=>'FFWD'), true)}">
		<div class="input-group">
		<eq name="site_sid" value="2">
		<input class="form-control ff-wd" name="wd" type="text" placeholder="标题、关键字">
		<else/>
		<input class="form-control ff-wd" name="wd" type="text" placeholder="影片名称、主演">
		</eq>
		<div class="input-group-append">
			<button class="btn btn-outline-light" type="submit">搜索</button>
		</div>
		</div>
	</form>
	<!-- -->
	<div class="navbar-text">
		<a class="mr-4 mr-lg-2 d-xl-none text-light" href="{:ff_url('ajax/search')}"><i class="fa fa-search fa-lg mr-1"></i>搜索</a>
		<a class="mr-4 mr-lg-2 d-none d-sm-inline-block text-light ff-record-get" href="javascript:;" data-toggle="popover" data-container="body" data-html="true" data-trigger="manual" data-placement="bottom" data-content="loading..."><i class="fa fa-history fa-lg mr-1"></i>看过</a>
		<gt name="site_user_id" value="0">
			<a class="text-light" href="{:ff_url('user/center')}"><i class="fa fa-user-circle fa-lg mr-1"></i>用户</a>
		<else/>
		<a class="text-light ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}"><i class="fa fa-user fa-lg mr-1"></i>登录</a>
		</gt>
	</div>
</div>
</nav>
</header>