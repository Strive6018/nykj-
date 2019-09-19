<div class="jumbotron text-center vod-ispay">
  <p>您的影币不足，请先充值，1元等于<span class="ff-text">{:C("user_pay_scale")}</span>个影币。</p>
  <p class="text-muted"><small>已支付过的影片永久有效，一次支付，永久观看。</small></p>
  <p>
		<a class="btn btn-primary user-score-payment" href="javascript:;">在线充值</a>
		<if condition="C('pay_card_sell')"> 
		<a class="btn btn-primary user-score-card" href="javascript:;">卡密充值</a>
		</if>
	</p>
</div>