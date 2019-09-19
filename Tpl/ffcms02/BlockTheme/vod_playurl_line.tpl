<volist name="playurl_line" id="feifei" key="sid">
<div class="card mt-3 rounded">
  <div class="card-header">
		<span class="text-uppercase text-dark">播放来源：{$feifei.player_name_zh}</span>
		<span class="float-right d-none d-sm-block text-primary">{$feifei.player_info}</span>
	</div>
  <div class="card-body pb-0">
		<ul class="list-unstyled row ff-playurl-line ff-playurl" data-active="{$vod_id}-{$play_sid}-{$play_pid}" data-more="{$Think.config.ui_playurl|intval}">
		<volist name="feifei.son" id="feifeison" key="pid">
		<eq name="vod_cid" value="4">
			<li class="col-6 col-md-3 mb-2" data-id="{$vod_id}-{$feifei.player_sid}-{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" class="btn btn-link btn-block border-light rounded-0"><if condition="(strlen($feifeison['title']) eq 8) and is_numeric($feifeison['title'])">{$feifeison.title|msubstr=2,5}<else/>{$feifeison.title|msubstr=0,6}</if></a></li>
		<else/>
			<li class="col-3 col-md-1 mb-2" data-id="{$vod_id}-{$feifei.player_sid}-{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" class="btn btn-link btn-block border-light rounded-0">{$feifeison.title|msubstr=0,8}</a></li>
		</eq>
		</volist>
		</ul>
	</div>
</div>
</volist>