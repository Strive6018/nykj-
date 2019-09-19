<php>
$item_vod=ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:6;cache_name:default;cache_time:default;order:vod_id;sort:desc');
</php>
<notempty name="item_vod">
<div class="clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-th-large ff-text"></span> 同主演作品</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-140">
<volist name="item_vod" id="feifei">
<include file="BlockTheme:vod_item_img" />
</volist>
</ul>
</notempty>