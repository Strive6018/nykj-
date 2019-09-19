<php>$item_orders = ff_mysql_orders('uid:'.$user_id.';limit:30;page_is:true;page_id:orders;page_p:'.$user_page.';order:order_id;sort:desc');
$page_info = ff_url_page('user/center',array('action'=>'orders','p'=>'FFLINK'),true,'orders',4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_center_orders" />
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
		<div class="card-header">我的订单</div>
		<div class="card-body pb-0">
			<div class="table-responsive">
				<table class="table">
				<thead>
					<tr>
						<th scope="col">订单号</th>
						<th scope="col">订单名称</th>
						<th scope="col">下单日期</th>
						<th scope="col">支付状态</th>
						<th scope="col">订单状态</th>
					</tr>
				</thead>
				<tbody>
				 <volist name="item_orders" id="feifei">
					<tr>
						<th scope="row">{$feifei.order_sign}</th>
						<td>{$feifei.order_info}</td>
						<td>{$feifei.order_addtime|date='Y-m-d H:i:s',###}</td>
						<td><switch name="feifei.order_ispay"><case value="2"><font color="green">已付款</font></case><default/>未支付</switch></td>
						<td><switch name="feifei.order_status"><case value="1"><font color="green">已确认</font></case><case value="2">已取消</case><case value="3">无效</case><case value="4">退货</case><default/>未确认</switch></td>
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