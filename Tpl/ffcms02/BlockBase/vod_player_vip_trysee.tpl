<div class="jumbotron text-center vod-ispay">
  <eq name="play_ispay" value="1">
    <p>试看{$play_trysee}分钟结束，请升级到VIP用户组看全集。</p>
    <p class="text-muted"><small>本站VIP会员按天计算，买多少您说了算，售价为<strong>{:C("user_pay_vip_ext")}</strong>影币/天，最低购买<strong>{:C("user_pay_vip_small")}</strong>天。</small></p>
    <p><a href="javascript:;" class="btn btn-primary user-score-upvip">升级VIP</a></p>
	<else/>
    <p>{$play_trysee}分钟试看结束，观看全集需要花费<span class="ff-text">{$play_price}</span>影币。</p>
 		<p class="text-muted"><small>一次支付，永久观看。影币充值请点击<a class="user-score-payment" href="javascript:;">这里</a>，1元等于<strong>{:C("user_pay_scale")}</strong>个影币。</small></p>
  	<p><a href="javascript:;" class="btn btn-primary vod-price">确定</a></p>
  </eq>
</div>