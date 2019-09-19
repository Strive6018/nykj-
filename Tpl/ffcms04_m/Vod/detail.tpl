<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$type_type}{$type_area}{$type_year}{$type_star}{$type_state}{$list_name}大全-{$list_name}排行榜-{$site_name}</title>
    <meta name="keywords" content="{$list_keywords}">
    <meta name="description" content="{$list_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default bg-forum">
<include file="Home:header" />
<!--影片详情-->
<section class="mod">
	<div class="albumDetail">
		<div class="albumDetailWrap">
			<div class="albumDetailCover"></div>
			<div class="albumDetailImg">
				<img src="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}">
			</div>
			<div class="albumDetailMedia">
				<h1 class="title aui-ellipsis-1">{$vod_name}</h1>
				<ul class="desc">
					<li>年代：{$vod_year|default='2018'}</li>
					<li>导演：{$vod_director}</li>
					<li>主演：{$vod_actor}</li>
					
					<li><include file="Home:vod_continn" /></li>
				</ul>
				<div class="btnBox">
				<a class="btn btn-danger btn-radius" href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,1)}">立即播放</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!--影片介绍-->
<section class="mod">
	<div class="albumDetailIntro">
		<p class="albumDetailIntroTxt" data-clamp="3" data-content="{$vod_content|strip_tags}">{$vod_content|msubstr=0,40}....<a class="expand" href="javascript:;">(展开)</a></p>
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
              <eq name="k" value="1"><span class="sSourcee win-xuanji cur"><else/><span class="sSourcee win-xuanji"></eq><span class="sSourceico sSource{$feifei.player_name_en}"></span><em>{$feifei.player_name_zh}</em></span>
			  </volist>
		<i class="iArrow"></i>
            </p>
	</div>
	
	<in name="list_id" value="4" ><div class="num-tab mod-main zy-play clearfix"><else/><div class="num-tab mod-main clearfix"></in>
	
	 <volist name="playurl_line" id="feifei" key="k"> 
	 <eq name="k" value="1"><assign name="active" value="cur" /><else/><assign name="active" value=""/></eq>
		<div class="albumSelect {$active}">
			<ul class="clearfix num-tab-main">
			 <volist name="feifei.son" id="feifeison" key="pid">
				<li><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}">{$feifeison.title}</a></li>
		</volist>
			</ul>
		</div>
		</volist>
	</div>
	
</section>
<!--正在热播---->
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

<!--播放器-->
<section class="popWinMask popXuanji">
    <section class="popWin playSource_popWin">
	       <div class="sTit">请选择播放源</div>
        <ul class="clearfix">
		  <volist name="playurl_line" id="feifei" key="k">
                   <eq name="k" value="1"><li class="cur"><else/><li></eq><div class="sSource popWin_sce"><span class="sSourceico sSource{$feifei.player_name_en}"></span><em>{$feifei.player_name_zh}</em><i></i></div></li>
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
		
        for (m = "<div class='drama-tab ff-gallery" + TooLength + "'>", n = 0; f > n; n++) o = 30 * n + 1, p = n == f - 1 ? d : 30 * (n + 1), m += 0 == n ? "<dt class='active'><a href='javascript:;' >" + o + "-" + p + "</a></dt>" : "<dt><a href='javascript:;'>" + o + "-" + p + "</a></dt>";
        m += "</div>", a.find(".drama-ning").after(m), q = 0, r = a.find(".drama-ning"), s = a.find(".drama-tab"), t = a.find(".drama-list"), t.eq(q).addClass("cur"); 

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


<!--播放器-->
<include file="Home:footer" />
</div>
</body>
</html>