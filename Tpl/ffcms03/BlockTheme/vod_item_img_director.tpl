<php>
$item_vod=ff_mysql_vod('cid:'.$vod_cid.';director:'.ff_array(explode(',',$vod_director),0).';limit:6;cache_name:default;cache_time:default;order:vod_id;sort:desc');
</php>
<notempty name="item_vod">
<ul class="list-unstyled vod-item-img ff-img-215">
<volist name="item_vod" id="feifei">
<li class="col-xs-2">
<include file="BlockTheme:vod_item_img" />
</li>
</volist>
</ul>
<div class="clearfix ff-clearfix"></div>
</notempty>