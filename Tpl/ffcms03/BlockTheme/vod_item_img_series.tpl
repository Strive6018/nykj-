<notempty name="vod_series">
<php>
$series_array = explode(',',$vod_series);
if(count($series_array) > 1 ){
	$item_vod = ff_mysql_vod('ids:'.$vod_series.';limit:6;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}else{
	$item_vod = ff_mysql_vod('series:'.$vod_series.';limit:6;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');
}
</php>
<ul class="list-unstyled vod-item-img ff-img-215">
<volist name="item_vod" id="feifei">
<li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
</volist>
</ul>
<div class="clearfix ff-clearfix"></div>
</notempty>