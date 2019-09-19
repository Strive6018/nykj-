<div class="modal fade ff-modal">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<h5 class="modal-title">VIP权限续期</h5>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<form class="form-inline user-upvip-form my-3" action="{:ff_url('user/deadtime')}" method="post" target="_blank" data-url="{:C('pay_card_sell')}">
			<label for="score_ext" class="control-label">购买期限（天）：</label>
			<input class="form-control text-center mx-sm-2" name="score_ext" id="score_ext" value="{:C('user_pay_vip_small')}" type="text" required>
			<button type="submit" class="btn btn-primary mt-2 mt-sm-0">提 交</button>
		</form>
		<div class="mt-2 text-center user-upvip-btn d-none">
			<a class="btn btn-primary user-score-payment" href="javascript:;">在线充值</a>
			<if condition="C('pay_card_sell')"><a class="btn btn-primary user-score-card" href="javascript:;">卡密充值</a></if>
		</div>
	</div>
	<div class="modal-footer text-muted mb-0 user-upvip-alert d-block text-center">
		<small>本站VIP会员按天计算，买多少您说了算，售价为<strong>{:C("user_pay_vip_ext")}</strong>影币/天，最低购买<strong>{:C("user_pay_vip_small")}</strong>天。</small>
	</div>
</div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>