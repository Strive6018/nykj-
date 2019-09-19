<volist name=":ff_mysql_list('sid:1;limit:4;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc')" id="feifeilist">
<php>$item = ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:24;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');</php>
<div class="carousel" id="ff-slide-{$feifeilist.list_id}">
	<h1>
  	<a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','ispay'=>'','order'=>'hits','p'=>1),true)}">{$feifeilist.list_name}精选</a>
  </h1>
  <!-- 轮播（Carousel）指标 -->
  <ol class="carousel-indicators">
  	<li data-target="#ff-slide-{$feifeilist.list_id}" data-slide-to="0" class="active"></li>
    <li data-target="#ff-slide-{$feifeilist.list_id}" data-slide-to="1"></li>
    <li data-target="#ff-slide-{$feifeilist.list_id}" data-slide-to="2"></li>
    <li data-target="#ff-slide-{$feifeilist.list_id}" data-slide-to="3"></li>
  </ol>
  <!-- 轮播（Carousel）项目 -->
  <div class="carousel-inner">
  	<ul class="item list-unstyled active vod-item-img ff-img-215">
      <volist name="item" id="feifei" offset="0" length="6">
      <li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
      </volist>
    </ul>
    <ul class="item list-unstyled vod-item-img ff-img-215">
      <volist name="item" id="feifei" offset="6" length="6">
      <li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
      </volist>
    </ul>
    <ul class="item list-unstyled vod-item-img ff-img-215">
      <volist name="item" id="feifei" offset="12" length="6">
      <li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
      </volist>
    </ul>
    <ul class="item list-unstyled vod-item-img ff-img-215">
      <volist name="item" id="feifei" offset="18" length="6">
      <li class="col-xs-2"><include file="BlockTheme:vod_item_img" /></li>
      </volist>
    </ul>
  </div>
</div>
</volist>
<div class="clearfix ff-clearfix"></div>