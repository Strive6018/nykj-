<php>$item_vod = ff_mysql_record('uid:'.$user_id.';sid:1;type:1;group:record_did;limit:30;page_p:'.$user_page.';page_is:true;page_id:record;order:record_id;sort:desc');
$page_info = ff_url_page('user/center',array('action'=>'history','p'=>'FFLINK'),true,'record',4);
</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_center_history" />
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
		<div class="card-header">我的观看记录</div>
		<div class="card-body pt-0">
			<volist name="item_vod" id="feifei">
				<include file="BlockTheme:record_card_item" />
			</volist>
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