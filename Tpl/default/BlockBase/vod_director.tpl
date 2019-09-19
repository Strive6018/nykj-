<notempty name="vod_director">
<volist name=":explode(',',$vod_director)" id="feifei">
<a href="{:ff_url('vod/search',array('director'=>urlencode($feifei)),true)}">{$feifei}</a>
</volist>
<else />
<a href="javascript:;">未填写</a>
</notempty>