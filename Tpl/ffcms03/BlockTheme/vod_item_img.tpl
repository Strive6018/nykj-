<p class="image">
  <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}">
    <img class="img-responsive img-thumbnail ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
    <span class="continu"><include file="BlockBase:vod_continu_foreach" /></span>
    <i class="playbg"></i>
    <i class="playbtn"></i>
  </a>
</p>
<h2 class="ff-text-hidden ff-text-right">
  <a class="ff-text" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name}</a>
</h2>
<h6 class="ff-text-hidden ff-text-right vod-actor">
  <notempty name="feifei.vod_actor">
    主演：<include file="BlockBase:vod_actor_foreach" />
   <else/>
    看点：<include file="BlockBase:vod_type_foreach" />
    <include file="BlockBase:vod_area_foreach" />
  </notempty>
</h6>
<h6 class="ff-text-hidden vod-hits">
  人气：{$feifei.vod_hits|number_format}
</h6>
