<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>欢迎加入_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户注册界面">
<meta name="description" content="欢迎加入{$site_name}大家庭。">
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

<script>
$(document).ready(function(){	
$(".form-user-register").on('submit',function(e){
	$('.ff-alert').html('');
	$('.form-user-register .help-block').remove();
	$('.form-user-register .form-group').removeClass('has-error');
	if($("#user_name").val().length < 3 || $("#user_name").val().length >12){
		after('用户名长度为3-12个字符');
		return false;
	}
	if($("#user_email").val().search(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)==-1){
		after('请输入正确的EMAIL格式');
		return false;
	}
	if($("#user_pwd").val().length < 6){
		alert('请至少输入6个字符作为密码');
		return false;
	}
	if($("#user_pwd_re").val().length < 6){
		alert('你输入的密码不正确');
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
<include file="Home:heanvd" />
<div class="p-imgcon"></div>
<div class="p-login">
    <div class="p-login-content g-clear">
      <div class="p-login-right">

   <div class="b-registe">
    <div class="b-registe-signup">
        <p class="b-registe-title">
          <b class="b-registe-back"></b>
          <span class="b-registe-sub-nav">用户注册</span>
        </p>
        <div class="b-registe-contentwrap">
            <div class="b-registe-error-con">
               <div class="ff-alert"></div>
            </div>
            <div class="b-registe-content">
                <div class="b-registe-cl-reg">
				<form class="form-horizontal form-user-register" action="{:ff_url('user/post')}" method="post" role="form" target="_blank">
                  <div class="b-registe-reg-tel"><input class="form-control" name="user_name" id="user_name" type="text" placeholder="字母、数字等，用户名唯一" title="" data-toggle="tooltip" data-placement="bottom" required><i class="b-registe-reg-yh"></i></div>
					<div class="b-registe-reg-tel"><input class="form-control" name="user_email" id="user_email" type="text" placeholder="常用邮箱 test@ffcms.cn" required><i class="b-registe-reg-yx"></i></div>
					<div class="b-registe-reg-tel"><input class="form-control" name="user_pwd" id="user_pwd" type="password" placeholder="请输入6-18位密码" required><i class="b-registe-reg-mm"></i></div>
					<div class="b-registe-reg-tel"><input class="form-control" name="user_pwd_re" id="user_pwd_re" type="password" placeholder="重复输入密码" required><i class="b-registe-reg-mm"></i></div>
                  <div class="b-registe-reg-clew" data="1">
                    <b></b>
                    <p>同意并接受<a href="javascript:;">《服务条款》</a></p>
                  </div>
				  

                  <div class="b-registe-reg-btn js-b-registe-reg-btn text-right">
                    <b><button type="submit" id="user-submit">注册</button></b>
                  </div>
				  </form>
				  
                </div>
                <p class="b-registe-txtbtns">
                  <span class="b-registe-login js-signin"><a href="{:ff_url('user/login')}">立即登录</a></span>
                  <span class="b-registe-forgetpwd js-forgetpwd"><a href="{:ff_url('user/forget')}">找回密码</a></span>
                </p>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<include file="Home:forum" />
</body>
</html>
