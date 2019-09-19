<li class="yk-pack">
<div class="p-thumb">
<a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" title="{$feifei.vod_name}" target="_blank"></a>
<img class="quic ff-img" data-original="{:ff_url_img($feifei['vod_pic'],$feifei['vod_content'])}" alt="{$feifei.vod_name}">
<span class="playshow"><include file="Home:vod_continu" /></span>
<div class="p-thumb-tagrt"><span class="red">推荐</span>
</div>
</div>
<ul class="info-list">
<li class="title"><a href="{:ff_url_vod_read($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],$feifei['vod_jumpurl'])}" target="_blank">{$feifei.vod_name}</a></li>
<span><in name="feifei.list_id" value="1,2" >主演：<include file="Home:vod_yyb" /><else/>{$feifei.vod_content|msubstr=0,15}</in></span>
</ul>
</li>