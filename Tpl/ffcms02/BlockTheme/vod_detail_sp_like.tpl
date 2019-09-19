<ul class="nav nav-tabs mt-3">
  <li class="nav-item">
    <a class="nav-link rounded-0 active" data-toggle="tab" href="#like">猜你喜欢</a>
  </li>
  <li class="nav-item">
    <a class="nav-link rounded-0" data-toggle="tab" href="#hot">大家都在看</a>
  </li>
</ul>
<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane container active px-0" id="like">
		<div class="row mt-2">
			<volist name=":ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:12;cache_name:default;cache_time:default;order:vod_id;sort:desc')" id="feifei"><include file="BlockTheme:vod_card_item" /></volist>
		</div>
	</div>
  <div class="tab-pane container px-0" id="hot">
		<div class="row mt-2">
			<volist name=":ff_mysql_vod('cid:'.$vod_cid.';limit:12;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc')" id="feifei"><include file="BlockTheme:vod_card_item" /></volist>
		</div>
	</div>
</div>