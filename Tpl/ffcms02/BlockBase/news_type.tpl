<a class="badge badge-secondary" href="{:ff_url_news_show($list_id,$list_dir,1)}">{$list_name}</a>
<volist name=":explode(',',$news_type)" id="feifei">
<a class="badge badge-secondary ml-1" href="{:ff_url('news/type',array('type'=>urlencode($feifei),'id'=>$list_id),true)}">{$feifei}</a>
</volist>