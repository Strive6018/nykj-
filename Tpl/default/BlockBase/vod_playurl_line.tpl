<volist name="playurl_line" id="feifei" key="sid">
<div class="page-header ff-playurl-line">
  <h2>
  <span class="glyphicon glyphicon-facetime-video ff-text"></span>
  来源：{$feifei.player_name_zh}</h2>
</div>
<ul class="list-unstyled row text-center ff-playurl-line ff-playurl" data-active="{$vod_id}-{$play_sid}-{$play_pid}" data-more="{$Think.config.ui_playurl|intval}">
  <volist name="feifei.son" id="feifeison" key="pid">
  <li class="col-md-1 col-xs-4" data-id="{$vod_id}-{$feifei.player_sid}-{$pid}"><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,$feifei['player_sid'],$pid)}" class="btn btn-default btn-block btn-sm ff-text-hidden"><if condition="(strlen($feifeison['title']) eq 8) and is_numeric($feifeison['title'])">{$feifeison.title|msubstr=2,5}<else/>{$feifeison.title|msubstr=0,6}</if></a></li>
  </volist>
</ul>
<div class="clearfix"></div>
</volist>