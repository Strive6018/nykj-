<php>$item_vod=ff_mysql_vod('cid:'.$vod_cid.';limit:12;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc');</php>
<div class="clearfix"></div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-fire ff-text"></span> 热播{$list_name}</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-140">
<volist name="item_vod" id="feifei">
<include file="BlockTheme:vod_item_img" />
</volist>
</ul>