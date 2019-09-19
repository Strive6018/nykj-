<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$site_title}</title>
    <meta name="keywords" content="{$site_keywords}">
    <meta name="description" content="{$site_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<!--幻灯片-->
<section class="mod">
             <section class="row">
            <div class="swiper-container focus_banner  js-swiper-container" id="js-swiper-focus-banner">
                <div class="swiper-wrapper focus_banner_list">
				<volist name=":ff_mysql_slide('cid:'.$list_id.';limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="10">
                                        <div class="swiper-slide focus_banner_item">
                        <a href="{$feifei.slide_url}" target="_blank" class="v_pic">
                            <img src="{$feifei.slide_pic|ff_url_img}" alt="" title="{$feifei.slide_name}丨{$feifei.slide_logo}"  class="swiper-lazy">
                            <span class="s_tit"><em>{$feifei.slide_name}丨{$feifei.slide_logo}</em></span>
                        </a>
                    </div>
					</volist>
                                    </div>
                <div class="swiper-pagination focus_banner_point"></div>
            </div>
        </section>
</section>

<section class="select">
        <ul class="show_select hidden">
		<volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="4">
            <li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="{$feifei|msubstr=0,4}">{$feifei|msubstr=0,4}动漫</a></li>
            </volist>
		<volist name=":explode(',',$list_extend['area'])" id="feifei" offset="0" length="3">
            <li><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" title="{$feifei|msubstr=0,4}">{$feifei|msubstr=0,4}动漫</a></li>
            </volist>
            <li><a class="shows" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>'addtime','p'=>1),true)}" title="全部">全部</a></li>
        </ul>
    </section>
	
<script type="text/javascript">
$(function(){

  $('.js-swiper-container').each(function(){
    if($(this).find('.swiper-slide').length > 1 && !$(this).attr('development')){
      new Swiper('#' + $(this).attr('id'), {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
        },
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        lazy: {
          loadPrevNext: true,
        }
      });
    }
  })

})
</script>
<!--最近更新-->
<section class="mod aui-margin-t-5">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">最近更新</span>
		</div>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
			<volist name=":ff_mysql_vod('cid:'.$list_id.';limit:6;order:vod_addtime desc')" id="feifei"> 
<include file="Home:vod_home" />
</volist> 
			</ul>
		</div>
	</div>
</section>

<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="8">
<php>$item_vod=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:9;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');if(!$item_vod){continue;}</php>
<!--{$feifeilist}动漫-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">{$feifeilist}动漫</span>
		</div>
		<a class="change" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多{$feifeilist}动漫</a>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
      <volist name="item_vod" id="feifei">
      <include file="Home:vod_home" />
      </volist> 
			</ul>
		</div>
	</div>
</section>
 </volist> 
 
<include file="Home:footer" />
</body>
</html>