<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title><in name="list_id" value="2,3,4">《{$vod_name}》第{$play_title}集在线观看－{$list_name}<else />《{$vod_name}》高清在线观看</in>－{$site_name}</title>
    <meta name="keywords" content="{$vod_name},{$vod_name}在线观看,{$vod_name}全集,电视剧{$vod_name},{$vod_name}下载,{$vod_name}主题曲,{$vod_name}剧情,{$vod_name}演员表">
    <meta name="description" content="{$vod_name} {$vod_name}在线观看 {$vod_name}全集 电视剧{$vod_name}，剧情介绍：{$vod_scenario['info'][$play_pid]|default=$vod_content|h|msubstr=0,100}">
<include file="Home:header_meta" />
</head>
<body class="bg-default bg-forum">
<include file="Home:header" />
<section class="mod">
	<div class="albumPlayer" id="cms_player">
	{$vod_player}
			<!-- 弹出窗 -->
<div class="am-share">
 <section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">{$vod_name}</span>
			<span class="mod-head-gold">{$vod_gold}分</span>
		</div>
		<span class="share_btn"></span>
	</div>
	<div class="mod-main clearfix Modtransition">
		<div class="albumSelect albumSele">
			<ul class="clearfix">
				<dt><em><include file="Home:vod_continn" /></em></dt>
				<dt>年代：<em>{$vod_year|default='2018'}</em></dt>
				<dt>地区：<em><notempty name="vod_area"><volist name=":explode(',',$vod_area)" id="feifei">{$feifei}</volist></notempty></em></dt>
				<dt>导演：<em><notempty name="vod_director"><volist name=":explode(',',$vod_director)" id="feifei" key="k" offset="0" length='3'><in name="k" value="1" ><else /><i class="BottomModel">/</i></in>{$feifei}</volist></notempty></em></dt>
				<dt>主演：<em><notempty name="vod_actor"><volist name=":explode(',',$vod_actor)" id="feifei" key="k" offset="0" length='10'><in name="k" value="1" ><else /><i class="BottomModel">/</i></in>{$feifei}</volist></notempty></em></dt>
				<span class="album-name">简介</span>
				<span class="album-txt">{$vod_content}</span>
		</ul>
</div>

</section>
</section> 
  </div>

<!-- 弹出窗 -->
	</div>
		<div class="albumPlayerWarp">
		

		<div class="albumPInfo">
			<div class="albumPMain">
				<h1 class="title">{$vod_name}<in name="list_id" value="2,3,4">：第{$play_title}集<else /></in></h1>
				<div class="brief-desc-jj fr" onClick="toshare()">简介<i></i></div>
				<div class="video-num"><em class="score-int">{$vod_gold}分</em><i>·</i><span>{$vod_year}</span><span>{$vod_area}</span><notempty name="vod_type"><volist name=":explode(',',$vod_type)" id="feifei" key="k" offset="0" length='2'><span>{$feifei}</span></volist></notempty><i>·</i><span>{$vod_hits}次播放</span></div>
				<p class="des">{$vod_content|msubstr=0,40}</p>
			</div>
		</div>
  <div class="brief-btn-wrap">
   <div class="brief-btn clearfix">
    <div class="fl">
     <div class="hdwrap">切换线路</div>
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

<!--剧集-->
<include file="Base:vod_playurl" />
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">剧集</span>
		</div>

	<p class="pSource change">
              <em class="sTit">来源：</em>
			  <volist name="playurl_line" id="feifei" key="k">
              <span class="sSourcee win-xuanji" id="play1_{$feifei.player_name_en}">
			  <span class="sSourceico sSource{$feifei.player_name_en}"></span><em>{$feifei.player_name_zh}</em></span>
			  </volist>
		<i class="iArrow"></i>
            </p>
	</div>
	
	<in name="list_id" value="4" ><div class="num-tab mod-main zy-play clearfix"><else/><div class="num-tab mod-main clearfix"></in>
	
	 <volist name="playurl_line" id="feifei" key="k"> 
		<div class="albumSelect" id="play2_{$feifei.player_name_en}">
			<ul class="num-tab-main">
			 <volist name="feifei.son" id="feifeison" key="pid">
				<li id="play-{$feifei.player_sid}{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}">{$feifeison.title}</a></li>
		</volist>
			</ul>
		</div>
		</volist>
	</div>
	
</section>





<!--正在热播-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">正在热播</span>
		</div>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
			<volist name=":ff_mysql_vod('cid:'.$vod_cid.';limit:9;order:vod_id;sort:desc')" id="feifei">
<include file="Home:vod_home" />
</volist> 
			</ul>
		</div>
	</div>
</section>
<!--评论-->
<include file="Base:forum_ajax_vod" />

<include file="Home:footer" />
</div>
{$vod_hits_insert}
<include file="Base:vod_record_set" />
<section class="popWinMask popXuanji">
    <section class="popWin playSource_popWin">
	       <div class="sTit">请选择播放源</div>
        <ul class="clearfix">
		  <volist name="playurl_line" id="feifei" key="k">
                   <li id="play3_{$feifei.player_name_en}"><div class="sSource popWin_sce"><span class="sSourceico sSource{$feifei.player_name_en}"></span><em>{$feifei.player_name_zh}</em><i></i></div></li>
			</volist>
                  </ul>
        <p class="pBtn clearfix"><em class="gray all hide_popWin">取消</em></p>
    </section>
</section>



<script type="text/javascript">
function series(a, b, c) {
    var f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, d = a.find("li").length,
        e = WidthScreen ? b : c;
	if (d > 30) {
        for (f = Math.ceil(d / 30), g = 0; f > g; g++) a.append("<div class='drama-list'></div>");
        for (h = 1; f >= h; h++) i = h == f ? d - 30 * f + 30 : 30, a.find("li:lt(" + i + ")").appendTo(a.find(".drama-list").eq(h - 1));
        for ("undefined" != typeof TooLength ? TooLength++ : window.TooLength = 1, 
		$("body").append("<div class='drama-ning' id='TooLength" + TooLength + "' style='display:none'></div>"), 
		a.find("li:lt(" + (c + 14) + ")").clone().appendTo($("#TooLength" + TooLength)), 
		a.find("li:gt(" + (d - (b / 2 - 2) / 2 - 1) + ")").clone().appendTo($("#TooLength" + TooLength)), 
		$("#TooLength" + TooLength).prependTo(a), 
		a.find(".drama-ning").hide(), a.find(".drama-ning li").eq(c + 13).after(j), l = 0; f > l; l++) 
		a.find(".drama-list").eq(l).append(k);
		
        for (m = "<div class='drama-tab ff-gallery" + TooLength + "'>", n = 0; f > n; n++) o = 30 * n + 1, p = n == f - 1 ? d : 30 * (n + 1), m += <include file="Home:jsq" /> == n ? "<dt class='active'><a href='javascript:;' >" + o + "-" + p + "</a></dt>" : "<dt><a href='javascript:;'>" + o + "-" + p + "</a></dt>";
        m += "</div>", a.find(".drama-ning").after(m), q = <include file="Home:jsq" />, r = a.find(".drama-ning"), s = a.find(".drama-tab"), t = a.find(".drama-list"), t.eq(q).addClass("cur"); 

		a.find(".drama-tab dt").click(function() {
            if (!$(this).hasClass("active")) {
                var a = $(this).index();
                t.eq(q).removeClass("cur"), t.eq(a).addClass("cur"), $(this).addClass("active").siblings(".active").removeClass("active"), q = a
            }
			
        });
	}	
}(jQuery), WidthScreen = !0, $(document).ready(function() {
	
});

</script>


<script type="text/javascript">
	function toshare(){
		$(".am-share").addClass("am-modal-active").slideDown();
		$("body").addClass("modal-open");	
		$(".share_btn").click(function(){
			$(".am-share").removeClass("am-modal-active").slideUp();
			$("body").removeClass("modal-open");	
			setTimeout(function(){
				$(".sharebg-active").removeClass("sharebg-active");	
			},300);
		})
	}		
$("#play-{$play_sid}{$play_pid}").addClass("active");
$("#play1_{$play_name_en}").addClass("cur");
$("#play2_{$play_name_en}").addClass("cur");
$("#play3_{$play_name_en}").addClass("cur");
<eq name="vod_isend" value="1"><else/>
$("#play-{$play_sid}{$vod_continu} a").last().after("<span class='player-new'>新</span>");
$("#play-{$play_sid}{$vod_continu-1} a").last().after("<span class='player-new'>新</span>");</eq>
var line = ["{$site_copyright}"];
playerSwitch = function(lineIndex)
{
    $(".albumPlayer iframe").attr("src",line[lineIndex] + "{$play_url}");
    $(".player_switch #" + lineIndex + "" ).addClass('cur').attr("onclick","");
    $(".player_switch #" + lineIndex + "" ).siblings().removeClass('cur').attr("onclick","playerSwitch(this.id)");

}



</script>

</body>
</html>