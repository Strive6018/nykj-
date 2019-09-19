<div class="modal fade ff-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h5 class="modal-title">影币充值</h5>
    </div>
    <div class="modal-body text-center">
      <eq name="Think.config.user_pay_name" value="vyipay">
        <form class="form-horizontal user-pay-form" action="{:ff_url('user/pay')}" method="post" role="form" target="_blank" style="padding:20px 0" data-small="{:C('user_pay_small')}">
          <div class="form-group">
            <label for="score_ext" class="col-sm-3 control-label">充值金额</label>
            <div class="col-sm-6">
              <input class="form-control text-center" name="score_ext" id="score_ext" value="{:(C('user_pay_small'))}" type="text" required>
            </div>
          </div>
          <div class="form-group">
            <label for="pay_type" class="col-sm-3 control-label">支付方式</label>
            <div class="col-sm-6">
              <label class="radio-inline">
                <input type="radio" name="pay_type" id="pay_type" value="alipay" checked> 支付宝
              </label>
              <label class="radio-inline">
                <input type="radio" name="pay_type" id="pay_type" value="wxpay"> 微信
              </label>
              <label class="radio-inline">
                <input type="radio" name="pay_type" id="pay_type" value="qqpay"> QQ钱包
              </label>
            </div>
          </div>
          <button type="submit" class="btn btn-play">提交</button>
        </form>
      <else/>
      	<form class="form-inline user-pay-form" action="{:ff_url('user/pay')}" method="post" role="form" target="_blank" style="padding:20px 0" data-small="{:C('user_pay_small')}">
        <div class="form-group">
          <label for="score_ext" class="control-label">充值金额（元）</label>
          <input class="form-control text-center" name="score_ext" id="score_ext" value="{:(C('user_pay_small'))}" type="text" required>
        </div>
        <button type="submit" class="btn btn-play">提交</button>
      </form>
      </eq>
    </div>
    <div class="modal-footer">
        <h6 class="user-pay-alert text-center">
        1元等于<span class="ff-text">{:C("user_pay_scale")}</span>个影币，最低<span class="ff-text">{:C("user_pay_small")}</span>元起充，支持微信、支付宝、网银等在线充值
        </h6>
    </div>
  </div>
</div>
</div>