<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="vod-channel">
<include file="BlockTheme:header" />
<div class="container ff-bg">
	<div class="page-header type-all">
    <h2><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">全部分类
    <span class="pull-right"><span class="glyphicon glyphicon-chevron-right text-muted"></span></span></a></h2>
  </div>
</div>
<div class="clearfix ff-clearfix"></div> 
<div class="container ff-bg">
  <include file="Slide:channel" />
</div>
<div class="clearfix ff-clearfix"></div> 
<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="8">
<php>$item_vod=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:15;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');</php>
<notempty name="item_vod">
<div class="container ff-bg">
  <div class="page-header">
    <h2>
    <span class="glyphicon glyphicon-film ff-text"></span>
    {:str_replace('片','',$feifeilist)}片
    <span class="pull-right"><a class="btn btn-success btn-xs" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a></span>
    </h2>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-140">
    <volist name="item_vod" id="feifei">
    <include file="BlockTheme:vod_item_img" />
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div> 
</notempty>
</volist>
<!-- -->
<include file="BlockTheme:footer" />
</body>
</html>