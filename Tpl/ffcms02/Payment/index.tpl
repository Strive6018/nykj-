<div class="modal fade ff-modal">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<h5 class="modal-title">影币在线充值</h5>
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	</div>
	<div class="modal-body mb-0 pb-0">
		<form class="forum-payment" action="{:ff_url('payment/post')}" method="post" role="form" target="_blank" data-small="{:C('user_pay_small')}">
			<div class="form-group row">
				<label for="score_ext" class="col-sm-3 form-control-label">充值金额</label>
				<div class="col-sm-6">
					<input class="form-control" name="score_ext" id="score_ext" type="text" value="{:(C('user_pay_small'))}" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">支付方式</label>
				<div class="col-sm-9">
					<volist name=":ff_PaymentItem()" id="paytype" mod="4">
					<label class="checkbox-inline">
						<input type="radio" name="pay_type" id="pay_type" value="{$paytype}" checked>
						<switch name="paytype">
						<case value="rj">云支付</case>
						<case value="code_ali">支付宝</case>
						<case value="code_wxpay">微 信</case>
						<case value="code_qq">QQ钱包</case>
						<case value="alipay">支付宝</case>
						<case value="wxpay">微 信</case>
						<case value="paypal">PayPal</case>
						</switch>
					</label>
					</volist>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-12 text-center">
					<button type="submit" class="btn btn-primary">提 交</button>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer text-muted mb-0 user-pay-alert d-block text-center">
		<small>1元等于<strong>{:C("user_pay_scale")}</strong>个影币，最低<strong>{:C("user_pay_small")}</strong>元起充，支持微信、支付宝、网银等在线充值</small>
	</div>
</div>
</div>
</div>