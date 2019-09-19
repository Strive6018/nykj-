<php>
$item_forum = ff_mysql_forum('uid:'.$user_id.';limit:10;page_is:true;page_id:forum;page_p:'.$user_page.';cache_name:default;cache_time:default;order:forum_id;sort:desc');
$page = ff_url_page('user/center',array('action'=>'forum','p'=>'FFLINK'),true,'forum',4);
$totalpages = ff_page_count('forum', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>我的评论_{$site_name}</title>
<meta name="keywords" content="{$site_name}用户中心">
<meta name="description" content="欢迎回到{$site_name}用户中心">
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
<body>
<include file="Home:heanvd" />
<div class="menu-box"></div>
<div class="ucenter-main">
        <!--左侧导航-->
	<include file="User:center_nav" />
	<div class="ucenter-con">
  <div class="ucenter-tit"><h2 class="tit">我的评论</h2></div>
    <table class="table table-striped table-bordered table-responsive">
    <tbody>
     <volist name="item_forum" id="feifei">
     <tr>
      	<td>{$feifei.forum_addtime|date='Y-m-d H:i:s',###}
        <small><a href="{:ff_url('forum/detail', array('id'=>$feifei['forum_id']), true)}" target="_blank">{$feifei.forum_title}详情</a></small></td>
      </tr>
      <tr>
      	<td><p class="forum-detail">{$feifei.forum_content|htmlspecialchars|msubstr=0,300}</p></td>
      </tr>
      </volist>
    </tbody>
  </table>
  <gt name="totalpages" value="1">
  <div class="clearfix"></div>
    <div class="list-pager-v2">{$page}</div>
  </gt>
<!--row end -->
</div>
</div>
</div>
</div>
<script src="{$public_path}ffcms/js/jQuery-image-upload.min.js"></script>
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
