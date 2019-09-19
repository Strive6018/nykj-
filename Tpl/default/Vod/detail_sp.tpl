<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><in name="list_id" value="2,3,4">《{$vod_name}》全集在线观看－{$list_name}<else />《{$vod_name}》高清在线观看-电影{$vod_name}下载</in>－{$site_name}</title>
<meta name="keywords" content="{$vod_name},{$vod_name}在线观看,{$vod_name}全集,电视剧{$vod_name},{$vod_name}下载,{$vod_name}主题曲,{$vod_name}剧情,{$vod_name}演员表">
<meta name="description" content="{$vod_name} {$vod_name}在线观看 {$vod_name}全集 电视剧{$vod_name}；{$vod_name}剧情：{$vod_content|h|msubstr=0,100}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<include file="Home:header" />
<link rel="stylesheet" href="/Public/ffcms/css/play.css"/>
</head>
<body>
<include file="Home:heanvd" />
<div class="play-primary">
        <div class="m-player wp m-player-open">
            <div class="c-player c-player-v3">
                <div class="c-player-aside hidecon">
				<a href="javascript:void(0);" class="aside-btnl u-ele-focus"></a>
                    <div class="c-player-aside-wrapper">
                        <div class="aside-head">
                            <div class="c-player-aside-showTitle u-title">
                                <h2 class="u-title title"><a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" target="_blank">{$vod_name}</a></h2>
								<span class="score"><em>{$vod_gold|msubstr=0,1}</em>{$vod_gold|msubstr=2,2}</span>
								<p class="tvintro"><em><include file="Home:vod_continn" /></em></p>
                            </div>
                        </div>
                        <div class="c-player-episode">
                            <div class="c-player-aside-list">
                                <div class="player-aside-list-main">
				<notempty name="vod_keywords">
                    <ul class="aside-videolist">
												<li>
                                <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" class="screenshot" title="{$feifei.vod_name}">
                                    <p class="lipic">
                                        <img src="{$vod_pic|ff_url_img=$vod_content}" alt="{$feifei.vod_name}">
                                        <span class="duration">正在播放</span>
                                    </p>
                                    <p class="litxt tvname">
                                        <span class="name">{$vod_name}</span>
                                        <span class="playwp play-num"><i></i>{$vod_hits}次播放</span>
                                </p>
                            </a>
                        </li>
					<volist name=":ff_mysql_vod('cid:5;tag_name:'.ff_array(explode(',',$vod_keywords),0).';ids_not:'.$vod_id.';limit:20;order:vod_addtime;sort:desc')" id="feifei" key="k">
							<li>
                                <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" class="screenshot" title="{$feifei.vod_name}">
                                    <p class="lipic">
                                        <img src="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
                                        <span class="duration">{:date('i:s',$feifei['vod_length'])}</span>
                                    </p>
                                    <p class="litxt">
                                        <span class="name">{$feifei.vod_name}</span>
                                        <span class="playwp"><i></i>{$feifei.vod_hits}次播放</span>
                                </p>
                            </a>
                        </li>
					</volist>
                    </ul>
					</notempty>
                </div>
              </div>
           </div>
       </div>
   </div>
<!-- {$vod_play} -->
<div class="c-player-video">
    <div class="c-player-video-size"><div class="c-player-flash"><div class="mini"><div id="cms_player" class="embed-responsive">
	<iframe src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true" id="player_iframe"></iframe>
	<div id="floatingMasker"><div id="banner">按住视频可进行拖动</div></div></div> </div>
	</div>
<div class="vpactionv5_iframe_wrap">
<div class="l-left"><ul class="play-fn fenxiang">
<li class="fn-share"><i class="icon-player playe"></i><span class="txt">{$vod_hits}次播放</span></li>
<li class="fn-share"><i class="icon-player share"></i><span class="text">分享</span><div class="fn-panel"><div class="fn-panel-header"><span class="fn-panel-title">分享给朋友</span></div><div class="fn-panel-body"><div class="ff-share"></div></div></div></li>
<li class="fn-download"><i class="icon-player glyphicon glyphicon-phone" data-toggle="popover" data-trigger="hover" data-placement="bottom" data-container="body" data-title="手机浏览请扫瞄二维码"></i><span class="text">手机看</span></li>
<li class="fn-info"><i class="icon-player info"></i><span class="text">下载</span><div class="fn-panel"><div class="fn-panel-header"><span class="fn-panel-title">由于版权限制，该影片暂时无法下载</div></div></li>


</ul>
</div>
<div class="danmuform">
	<div class="yk-dmform <gt name="site_user_id" value="0"><else/>yk-nodl</gt> fix">
		<div class="yk-dmtxtbox">
			<input class="yk-dmtxt" type="text" placeholder="<gt name="site_user_id" value="0">好的，你帅你长的好看，你发什么弹幕都是对的<else/>" disabled="disabled" style="color: rgb(255, 255, 255);</gt>">
			<button class="yk_dmadd_button" type="button">发 送</button></div>
			<gt name="site_user_id" value="0"><else/><div class="user-info"><a class="ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}" data-toggle="tooltip" data-placement="bottom">登录</a> 一起吐槽吧！</div></gt>
			<div class="yk_dmswitch_box"><a href="javascript:;" class="yk_dm_button"><span class="dmicon">弹</span></a></div>
			</div>
			</div>
		</div>
      </div>
   </div>
</div>
<div class="l-module">
<div class="player-title clearfix">
<div class="title-wrap" >
<h1>{$vod_name}</h1>

			</div>
		  </div> 
	  </div>
	</div>
</div>

<div class="main-box">
  <div class="c-body-left">
  <div class="summary-expena">
       <div class="module-title"><h2>视频简介</h2></div>
    <div class="s-relate">
	<div class="summary-wrap">{$vod_content|strip_tags}</div> 
 </div> 
</div>


 <div class="summary-expend">
    <div class="module-title"><h2>猜你喜欢</h2></div>
	<ul class="index-list-0">
	<volist name=":ff_mysql_vod('cid:5;limit:10;order:vod_stars desc,vod_id;sort:desc;')" id="feifei">
	<div class="yk-pack">
	<div class="p-thumb">
	<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"></a>
	<img class="quic ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
	<span class="playicon"></span><span class="playshow">{:date('i:s',$feifei['vod_length'])}</span>
	</div>
	<ul class="info-list">
	<li class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></li>
	<li><span>{$feifei.vod_hits}次播放</span></li>
	</ul>
	</div>
	</volist> 
	</ul>
</div>
  <div class="summary-expend">
      <div class="module-title"><h2>相关评论</h2></div>
<div class="ff-forum" data-id="{$vod_id}" data-sid="1" data-type="{$Think.config.forum_type}" data-uyan-uid="{$Think.config.forum_type_uyan_uid}" data-cy-id="{$Think.config.forum_type_changyan_appid}" data-cy-conf="{$Think.config.forum_type_changyan_conf}">
  评论加载中...
</div>

</div>
</div>
   <div class="c-body-right">
   <div class="summary-expena">
	<div class="module-title"><h2>精彩视频</h2></div>
      <ul class="topvideo-list">
	<volist name=":ff_mysql_vod('cid:5;limit:10;order:vod_addtime;sort:desc')" id="feifei" key="k">
		<li>
           <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" class="screenshot" title="{$feifei.vod_name}">
             <p class="lipic">
              <img src="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
                <span class="duration">{:date('i:s',$feifei['vod_length'])}</span></p>
                  <p class="litxt">
                    <span class="name">{$feifei.vod_name}</span>
                  <span class="playwp">{$feifei.vod_hits}次播放</span></p>
                  </a>
              </li>
			</volist>
           </ul>
		</div>
	 </div>
   </div>
  </div>
</div>
</div>  

<script>
var line = ["{$site_copyright}"];
playerSwitch = function(lineIndex)
{
    $(".embed-responsive iframe").attr("src",line[lineIndex] + "{$vod_url}");
    $(".player_switch #" + lineIndex + "" ).attr("onclick","");
    $(".player_switch #" + lineIndex + "" ).siblings().attr("onclick","playerSwitch(this.id)");
}
</script>

<include file="Base:vod_record_set" />
{$vod_hits_insert}
<include file="Home:forum" />
</body>
</html>
