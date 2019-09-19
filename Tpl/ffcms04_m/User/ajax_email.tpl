<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="mod aui-margin-t-15">
	<div class="mod-main">
		<form class="loginForm user-email-form" action="{:ff_url('user/email')}" method="post" role="form" target="_blank">
			<ul class="mod-form-list">
					<li class="form-list-item aui-margin-t-0"><span class="user-email-alert"></span></li>
					<label for="user_email" class="control-label">修改邮箱</label><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-lock"></i>
					<input class="input mod-login-phone" placeholder="密码" name="user_pwd" id="user_pwd"  type="password" required>
				<span class="Validform_checktip"></span></li>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-mail"></i>
					<input class="input" placeholder="新邮箱" name="user_email" id="user_email"  type="text" required>
				<span class="Validform_checktip"></span></li>

				<li class="form-list-item aui-margin-t-5">
					<button type="submit" class="button button-ture">确认修改</button>
				</li>
			</ul>
		</form>
	</div>
</div>
</div>
</div>

