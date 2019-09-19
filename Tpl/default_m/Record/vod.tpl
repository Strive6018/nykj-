<!--弹出框展示观看记录 -->
<notempty name="vod_ids">
<ol class="ff-record">
<volist name=":ff_mysql_vod('ids:'.$vod_ids.';limit:0;field:list_id,list_dir,vod_id,vod_ename,vod_name;cache_name:default;cache_time:default;order:vod_id;sort:desc');" id="feifei">
<li><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}">{$feifei.vod_name|msubstr=0,15,true}</a></li>
</volist>
</ol>
</notempty>