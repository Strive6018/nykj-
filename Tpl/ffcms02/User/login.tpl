<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_login" />
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
				feifei.alert.warning('.user-login-alert','请求失败，请刷新网页。');
			},
			success: function(json){
				if(json.status == 200){
					location = '{:ff_url("user/center",array("action"=>"index"))}';
				}else{
					$('#user-submit').html('登 录');
					feifei.alert.warning('.user-login-alert',json.info);
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
<body class="bg-light user-login">
<include file="BlockTheme:header" />
<main class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card my-3">
	<div class="card-header text-center text-nowrap h4">
		欢迎回到{$site_name}
	</div>
	<div class="card-body pb-0">
		<form class="form-user-login" action="{:ff_url('user/loginpost')}" method="post" target="_blank">
			<fieldset class="form-group">
				<label for="user_email">邮 箱</label>
				<input class="form-control" name="user_email" id="user_email" type="text" placeholder="请输入你注册的邮箱帐号" required>
			</fieldset>
			<fieldset class="form-group">
				<label for="user_pwd">密 码</label>
				<input class="form-control" name="user_pwd" id="user_pwd" type="password" placeholder="不少于 6 位" required>
			</fieldset>
			<div class="checkbox">
				<label>
					<input name="user_remember" value="1" type="checkbox" checked> 下次自动登录
				</label>
			</div>
			<div class="form-group text-center mb-3">
				<button class="btn btn-primary" id="user-submit" type="submit">登 录</button>
			</div>
			<div class="form-group user-login-alert">
			</div>
		</form>		
	</div> 
	<div class="card-footer text-right">
		<a href="{$root}">返回首页</a>
		<a href="{:ff_url('user/forget')}">忘记密码</a>
		<a href="{:ff_url('user/register')}">没有帐号注册</a>
	</div>
</div><!--card end -->
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>