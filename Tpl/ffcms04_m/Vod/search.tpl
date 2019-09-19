<php>
if($search_wd){
$item_vod = ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:24;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('id'=>$search_id,'wd'=>urlencode($search_wd),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_actor){
$item_vod = ff_mysql_vod('actor:'.$search_actor.';limit:24;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('actor'=>urlencode($search_actor),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_director){
$item_vod = ff_mysql_vod('director:'.$search_director.';limit:24;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('director'=>urlencode($search_director),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_name){
$item_vod = ff_mysql_vod('name:'.$search_name.';limit:24;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('name'=>urlencode($search_name),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}else if($search_title){
$item_vod = ff_mysql_vod('title:'.$search_title.';limit:24;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:desc');
  $params = array('title'=>urlencode($search_title),'p'=>'FFLINK');
  $page = ff_url_page('vod/search', $params, true, 'search', 4);
}
$totalpages = ff_page_count('search', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>《{$search_name}{$search_actor}{$search_director}{$search_wd}》第{$search_page}页_{$site_name}</title>
    <meta name="keywords" content="{$search_name}{$search_actor}{$search_director}{$search_wd}">
    <meta name="description" content="{$search_name}{$search_actor}{$search_director}{$search_wd}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<div class="subNav">
	<div class="warp swiperTopNav">
	<ul class="swiper-wrapper">
	<li class="swiper-slide" id="idcfcd208495d565ef66e7dff9f98764da"><a href="{:ff_url('vod/search',array('id'=>0,'wd'=>$search_wd,'p'=>1),true)}">全部<volist name=":ff_mysql_vod('cid:0;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">({:ff_page_count('search', 'records')})
</volist>
</a>
</li>

<volist name=":ff_mysql_vod('cid:1;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<li class="swiper-slide" id="id{:md5($feifei['list_id'])}"><a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}">
{$feifei.list_name}({:ff_page_count('search', 'records')})
</a></li></volist>

<volist name=":ff_mysql_vod('cid:2;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<li class="swiper-slide" id="id{:md5($feifei['list_id'])}"><a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}">
{$feifei.list_name}({:ff_page_count('search', 'records')})
</a></li></volist>

<volist name=":ff_mysql_vod('cid:3;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<li class="swiper-slide" id="id{:md5($feifei['list_id'])}"><a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}">
{$feifei.list_name}({:ff_page_count('search', 'records')})
</a></li></volist>

<volist name=":ff_mysql_vod('cid:4;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<li class="swiper-slide" id="id{:md5($feifei['list_id'])}"><a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}">
{$feifei.list_name}({:ff_page_count('search', 'records')})
</a></li></volist>

<volist name=":ff_mysql_vod('cid:5;wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<li class="swiper-slide" id="id{:md5($feifei['list_id'])}"><a href="{:ff_url('vod/search',array('id'=>$feifei['list_id'],'wd'=>$search_wd,'p'=>1),true)}">
{$feifei.list_name}({:ff_page_count('search', 'records')})
</a></li></volist>

	</div>
</div>
</div>
<div>
<script type="text/javascript">

$("#id{$search_id|md5}").addClass('active');

</script>

<script type="text/javascript">
	$(".swiperTopNav li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('.swiperTopNav',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});

</script>


<eq name="search_id" value="5">
<section class="mod aui-margin-t-0">
		<div class="mod-head" mod-skin="line">
		<div class="mod-head-title">
			<span class="mod-head-name">相关结果</span>
		</div>
		<span class="change">共有<em>“<volist name=":ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">{:ff_page_count('search', 'records')}</volist> ”</em>部影片</span>
	</div>
	<div class="mod-main clearfix">
		<div class="mod-row">
			<ul class="m-list aui-clearfix" m-list-skin="small">
			<volist name=":ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:18;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
<include file="Home:vod_homex" />
		</volist> 
			</ul>
		</div>
	</div>
</section>
<else/>
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">相关结果</span>
		</div>
		<span class="change">共有<em>“<volist name=":ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:1;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">{:ff_page_count('search', 'records')}</volist> ”</em>部影片</span>
	</div>
	<div class="mod-main clearfix">
				<div class="mod-row">
			<ul class="m-list clearfix" m-list-skin="film">
			<volist name=":ff_mysql_vod('cid:'.$search_id.';wd:'.$search_wd.';limit:18;page_is:true;page_id:search;page_p:'.$search_page.';cache_name:default;cache_time:default;order:vod_'.$search_order.';sort:asc')" id="feifei">
      <include file="Home:vod_home" />
</volist> 
							</ul>
		</div>
			</div>
</section>
</eq>
<gt name="totalpages" value="1">
<div class="navigation">
	<ul class="clearfix">{$page}</ul>
</div>
</gt>

<include file="Home:footer" />
</body>
</html>