<div class="modal fade ff-modal">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<h5 class="modal-title">用户登录</h5>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body pb-0">
		<form class="form-user-login" action="{:ff_url('user/loginpost')}" method="post" role="form" target="_blank">
		<fieldset class="form-group">
			<label for="user_email">邮 箱</label>
			<input class="form-control" name="user_email" id="user_email" type="email" placeholder="请输入邮箱" required>
		</fieldset>
		<fieldset class="form-group">
			<label for="user_pwd">密 码</label>
			<input class="form-control" name="user_pwd" id="user_pwd" type="password" placeholder="请输入密码" required>
		</fieldset>
		<div class="checkbox">
			<label><input name="user_remember" type="checkbox" value="1" checked>自动登录</label>
		</div>
		<div class="text-center mb-3">
			<button class="btn btn-primary mr-3" type="submit">登 录</button>
			<a class="btn btn-primary" href="{:ff_url('user/register')}">注 册</a>
		</div>
		<div class="mt-3 text-center user-login-alert">
		</div>
		</form>
	</div>
</div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>