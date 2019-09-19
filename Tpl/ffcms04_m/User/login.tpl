<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>用户登录_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户登录">
<meta name="description" content="欢迎回到{$site_name}">
<script>
$(document).ready(function(){
	$(".form-user-login").on('submit',function(e){
		$.ajax({
			url: $(this).attr('action'),
			type: 'POST',
			dataType: 'json',
			timeout: 3000,
			data: $(this).serialize(),
			beforeSend: function(xhr){
				$('#user-submit').html('正在登录...');
			},
			error : function(){
				feifei.alert.warning('.ff-alert','请求失败，请刷新网页。');
			},
			success: function(json){
				if(json.status == 200){
					location = '{:ff_url("user/center",array("action"=>"index"))}';
				}else{
					$('#user-submit').html('登录');
					feifei.alert.warning('.ff-alert',json.info);
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
<header class="aui-bar aui-bar-nav aui-bar-light">
    <a class="aui-pull-lefta aui-btn" href="javascript:window.history.back(-1);">
        <span class="aui-iconfonta aui-icon-lefta"></span>
    </a>
    <div class="aui-title">登录</div>
    <a class="aui-pull-right aui-btn" href="{:ff_url('user/forget')}"><small>忘记密码？</small></a>
</header>
<section class="mod aui-margin-t-0"><span class="ff-alert"></span></section>
<section class="mod aui-margin-t-5">
	<div class="mod-main">
		<form class="loginForm form-user-login" action="{:ff_url('user/loginpost')}" method="post" role="form">
		<ul class="mod-form-list">
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-mail"></i>
				<input type="text" class="input mod-login-phone" name="user_email" id="user_email" type="text" placeholder="请输入邮箱" required>
			</li>
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-lock"></i>
				<input class="input" name="user_pwd" id="user_pwd" type="password" placeholder="请输入密码" required>
			</li>
			<li class="form-list-item aui-margin-t-30">
				<button type="submit" class="button button-ture" id="user-submit">登录</button>
			</li>
			<li class="form-list-item aui-margin-t-15">
				<a class="aui-btn button button-false" href="{:ff_url('user/register')}">注册</a>
			</li>
          	<li class="form-list-item aui-margin-t-15">
				<a class="aui-btn button button-false" href="/">返回首页</a>
			</li>
		</ul>
		</form>
		
	</div>
</section>
<footer class="footer">
	<div class="footer-copyright"> ©2016-2018 {$site_name}</div>
</footer>
</body>
</html>