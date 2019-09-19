<notempty name="feifei.vod_director">
<volist name=":explode(',',$feifei['vod_director'])" id="director" offset="0" length="2">
<a class="mr-1" href="{:ff_url('vod/search',array('director'=>urlencode($director)),true)}">{$director}</a>
</volist>
<else/>
未填写
</notempty>