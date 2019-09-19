<div class="list-group">
  <a class="list-group-item list-group-item-action uc-index" href="{:ff_url('user/center',array('action'=>'index'))}">帐号管理</a>
	<a class="list-group-item list-group-item-action uc-history" href="{:ff_url('user/center',array('action'=>'history'))}">观看记录</a>
	<a class="list-group-item list-group-item-action uc-forum" href="{:ff_url('user/center',array('action'=>'forum'))}">我的话题</a>
  <a class="list-group-item list-group-item-action uc-orders" href="{:ff_url('user/center',array('action'=>'orders'))}">我的订单</a>
  <a class="list-group-item list-group-item-action uc-buy" href="{:ff_url('user/center',array('action'=>'buy'))}">影币记录</a>
	<a class="list-group-item list-group-item-action" href="{:ff_url('user/logout')}">安全退出</a>
</div>
<script>$('.uc-{$user_action}').addClass('bg-theme text-white');</script>