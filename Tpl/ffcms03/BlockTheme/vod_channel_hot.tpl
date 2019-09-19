<ul class="list-group vod-item-text">
  <volist name="item_list" id="feifei">
  <li class="list-group-item">
  <i class="i-{$i}">{$i}</i>
  <a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name|msubstr=0,8}</a> 
  <span class="badge"><include file="BlockBase:vod_continu_foreach" /></span>
  </li>
  </volist>
</ul>