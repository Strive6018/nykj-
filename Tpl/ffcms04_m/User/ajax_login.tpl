<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="mod aui-margin-t-15">
	<div class="mod-main">
		<form class="loginForm form-user-login" action="{:ff_url('user/loginpost')}" method="post" role="form" target="_blank">
			<ul class="mod-form-list">
					<li class="form-list-item"><span class="user-login-alert"></span></li>
				<label for="user_email" class="control-label">用户登录</label><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-mail"></i>
					<input class="input mod-login-phone" name="user_email" id="user_email" type="text" placeholder="邮箱" required>
				<span class="Validform_checktip"></span></li>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-lock"></i>
					<input class="input" name="user_pwd" id="user_pwd" type="password" placeholder="密码" required>
				<span class="Validform_checktip"></span></li>
				<li class="form-list-item">
					<button type="submit" class="button button-ture" id="user-submit">登录</button>
				</li>
				<li class="form-list-item">
				<a class="aui-btn button button-false" href="{:ff_url('user/register')}">注册</a>
			</li>
			</ul>
		</form>
	</div>
</div>
</div>

