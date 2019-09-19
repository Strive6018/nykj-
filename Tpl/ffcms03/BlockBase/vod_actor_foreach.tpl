<notempty name="feifei.vod_actor">
<volist name=":explode(',',$feifei['vod_actor'])" id="feifeiactor" offset="0" length="2">
<a href="{:ff_url('vod/search',array('actor'=>urlencode($feifeiactor)),true)}">{$feifeiactor}</a>
</volist>
</notempty>