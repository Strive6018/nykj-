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
<link rel="stylesheet" href="{$public_path}/ffcms/css/play.css"/>
 </head>
 <body>
<include file="Home:heanvd" />

<div class="c-top">
        <div class="c-top-main-wrap">
            <div class="c-top-main">
    <div class="s-top g-clear">
    <div class="s-top-left">
        <div class="s-cover playlike">

    <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,1)}" class="g-playicon s-cover-img">
        <img class="ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}">
	<span class="playicon"></span>
            </a>
		</div>  
  </div>
    <div class="s-top-right">
        <div class="s-top-info">
            <div class="s-top-info-title">
                <div class="title-left g-clear">
                    <h1>{$vod_name}</h1>
					<div class="video_score">
			<div class="score_v"><span class="score">{$vod_gold}</span><span class="f">分</span></div>
			<div class="score_db" title="豆瓣评分：<eq name="vod_douban_score" value="0.0">{$vod_gold}<else/>{$vod_douban_score}</eq>"><span class="db">豆</span><span class="score"><eq name="vod_douban_score" value="0.0">{$vod_gold}<else/>{$vod_douban_score}</eq></span></div>
					</div>
				</div>
                <p class="tag"><include file="Home:vod_continn" /> </p></div>
            <div class="s-top-info-detail g-clear">
                <div class="g-clear item-wrap">
                    <p class="item"><span>地区：</span><notempty name="vod_area"><volist name=":explode(',',$vod_area)" id="feifei"><a href="{:ff_url('vod/type',array('id'=>$vod_cid,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime'),true)}">{$feifei}</a></volist><else/><a href="javascript:;">未知</a></notempty></p>
                    <p class="item item-actor"><span>年代：</span><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2018'}</a></p>
					<p style="clear:both"></p>
                    <p class="item item-director">
                        <span>类型：</span><notempty name="vod_type"><volist name=":explode(',',$vod_type)" id="feifei" key="k" offset="0" length='3'><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}"><in name="k" value="2,3" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty></p>
                    <p class="item item-actor">
                        <span>导演：</span><notempty name="vod_director"><volist name=":explode(',',$vod_director)" id="feifei" key="k" offset="0" length='3'><a href="{:ff_url('vod/search',array('wd'=>urlencode($feifei)),true)}" target="_blank"><in name="k" value="2,3" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty></p>
                   <p class="item item-type"><span>演员：</span><notempty name="vod_actor"><volist name=":explode(',',$vod_actor)" id="feifei" key="k" offset="0" length='9'><a href="{:ff_url('vod/search',array('wd'=>urlencode($feifei)),true)}" target="_blank"><in name="k" value="2,3,4,5,6,7,8,9" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty></p>
                </div>
                <p class="item-desc js-open-wrap"><span class="desc">简介：</span><span id="cText">{$vod_content|strip_tags}</span><script language="javascript"> var conText = ""; hideText("cText", 110, "", ""); </script></p>
            </div>
			
			 <div class="s-top-info-detail g-clear"><div class="item-desc js-open-wrap"><span class="ff-desc">分享给朋友：</span><div class="ff-share"></div></div></div>
			 <div class="s-top-info-detail g-clear">
			 
			 <div class="playBtnCon clearfix">
			 <include file="Home:vod_playurl" />
			 <volist name="playurl_line" id="feifei" key="k" offset="0" length="1">
			<volist name="feifei.son" id="feifeison" key="pid" offset="0" length="1">
			  <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" target="_blank" class="v_blue_btn latestBtn">
			</volist>
			</volist>
			<i class="iconfont"></i>立即播放</a>
				<eq name="list_id" value="1" >
				<div class="playSource">
                     <span class="sTit">来源：</span>
					 <volist name="playurl_line" id="feifei" key="k" offset="0" length="6">
                      <span class="ea-site ea-site-{$feifei.player_name_en}"><a target="_blank" href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}">{$feifei.player_name_zh}<span class="c-gray">（免费）</span></a></span>
					  </volist>
                          </div>
						  </eq>
					</div>
				</div>
			</div>
			</div>
		  </div>
		 </div>
		</div>
		</div>
	</div>
<div class="main-box"> 
		<div class="c-body-left">
			<div class="d-play-mod d-play-top">
			<in name="list_id" value="1" ><else/>
			<div class="s-top-list">
			 <div class="s-top-list-ji">
				<h2 class="title g-clear">全部剧集</h2>
			<div class="s-playsite">
			<notempty name="playurl_line" id="feifei"> 
			<em>当前选择：</em><div class="js-current s-playsite-current">
			 <volist name="playurl_line" id="feifei" key="k">
			 <eq name="k" value="1"><assign name="active" value="inline" /><else/><assign name="active" value="none"/></eq>
			<span class="ea-site ea-site-{$feifei.player_name_en}" style="display:{$active};">{$feifei.player_name_zh}</span>
			</volist>
			</div>
			<div class="sites">
					<div class="sites-inner">
						<p class="arrow"></p>
						<ul class="js-list">
						 <volist name="playurl_line" id="feifei" key="i">
						  <eq name="i" value="1"><assign name="active" value="cur" /><else/><assign name="active" value=""/></eq>
						<li class="{$active}"><span class="ea-site ea-site-{$feifei.player_name_en}">{$feifei.player_name_zh}</span></li>
						</volist>
						</ul>
					</div>
				</div>
		</notempty> 
		  </div>
        <div class="num-tab js-tabs">
	<volist name="playurl_line" id="feifei" key="q">
	<eq name="q" value="1"><assign name="active" value="cur" /><else/><assign name="active" value=""/></eq>
            <div class="num-tab-main g-clear js-tab <in name="list_id" value="4" >zy-item</in> {$active}">
           			<volist name="feifei.son" id="feifeison" key="pid">
			    <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}"><in name="list_id" value="2">{$pid}<else/>{$feifeison.title}</in></a>
			</volist>
		</div>
	</volist>
     </div>
   </div>
</div>
</in>
<include file="Base:vod_playurl_down" />
<div class="d-play-side">
<!-- 预告花絮 -->
	<div class="d-play-hd">
	<div class="d-play-title">
		<h2 class="title">预告花絮</h2>
			<div class="d-play-showmore">
			<volist name=":ff_mysql_vod('cid:5;limit:1;order:vod_addtime desc')" id="feifei">
		<a class="d-play-link" href="{:ff_url_vod_show($feifei['list_id'],$feifei['list_dir'],1)}"><span class="icon_text">更多</span><i class="icon_sm icon_right_sm"></i></a>
		</volist>
	</div>				
  </div>
	<div class="d-play-default">
	<volist name=":ff_mysql_vod('cid:5;limit:12;order:vod_stars desc,vod_id;sort:desc;')" id="feifei" key="k" offset="0" length="10">
	<li class="yk-pack">
	<div class="p-thumb">
	<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"></a>
	<img class="quic ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
	<span class="playicon"></span><span class="playshow">{:date('i:s',$feifei['vod_length'])}</span>
	</div>
	<ul class="info-list">
	<li class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></li>
	<li><span>{$feifei.vod_hits}次播放</span></li>
	</ul>
	</li>
	</volist> 
 </div>
</div>
<!-- 相关推荐 -->
 <div class="summary-expend">
	 <div class="module-title"><h2>相关推荐</h2></div>
		<div class="play-actor">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
		<div class="index-list-1 item active">
		<volist name=":ff_mysql_vod('cid:'.$vod_cid.';tag_name:'.ff_array(explode(',',$vod_type),1).';limit:10;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei" key="k" offset="0" length="5">
		<include file="Block:yk_img" />
		</volist>
		</div>
		<div class="index-list-1 item">
		<volist name=":ff_mysql_vod('cid:'.$vod_cid.';tag_name:'.ff_array(explode(',',$vod_type),1).';limit:10;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei" key="k" offset="5" length="5">
		<include file="Block:yk_img" />
		</volist>
		</div>
	</div>
	<volist name=":ff_mysql_vod('cid:'.$vod_cid.';tag_name:'.ff_array(explode(',',$vod_type),1).';limit:10;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei" key="k">
	<eq name="k" value="10">
		<a class="mbtn btnprev" href="#myCarousel" role="button" data-slide="prev"><span class="chevron-left" aria-hidden="true"></span></a>
		<a class="mbtn btnnext" href="#myCarousel" role="button" data-slide="next"><span class="chevron-right" aria-hidden="true"></span></a></eq>
		</volist>
	</div>
	</div>
	</div>
	<include file="Base:vod_scenario" />
	</div>
	</div>
 </div> 

   <div class="c-body-right">
   <div class="d-play-mod d-play-top" id="guideSlider">
	<div class="module-title"><h2>{$list_name}榜单</h2></div>
   <ul class="m-top-toplist guide-list">
   <volist name=":ff_mysql_vod('cid:'.$vod_cid.';limit:20;order:vod_hits;sort:desc')" id="feifei" key="k" offset="0" length="10">
		<in name="k" value="1" ><li class="guide sel"><else/><li class="guide"></in>
			<p class="txt"><em <in name="k" value="1,2,3" >class="on"<else/></in>>{$k}</em><span><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></span></p>
			<p class="con">
				<span class="screenshot playlike">
					<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">
					<img class="ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
					<span class="playicon"></span><span class="playshow"><include file="Home:vod_continu" /></span>
					</a>
				</span>
				<span class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank">{$feifei.vod_name}</a></span>
				<span class="play"><em>年代：</em>{$feifei.vod_year}</span>
				<span class="play"><em>地区：</em>{$feifei.vod_area}</span>
				<span class="name"><em>导演：</em>{$feifei.vod_director}</span>
				<span class="name"><em>主演：</em>{$feifei.vod_actor}</span>
				<span class="tent"><em>简介：</em>{$feifei.vod_content|msubstr=0,24}....</span>
			</p>
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
<in name="list_id" value="1" ><else/>
function series(a, b, c) {
	var f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, d = a.find("a").length,
		e = WidthScreen ? b : c;
		if (d > 45) {
		for (g = c + 24; d - (b / 2 - 2) / 2 > g; g++) a.find("a").eq(g).addClass("Hide");
		u = "<a target='_self' href='javascript:void(0)' class='more' id='playurlmore' title='展开'>......</a>", a.find("a").eq(c + 24).after(u), v = a.find(".more"), w = !1, v.click(function() {
			w ? (a.find(".Hide").hide(), 
			$(this).html("......"), 
			$(this).append(''), 
			$(this).insertAfter(a.find("a").eq(c + 24)), w = !1) : (a.find(".Hide").show(), 
			$(this).html("收起"), $(this).append(''), $(this).insertAfter(a.find("a:last")), w = !0)
		})
	}
}(jQuery), WidthScreen = !0, $(document).ready(function() {
	
});
</in>
var $guideSlider = $("#guideSlider").eq(0);
$guideSlider.find(".guide-list .guide").hover(function() {
$(this).addClass("sel").siblings().removeClass("sel");
});


</script>

<include file="Home:forum" />
</body>
</html>
