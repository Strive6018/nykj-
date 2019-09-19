<div class="modal fade ff-modal">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<h5 class="modal-title">影币卡密充值</h5>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body">
		<form class="form-horizontal forum-card" action="{:ff_url('payment/post_card')}" method="post" role="form" target="_blank">
			<fieldset class="form-group">
				<label for="card_number">充值卡号</label>
				<input class="form-control" name="card_number" id="card_number" type="text" required>
			</fieldset>
			<div class="forum-group row">
				<div class="col-12 text-center">
					<button type="submit" class="btn btn-primary">提交充值</button>
					<a class="btn btn-primary" href="{:C('pay_card_sell')}"target="_blank">购买卡密</a>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer alert-card d-block text-center">
		<small>本站卡密24小时无人自动发货，如需购买请点击<a href="{:C('pay_card_sell')}" target="_blank">这里</a>、1元等于<strong>{:C("user_pay_scale")}</strong>个影币</span></small>
	</div>
</div>
</div>
</div>