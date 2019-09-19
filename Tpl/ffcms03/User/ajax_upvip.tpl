<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h5 class="modal-title">VIP权限续期</h5>
    </div>
    <div class="modal-body text-center">
      <form class="form-inline user-upvip-form" action="{:ff_url('user/deadtime')}" method="post" role="form" target="_blank" style="padding:20px 0" data-url="{:C('pay_card_sell')}">
        <div class="form-group">
          <label for="user_email" class="control-label">购买期限（天）</label>
          <input class="form-control text-center" name="score_ext" id="score_ext" value="{:C('user_pay_vip_small')}" type="text" required>
        </div>
        <button type="submit" class="btn btn-play">提交</button>
      </form>
    </div>
    <div class="modal-footer">
			<h6 class="user-upvip-alert text-center">
			本站VIP会员按天计算，买多少您说了算，售价为<span class="ff-text">{:C("user_pay_vip_ext")}</span>影币/天，最低购买<span class="ff-text">{:C("user_pay_vip_small")}</span>天。
			</h6>
    </div>
  </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>