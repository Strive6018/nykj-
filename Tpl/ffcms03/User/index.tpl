<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="User:header" />
<title>{$user_name|htmlspecialchars|nb}的个人主页_{$site_name}</title>
<meta name="keywords" content="{$user_name|htmlspecialchars|nb}喜欢的电影">
<meta name="description" content="欢迎来到{$user_name|htmlspecialchars|nb}的个人主页，在这里与您一起分享{$user_name|htmlspecialchars|nb}喜欢的影片。">
</head>
<body class="user-center user-index">
<div class="container">
<h6 class="text-right ff-text tool">
	<a href="{$root}">网站首页</a>
	<a href="{:ff_url('user/index',array('id'=>$site_user_id))}">我的主页</a>
  <a class="ff-user-active" href="{:ff_url('user/center')}">用户中心</a>
</h6>
<div class="row">
  <div class="col-xs-12">
    <h2 class="text-center">
      <a href="{:ff_url('user/index',array('id'=>$user_id),true)}">
        <img class="img-circle face" src="{$user_face|ff_url_img|default=$root.'Public/images/face/default.png'} " align="用户中心">
      </a>
    </h2>
    <h4 class="text-center user-name ff-text">
      {$user_name|htmlspecialchars|nb}最近喜欢的影片
    </h4>
    <h6 class="text-center user-link">
      <a href="{:ff_url('user/index',array('id'=>$user_id))}">
        {$site_url}{:ff_url('user/index',array('id'=>$user_id))}
      </a>
    </h6>
  </div>
  <div class="clear"></div>
  <div class="col-xs-12">
    <php>
$item_vod = ff_mysql_record('sid:1;uid:'.$user_id.';type:1;group:record_did;limit:60;cache_name:default;cache_time:default;order:record_id;sort:desc');
</php>
    <include file="User:inc_item_record" />
  </div>
</div><!--row end -->
</div>
<include file="User:footer" />
</body>
</html>