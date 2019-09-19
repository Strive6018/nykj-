<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <php>$list_dir = 'index';</php><title>{$site_title}</title>
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
				<volist name=":ff_mysql_slide('limit:10;order:slide_oid;sort:desc')" id="feifei" offset="0" length="10">
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


<volist name="item_list" id="feifeilist" offset="0" length="1">
<!--VIP独播影院-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">VIP影院</span>
			</div>
		<span class="change">今日更新:{:ff_list_count(999)}个影片</span>
	</div>

	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
<volist name=":ff_mysql_vod('cid:1,2;limit:6;stars:5;order:vod_stars desc,vod_hits desc;')" id="feifei"> 
<include file="Home:vod_home" />
	</volist> 
			</ul>
		</div>
	</div>
</section>
</volist> 
<volist name="item_list" id="feifeilist" offset="1" length="1">
<!--{$feifeilist.list_name}-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">{$feifeilist.list_name}</span>
		</div>
		<a href="{$feifeilist.list_link}" class="change">更多</a>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
<volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:6;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
<include file="Home:vod_home" />
	</volist> 
			</ul>
		</div>
	</div>
</section>
</volist> 

<volist name="item_list" id="feifeilist" offset="0" length="1">
<!--{$feifeilist.list_name}-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">{$feifeilist.list_name}</span>
		</div>
		<a href="{$feifeilist.list_link}" class="change">更多</a>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
<volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:6;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
<include file="Home:vod_home" />
	</volist> 
			</ul>
		</div>
	</div>
</section>
</volist> 

<volist name="item_list" id="feifeilist" offset="2" length="2">
<!--{$feifeilist.list_name}-->
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">{$feifeilist.list_name}</span>
		</div>
		<a href="{$feifeilist.list_link}" class="change">更多</a>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
<volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:6;order:vod_stars desc,vod_addtime;sort:desc;')" id="feifei"> 
<include file="Home:vod_home" />
	</volist> 
			</ul>
		</div>
	</div>
</section>
</volist> 

<volist name=":ff_mysql_nav('field:*;limit:0;cache_name:default;cache_time:default;order:nav_pid asc,nav_oid;sort:asc')" id="feifei" offset="6" length="1">
	<section class="mod aui-margin-t-0">
		<div class="mod-head">
		<div class="mod-head-title">
			<span class="mod-head-name">资讯·预告</span>
		</div>
		<a href="{$feifei.nav_link}" class="change">更多</a>
		</volist> 
	</div>
		<div class="mod-main clearfix">
			<div class="m-a-list">
				<volist name=":ff_mysql_news('limit:5;order:news_addtime desc')" id="feifei">
				<article class="news-card card-type-news">
					<a href="{:ff_url_news_read($feifei['list_id'],$feifei['list_dir'],$feifei['news_id'],$feifei['news_name'],$feifei['news_jumpurl'],1)}" title="{$feifei.news_name}">
						<div class="news-pic">
							<img class="ff-img" data-original="{$feifei.news_pic|ff_url_img=$feifei['news_content']}">
						</div>
						<div class="news-info">
							<h3 class="title">{$feifei.news_name}</h3>
							<div class="detail">
								<span>{$feifei.news_addtime|date='Y-m-d H:i:s',###}</span>
								<span>{$feifei.news_hits}阅读</span>
							</div>
						</div>
					</a>
				</article>
			</volist>
			</div>
		</div>
	</section>
</volist> 
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
<include file="Home:footer" />

</body>
</html>