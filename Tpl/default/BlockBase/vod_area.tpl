<notempty name="vod_area">
<volist name=":explode(',',$vod_area)" id="feifei">
<a href="{:ff_url('vod/type',array('id'=>$vod_cid,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime'),true)}">{$feifei}</a>
</volist>
<else/>
<a href="javascript:;">未填写</a>
</notempty>