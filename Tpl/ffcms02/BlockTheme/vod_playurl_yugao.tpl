<volist name="playurl_yugao" id="feifei" key="sid">
<div class="card mt-3 rounded">
  <div class="card-header bg-light">
		<span class="h6 text-uppercase text-dark">播放来源：{$feifei.player_name_zh}</span>
		<span class="d-none d-sm-block float-right text-primary">{$feifei.player_info}</span>
	</div>
  <div class="card-body pb-0">
		<ul class="list-unstyled row text-center ff-playurl ff-playurl-yugao" data-active="{$vod_id}-{$play_sid}-{$play_pid}" data-more="{$Think.config.ui_playurl|intval}">
		<volist name="feifei.son" id="feifeison" key="pid">
			<li class="col-3 col-md-1 mb-2" data-id="{$vod_id}-{$feifei.player_sid}-{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" class="btn btn-link btn-block border-light rounded-0">{$feifeison.title|msubstr=0,8}</a></li>
		</volist>
		</ul>
	</div> 
</div>
</volist>