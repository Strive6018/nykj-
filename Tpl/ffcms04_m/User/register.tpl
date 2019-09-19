<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>欢迎加入_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户注册界面">
<meta name="description" content="欢迎加入{$site_name}大家庭。">
<script>
$(document).ready(function(){	
$(".form-user-register").on('submit',function(e){
	$('.ff-alert').html('');
	$('.form-user-register .help-block').remove();
	$('.form-user-register .form-group').removeClass('has-error');
	if($("#user_name").val().length < 3 || $("#user_name").val().length >12){
		$('#user_name').parent().addClass('has-error');
		$('#user_name').after('<span class="help-block">用户名长度为3-12个字符</span>');
		return false;
	}
	if($("#user_email").val().search(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)==-1){
		$('#user_email').parent().addClass('has-error');
		$('#user_email').after('<span class="help-block">请输入正确的EMAIL格式</span>');
		return false;
	}
	if($("#user_pwd").val().length < 6){
		$('#user_pwd').parent().addClass('has-error');
		$('#user_pwd').after('<span class="help-block">请至少输入6个字符作为密码</span>');
		return false;
	}
	$.ajax({
		url: $(this).attr('action'),
		type: 'POST',
		dataType: 'json',
		timeout: 6000,
		data: $(this).serialize(),
		beforeSend: function(xhr){
			$('#user-submit').html('正在注册');
		},
		error : function(){
			feifei.alert.warning('.ff-alert','请求失败，请刷新网页。');
		},
		success: function(json){
			if(json.status == 200){
				if(json.data.referer){
					top.location.href = json.data.referer;
				}else{
					top.location.href = '{:ff_url("user/center",array("action"=>"index"))}';
				}
			}else if(json.status == 201){
				$('#user-submit').html('注册');
				feifei.alert.warning('.ff-alert','已注册');
			}else{
				$('#user-submit').html('注册');
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
<body class="user-register">
<header class="aui-bar aui-bar-nav aui-bar-light">
    <a class="aui-pull-lefta aui-btn" href="javascript:window.history.back(-1);">
        <span class="aui-iconfonta aui-icon-lefta"></span>
    </a>
    <div class="aui-title">注册账号</div>
    <a class="aui-pull-right aui-btn" href="{:ff_url('user/forget')}"><small>忘记密码？</small></a>
</header>
<section class="mod aui-margin-t-0"><span class="ff-alert"></span></section>
<section class="mod aui-margin-t-5">
	<div class="mod-main">
		<form class="loginForm form-user-register" action="{:ff_url('user/post')}" method="post" role="form" target="_blank">
		<ul class="mod-form-list">
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-user"></i>
				<input class="input mod-login-phone" name="user_name" id="user_name" type="text" placeholder="用户名" title="" data-toggle="tooltip" data-placement="bottom" required>
			</li>
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-mail"></i>
				<input class="input" name="user_email" id="user_email" type="text" placeholder="邮箱" required>
			</li>
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-lock"></i>
				<input class="input" name="user_pwd" id="user_pwd" type="password" placeholder="6位数密码" required>
			</li>
			<li class="form-list-item">
				<i class="aui-iconfont aui-icon-lock"></i>
				<input class="input" name="user_pwd_re" id="user_pwd_re" type="password" placeholder="重复输入密码" required>
			</li>
			<li class="form-list-item aui-margin-t-30">
				<button type="submit" class="button button-ture">立即注册</button>
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