<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_center_index" />
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
	<div class="card-header">
		帐户管理
	</div>
	<div class="card-body pb-0">
		<p class="text-center">
      <a href="{:ff_url('user/center')}"><img class="rounded-circle user-face border p-2" src="/Tpl/ffcms02/user.png" align="我的头像" width="96" height="96"></a>
    </p>
		<dl>
			<dt>{$user_name|htmlspecialchars|nb}<small class="ml-2 text-muted">呢称不可修改</small></dt>
      <dd>我的个人主页：<a href="{:ff_url('user/index',array('id'=>$user_id))}" target="_blank">{$site_url}{:ff_url('user/index',array('id'=>$user_id))}</a></dd>
      <dt>我的影币</dt>
      <dd>影币可用来支付需付费点播的影片或购买VIP权限 您现在拥有（<strong>{$user_score|default=0}</strong>）个影币
			<if condition="ff_PaymentItem()"><a class="btn btn-primary btn-sm user-score-payment" href="javascript:;">在线充值</a></if>
			<if condition="('pay_card_sell')"><a class="btn btn-primary btn-sm user-score-card" href="javascript:;">卡密充值</a></if>
			</dd>  
      <dt>VIP权限</dt>
      <dd>VIP权限到期后将不能观看付费影片，您的VIP到期时间为（{$user_deadtime|date='Y/m/d',###}）<a href="javascript:;" class="btn btn-primary btn-sm user-score-upvip">升级VIP</a></dd>
      <dt>登录邮箱</dt>
      <dd>{$user_email} <a href="javascript:;" class="btn btn-primary btn-sm user-change-email">修改邮箱</a></dd>
      <dt>用户密码</dt>
      <dd>建议使用字母、数字与标点的组合，可以大幅提升帐号安全 <a href="javascript:;" class="btn btn-primary btn-sm user-change-pwd">修改密码</a></dd>
      <dt>最近登录IP</dt>
      <dd>您最近一次登录本站的IP为（{$user_logip}）</dd>
      <dt>最近登录时间</dt>
      <dd>您最近一次登录本站的时间为（{$user_logtime|date='Y/m/d H:i:s',###}）</dd>
			<dt>邀请奖励 <small>每邀请一个用户注册后将获得（<strong>{:C("user_register_score_pid")}</strong>）影币奖励</small></dt>
      <dd>推广链接：<a href="{:ff_url('user/register',array('id'=>$user_id))}" target="_blank">{$site_url}{:ff_url('user/register',array('id'=>$user_id))}</a></dd>      
    </dl>	
	</div> 
</div><!--card end -->
<script src="https://cdn.bootcss.com/jquery-image-upload/1.2.0/jQuery-image-upload.min.js"></script>
<script>
	$(".user-face").imageUpload({
		formAction: "{:ff_url('user/face')}",
		inputFileName:'file',
		browseButtonValue: '修改头像',
		browseButtonClass:'btn btn-default btn-sm',
		automaticUpload: true,
		hideDeleteButton: true,
		hover:true
	})
	$(".user-face").on("imageUpload.uploadFailed", function (ev, err) {
		alert(err);
	});
</script>
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>