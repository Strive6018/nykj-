<php>$vod_scenario = json_decode($feifei['vod_scenario'],true);</php>
<div class="card card-scenario mt-3">
<div class="card-header border-0 bg-white pb-0 h5">
	<a class="text-dark" href="{:ff_url('scenario/detail', array('id'=>$feifei['vod_id']), true)}" title="{$feifei.vod_name}剧情介绍">{$feifei.vod_name} 剧情介绍</a>
</div>
<div class="card-body mt-2 pt-0 pb-2">
	<a class="border float-left p-1 mt-1 mr-2" href="{:ff_url('scenario/detail', array('id'=>$feifei['vod_id']), true)}"><img class="ff-img" data-original="{$feifei['vod_pic']|ff_url_img}" alt="{$feifei.vod_name}剧情介绍"></a>
	<strong>主演：</strong><include file="BlockBase:vod_actor_foreach" /><br />
	<strong>导演：</strong><include file="BlockBase:vod_director_foreach" /><br />
	{$vod_scenario['info']|end|nb|msubstr=0,400,true}
	<span class="badge badge-secondary">第{:count($vod_scenario['info'])}集剧情</span>
</div>
<div class="card-footer d-flex flex-wrap">
	<volist name="vod_scenario.info" id="scenario"><a class="mr-2" href="{:ff_url('scenario/detail', array('id'=>$feifei['vod_id'],'pid'=>$i), true)}" title="{$feifei.vod_name}第{$i}集剧情介绍">第<lt name="i" value="10">0</lt>{$i}集</a></volist>
</div>
</div>