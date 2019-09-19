<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><in name="list_id" value="2,3,4">《{$vod_name}》{$play_title}在线观看－{$list_name}<else />《{$vod_name}》高清在线观看</in>－{$site_name}</title>
<meta name="keywords" content="{$vod_name},{$vod_name}在线观看,{$vod_name}全集,电视剧{$vod_name},{$vod_name}下载,{$vod_name}主题曲,{$vod_name}剧情,{$vod_name}演员表">
<meta name="description" content="{$vod_name} {$vod_name}在线观看 {$vod_name}全集 电视剧{$vod_name}，剧情介绍：{$vod_scenario['info'][$play_pid]|default=$vod_content|h|msubstr=0,100}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"/>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<include file="Home:header" />
<link rel="stylesheet" href="{$public_path}/ffcms/css/play.css"/>
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
                            <div class="c-player-aside-showTitle">
                                <h2><a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" target="_blank">{$vod_name}</a></h2>
								<span class="score"><em>{$vod_gold|msubstr=0,1}</em>{$vod_gold|msubstr=2,2}</span>
								<p class="tvintro"><em><include file="Home:vod_continn" /></em></p>
								<div class="s-playsite s-playsitee">
					<include file="Home:vod_playurl" />

					<p class="js-current s-playsite-current">
				<volist name="playurl_line" id="feifei" key="sid"> 
			<span class="ea-site ea-site-{$feifei.player_name_en}" id="{$feifei.player_name_en}play1" style="display: none;">{$feifei.player_name_zh}</span>
			</volist></p>
						<div class="sites">
						<div class="sites-inner">
							<p class="arrow"></p>
								<ul class="js-list">
										 <volist name="playurl_line" id="feifei" key="sid"> 
										<li id="{$feifei.player_name_en}play2"><span class="ea-site ea-site-{$feifei.player_name_en}">{$feifei.player_name_zh}</span></li>
										</volist>
										</ul>
									</div>
								</div>
							</div>
                            </div>
                        </div>
                        <div class="c-player-episode">
                            <div class="c-player-aside-list">
                                <div class="player-aside-list-main">
                <div class="u-listbox d-play-list num-tab">
					<volist name="playurl_line" id="feifei" key="sid"> 
                        <div class="looplist aside-tabbox num-tab-main <in name="list_id" value="1,2" >zy-play</in>" id="{$feifei.player_name_en}play"> 
						<volist name="feifei.son" id="feifeison" key="pid">
                          <a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" id="{$feifei.player_name_en}{$feifei.player_sid}{$pid}">{$feifeison.title}</a>
                          </volist>	
                        </div>
						</volist>	
                </div>
				<php>$item = ff_mysql_vod('cid:5;tag_name:'.ff_array(explode(',',$vod_keywords),0).';limit:20;order:vod_addtime;sort:desc');</php>
				<notempty name="vod_keywords">
				<notempty name="item">
                    <p class="top-tillist">节目相关片段</p>
                    <ul class="aside-videolist">
					<volist name="item" id="feifei">
							<li>
                                <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" class="screenshot on-ssh">
                                    <p class="lipic">
                                        <img src="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
                                        <span class="duration"><empty name="feifei.vod_title">{:date('i:s',$feifei['vod_length'])}<else />{$feifei.vod_title}</empty></span>
                                    </p>
                                    <p class="litxt">
                                        <span class="name tvname">{$feifei.vod_name}</span>
                                        <span class="playwp play-num"><em><span class="icon playnum"></span></em>{$feifei.vod_hits}次播放</span>
                                </p>
                            </a>
                        </li>
					</volist>
                    </ul>
				</notempty>
				</notempty>
                </div>
              </div>
           </div>
       </div>
   </div>
<div class="c-player-video">
    <div class="c-player-video-size"><div class="c-player-flash"><div class="mini"><div id="cms_player" class="embed-responsive">{$vod_player}
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
<h1><a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" target="_blank">{$vod_name}</a><in name="vod_cid" value="2,3" ><span>：{$play_title}</span></in><in name="vod_cid" value="4" ><span>：{$play_title}期</span></in><span class="yk-modules">详情<i class="icon-jiantou unrotate"></i></span></h1>
<div class="programDetail" style="display: none;">
							
							<div class="programText">
				<div class="v-panel-extend">
                            <div class="v-panel-route">
                                <a class="route-til" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" target="_blank">{$vod_name}</a>
								<in name="vod_cid" value="2,3" ><a href="{:ff_url_vod_show($list_id,$list_dir,1)}" class="route-tag">{$vod_total}</a></in>
								<a href="{:ff_url_vod_show($list_id,$list_dir,1)}" class="route-tag">{$list_name}</a>
                            </div>
                            <div class="v-panel-meta">
                                <p class="u-meta-short">
                                    <span class="babel">年代：</span>
                                      <a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2019'}</a>
                                </p>

                                <p class="u-meta-long">
                                    <span class="babel">类型：</span>

								<notempty name="vod_type"><volist name=":explode(',',$vod_type)" id="feifei" key="k" offset="0" length='3'><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}"><in name="k" value="2,3" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty>
                                </p>
                                <p class="u-meta-short">
                                    <span class="babel">地区：</span>
                                       <notempty name="vod_area"><volist name=":explode(',',$vod_area)" id="feifei"><a href="{:ff_url('vod/type',array('id'=>$vod_cid,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime'),true)}">{$feifei}</a></volist></notempty>
                                </p>
                                <p class="u-meta-short">
                                    <span class="babel">导演：</span>
					<notempty name="vod_director"><volist name=":explode(',',$vod_director)" id="feifei" key="k" offset="0" length='3'><a href="{:ff_url('vod/search',array('director'=>urlencode($feifei)),true)}"><in name="k" value="2,3" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty>
                                </p>

                                <p class="u-meta-long">
                                    <span class="babel">主演：</span>
                                        <notempty name="vod_actor"><volist name=":explode(',',$vod_actor)" id="feifei" key="k" offset="0" length='10'><a href="{:ff_url('vod/search',array('actor'=>urlencode($feifei)),true)}"><in name="k" value="2,3,4,5,6,7,8,9,10" ><i class="BottomModel">/</i></in>{$feifei}</a></volist></notempty>
                                </p>
                                <p class="u-meta-intro">
                                    <span class="babel">简介：</span>
                                    <span class="details">{$vod_content|strip_tags}</span>
                                </p>
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
  <div class="summary-expena">
       <div class="module-title"><h2>剧情简介</h2></div>
    <div class="s-relate">
	<div class="summary-wrap">{$vod_content|strip_tags}</div> 
 </div> 
</div>
<in name="list_id" value="3,4" ><else/>
  <div class="summary-expenb">
	  <div class="module-title"><h2>相关明星</h2>
	  <div class="myTab-actor" id="statetab"> 
	<ul id="myTab1"> 
  		<notempty name="vod_type">
		<volist name=":explode(',',$vod_director)" id="feifei" key="k" offset="0" length="1">
			  <li <eq name="k" value="1">class="active"<else/></eq>><a href="{:ff_url('vod/search',array('wd'=>urlencode($feifei)),true)}" target="_blank">
			  <div class="item g-clear">
							<img src="/Public/ffcms/images/user.png">
							<p class="name">{$feifei}</p>
							<em class="zhiye">导演</em>
						</div></a></li>
					</volist>
				</notempty>	 
		<notempty name="vod_type">
		<volist name=":explode(',',$vod_actor)" id="feifei" key="k" offset="0" length="6">
			  <li><a href="{:ff_url('vod/search',array('wd'=>urlencode($feifei)),true)}" target="_blank">
			  <div class="item g-clear">
							<img src="/Public/ffcms/images/user.png">
							<p class="name">{$feifei}</p>
							<em class="zhiye">演员</em>
						</div></a></li>
					</volist>
				</notempty>	 	
			</ul>  
		</div>
		</div>
		<div class="play-actor statetab">
				<volist name=":explode(',',$director)" id="feifei" key="k" offset="0" length="1">
		<ul class="index-list-1 tabcon <eq name="k" value="1">active<else/></eq>">
		<volist name=":ff_mysql_vod('cid:'.$vod_cid.';director:'.ff_array(explode(',',$vod_director),$k).';limit:5;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei">
		<include file="Block:yk_img" />
		</volist>
		</ul>
		</volist>
		<volist name=":explode(',',$vod_actor)" id="feifei" key="k" offset="0" length="6">
		<ul class="index-list-1 tabcon">
		<volist name=":ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),$k-1).';limit:5;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei">
		<include file="Block:yk_img" />
		</volist>
		</ul>
		</volist>
		</div>
		</div>
		</in>
		
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
	  <div class="summary-expend">
			<div class="module-title"><h2>精彩影评</h2></div>
	<div class="ff-forum" data-id="{$vod_id}" data-sid="1" data-type="{$Think.config.forum_type}" data-uyan-uid="{$Think.config.forum_type_uyan_uid}" data-cy-id="{$Think.config.forum_type_changyan_appid}" data-cy-conf="{$Think.config.forum_type_changyan_conf}">
	  评论加载中...
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
  
<include file="Base:vod_record_set" />
{$vod_hits_insert}

<include file="Home:forum" />

<script>

function series(a, b, c) {
    var f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, d = a.find("a").length,
        e = WidthScreen ? b : c;
	<in name="list_id" value="2,3" >
    if (d > 30) {
        for (f = Math.ceil(d / 30), g = 0; f > g; g++) a.append("<li class='fortab'></li>");
        for (h = 1; f >= h; h++) i = h == f ? d - 30 * f + 30 : 30, a.find("a:lt(" + i + ")").appendTo(a.find(".fortab").eq(h - 1));
        for ("undefined" != typeof TooLength ? TooLength++ : window.TooLength = 1, $("body").append("<div class='Df' id='TooLength" + TooLength + "' style='display:none'></div>"), a.find("a:lt(" + (c + 14) + ")").clone().appendTo($("#TooLength" + TooLength)), a.find("a:gt(" + (d - (b / 2 - 2) / 2 - 1) + ")").clone().appendTo($("#TooLength" + TooLength)), $("#TooLength" + TooLength).prependTo(a), a.find(".Df").hide(), a.find(".Df a").eq(c + 13).after(j), l = 0; f > l; l++) a.find(".fortab").eq(l).append(k);
        for (m = "<div class='drama-list'>", n = 0; f > n; n++) o = 30 * n + 1, p = n == f - 1 ? d : 30 * (n + 1), m += <include file="Home:jsq" /> == n ? "<a href='javascript:;' class='current-tab'>" + o + "-" + p + "</a>" : "<a href='javascript:;'>" + o + "-" + p + "</a>";
        m += "</div>", a.find(".Df").after(m), q = <include file="Home:jsq" />, r = a.find(".Df"), s = a.find(".drama-list"), t = a.find(".fortab"),  t.eq(q).show() 
		a.find(".drama-list a").click(function() {
            if (!$(this).hasClass("current-tab")) {
                var a = $(this).index();
                t.eq(q).hide(), t.eq(a).show(), $(this).addClass("current-tab").siblings(".current-tab").removeClass("current-tab"), q = a
            }
			
        });
	}
	
</in>	
}(jQuery), WidthScreen = !0, $(document).ready(function() {
	
});


var $guideSlider = $("#guideSlider").eq(0);

$guideSlider.find(".guide-list .guide").hover(function() {
$(this).addClass("sel").siblings().removeClass("sel");
});
$("#{$play_name_en}{$play_sid}{$play_pid}").addClass("current"); 
$("#{$play_name_en}play1").css('display','inline-block'); 
$("#{$play_name_en}play2").addClass("cur"); 
$("#{$play_name_en}play").addClass("cur"); 
<egt name="play_count" value="121">$(document).ready(function(){ $(".drama-list a").last().after("<div class='tab-more'></div>");});</egt>
</script>
<script>
var line = ["{$site_copyright}"];
playerSwitch = function(lineIndex)
{
    $(".embed-responsive iframe").attr("src",line[lineIndex] + "{$play_url}");
    $(".player_switch #" + lineIndex + "" ).attr("onclick","");
    $(".player_switch #" + lineIndex + "" ).siblings().attr("onclick","playerSwitch(this.id)");
}
</script>



</body>
</html>
