<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:user_register" />
<script>
$(document).ready(function(){	
	$(".form-user-register").on('submit',function(e){
		$('.user-register-alert').html('');
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
				feifei.alert.warning('.user-register-alert','请求失败，请刷新网页。');
			},
			success: function(json){
				if(json.status == 200){
					if(json.data.referer){
						top.location.href = json.data.referer;
					}else{
						top.location.href = '{:ff_url("user/center",array("action"=>"index"))}';
					}
				}else if(json.status == 201){
					$('#user-submit').html('注 册');
					feifei.alert.warning('.user-register-alert','已注册');
				}else{
					$('#user-submit').html('注 册');
					feifei.alert.warning('.user-register-alert',json.info);
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
<body class="bg-light user-register">
<include file="BlockTheme:header" />
<main class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card my-3">
	<div class="card-header text-center text-nowrap h4">
		欢迎加入{$site_name}
	</div>
	<div class="card-body pb-0">
		<form class="form-user-register" action="{:ff_url('user/post')}" method="post" target="_blank">
			<fieldset class="form-group">
				<label for="user_name">昵 称</label>
				<input class="form-control" name="user_name" id="user_name" type="text" placeholder="字母、数字等，用户名唯一" title="" data-toggle="tooltip" data-placement="bottom" required>
			</fieldset>
			<fieldset class="form-group">
				<label for="user_email">邮 箱</label>
				<input class="form-control" name="user_email" id="user_email" type="text" placeholder="常用邮箱 test@ffcms.cn" required>
			</fieldset>
			<fieldset class="form-group">
				<label for="user_pwd">密 码</label>
				<input class="form-control" name="user_pwd" id="user_pwd" type="password" placeholder="不少于 6 位" required>
			</fieldset>
			<fieldset class="form-group">
				<label for="user_email">确认密码</label>
				<input class="form-control" name="user_pwd_re" id="user_pwd_re" type="password" placeholder="重复输入密码" required>
			</fieldset>
			<div class="checkbox">
				<label>
					<input type="checkbox" checked> 同意并接受<a href="javascript:;">《服务条款》</a>
				</label>
			</div>
			<div class="form-group text-center mb-3">
				<button class="btn btn-primary" id="user-submit" type="submit">注 册</button>
			</div>
			<div class="form-group user-register-alert">
			</div>
		</form>		
	</div> 
	<div class="card-footer text-right">
		<a href="{$root}">返回首页</a>
		<a href="{:ff_url('user/forget')}">忘记密码</a>
		<a href="{:ff_url('user/login')}">已有帐号登录</a>
	</div>
</div><!--card end -->
</div>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>