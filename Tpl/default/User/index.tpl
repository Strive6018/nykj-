<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>{$user_name|htmlspecialchars}的个人主页_{$site_name}</title>
<meta name="keywords" content="{$user_name|htmlspecialchars}喜欢的电影">
<meta name="description" content="欢迎来到{$user_name|htmlspecialchars}的个人主页，在这里与您一起分享{$user_name|htmlspecialchars}喜欢的影片。">
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

</head>
<body class="user-center user-index">
<div class="container ff-bg">
<div class="row">
  <div class="col-xs-12 ff-col">
    <h2 class="text-center">
      <a href="{:ff_url('user/index',array('id'=>$user_id),true)}">
        <img class="img-circle face" src="{$user_face|ff_url_img|default=$root.'Public/images/face/default.png'} " align="用户中心">
      </a>
    </h2>
    <h4 class="text-center user-name">
      {$user_name|htmlspecialchars}的个人主页
    </h4>
    <h6 class="text-center user-link">
      <a href="{:ff_url('user/index',array('id'=>$user_id))}">
        {$site_url}{:ff_url('user/index',array('id'=>$user_id))}
      </a>
    </h6>
  </div>
  <div class="clear"></div>
  <div class="col-xs-12 ff-col">
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-menu-right ff-text"></span> {$user_name|htmlspecialchars}喜欢的影片</h4>
    </div>
    <php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:3;group:record_did;limit:24;cache_name:default;cache_time:default;order:record_id;sort:desc');
</php>
    <include file="User:inc_item_record" />
  </div>
  <div class="clear"></div>
  <div class="col-xs-12 ff-col">
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-menu-right ff-text"></span> {$user_name|htmlspecialchars}想看的影片</h4>
    </div>
    <php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:4;group:record_did;limit:24;cache_name:default;cache_time:default;order:record_id;sort:desc');
</php>
    <include file="User:inc_item_record" />
  </div>
  <div class="clear"></div>
  <div class="col-xs-12 ff-col">
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-menu-right ff-text"></span> {$user_name|htmlspecialchars}在看的影片</h4>
    </div>
    <php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:5;group:record_did;limit:24;cache_name:default;cache_time:default;order:record_id;sort:desc');
</php>
    <include file="User:inc_item_record" />
  </div>  
  <div class="clear"></div>
  <div class="col-xs-12 ff-col">
    <div class="page-header">
      <h4><span class="glyphicon glyphicon-menu-right ff-text"></span> {$user_name|htmlspecialchars}看过的影片</h4>
    </div>
    <php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:6;group:record_did;limit:24;cache_name:default;cache_time:default;order:record_id;sort:desc');
</php>
    <include file="User:inc_item_record" />
  </div> 
</div><!--row end -->
</div>
<include file="Home:forum" />
</body>
</html>
