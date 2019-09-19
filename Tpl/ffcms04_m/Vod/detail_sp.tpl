<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>《{$vod_name}》在线观看－{$site_name}</title>
    <meta name="keywords" content="{$vod_name|msubstr=0,4},{$vod_name|msubstr=2,6},{$vod_name|msubstr=4,8}">
    <meta name="description" content="{$vod_content|h|msubstr=0,100}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<!--幻灯片-->
<section class="mod">

    <div class="albumPlayer embed-responsive embed-responsive-4by3" id="cms_player">
      <div id="cms-player-vip">
        <div class="cms-player-box"></div>
        <iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true" id="player_iframe"></iframe>
      </div>
    </div>
	  
	  
	  
	  
	  
	  
		<div class="albumPlayerWarp">

		<div class="albumPInfo">
			<div class="albumPMain">
				<h1 class="title">{$vod_name}</h1>
				<p class="des">{$vod_hits}次播放</p>
			</div>
		</div>

  <div class="brief-btn-wrap">
   <div class="brief-btn clearfix">
    <div class="fl">
     <div aui-popup-for="top-left" class="hdwrap">切换线路</div>
    </div> 
    <div class="fr">
	 <a href="javascript:void(0)" class="Soure-con"></a> 
     <a href="javascript:void(0)" class="dowme-con"></a> 
     <a href="javascript:void(0)" class="share-con"></a> 
    </div>
   </div>
  </div> 
</div> 
</section>
<!--猜你喜欢-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">猜你喜欢</span>
		</div>
	</div>
		<div class="mod-main clearfix">
			<div class="m-a-list mod-vod-list">
				<volist name=":ff_mysql_vod('cid:'.$vod_cid.';ids_not:'.$vod_id.';limit:10;order:vod_addtime;sort:desc')" id="feifei">
				<article class="news-card card-type-news">
					<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">
						<div class="news-pic">
							<img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}">
						<i class="mask"></i>
						<div class="icon-br"><span class="label"><include file="Home:vod_continu" /></span></div>
						</div>
						<div class="news-info">
							<h3 class="title">{$feifei.vod_name}</h3>
							<div class="detail">
								<span>{$feifei.vod_addtime|date='m-d H:i',###}</span>
								<span>{$feifei.vod_hits}播放</span>
							</div>
						</div>
					</a>
				</article>
			</volist>
			</div>
		</div>
	</section>	

</notempty>

<!--猜你喜欢-->

<!--评论-->
<include file="Base:forum_ajax_vod" />
{$vod_hits_insert}
<script type="text/javascript">
var line = ["{$site_copyright}"];
playerSwitch = function(lineIndex)
{
    $(".albumPlayer iframe").attr("src",line[lineIndex] + "{$vod_url}");
    $(".player_switch #" + lineIndex + "" ).addClass('cur').attr("onclick","");
    $(".player_switch #" + lineIndex + "" ).siblings().removeClass('cur').attr("onclick","playerSwitch(this.id)");
}
</script>
<include file="Home:footer" />
</div>
</body>
</html>