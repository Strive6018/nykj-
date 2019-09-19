<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="wilih=device-wilih"/>
<meta name="viewport" content="wilih=device-wilih, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>用户中心_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
<link rel="shortcut icon" href="{$public_path}ffcmsfavicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="{$public_path}ffcms/css/bass.css"/>
<link rel="stylesheet" href="{$public_path}ffcms/css/bootstrap.min.css">
<link rel="stylesheet" href="{$public_path}ffcms/user/user.css?3.7.180327">
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
<body class="user-center">
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="ucenter-main">
        <!--左侧导航-->
	<include file="User:center_nav" />
        <div class="ucenter-con">
            <div class="ucenter-tit">
                <h2 class="tit">个人中心</h2>
            </div>
          
                <div class="fill_infor_form">
				<ul>
      <li><span class="s_tit">我的影币</span>
      <div class="form_con"><dd>影币可用来支付付费点播影片或购买VIP权限 您现在拥有（{$user_score|default=0}）个影币
			<if condition="pay_card_sell"><a class="user-score-payment" href="javascript:;">在线充值</a></if>
			<if condition="('pay_card_sell')"><a class="user-score-card" href="javascript:;">卡密充值</a></if>
			</dd></div> </li>
			
      <li><span class="s_tit">ＶIP权限</span>
     <div class="form_con"><dd>VIP权限到期后将不能观看付费影片，您的VIP到期时间为（{$user_deadtime|date='Y/m/d',###}）<a href="javascript:;" class="user-score-upvip">升级VIP</a></dd></li>

	 <li><span class="s_tit">登录邮箱</span>
      <div class="form_con"><dd>{$user_email}</span><a href="javascript:;" class="user-change-email">修改邮箱</a></dd></div></li>
	  
      <li><span class="s_tit">用户密码</span>
      <div class="form_con"><dd>建议使用字母、数字与标点的组合，可以大幅提升帐号安全<a href="javascript:;" class="user-change-pwd">修改密码</a></dd></div></li> 
	  
      <li><span class="s_tit">邀请奖励</span>
      <div class="form_con"><dd>每邀请一个用户注册后将获得（<em>{:C("user_register_score_pid")}</em>）影币奖励，推广链接：<a href="{$site_url}{:ff_url('user/register',array('id'=>$user_id))}">{$site_url}{:ff_url('user/register',array('id'=>$user_id))}</a></dd></div></li>
	  
      <li><span class="s_tit">登录ＩＰ</span>
      <div class="form_con"><dd>您最近一次登录本站的IP为（{$user_logip}）</span></div></li>
	  
      <li><span class="s_tit">登录时间</span>
      <div class="form_con"><dd>您最近一次登录本站的时间为（{$user_logtime|date='Y/m/d H:i:s',###}）</dd></div> </li>   
			</ul>
				
            </div>
        </div>
    </div>
	</div>

<script src="{$public_path}ffcms/user/upload.min.js"></script>
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
<script>
var top1=$(".scroll").offset().top;
　　　　$(window).scroll(function(){
　　　　　　var  win_top=$(this).scrollTop();
　　　　　　var  top=$(".scroll").offset().top;
　　　　　　if(win_top>=top){
　　　　　　　　$(".scroll").css({"position":"fixed","top":"0","left":"13.5%","z-index":"10"}).addClass('stosition');  
　　　　　　}
　　　　　　if(win_top<top1){
　　　　　　　　$(".scroll").css({"position":"","top":"","left":"","z-index":""}).removeClass('stosition');   
　　　　　　}
  });

</script>
<include file="Home:forum" />
</body>
</html>
