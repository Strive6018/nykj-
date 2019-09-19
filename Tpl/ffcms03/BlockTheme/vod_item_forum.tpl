<php>$item_list = ff_mysql_forum('cid:'.$vod_id.';sid:1;pid:0;status:1;limit:20;cache_name:default;cache_time:default;order:forum_up;sort:desc');</php>
<form class="form-forum ff-forum-post ff-forum-detail" id="form-forum" role="form" action="{$root}index.php?s=forum-update" method="post">
  <input name="forum_cid" type="hidden" value="{$vod_id}" />
  <input name="forum_sid" type="hidden" value="1" />
  <input name="forum_pid" type="hidden" value="0" />
  <div class="form-group">
    <textarea name="forum_content" class="form-control" rows="5" placeholder="吐槽......"></textarea>
  </div>
  <div class="form-group text-right">
    <label>
      <input class="form-control input-sm text-center ff-vcode ff-vcode-input" name="forum_vcode" maxlength="4" type="text" placeholder="验证码">
    </label>
    <label>
      <button type="submit" class="btn btn-default btn-sm">提交</button>
    </label>
  </div>
  <div class="form-group ff-alert clearfix">
  </div>
</form>
<notempty name="item_list">
<div class="ff-forum-item">
	<include file="BlockBase:forum_item" />
</div>
<ul class="list-unstyled">
  <li class="col-xs-4 col-xs-offset-4 text-center">
  <a class="btn btn-default btn-block btn-lg" href="{:ff_url('forum/vod',array('cid'=>$vod_id),true)}">
  	查看全部评论
  	<span class="fa fa-angle-right"></span>
  </a>
  </li>
</ul>
</notempty>
<div class="clearfix ff-clearfix"></div>