<notempty name="feifei.vod_type">
<volist name=":explode(',',$feifei['vod_type'])" id="feifeitype">
<a href="{:ff_url('vod/type',array('id'=>$feifei['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'hits'),true)}">{$feifeitype}</a>
</volist>
<else />
<a href="javascript:;">{$feifei.list_name}</a>
</notempty>