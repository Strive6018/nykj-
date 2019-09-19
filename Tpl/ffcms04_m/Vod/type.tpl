<php>$item_vod = ff_mysql_vod('cid:'.$type_id.';limit:42;tag_name:'.$type_type.';tag_list:vod_type;area:'.$type_area.';year:'.implode(',',str_split($type_year,4)).';actor:'.$type_star.';state:'.$type_state.';page_is:true;page_id:type;page_p:'.$type_page.';cache_name:default;cache_time:default;order:vod_'.$type_order.';sort:desc');
$params = array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>'FFLINK');
$page = ff_url_page('vod/type', $params, true, 'type', 4);
$totalpages = ff_page_count('type', 'totalpages');
</php>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no,minimal-ui">
    <title>{$type_year}{$type_area}{$type_type}{$type_star}{$type_state}{$list_name}大全-{$list_name}排行榜-{$site_name}</title>
    <meta name="keywords" content="{$list_keywords}">
    <meta name="description" content="{$list_description}">
<include file="Home:header_meta" />
</head>
<body class="bg-default">
<include file="Home:header" />
<section class="modx aui-margin-t-5">
<div class="mod-shaix clearfix">
		<if condition="$type_type|$type_area|$type_year|$type_star|$type_state">
		<eq name="type_type" value="1">
		<gt name="type_type" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_type" value="0">
		<em>{$type_type}</em><i>&#183;</i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_area" value="1">
		<gt name="type_area" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_area" value="0">
		<em>{$type_area}</em><i>&#183;</i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_year" value="1">
		<gt name="type_year" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_year" value="0">
		<em>{$type_year}</em><i>&#183;</i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_star" value="1">
		<gt name="type_star" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_star" value="0">
		<em>{$type_star}</em><i>&#183;</i>
		</a>
		<else/>
		</gt>
		</eq>
		<eq name="type_state" value="1">
		<gt name="type_state" value="0">
		<else/>
		</gt>
		<else/>
		<gt name="type_state" value="0">
		<em>{$type_state}</em><i>&#183;</i>
		</a>
		<else/>
		</gt>
		</eq>

		<a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" target="_self" id="closeSelect_clear" class="aSelected">
		<em>重新选择</em>
		</a>
		<else/>
		<span>筛选</span>
		</if>



</div>

</section>
<section class="mode aui-margin-t-5">
	<div class="mod-main clearfix">
		<div class="classifyWarp">

			<div id="classifyList02" class="classifyList">
				<ul class="swiper-wrapper clearfix">
	<li class="swiper-slide" id="type{:md5('')}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>'','area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部类型</a></li>
    <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length='24'><li class="swiper-slide" id="type{:md5($feifei)}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($feifei),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></li></volist>
				</ul>
			</div>
			
			<div id="classifyList03" class="classifyList">
				<ul class="swiper-wrapper clearfix">
 <li class="swiper-slide"id="area{:md5('')}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>'','year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部地区</a></li>
    <volist name=":explode(',',$list_extend['area'])" id="feifei">
	<li class="swiper-slide" id="area{:md5($feifei)}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($feifei),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}"">{$feifei}</a></li></volist> 
				</ul>
			</div>	

			<div id="classifyList04" class="classifyList">
				<ul class="swiper-wrapper clearfix">
	<li class="swiper-slide" id="year{:md5('')}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部年代</a></li>
    <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length='15'>
	<li class="swiper-slide" id="year{:md5($feifei)}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$feifei,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></li></volist>
	<li class="swiper-slide" id="year{:md5('18002003')}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>'18001989','star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">更早</a></li>
	</ul>
	</div>	

			<div id="classifyList05" class="classifyList scroll">
				<ul class="swiper-wrapper clearfix">
	<li class="swiper-slide" id="star{:md5('')}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>'','state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">全部明星</a></li>
    <volist name=":explode(',',$list_extend['star'])" id="feifei" offset="0" length='20'><li class="swiper-slide" id="star{:md5($feifei)}"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($feifei),'state'=>urlencode($type_state),'order'=>$type_order,'p'=>1),true)}">{$feifei}</a></li></volist>

		</ul>
			</div>
			<div id="classifyList01" class="classifyList">
				<ul class="swiper-wrapper clearfix">
		<li class="swiper-slide" id="orderaddtime"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>addtime,'p'=>1),true)}">最新上线</a>
		<li class="swiper-slide" id="orderhits"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>hits,'p'=>1),true)}">最多播放</a>
		<li class="swiper-slide" id="ordergold"><a href="{:ff_url('vod/type',array('id'=>$type_id,'type'=>urlencode($type_type),'area'=>urlencode($type_area),'year'=>$type_year,'star'=>urlencode($type_star),'state'=>urlencode($type_state),'order'=>gold,'p'=>1),true)}">评分最高</a>
		
				</ul>
				<div class="swiper-gbx">收起<i></i></div>
			</div>
			
		</div>
	</div>
</section>

<script>
$("#id{$type_id|md5}").addClass("active"); 
$("#area{$type_area|md5}").addClass("active");
$("#type{$type_type|md5}").addClass("active");
$("#year{$type_year|md5}").addClass("active");
$("#star{$type_star|md5}").addClass("active");
$("#order{$type_order}").addClass("active");
$("#state{$type_state|md5}").addClass("active");




var top1=$(".scroll").offset().top;
　　　　$(window).scroll(function(){
　　　　　　var win_top=$(this).scrollTop();
　　　　　　var top=$(".scroll").offset().top;
　　　　　　if(win_top>=top){
　　　　　　　　$(".modx").show(); 
　　　　　　}
　　　　　　if(win_top<top1){
　　　　　　　　$(".modx").hide();   
				
　　　　　　}
  });


$(function(){	
  $(window).scroll(function() {
	if($(window).scrollTop()<=100){
		$(".classifyWarp").removeClass("mode-shaix");
	} 
  });
});
  

  
$(document).ready(function(){
  $(".mod-shaix").click(function(){
    $(".classifyWarp").addClass("mode-shaix");
	$(".modx").hide(); 
  });
});
$(document).ready(function(){
  $(".swiper-gbx").click(function(){
    $(".classifyWarp").removeClass("mode-shaix");
	$(".modx").show(); 
  });
});
</script>   
<script>
	//导航条
	$("#classifyList01 li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#classifyList02',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});
	$("#classifyList02 li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#classifyList02',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});
	$("#classifyList03 li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#classifyList03',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});
	$("#classifyList04 li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#classifyList04',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});
	$("#classifyList05 li").each(function(index){
		if($(this).hasClass("active")){
        	var videoSelectWrap = new Swiper('#classifyList05',{freeMode : true,slidesPerView : 'auto',initialSlide:index-2});
        }
	});
</script>
<section class="mod aui-margin-t-0">
	<div class="mod-head clearfix">
		<div class="mod-head-title">
			<span class="mod-head-name">资源列表</span>
		</div>
		<span class="change">共有<em>“{:ff_page_count('type', 'records')}”</em>部影片</span>
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


<div class="navigation">
<ul class="clearfix">{$page}</ul>
</div>
<include file="Home:footer" />
</body>
</html>