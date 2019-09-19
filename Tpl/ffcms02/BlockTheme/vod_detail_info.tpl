<div class="media bg-white px-2 pb-2">
  <div class="media-body">
		<h6 class="d-sm-none"><a class="mr-2" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a><small class="text-muted">第{$play_pid}集</small></h6>
		<ul class="list-inline d-flex flex-wrap flex-row mb-0">
			<li class="list-inline-item">类型：<include file="BlockBase:vod_type" /></li>
			<li class="list-inline-item">主演：<include file="BlockBase:vod_actor" /></li>
			<li class="list-inline-item">导演：<include file="BlockBase:vod_director" /></li>
			<li class="list-inline-item">地区：<include file="BlockBase:vod_area" /></li>
			<li class="list-inline-item">年份：<a class="mr-1" href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2018'}</a></li>
			<li class="list-inline-item"><a class="text-muted vod_detail_collapse" href="#vod_detail_collapse" data-toggle="collapse"><i class="fa fa-chevron-down"></i></a></li>
		</ul>		
		<div class="collapse" id="vod_detail_collapse">
			<div class="media mt-2">
				<a class="mr-2" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}"><img class="ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看" width="120" height="160"></a>
				<div class="media-body text-muted">
					{:ff_url_tags_content(nb(strip_tags($vod_content,"<a>")),$Tag)}
				</div>
			</div>
		</div>		
	</div>
  </div>
</div>