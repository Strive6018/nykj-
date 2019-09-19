<ul class="list-unstyled vod-record">
<volist name="item_vod" id="feifei">
<li class="col-xs-3">
  <a class="picbg" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" style="background:url('{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}') bottom center;" target="_blank">
  </a>
  <h4 class="ff-text-hidden ff-text-right">
    <a class="ff-text" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank">{$feifei.vod_name}</a>
  </h4>
  <h6 class="ff-text-hidden ff-text-right">
  <notempty name="feifei.vod_actor">
    主演：<include file="BlockBase:vod_actor_foreach" />
   <else/>
    看点：<include file="BlockBase:vod_type_foreach" />
    <include file="BlockBase:vod_area_foreach" />
  </notempty>
  </h6>
</li>
</volist>
</ul>