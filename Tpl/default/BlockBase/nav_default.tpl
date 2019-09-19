<ul class="nav navbar-nav navbar-left">
  <volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="0" length="10">
  <notempty name="feifei.nav_son">
    <li class="dropdown" id="nav-{$feifeison.nav_tips}">
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
  <li class="hidden-xs"><a class="ff-record-get" href="javascript:;" data-toggle="popover" data-container="body" data-html="true" data-trigger="manual" data-placement="bottom" data-content="loading...">看过</a></li>
  <li class="visible-sm"><a href="{:ff_url('user/center')}"><span class="glyphicon glyphicon-user"></span></a></li>
  <li class="visible-sm"><a href="{:ff_url('ajax/search')}"><span class="glyphicon glyphicon-search"></span></a></li>
</ul>