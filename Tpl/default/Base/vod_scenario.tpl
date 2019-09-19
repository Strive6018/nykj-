<notempty name="vod_scenario.info">
<!-- 分集剧情 -->
	<div class="d-play-juq">
		<div class="d-play-hd ">
		<div class="d-play-title">
		<h2 class="title">分集剧情</h2>
	</div>
</div>	
<ul class="ff-scenario-pill" data-max="{$Think.CONFIG.ui_scenario}"></ul>
<div class="tab-content ff-scenario-content">
  <volist name="vod_scenario.info" id="feifei">
  <dl class="tab-pane active vod-scenario-{$i}">
    <dt><a href="{:ff_url_vod_play($list_id,$list_dir,$vod_id,$vod_ename,1,$i)}">{$vod_name} 第{$i}集</a></dt>
    <dd>{$feifei|msubstr=0,210}</dd>
  </dl>
  </volist>
  </div>
  </div>
  
</notempty>