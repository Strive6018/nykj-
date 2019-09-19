<a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
<notempty name="vod_actor">
<volist name=":explode(',',$vod_actor)" id="feifei"><a class="mr-1" href="{:ff_url('vod/search',array('actor'=>urlencode($feifei)),true)}">{$feifei}</a></volist>
<else/>
<a href="javascript:;">未填写</a>
</notempty>