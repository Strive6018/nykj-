<php>$item_vod=ff_mysql_vod('cid:'.$vod_cid.';limit:6;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');</php>
<div class="clearfix"></div>
<ul class="list-unstyled vod-item-img ff-img-215">
<volist name="item_vod" id="feifei">
<li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
</volist>
</ul>
<div class="clearfix ff-clearfix"></div>