<div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-3">
	<div class="card mt-3 box-shadow card-vod border-light card-vod-{$feifei.vod_cid}">
		<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}免费观看"><img class="card-img-top rounded-0 ff-img p-1" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}"></a>
		<div class="card-body pt-0 pb-1 px-2">
			<neq name="feifei.list_skin" value="channel_sp">
				<h6 class="card-title mt-2 mb-1 text-center text-nowrap overflow-hidden text-overflow">
					<a class="text-primary" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}免费观看">{$feifei.vod_name}</a>
				</h6>
				<ul class="list-inline my-0 d-none d-md-block">
					<in name="feifei.list_id" value="1,2">
					<li class="text-nowrap overflow-hidden"><small><strong>主演：</strong><include file="BlockBase:vod_actor_foreach" /></small></li>
					<li class="text-nowrap overflow-hidden"><small><strong>导演：</strong><include file="BlockBase:vod_director_foreach" /></small></li></in>  
					<in name="feifei.list_id" value="3,4">
					<li class="text-nowrap overflow-hidden"><small><strong>地区：</strong><include file="BlockBase:vod_area_foreach" /></small></li>
					<li class="text-nowrap overflow-hidden"><small><strong>类型：</strong><include file="BlockBase:vod_type_foreach" /></small></li>
					</in>
				</ul>
			</neq>
			<p class="card-text card-text-content overflow-hidden d-none d-xl-block">
				<small>{$feifei.vod_content|strip_tags|nb|msubstr=0,68,'utf-8',true}</small>
			</p>
			<div class="d-none d-md-block mt-2 pb-1">
				<div class="d-flex justify-content-between align-items-center">
					<a class="btn btn-outline-secondary btn-sm" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}免费观看">免费观看</a>
					<span class="badge bg-theme text-white"><small><include file="BlockBase:vod_continu_foreach" /></small></span>
				</div>
			</div>
		</div>
	</div>
</div>