<notempty name="vod_series">
<php>
$series_array = explode(',',$vod_series);
if(count($series_array) > 1 ){
	$item_vod = ff_mysql_vod('ids:'.$vod_series.';limit:6;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}else{
	$item_vod = ff_mysql_vod('series:'.$vod_series.';limit:6;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}
</php>
<div class="clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-link ff-text"></span> 相关推荐</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-140">
<volist name="item_vod" id="feifei">
<include file="BlockTheme:vod_item_img" />
</volist>
</ul>
</notempty>