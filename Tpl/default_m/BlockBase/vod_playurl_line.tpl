<volist name="playurl_line" id="feifei" key="sid">
<div class="page-header ff-playurl-line">
  <h2><span class="glyphicon glyphicon-facetime-video ff-text"></span> {$feifei.player_name_zh}</h2>
</div>
<ul class="list-unstyled row text-center ff-playurl-line ff-playurl" data-active="{$vod_id}-{$play_sid}-{$play_pid}" data-more="{$Think.config.ui_playurl|intval}">
  <volist name="feifei.son" id="feifeison" key="pid">
  <li class="col-xs-4" data-id="{$vod_id}-{$feifei.player_sid}-{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" class="btn btn-default btn-block btn-sm">{$feifeison.title|msubstr=0,8}</a></li>
  </volist>
</ul>
<div class="clearfix ff-clearfix"></div>
</volist>