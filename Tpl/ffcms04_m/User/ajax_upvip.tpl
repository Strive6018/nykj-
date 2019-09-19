<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="mod aui-margin-t-15">
	<div class="mod-main">
		<form class="loginForm user-upvip-form" action="{:ff_url('user/deadtime')}" method="post" role="form" target="_blank">
			<ul class="mod-form-list">
				<li class="form-list-item aui-margin-t-0"><span class="user-upvip-alert"></span></li>
				<label for="user_email" class="control-label">购买期限（天）</label><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<li class="form-list-item">
					<input class="input mod-login-phone" name="score_ext" id="score_ext" value="{:C('user_pay_vip_small')}" type="text" required>
				<span class="Validform_checktip"></span></li>

				<li class="form-list-item aui-margin-t-5">
					<button type="submit" class="button button-ture">提交</button>
				</li>
								<li class="form-list-item aui-margin-t-0">
					<span>本站VIP会员按天计算,售价为<span class="ff-text">{:C("user_pay_vip_ext")}</span>影币/天,<span class="ff-text">{:C("user_pay_vip_small")}</span>天起售!</span>
				</li>
			</ul>
		</form>
	</div>
</div>
</div>
</div>
