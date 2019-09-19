<!--forum/**_detail调用 按PID聚合 -->
<div class="clearfix"></div>
<div class="alert bg-theme border-0 mt-3">
	<a class="h6" href="jvavascript:;">发表您对此<eq name="forum_sid" value="5">留言<else/>评论</eq>的看法</a>
</div>
<div class="ff-forum" data-sid="{$forum_sid}" data-id="{$forum_cid}" data-pid="{$forum_id}" data-type="{$Think.config.forum_type}" data-uyan-uid="{$Think.config.forum_type_uyan_uid}" data-cy-id="{$Think.config.forum_type_changyan_appid}" data-cy-conf="{$Think.config.forum_type_changyan_conf}">评论加载中...</div>