<nav class="navbar navbar-default navbar-fixed-top" data-dir="#nav-{$list_dir}">
<div class="container">
  <p class="navbar-left navbar-logo">
    <a href="{$root}"><img src="{$tpl_path}Images/logo.png" title="{$site_name}" /></a>
  </p>
  <ul class="nav navbar-nav">
  	<volist name=":ff_mysql_nav('field:*;limit:120;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei">
    <notempty name="feifei.nav_son">
      <li class="dropdown">
        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">{$feifei.nav_title}<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <volist name="feifei.nav_son" id="feifeison">
          <eq name="feifeison.nav_target" value="1">
            <li><a href="{$feifeison.nav_link}" target="_blank">{$feifeison.nav_title}</a></li>
           <else/>
            <li><a href="{$feifeison.nav_link}">{$feifeison.nav_title}</a></li>
           </eq>
          </volist>
        </ul>
      </li>
    <else/>
       <eq name="feifei.nav_target" value="1">
        <li id="nav-{$feifei.nav_tips}"><a href="{$feifei.nav_link}" target="_blank">{$feifei.nav_title}</a></li>
      <else/>
        <li id="nav-{$feifei.nav_tips}"><a href="{$feifei.nav_link}">{$feifei.nav_title}</a></li>
      </eq>
    </notempty>
    </volist>
    <li><a class="ff-record-get" href="javascript:;" data-toggle="popover" data-container="body" data-html="true" data-trigger="manual" data-placement="bottom" data-content="loading...">看过</a></li>
  </ul>
  <form class="navbar-form ff-search" data-sid="{$site_sid}" role="search" action="{$root}index.php?s=vod-search-name" method="post">
    <div class="input-group input-group-sm">
      <span class="input-group-addon">
      <gt name="site_user_id" value="0">
      <a class="ff-user-active" href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom" title="我的用户中心"><span class="glyphicon glyphicon-user"></span></a>
      <else/>
      <a class="ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom" title="点击登录"><span class="glyphicon glyphicon-user"></span></a>
      </gt>
      </span>
      <eq name="site_sid" value="2">
      <input type="text" class="form-control ff-wd" id="ff-wd" name="wd" placeholder="请输入关键字">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-default" data-action="{:ff_url('news/search',array('name'=>'FFWD'), true)}">
          <span class="glyphicon glyphicon-search"></span>
        </button>
      </div>
      <else/>
      <input type="text" class="form-control ff-wd" id="ff-wd" name="wd" placeholder="请输入影片名称">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-default" data-action="{:ff_url('vod/search',array('name'=>'FFWD'), true)}">
          <span class="glyphicon glyphicon-search"></span>
        </button>
      </div>
      </eq>
    </div>
  </form> 
</div><!-- /.container -->
</nav><!-- /.navbar -->