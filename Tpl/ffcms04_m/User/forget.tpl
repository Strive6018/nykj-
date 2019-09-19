<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>忘记密码_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户登录">
<meta name="description" content="欢迎回到{$site_name}">
<script>
$(document).ready(function(){
	$(".form-user-forget").on('submit',function(e){
		$.ajax({
			url: $(this).attr('action'),
			type: 'POST',
			dataType: 'json',
			timeout: 3000,
			data: $(this).serialize(),
			beforeSend: function(xhr){
				$('.user-forget-alert').html('Loading...');
			},
			error : function(){
				$('.user-forget-alert').html('请求失败，请刷新网页。');
			},
			success: function(json){
				if(json.status == 200){
					location = '{:ff_url("user/login","",true)}';
				}else{
					feifei.alert.warning('.user-forget-alert',json.info);
				}
			},
			complete: function(xhr){
			}
		});
		return false;
	});
});
</script>
</head>
<body class="user-forget">
<header class="aui-bar aui-bar-nav aui-bar-light">
    <a class="aui-pull-lefta aui-btn" href="javascript:window.history.back(-1);">
        <span class="aui-iconfonta aui-icon-lefta"></span>
    </a>
    <div class="aui-title">找回密码</div>
</header>
<section class="mod aui-margin-t-0"><span class="user-forget-alert">
<div class="aui-tips"><i class="aui-iconfont aui-icon-info"></i><div class="aui-tips-title aui-ellipsis-1">通过验证后新密码将通过邮件发送给您,请注意查收</div></div></span></section>
<section class="mod aui-margin-t-5">
	<div class="mod-main">
		<form class="loginForm form-user-forget" action="{:ff_url('user/forgetpost')}" method="post" role="form" target="_blank">
		<ul class="mod-form-list">
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-mail"></i>
				<input class="input" name="user_email" id="user_email" type="text" placeholder="请输入邮箱" required>
			</li>
			<li class="form-list-item clearfix">
				<i class="aui-iconfont aui-icon-info"></i>
				<input class="input input-check" name="user_vcode" id="user_vcode" type="test" placeholder="请输入验证码" required>
				<div class="code-img"><img class="ff-vcode-img" src="{$root}index.php?s=Vcode-Index"></div>
			<span class="Validform_checktip"></span></li>
			<li class="form-list-item aui-margin-t-30">
				<button type="submit" class="button button-ture" id="user-submit">找回密码</button>
			</li>
			<li class="form-list-item aui-margin-t-15">
				<a class="aui-btn button button-false" href="{:ff_url('user/login')}">登录</a>
			</li>
          	<li class="form-list-item aui-margin-t-15">
				<a class="aui-btn button button-false" href="/">返回首页</a>
			</li>
		</ul>
		</form>
	</div>
</section>
<footer class="footer">
	<div class="footer-copyright"> ©2006-2018 {$site_name}</div>
</footer>
</body>
</html>