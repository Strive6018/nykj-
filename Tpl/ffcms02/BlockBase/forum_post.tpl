<form class="form-forum ff-forum-post mt-3 mb-0" role="form" action="{$root}index.php?s=forum-update" method="post">
  <input name="forum_cid" type="hidden" value="{$forum_cid|default=0}" />
  <input name="forum_sid" type="hidden" value="{$forum_sid|default=5}" />
  <input name="forum_pid" type="hidden" value="{$forum_pid|default=0}" />
  <div class="form-group">
    <textarea name="forum_content" class="form-control" rows="5" placeholder="吐槽......"></textarea>
  </div>
  <div class="form-row">
		<div class="col-3 col-md-1">
			<input class="form-control text-center ff-vcode ff-vcode-input" name="forum_vcode" maxlength="4" type="text" placeholder="验证码">
		</div>
		<div class="col-3 col-md-1">
			<button type="submit" class="btn btn-primary btn-block">提交</button>
		</div>
  </div>
	<div class="form-group ff-alert mt-2">
  </div>
</form>