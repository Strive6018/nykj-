<div class="media py-3 border-bottom">
	<a class="mr-3 mt-1" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">
    <img class="border" src="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" width="64" height="64">
  </a>
	<div class="media-body">
		<p class="mb-0 pb-0">
			<a class="text-dark" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name|msubstr=0,20,true}</a>
			<eq name="feifei.record_uid" value="$site_user_id">
			<i class="fa fa-trash-o"></i> <a class="text-muted ff-record-delete" href="javascript:;" data-id="{$feifei.record_id}" data-toggle="tooltip" data-placement="top" title="删除">删除</a>
			</eq>
		</p>
		<ul class="card-text list-inline mb-0 d-flex flex-wrap flex-row">
			<li class="list-inline-item">类型：<include file="BlockBase:vod_type_foreach" /></li>
			<li class="list-inline-item">主演：<include file="BlockBase:vod_actor_foreach" /></li>
			<li class="list-inline-item">导演：<include file="BlockBase:vod_director_foreach" /></li>
			<li class="list-inline-item">地区：<include file="BlockBase:vod_area_foreach" /></li>
			<li class="list-inline-item">年份：<a class="mr-1" href="{:ff_url('vod/type',array('id'=>$vod['vod_cid'],'type'=>'','area'=>'','year'=>$vod['vod_year'],'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod['vod_year']|default='2018'}</a></li>
		</ul>
		<ul class="card-text list-inline mb-0 d-flex flex-wrap flex-row">
			<li class="list-inline-item">观看时间：{$feifei.record_time|date='Y-m-d H:i:s',###}</li>
			<li class="list-inline-item">更新时间：{$feifei.vod_addtime|date='Y-m-d H:i:s',###}</li>
		</ul>
	</div>
</div>