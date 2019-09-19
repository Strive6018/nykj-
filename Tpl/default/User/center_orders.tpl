<php>$item_orders = ff_mysql_orders('uid:'.$user_id.';limit:30;page_is:true;page_id:orders;page_p:'.$user_page.';order:order_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'orders','p'=>'FFLINK'),true,'orders',4);
$totalpages = ff_page_count('orders', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>订单管理_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
<link rel="shortcut icon" href="{$public_path}ffcmsfavicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="{$public_path}ffcms/css/bass.css"/>
<link rel="stylesheet" href="{$public_path}ffcms/css/bootstrap.min.css">
<link rel="stylesheet" href="{$public_path}ffcms/user/user.css?v8.0">
<script type="text/javascript" src="{$public_path}jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="{$public_path}ffcms/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{$public_path}ffcms/js/system.js?{%feifeicms_version}"></script>
<script type="text/javascript" src="{$public_path}ffcms/js/jquery.SuperSlide.js"></script>
<!--[if lt IE 9]>
<script src="{$public_path}html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="{$public_path}respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">var cms = {
root:"{$root}",urlhtml:"{$Think.config.url_html}",sid:"{$site_sid}",id:"{$vod_id}{$news_id}{$special_id}",userid:"{$site_user_id}",username:"{$site_user_name}",userforum:"{$Think.config.user_forum}",page:"{$list_page|default=1}",domain_m:"{$site_domain_m}"
};</script>
</head>
<body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="ucenter-main">
        <!--左侧导航-->
	<include file="User:center_nav" />
	<div class="ucenter-con">
  <div class="ucenter-tit"><h2 class="tit">订单中心</h2></div>
		<div class="table-responsive">
			<table class="table table-bordered table-responsive text-center">
			<thead>
				<tr>
					<th class="text-center">订单名称</th>
					<th class="text-center">订单号</th>
					<th class="text-center">下单日期</th>
					<th class="text-center">支付状态</th>
					<th class="text-center">订单状态</th>
				</tr>
			</thead>
			<tbody>
			 <volist name="item_orders" id="feifei">
				<tr>
					<td>{$feifei.order_info}</td>
					<td>{$feifei.order_sign}</td>
					<td>{$feifei.order_addtime|date='Y-m-d H:i:s',###}</td>
					<td><switch name="feifei.order_ispay"><case value="2"><font color="green">已付款</font></case><default/>未支付</switch></td>
					<td><switch name="feifei.order_status"><case value="1"><font color="green">已确认</font></case><case value="2">已取消</case><case value="3">无效</case><case value="4">退货</case><default/>未确认</switch></td>
				</tr>
				</volist>
			</tbody>
			</table>
		</div>
  <gt name="totalpages" value="1">
    <div class="col-xs-12 ff-col text-center">
      <ul class="pagination pagination-lg hidden-xs">
        {$page}
      </ul>
      <ul class="pager visible-xs">
      	<gt name="user_page" value="1">
          <li><a id="ff-prev" href="{:ff_url('user/center', array('action'=>'history','p'=>($user_page-1)), true)}">上一页</a></li>
        </gt>
        <lt name="user_page" value="$totalpages">
          <li><a id="ff-next" href="{:ff_url('user/center', array('action'=>'history','p'=>($user_page+1)), true)}">下一页</a></li>
        </lt>
       </ul> 
    </div>
  </gt>
</div><!--row end -->
</div>
</div>
</div>
<script src="{$public_path}ffcms/user/upload.js"></script>
<script>
	$(".face").imageUpload({
		formAction: "{:ff_url('user/face')}",
		inputFileName:'file',
		browseButtonValue: '修改头像',
		browseButtonClass:'btn btn-default btn-xs',
		automaticUpload: true,
		hideDeleteButton: true,
		hover:true
	})
	$(".face").on("imageUpload.uploadFailed", function (ev, err) {
		alert(err);
	});
</script>
<include file="Home:forum" />
</body>
</html>
