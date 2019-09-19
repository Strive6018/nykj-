<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>忘记密码_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户登录">
<meta name="description" content="欢迎回到{$site_name}">
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
<body>
<include file="Home:heanvd" />
<div class="p-imgcon"></div>
<div class="p-login">
    <div class="p-login-content g-clear">
      <div class="p-login-right">
   <div class="b-registe">
    <div class="b-registe-signup">
        <p class="b-registe-title">
          <b class="b-registe-back"></b>
          <span class="b-registe-sub-nav">找回密码</span>
        </p>
        <div class="b-registe-contentwrap b-registe-zhaohui">
            <div class="b-registe-error-con">
               <div class="ff-alert"></div>
            </div>
            <div class="b-registe-content">
                <div class="b-registe-cl-reg">
				<form class="form-horizontal form-user-forget" action="{:ff_url('user/forgetpost')}" method="post" role="form" target="_blank">
					<div class="b-registe-reg-tel"><input class="form-control" name="user_email" id="user_email" type="text" placeholder="请输入邮箱" required><i class="b-registe-reg-yx"></i></div>
					<div class="b-registe-reg-tel b-registe-reg-hui"><input class="form-control" name="user_vcode" id="user_vcode" type="test" placeholder="请输入验证码" required><i class="b-registe-reg-yz"></i></div>

                  <div class="b-registe-reg-btn js-b-registe-reg-btn text-center">
                    <b><button type="submit" id="user-submit">找回密码</button></b>
                  </div>
				  </form>
                </div>
                <p class="b-registe-txtbtns">
                  <span class="b-registe-login js-signin"><a href="{:ff_url('user/login')}">登录账号</a></span>
                  <span class="b-registe-forgetpwd js-forgetpwd"><a href="{:ff_url('user/register')}">注册帐号</a></span>
                </p>
				<span class="b-registe-reg-tyzm"><img class="ff-vcode-img" src="{$root}index.php?s=Vcode-Index"></span>
				<h6 class="user-forget-alert">注意：输入正确邮箱后新密码将通过邮件发送给您</h6>
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
