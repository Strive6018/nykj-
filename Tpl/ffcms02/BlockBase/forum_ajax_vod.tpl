<!--vod_detial调用 按CID聚合 -->
<div class="clearfix"></div>
<div class="alert bg-theme border-0 mt-3">
	<a class="h6" href="{:ff_url('forum/vod',array('cid'=>$vod_id,'p'=>1),true)}">影片评论</a>
</div>
<div class="ff-forum" data-sid="1" data-id="{$vod_id}" data-pid="0" data-type="{$Think.config.forum_type}" data-uyan-uid="{$Think.config.forum_type_uyan_uid}" data-cy-id="{$Think.config.forum_type_changyan_appid}" data-cy-conf="{$Think.config.forum_type_changyan_conf}">评论加载中...</div>