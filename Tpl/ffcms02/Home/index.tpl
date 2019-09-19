<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:index" />
</head>
<body class="bg-light index">
<include file="BlockTheme:header" />
<main class="container">
	<include file="Slide:index" />
	<volist name=":ff_mysql_list('sid:1;limit:0;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc')" id="feifeilist">
	<div class="alert bg-theme border-0 mt-3 mb-0">
		<a class="h5" href="{$feifeilist.list_link}">{$feifeilist.list_name}</a>
		<span class="float-md-right">
			<volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" offset="0" length="12">
			<a class="h6 mr-2" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifeitype}</a>
			</volist>
			<a class="text-white h6" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}"><i class="fa fa-chevron-right"></i></a>
    </span>
	</div>
	<div class="row">
		<volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime desc')" id="feifei">
			<include file="BlockTheme:vod_card_item" />
		</volist>
	</div>
	</volist>
	<div class="alert bg-theme mt-3 mb-0">
		<strong class="h5 text-white">友情链接</strong>
	</div>
	<p class="mt-3 mb-0"><volist name=":ff_mysql_link('limit:20;cache_name:default;cache_time:default;order:link_order;sort:asc')" id="feifei"><a class="mr-1" href="{$feifei.link_url}" target="_blank">{$feifei.link_name}</a></volist></p>
</main>
<include file="BlockTheme:footer" />
</body>
</html>