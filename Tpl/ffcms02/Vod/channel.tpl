<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="bg-light vod-channel">
<include file="BlockTheme:header" />
<main>
<div class="bg-eee" >
<div class="container mt-3">	
	<script src="{$public_path}jquery.flickity/2.1.1/flickity.pkgd.min.js?{%feifeicms_version}"></script>
	<div class="ff-slide">
		<volist name=":ff_mysql_vod('cid:'.$list_id.';limit:20;cache_name:default;cache_time:default;order:vod_stars desc,vod_up;sort:asc')" id="feifei">
		<a class="mr-3 p-1 border bg-white rounded text-dark" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}">
			<p><img src="{$feifei.vod_pic|ff_url_img}"></p>
			<h6 class="text-center">{$feifei.vod_name|msubstr=0,6,true}</h6>
		</a>
		</volist>
	</div>
	<script>$('.ff-slide').flickity({setGallerySize: true,wrapAround: true,pageDots: false,resize: true,cellAlign: 'center',autoPlay: 1200});</script>
	<include file="BlockTheme:vod_channel_extend" />
</div>
</div>
<div class="container">	
<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="10">
<php>$item_vod = ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:12;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');if(!$item_vod){continue;}</php>
<div class="alert bg-theme border-0 mb-0 mt-3">
	<strong class="h5 text-white">{$feifeilist}</strong>
	<span class="float-right">
		<a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}"><i class="fa fa-chevron-right"></i></a>
	</span>
</div>
<div class="row">
<volist name="item_vod" id="feifei">
	<include file="BlockTheme:vod_card_item" />
</volist>
</div>
</volist>
</div>
</main>
<include file="BlockTheme:footer" />
</body>
</html>