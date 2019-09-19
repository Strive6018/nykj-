<php>$item_score = ff_mysql_score('uid:'.$user_id.';limit:30;page_is:true;page_id:score;page_p:'.$user_page.';order:score_id;sort:desc');
$page_info = ff_url_page('user/center',array('action'=>'buy','p'=>'FFLINK'),true,'score',4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_center_buy" />
</head>
<body class="bg-light user-center">
<include file="BlockTheme:header" />
<main class="container">
<div class="row mt-3">
<div class="col-md-2 order-2 order-md-1 mb-3">
	<include file="BlockBase:user_center_nav" />
</div>
<div class="col-md-10 order-1 order-md-2 mb-3">
	<div class="card">
		<div class="card-header">我的消费记录</div>
		<div class="card-body pb-0">
			<div class="table-responsive">
				<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">频道</th>
						<th scope="col">类型</th>
						<th scope="col">变化值</th>
						<th scope="col">操作时间</th>
					</tr>
				</thead>
				<tbody>
				 <volist name="item_score" id="feifei">
					<tr>
						<th scope="row">{$i}</th>
						<td><switch name="feifei.score_sid"><case value="1">视频</case><case value="2">文章</case><case value="3">专题</case><default/>用户</switch></td>
						<td><switch name="feifei.score_type"><case value="1">影币充值</case><case value="2">注册赠送</case><case value="3">管理员操作</case><case value="4">推广奖励</case><case value="5">退货返还</case><case value="6">卡密充值</case><case value="21">升级VIP</case><case value="22"><a href="{:ff_url('vod/read',array('id'=>$feifei['score_did']),true)}" target="_blank">付费点播</case><default/>未知</switch></td>
						<td>{$feifei.score_ext}</td>
						<td>{$feifei.score_addtime|date='Y-m-d H:i',###}</td>
					</tr>
					</volist>
				</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer pagination d-flex flex-wrap justify-content-center border-top-0">
			{$page_info}
		</div>
	</div><!--card end -->
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>