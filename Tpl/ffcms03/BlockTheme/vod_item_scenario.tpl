<notempty name="vod_scenario.info">
<div class="clearfix"></div>
<ul class="nav nav-pills ff-scenario-pill" data-max="{$Think.CONFIG.ui_scenario}">
  <!--<li><a href="javascript:;" data-target=".ff-scenario-1" data-toggle="pill">1</a></li> -->
</ul>
<div class="tab-content ff-scenario-content">
  <volist name="vod_scenario.info" id="feifei">
  <dl class="tab-pane active vod-scenario-{$i}">
    <dt><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,$i)}">{$vod_name} 第{$i}集</a></dt>
    <dd>{$feifei}</dd>
  </dl>
  </volist>
</div>
</notempty>