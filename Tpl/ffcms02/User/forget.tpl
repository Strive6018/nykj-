<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_forget" />
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
					$url = '{:ff_url("user/login","",true)}';
					feifei.alert.success('.user-forget-alert',json.info);
					setTimeout(function(){location.href = $url}, 2000);
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
<body class="bg-light user-forget">
<include file="BlockTheme:header" />
<main class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card my-3">
	<div class="card-header text-center text-nowrap h4">
		找回密码
	</div>
	<div class="card-body pb-0">
		<form class="form-user-forget" action="{:ff_url('user/forgetpost')}" method="post" target="_blank">
			<fieldset class="form-group">
				<label for="user_email">邮 箱</label>
				<input class="form-control" name="user_email" id="user_email" type="text" placeholder="请输入你的邮箱" required>
			</fieldset>
			<fieldset class="form-group">
				<label for="user_vcode">验证码</label>
				<div class="row">
					<div class="col">
						<input class="form-control" name="user_vcode" id="user_vcode" type="test" placeholder="请输入验证码" required>
					</div>
					<div class="col">
						<img class="ff-vcode-img" src="{$root}index.php?s=Vcode-Index">
					</div>
				</div>
			</fieldset>
			<div class="form-group text-center mb-3">
				<button class="btn btn-primary" id="user-submit" type="submit">找回密码</button>
			</div>
			<div class="form-group user-forget-alert">
			</div>
		</form>		
	</div> 
	<div class="card-footer text-right">
		<a href="{$root}">返回首页</a>
		<a href="{:ff_url('user/login')}">用户登录</a>
		<a href="{:ff_url('user/register')}">没有帐号注册</a>
	</div>
</div><!--card end -->
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>