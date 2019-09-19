<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_index" />
</head>
<body class="bg-light user-index">
<include file="BlockTheme:header" />
<main class="container">
<div class="card mt-3 mb-3">
	<div class="card-body">
		<p class="card-text text-center">
      <a href="{:ff_url('user/center')}"><img class="rounded-circle border p-2" src="/Tpl/ffcms02/user.png" width="96" height="96"></a>
    </p>
		<h6 class="card-title text-center">
			<a href="{:ff_url('user/index',array('id'=>$user_id))}">{$user_name|htmlspecialchars|nb}的个人主页</a>
    </h6>
		<div class="row">
		<volist name=":ff_mysql_record('sid:1;type:1;uid:'.$user_id.';group:record_did;limit:60;cache_name:default;cache_time:default;order:record_id;sort:desc')" id="feifei">
			<include file="BlockTheme:vod_card_item" />
		</volist>
		</div>
	</div>
</div><!--card end -->
</main>
<include file="BlockTheme:footer" />
</body>
</html>