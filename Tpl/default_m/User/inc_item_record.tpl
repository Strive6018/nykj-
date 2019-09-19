<ul class="list-unstyled vod-record">
<volist name="item_vod" id="feifei">
<li class="col-xs-6">
  <a class="picbg" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" style="background:url('{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}') bottom center;">
  </a>
  <h5 class="text-nowrap ff-text-right">
    <a class="ff-text" href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name|msubstr=0,10}</a>
  </h5>
  <lt name="feifei.vod_cid" value="3">
  <h6 class="text-nowrap ff-text-right">
    {$feifei.vod_actor|ff_url_search}
  </h6>
  </lt>
</li>
</volist>
</ul>