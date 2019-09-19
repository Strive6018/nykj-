<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="mod aui-margin-t-15">
	<div class="mod-main">
		<form class="loginForm user-repwd-form" action="{:ff_url('user/repwd')}" method="post" role="form" target="_blank">
			<ul class="mod-form-list">
				<li class="form-list-item aui-margin-t-0"><span class="user-repwd-alert"></span></li>
				<label for="user_email" class="control-label">修改密码</label><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-unlock"></i>
					<input  class="input mod-login-phone" name="user_pwd_old" placeholder="密码" id="user_pwd_old"  type="password" required>
				<span class="Validform_checktip"></span></li>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-lock"></i>
					<input class="input" name="user_pwd" id="user_pwd" placeholder="新密码" type="password" required>
				<span class="Validform_checktip"></span></li>
				<li class="form-list-item">
					<i class="aui-iconfont aui-icon-lock"></i>
					<input class="input" name="user_pwd_re" id="user_pwd_re" placeholder="确认密码"  type="password" required>
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
