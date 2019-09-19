<p class="navbar-text navbar-right ff-user" data-href="{:ff_url('user/center')}" data-name="true">
  <span class="glyphicon glyphicon-user ff-text"></span>
  <gt name="site_user_id" value="0">
    <a class="ff-text" href="{:ff_url('user/center')}">{$site_user_name|msubstr=0,6,true}</a>
  <else/>
  <a class="ff-text" href="{:ff_url('user/login')}">登录</a>
  <a class="ff-text" href="{:ff_url('user/register')}">注册</a>
  </gt>
</p>