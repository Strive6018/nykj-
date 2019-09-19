<li class="col-xs-6">
	<p class="image">
    <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}">
      <img class="img-responsive img-thumbnail ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
      <span class="continu"><include file="BlockBase:vod_continu_foreach" /></span>
      <i class="playbg"></i>
      <i class="playbtn"></i>
    </a>
  </p>
  <h4 class="ff-text-right">
    <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name|msubstr=0,20,true}</a>
  </h4>
</li>